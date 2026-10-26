#!/usr/bin/env python3
"""Batch guards/resume/failure tests with fake processes and exact fixtures only."""
import copy
from collections import namedtuple
import fcntl
import importlib.util
import json
from pathlib import Path
import signal
import sys
import unittest
from unittest.mock import Mock, patch

ROOT = Path(__file__).resolve().parents[1]
sys.dont_write_bytecode = True
sys.path.insert(0, str(ROOT/'tools'))
import caps_centre_batch as batch

spec = importlib.util.spec_from_file_location('batch_fine_fixtures', ROOT/'scripts/test_caps_centre_fine.py')
fixtures = importlib.util.module_from_spec(spec)
spec.loader.exec_module(fixtures)


class FakeChild:
    pid = 5001

    def __init__(self, polls=1):
        self.polls, self.ended, self.code = polls, False, 0

    def poll(self):
        if self.ended:
            return self.code
        if self.polls:
            self.polls -= 1
            return None
        self.ended = True
        return self.code

    def wait(self, timeout=None):
        self.ended = True
        return self.code


class FakeGuard:
    def __init__(self, observations):
        self.observations = iter(observations)

    def observe(self, _group=None):
        return next(self.observations, {'rss': 0, 'pause_reason': None, 'free_disk': 9*batch.GIB})


class BatchTests(unittest.TestCase):
    def setUp(self):
        fixtures.FineTests.setUp(self)
        first = self.nodes[0]
        self.nodes += [dict(copy.deepcopy(first), i=201), dict(copy.deepcopy(first), i=202)]
        batch.sweep.write_json(self.root/batch.sweep.PIECES, self.nodes)
        (self.root/'tools/caps_centre_batch.py').write_bytes((ROOT/'tools/caps_centre_batch.py').read_bytes())
        for name in ['caps_centre_campaign.py', 'caps_centre_restore.py']:
            (self.root/'tools'/name).write_bytes((ROOT/'tools'/name).read_bytes())
        manifest = batch.sweep.inventory(self.root)
        batch.sweep.prepare(self.root, manifest, 'Codex15b7Portable')
        pending, self.fms = [], {}
        for entry in manifest['entries']:
            self.make_relative(entry)
            key = batch.sweep.key_string(entry)
            fm = batch.fine.prepare(self.root, f"{entry['k']}:{entry['i']}", 'Codex15b7Portable', self.grid)
            self.make_relative(fm['entry'])
            fp = Path(f"data/caps-m/plan/fine-{entry['i']}.json")
            batch.sweep.write_json(self.root/fp, fm)
            self.fms[key] = fm
            pending.append({'key': key, 'stored_module': entry['module'], 'stored_export': entry['export'],
                            'fine_manifest': fp.as_posix(), 'fine_module': fm['entry']['module'],
                            'fine_export': fm['entry']['export'], 'fine_grid_spec': self.grid})
        manifest['portable'] = {'completed_records': {}, 'legacy_modules_never_build': []}
        self.manifest = manifest
        mp = Path('data/caps-m/plan/portable/manifest.json')
        batch.sweep.write_json(self.root/mp, manifest)
        ref = {'path': mp.as_posix(), 'sha256': batch.sweep.sha(self.root/mp)}
        outputs = {}
        for entry in manifest['entries']:
            for field in ['module_file', 'export_provenance']:
                outputs[entry[field]] = batch.sweep.sha(self.root/entry[field])
        for item in pending:
            fm = self.fms[item['key']]
            for field in ['module_file', 'export_provenance']:
                outputs[fm['entry'][field]] = batch.sweep.sha(self.root/fm['entry'][field])
            outputs[item['fine_manifest']] = batch.sweep.sha(self.root/item['fine_manifest'])
        config = {'format': 'caps-centre-portable/v1', 'manifest': ref, 'inputs': {'manifest': ref},
                  'pending': pending, 'completed_keys': [], 'preserved_files': {},
                  'source_files': manifest['provenance']['files'], 'outputs': outputs,
                  'generator': {'path': 'tools/caps_centre_batch.py',
                                'sha256': batch.sweep.sha(self.root/'tools/caps_centre_batch.py')}}
        self.portable = self.root/'data/caps-m/plan/portable/config.json'
        batch.sweep.write_json(self.portable, config)
        self.config = batch.Config(self.root, self.portable, self.root/'data/caps-m/plan/batch-codex-15b7-test.json',
                                   self.root/'handoff/caps-centre/codex-15b7-batch-test',
                                   self.root/'handoff/caps-centre/codex-15b7-batch-test/STOP_REQUESTED')

    def make_relative(self, entry):
        path = self.root/entry['module_file']
        path.write_text(path.read_text().replace(json.dumps(str((self.root/entry['export']).resolve())),
                                                json.dumps(entry['export'])))
        entry['module_source_sha256'] = batch.sweep.sha(path)
        sidecar = json.loads((self.root/entry['export_provenance']).read_text())
        sidecar['module_source_sha256'] = entry['module_source_sha256']
        batch.sweep.write_json(self.root/entry['export_provenance'], sidecar)

    def export(self, entry):
        identity = [['1' if i == j else '0' for j in range(13)] for i in range(13)]
        zero = [['0' for _ in range(13)] for _ in range(13)]
        row = {'k': entry['k'], 'i': entry['i'], 'j': entry['j'], 'grid': entry['grid'],
               's': '1/5', 'cap': '7/5', 'capPad': '1/100000000000',
               'encl': True, 'polyOK': True, 'ok': True, 'N': identity,
               'cons': [{'lo': '-3/1000', 'hi': '3/1000', 'lam': '1/5', 'mu': '0', 'A': zero, 'B': zero}]}
        if entry['grid'] == 3:
            row['grid_spec'] = entry['grid_spec']
        path = self.root/entry['export']
        path.write_text(json.dumps(row)+'\n')
        return path

    def new_batch(self, **changes):
        for name, value in changes.items():
            setattr(self.config, name, value)
        return batch.Batch(self.config, checker=lambda *_: None)

    def fake_runner(self, owner, callback):
        calls = []
        def run(argv, phase, keys):
            calls.append((argv, phase, keys))
            code = callback(phase, keys)
            return {'actual_exit': code or 0, 'error': None, 'pause_reason': None, 'keys': keys, 'phase': phase}
        owner.runner = Mock(run=run)
        return calls

    def test_whitelist_rejects_unrelated_module_and_extra_import(self):
        entry = copy.deepcopy(self.manifest['entries'][0])
        self.assertEqual(batch.module_target(self.root, entry), entry['module'])
        with self.assertRaises(ValueError):
            batch.module_target(self.root, dict(entry, module='GrotheCaps'))
        path = self.root/entry['module_file']
        path.write_text('import Grothe.LowerAnalytic.CapRow00\n'+path.read_text())
        entry['module_source_sha256'] = batch.sweep.sha(path)
        with self.assertRaisesRegex(ValueError, 'imports'):
            batch.module_target(self.root, entry)

    def test_whitelist_rejects_absolute_io_and_native_command(self):
        entry = copy.deepcopy(self.manifest['entries'][0])
        path = self.root/entry['module_file']
        original = path.read_text()
        for bad in [original.replace(json.dumps(entry['export']), json.dumps(str(self.root/entry['export']))),
                    original+'\ntheorem bad : True := by native_decide\n']:
            path.write_text(bad)
            entry['module_source_sha256'] = batch.sweep.sha(path)
            with self.assertRaises(ValueError):
                batch.module_target(self.root, entry)

    def test_initial_group_two_later_explicit_three_and_resume(self):
        owner = self.new_batch(batch_size=3)
        calls = self.fake_runner(owner, lambda _phase, keys: [self.export(owner.entries[k]) for k in keys] and 0)
        owner.exports(owner.selected_keys, 'raw')
        self.assertEqual([len(keys) for _, _, keys in calls], [2, 1])
        before = {k: (self.root/e['export']).read_bytes() for k, e in owner.entries.items()}
        owner.exports(owner.selected_keys, 'raw')
        self.assertEqual(len(calls), 2)
        self.assertEqual(before, {k: (self.root/e['export']).read_bytes() for k, e in owner.entries.items()})

    def test_pilot_resumption_never_advances_to_third_centre(self):
        owner = self.new_batch(pilot_limit=2, export_only=True)
        calls = self.fake_runner(owner, lambda _phase, keys: [self.export(owner.entries[k]) for k in keys] and 0)
        self.assertEqual(owner.run(), 0)
        self.assertEqual(len(calls), 1)
        resumed = self.new_batch()
        calls2 = self.fake_runner(resumed, lambda *_: self.fail('Completed pilot must not build again'))
        self.assertEqual(resumed.run(), 0)
        self.assertFalse(calls2)
        third = owner.pending_keys[2]
        self.assertFalse((self.root/owner.entries[third]['export']).exists())

    def test_first_export_group_stays_two_after_prior_solver_receipts(self):
        owner = self.new_batch(batch_size=3)
        owner.state['groups'].append({'phase': 'raw-solve', 'actual_exit': 0})
        calls = self.fake_runner(owner, lambda _phase, keys:
                                 [self.export(owner.fine_manifests[k]['entry']) for k in keys] and 0)
        owner.exports(owner.selected_keys, 'fine')
        self.assertEqual([len(keys) for _, _, keys in calls], [2, 1])

    def test_failed_batch_keeps_complete_peer_and_partial_bytes(self):
        owner = self.new_batch()
        first, second = owner.selected_keys[:2]
        def fail(_phase, _keys):
            self.export(owner.entries[first])
            (self.root/owner.entries[second]['export']).write_text('{"k":14,')
            return 1
        calls = self.fake_runner(owner, fail)
        with self.assertRaisesRegex(ValueError, 'peer exports'):
            owner.exports(owner.selected_keys, 'raw')
        self.assertEqual(owner.state['centres'][first]['raw_export'], 'valid')
        self.assertEqual(owner.state['centres'][second]['raw_export'], 'invalid_preserved')
        self.assertEqual((self.root/owner.entries[second]['export']).read_text(), '{"k":14,')
        with self.assertRaisesRegex(ValueError, 'Partial/stale'):
            owner.exports(owner.selected_keys, 'raw')
        self.assertEqual(len(calls), 1)

    def test_stop_file_pauses_after_current_batch(self):
        owner = self.new_batch()
        def stop(_phase, keys):
            for key in keys:
                self.export(owner.entries[key])
            self.config.stop_file.parent.mkdir(parents=True, exist_ok=True)
            self.config.stop_file.write_text('pause\n')
        calls = self.fake_runner(owner, stop)
        with self.assertRaises(batch.Pause):
            owner.exports(owner.selected_keys, 'raw')
        self.assertEqual(len(calls), 1)

    def solved(self, owner, key, phase, increase='0', status='fixed'):
        entry = owner.entries[key] if phase == 'raw' else owner.fine_manifests[key]['entry']
        prov = {'fingerprint': owner.manifest['provenance']['fingerprint'] if phase == 'raw' else
                owner.fine_manifests[key]['provenance']['fingerprint'],
                'export_sha256': batch.sweep.sha(self.root/entry['export']),
                'baseline_capPad': '1/100000000000',
                'cap_up_convention': owner.manifest['provenance']['cap_up_convention']}
        row = {'k': entry['k'], 'i': entry['i'], 'j': entry['j'], 'grid': entry['grid'],
               'status': status, 'cap_up': increase, 'lm': [['1/5', '0']], 'provenance': prov}
        if phase == 'fine':
            prov['grid_spec'] = self.grid
            row['grid_spec'] = self.grid
        if status == 'fail':
            row.update(cap_up=None, lm=None, error='optimizer did not find exact feasible multipliers')
        batch.sweep.write_json(self.root/entry['solved'], [row])

    def test_fine_exports_only_positive_raw_and_failed_solver_is_not_success(self):
        owner = self.new_batch(pilot_limit=2)
        positive = owner.selected_keys[1]
        def process(phase, keys):
            for key in keys:
                if phase.endswith('export'):
                    self.export(owner.entries[key] if phase == 'raw-export' else owner.fine_manifests[key]['entry'])
                elif phase == 'raw-solve':
                    self.solved(owner, key, 'raw', '1/7' if key == positive else '0',
                                'cap_up' if key == positive else 'fixed')
                else:
                    self.solved(owner, key, 'fine', status='fail')
            return 0
        calls = self.fake_runner(owner, process)
        self.assertEqual(owner.run(), 1)
        self.assertEqual(owner.state['status'], 'incomplete_or_unknown')
        self.assertEqual([keys for _, phase, keys in calls if phase == 'fine-export'], [[positive]])
        self.assertNotIn('fine_cap_up', owner.state['centres'][positive])
        self.assertTrue((self.root/owner.fine_manifests[positive]['entry']['solved']).exists())

    def test_failed_revalidation_removes_stale_positive_number(self):
        owner = self.new_batch(pilot_limit=2)
        first = owner.selected_keys[0]
        self.export(owner.entries[first])
        self.solved(owner, first, 'raw')
        path = self.root/owner.entries[first]['solved']
        rows = json.loads(path.read_text())
        rows[0]['provenance'] = {}
        path.write_text(json.dumps(rows))
        owner.state['centres'][first].update(raw_export='valid', raw_cap_up='1/7', fine_cap_up='0')
        self.fake_runner(owner, lambda *_: self.fail('Existing failed result must not be overwritten'))
        owner.solve([first], 'raw')
        self.assertNotIn('raw_cap_up', owner.state['centres'][first])
        self.assertNotIn('fine_cap_up', owner.state['centres'][first])
        self.assertEqual(owner.state['centres'][first]['state'], 'unknown')

    def test_foreign_controller_record_is_only_probed_never_signalled(self):
        path = self.root/'handoff/caps-centre/active-child.json'
        path.parent.mkdir(parents=True, exist_ok=True)
        batch.sweep.write_json(path, {'state': 'running', 'pid': 92735, 'pgid': 92735,
                                     'controller_pid': 92735, 'controller_pgid': 92735})
        with patch.object(batch.campaign.os, 'killpg') as probe:
            with self.assertRaises(batch.campaign.SurvivingJob):
                batch.previous_jobs(self.root, {})
        self.assertEqual(probe.call_args.args, (92735, 0))

    def test_common_flock_excludes_another_controller(self):
        path = self.root/'campaign.lock'
        with path.open('a+') as first, path.open('a+') as second:
            fcntl.flock(first, fcntl.LOCK_EX | fcntl.LOCK_NB)
            with self.assertRaises(BlockingIOError):
                fcntl.flock(second, fcntl.LOCK_EX | fcntl.LOCK_NB)

    def test_config_rejects_foreign_progress_and_oversized_initial_group(self):
        self.config.progress = self.root/'data/caps-m/plan/batch-other.json'
        with self.assertRaises(ValueError):
            self.config.validate()
        self.config.progress = self.root/'data/caps-m/plan/batch-codex-15b7-test.json'
        self.config.initial_batch_size = 3
        with self.assertRaises(ValueError):
            self.config.validate()

    def test_busy_scanner_ignores_own_lean_and_listener(self):
        rows = [{'pid': 1, 'pgid': 1, 'comm': 'Runner.Listener', 'exe': 'Runner.Listener'},
                {'pid': 2, 'pgid': 7, 'comm': 'lean', 'exe': 'lean'},
                {'pid': 3, 'pgid': 3, 'comm': 'Runner.Worker', 'exe': 'Runner.Worker'}]
        self.assertEqual([r['pid'] for r in batch.busy(rows, 7)], [3])

    def test_malformed_quotes_in_foreign_args_do_not_break_scanner(self):
        line = "11 11 1 20 bash bash -c unmatched'quote\n12 12 1 21 Runner.Worker /bin/Runner.Worker\n"
        with patch.object(batch.subprocess, 'check_output', return_value=line):
            rows = batch.process_rows()
        self.assertEqual([r['pid'] for r in batch.busy(rows)], [12])

    def test_disk_and_foreign_guard_prevent_start(self):
        disk = namedtuple('Disk', 'free')
        guard = batch.Guard(self.config, snapshot=lambda: [], disk=lambda _: disk(2*batch.GIB))
        popen = Mock()
        runner = batch.Runner(self.config, lambda **_: None, guard=guard, popen=popen)
        with self.assertRaises(batch.Pause):
            runner.run(['lake', 'build', 'ignored'], 'raw-export', ['key'])
        popen.assert_not_called()

    def test_runner_records_peak_and_single_thread_environment(self):
        child, captured = FakeChild(), {}
        def popen(argv, **kwargs):
            captured.update(kwargs)
            return child
        guard = FakeGuard([{'rss': 0, 'pause_reason': None},
                           {'rss': 3*batch.GIB, 'pause_reason': None, 'modules': ['A.lean', 'B.lean'], 'lean_count': 2},
                           {'rss': 0, 'pause_reason': None}])
        runner = batch.Runner(self.config, lambda **_: None, guard=guard, popen=popen, sleep=lambda _: None)
        record = runner.run(['lake', 'build', 'A', 'B'], 'raw-export', ['a', 'b'])
        self.assertEqual(record['actual_exit'], 0)
        self.assertEqual(record['peak_concurrent_lean'], 2)
        self.assertEqual(record['peak_aggregate_rss_bytes'], 3*batch.GIB)
        self.assertEqual(record['observed_modules'], ['A.lean', 'B.lean'])
        self.assertTrue(captured['start_new_session'])
        self.assertEqual(captured['env']['LEAN_NUM_THREADS'], '1')
        self.assertEqual(captured['env']['PYTHONDONTWRITEBYTECODE'], '1')
        self.assertFalse((self.root/'handoff/caps-centre/active-child.json').exists())
        self.assertTrue((self.config.run_dir/'batch-child.json').exists())

    def test_rss_or_runner_guard_stops_only_fresh_owned_group(self):
        for reason in ['aggregate RSS exceeded', 'busy CI/foreign Lean']:
            with self.subTest(reason=reason):
                child = FakeChild()
                signals = []
                def killpg(pid, sig):
                    signals.append((pid, sig))
                    child.ended, child.code = True, -15
                guard = FakeGuard([{'rss': 0, 'pause_reason': None},
                                   {'rss': 9*batch.GIB, 'pause_reason': reason},
                                   {'rss': 0, 'pause_reason': None}])
                runner = batch.Runner(self.config, lambda **_: None, guard=guard,
                                     popen=lambda *a, **k: child, killpg=killpg, sleep=lambda _: None)
                # Distinct owned receipt names for the second fake controller run.
                runner.sequence = len(list(self.config.run_dir.glob('*.log')))
                record = runner.run(['lake', 'build', 'A'], 'raw-export', ['a'])
                self.assertEqual(record['state'], 'paused')
                self.assertEqual(signals, [(5001, signal.SIGTERM)])

    def test_journal_failure_after_spawn_still_stops_owned_child(self):
        child, signals, updates = FakeChild(), [], []
        def killpg(pid, sig):
            signals.append((pid, sig))
            child.ended, child.code = True, -15
        def update(**items):
            updates.append(items)
            if len(updates) == 1:
                raise OSError('fake checkpoint write failure')
        runner = batch.Runner(self.config, update, guard=FakeGuard([{'rss': 0, 'pause_reason': None}]),
                             popen=lambda *a, **k: child, killpg=killpg, sleep=lambda _: None)
        record = runner.run(['lake', 'build', 'A'], 'raw-export', ['a'])
        self.assertEqual(record['state'], 'failed')
        self.assertEqual(signals, [(5001, signal.SIGTERM)])


if __name__ == '__main__':
    unittest.main()
