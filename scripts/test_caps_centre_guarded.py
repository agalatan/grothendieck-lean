#!/usr/bin/env python3
"""Guarded Campaign adapter regressions; fake processes/fixtures, no Lean/search.

Agent-ID: codex-15b7 (tests prepared by codex-7d19).
"""
import copy
import contextlib
from dataclasses import replace
import fcntl
import importlib.util
import io
import json
from pathlib import Path
import shutil
import signal
import sys
import unittest
from unittest.mock import Mock, patch

ROOT = Path(__file__).resolve().parents[1]
sys.dont_write_bytecode = True
sys.path.insert(0, str(ROOT/'tools'))
import caps_centre_guarded as guarded

sp = importlib.util.spec_from_file_location('guarded_fine_fixtures', ROOT/'scripts/test_caps_centre_fine.py')
fixtures = importlib.util.module_from_spec(sp)
sp.loader.exec_module(fixtures)


class Child:
    pid = 987653

    def __init__(self, code=0):
        self.code, self.polls, self.ended = code, 1, False

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


class Guard:
    def __init__(self, values=()):
        self.values = iter(values)

    def observe(self, group=None):
        return next(self.values, {'pause_reason': None, 'rss': 0, 'free_disk': 9*guarded.batch.GIB,
                                  'lean_count': 0, 'modules': []})


class Tests(unittest.TestCase):
    def setUp(self):
        fixtures.FineTests.setUp(self)
        self.root = self.root.resolve()
        (self.root/'lakefile.toml').write_text('name = "fixture"\n\n[[lean_lib]]\nname = "Grothe"\n')
        for name in guarded.SOURCE_NAMES:
            shutil.copyfile(ROOT/'tools'/name, self.root/'tools'/name)
        self.plan = self.root/guarded.sweep.PLAN
        self.manifest = guarded.sweep.inventory(self.root)
        guarded.sweep.prepare(self.root, self.manifest, 'Codex15b7GuardedFixture')
        self.entry = self.manifest['entries'][0]
        self.ident = guarded.sweep.key_string(self.entry)
        self.manifest_path = self.plan/'manifest.json'
        guarded.repair.atomic_json(self.manifest_path, self.manifest)
        self.config = guarded.Config(self.root, self.plan/'portable/config.json',
                                     self.plan/'guarded-campaign-codex-15b7-fixture.json',
                                     self.root/'handoff/caps-centre/codex-15b7-guarded-fixture',
                                     self.root/'handoff/caps-centre/codex-15b7-guarded-fixture/STOP_REQUESTED',
                                     poll_seconds=0.001)
        self.bundle = {'format': guarded.portable.FORMAT, 'source_files': {}, 'outputs': {},
                       'preserved_files': {}, 'inputs': {}, 'completed_keys': [],
                       'pending': [{'key': self.ident}],
                       'manifest': {'path': str(self.manifest_path.relative_to(self.root)),
                                    'sha256': guarded.sweep.sha(self.manifest_path)},
                       'generator': {'path': 'tools/caps_centre_portable.py',
                                     'sha256': guarded.sweep.sha(self.root/'tools/caps_centre_portable.py')}}
        guarded.repair.atomic_json(self.config.portable, self.bundle)
        self.registry = guarded.Registry(self.config, self.bundle, self.manifest_path, self.manifest)

    def fine(self):
        fm = guarded.fine.prepare(self.root, '14:200', 'Codex15b7GuardedFine', self.grid)
        path = self.plan/'fine-campaign/fine-fixture.json'
        guarded.repair.atomic_json(path, fm)
        return path, fm

    def raw_export(self):
        eye = [['1' if i == j else '0' for j in range(13)] for i in range(13)]
        zero = [['0' for _ in range(13)] for _ in range(13)]
        e = self.entry
        row = {'k': e['k'], 'i': e['i'], 'j': e['j'], 'grid': e['grid'], 's': '1/5', 'cap': '7/5',
               'capPad': '1/100000000000', 'encl': True, 'polyOK': True, 'ok': True, 'N': eye,
               'cons': [{'lo': '-3/1000', 'hi': '3/1000', 'lam': '1/5', 'mu': '0', 'A': zero, 'B': zero}]}
        p = self.root/e['export'];p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(json.dumps(row)+'\n')
        return row

    def passport(self):
        return guarded.Passport(self.config, self.bundle, self.manifest_path,
                                snapshot=lambda _: {'head': 'fixture', 'tracked_diff': 'explicit fixture config'})

    def adapter(self, *, code=0, observations=()):
        passport = self.passport()
        registry = Mock()
        registry.authorize.return_value = {'exact_registry': 'fixture'}
        self.popen, self.killpg = Mock(return_value=Child(code)), Mock()
        guard = Guard(observations)
        def factory(c, update):
            return guarded.batch.Runner(c, update, guard=guard, popen=self.popen,
                                        killpg=self.killpg, sleep=lambda _: None)
        return guarded.Adapter(self.config.campaign_config(self.manifest_path), Mock(), passport, registry,
                               runner_factory=factory)

    def test_config_rejects_foreign_paths_and_shared_directories(self):
        self.config.validate()
        for config in [replace(self.config, progress=self.plan/'other.json'),
                       replace(self.config, run_dir=self.root/'handoff/caps-centre/foreign'),
                       replace(self.config, stop_file=self.root.parent/'outside'),
                       replace(self.config, disk_floor=2*guarded.batch.GIB)]:
            with self.assertRaises(ValueError):
                config.validate()

    def test_fine_export_accepts_exact_absolute_and_relative_templates(self):
        path, fm = self.fine()
        argv = ['lake', 'build', fm['entry']['module'], '--wfail']
        got = self.registry.authorize(argv, 'fine-export', self.ident, fine_grid=True)
        self.assertEqual(got['manifest_sha256'], guarded.sweep.sha(path))
        e = fm['entry'];name = e['module'].split('.')[-1]
        source = guarded.portable.source(self.nodes[0], e, name, grid_spec=e['grid_spec'], target=e['export'])
        (self.root/e['module_file']).write_bytes(source)
        e['module_source_sha256'] = guarded.hashlib.sha256(source).hexdigest()
        side = self.root/e['export_provenance'];value = guarded.read(side)
        value['module_source_sha256'] = e['module_source_sha256'];guarded.repair.atomic_json(side, value)
        guarded.repair.atomic_json(path, fm)
        self.registry.authorize(argv, 'fine-export', self.ident, fine_grid=True)

    def test_appended_native_code_is_rejected_even_with_consistent_hash(self):
        path, fm = self.fine();e = fm['entry'];p = self.root/e['module_file']
        p.write_text(p.read_text()+'\ntheorem bad : True := by native_decide\n')
        e['module_source_sha256'] = guarded.sweep.sha(p)
        side = self.root/e['export_provenance'];value = guarded.read(side)
        value['module_source_sha256'] = e['module_source_sha256'];guarded.repair.atomic_json(side, value)
        guarded.repair.atomic_json(path, fm)
        with self.assertRaisesRegex(ValueError, 'exact pure exporter'):
            self.registry.authorize(['lake', 'build', e['module'], '--wfail'], 'fine-export', self.ident, fine_grid=True)

    def test_legacy_modules_and_all_raw_rebuilds_are_forbidden(self):
        _, fm = self.fine();e = fm['entry'];self.registry.legacy.add(e['module'])
        with self.assertRaisesRegex(ValueError, 'Legacy'):
            self.registry.authorize(['lake', 'build', e['module'], '--wfail'], 'fine-export', self.ident, fine_grid=True)
        with self.assertRaisesRegex(ValueError, 'raw rebuilding'):
            self.registry.authorize(['lake', 'build', self.entry['module'], '--wfail'], 'stored-export', self.ident)

    def test_unknown_phases_and_generic_native_processes_are_forbidden(self):
        for argv, phase, fine_grid in [(['lake', 'build', 'Grothe'], 'fine-export', True),
                                       (['lake', 'build', 'Grothe', '--wfail', 'Extra'], 'fine-export', True),
                                       (['python3', '-c', 'pass'], 'solve-stored', False),
                                       (['lake', 'build', 'GrotheCaps'], 'interval-export', True)]:
            with self.assertRaises(ValueError):
                self.registry.authorize(argv, phase, self.ident, fine_grid=fine_grid)

    def test_stored_solver_requires_exact_interpreter_manifest_and_key(self):
        self.raw_export()
        argv = [sys.executable, str(self.root/'tools/caps_centre_campaign.py'), '_worker', 'solve-stored',
                '--manifest', str(self.manifest_path), '--key', self.ident]
        self.registry.authorize(argv, 'solve-stored', self.ident)
        for invalid in [argv+['--extra'], argv[:-1]+['12:999:0'], ['python3']+argv[1:]]:
            with self.assertRaises(ValueError):
                self.registry.authorize(invalid, 'solve-stored', self.ident)

    def test_fine_solver_needs_registered_complete_export(self):
        path, fm = self.fine()
        argv = [sys.executable, str(self.root/'tools/caps_centre_campaign.py'), '_worker', 'solve-fine',
                '--manifest', str(self.manifest_path), '--fine-manifest', str(path)]
        with self.assertRaisesRegex(ValueError, 'complete export'):
            self.registry.authorize(argv, 'solve-fine', self.ident, fine_grid=True)
        fixtures.FineTests.exported(self, fm)
        self.registry.authorize(argv, 'solve-fine', self.ident, fine_grid=True)

    def test_fine_solved_destination_cannot_escape_or_replace_another_input(self):
        path, fm = self.fine()
        for destination in (str(self.root.parent/'outside.json'),
                            'data/caps-m-pieces/pieces.json', '../escape.json'):
            with self.subTest(destination=destination):
                invalid = copy.deepcopy(fm);invalid['entry']['solved'] = destination
                guarded.repair.atomic_json(path, invalid)
                for argv, phase in [(['lake', 'build', fm['entry']['module'], '--wfail'], 'fine-export'),
                                    ([sys.executable, str(self.root/'tools/caps_centre_campaign.py'), '_worker',
                                      'solve-fine', '--manifest', str(self.manifest_path), '--fine-manifest', str(path)],
                                     'solve-fine')]:
                    with self.assertRaises(ValueError):
                        self.registry.authorize(argv, phase, self.ident, fine_grid=True)
        self.assertFalse((self.root.parent/'outside.json').exists())

    def test_synchronous_fine_replay_is_checked_even_when_no_child_is_needed(self):
        path, fm = self.fine();fixtures.FineTests.exported(self, fm)
        outside = self.root.parent/('guarded-outside-'+self.root.name+'.json')
        outside.write_text('[{"existing":"owned fixture, must remain unchanged"}]\n')
        self.addCleanup(outside.unlink, missing_ok=True)
        before = outside.read_bytes();fm['entry']['solved'] = str(outside)
        guarded.repair.atomic_json(path, fm)
        runner = Mock();runner.registry = self.registry
        runner.run.side_effect = AssertionError('No child should be started')
        owner = guarded.GuardedCampaign(self.config.campaign_config(self.manifest_path),
                                         runner_factory=lambda *_: runner)
        with patch.object(guarded.fine, 'solve', side_effect=AssertionError('Do not replay unsafe paths')) as solve:
            with self.assertRaises(ValueError):
                owner.finer(self.entry)
        solve.assert_not_called();runner.run.assert_not_called()
        self.assertEqual(outside.read_bytes(), before)

    def test_fine_manifest_must_be_in_campaign_discovery_registry(self):
        path, fm = self.fine()
        unregistered = self.plan/'solved/not-a-discovery-manifest.json'
        guarded.repair.atomic_json(unregistered, fm)
        argv = [sys.executable, str(self.root/'tools/caps_centre_campaign.py'), '_worker', 'solve-fine',
                '--manifest', str(self.manifest_path), '--fine-manifest', str(unregistered)]
        with self.assertRaisesRegex(ValueError, 'discovery registry'):
            self.registry.authorize(argv, 'solve-fine', self.ident, fine_grid=True)

    def test_identical_fine_aliases_follow_campaign_order_and_conflicts_fail_closed(self):
        path, fm = self.fine()
        alias = self.plan/'fine-alias.json';guarded.repair.atomic_json(alias, fm)
        chosen, _ = self.registry.fine_manifest(self.ident, module=fm['entry']['module'])
        self.assertEqual(chosen, min(path, alias, key=str))
        changed = copy.deepcopy(fm);changed['unexpected_alias_metadata'] = 'different'
        guarded.repair.atomic_json(alias, changed)
        with self.assertRaisesRegex(ValueError, 'Ambiguous'):
            self.registry.fine_manifest(self.ident, module=fm['entry']['module'])

    def test_historical_repair_accepts_bound_in_progress_resume_folder(self):
        row = self.raw_export()
        solved = self.plan/'solved/historical-positive.json'
        baseline = {'cap_up': '1/10'}
        guarded.repair.atomic_json(solved, [baseline])
        entry = dict(self.entry, search_status='historical_adopted',
                     historical={'file': str(solved.relative_to(self.root))})
        self.registry.entries[self.ident] = entry
        export = self.root/entry['export']
        folder = self.plan/'repairs/preserved-source-attempt'
        fp = guarded.campaign.repair_fingerprint(export, solved, self.config.repair_depth)
        checkpoint = folder/f"repair_centre_{entry['k']}x{entry['i']}_j{entry['j']}_g{entry['grid']}.json"
        state = {'fingerprint': fp, 'piece': [row[k] for k in ('k', 'i', 'j', 'grid')], 'state': 'in_progress'}
        guarded.repair.atomic_json(checkpoint, state)
        argv = [sys.executable, 'tools/caps_centre_repair.py', str(export.relative_to(self.root)),
                str(solved.relative_to(self.root)), '--agent-id', self.config.agent_id,
                '--output-dir', str(folder.relative_to(self.root)), '--max-depth', '1', '--piece', self.ident]
        with patch.object(guarded.campaign, 'historical_result', return_value=baseline), \
                patch.object(guarded.campaign, 'find_historical_export',
                             return_value=(row, export.relative_to(self.root))):
            got = self.registry.authorize(argv, 'stored-repair', self.ident)
            self.assertEqual(got['output_dir'], str(folder))
            state['fingerprint'] = {'wrong': 'source'};guarded.repair.atomic_json(checkpoint, state)
            with self.assertRaisesRegex(ValueError, 'exact baseline'):
                self.registry.authorize(argv, 'stored-repair', self.ident)

    def test_fine_repair_cannot_start_optimizer_for_missing_primary_result(self):
        _, fm = self.fine();fixtures.FineTests.exported(self, fm)
        argv = [sys.executable, 'tools/caps_centre_repair.py', fm['entry']['export'], fm['entry']['solved'],
                '--agent-id', self.config.agent_id, '--output-dir', 'data/caps-m/plan/repairs/test',
                '--max-depth', '1', '--piece', self.ident]
        with patch.object(guarded.fine, 'solve', side_effect=AssertionError('No in-controller optimizer')) as solve:
            with self.assertRaisesRegex(ValueError, 'primary result is missing'):
                self.registry.authorize(argv, 'fine-repair', self.ident, fine_grid=True)
        solve.assert_not_called()

    def test_symlink_and_outside_fine_registry_paths_fail_before_spawn(self):
        path, fm = self.fine();argv = [sys.executable, str(self.root/'tools/caps_centre_campaign.py'), '_worker',
                                      'solve-fine', '--manifest', str(self.manifest_path), '--fine-manifest', str(path)]
        original = path.read_bytes();path.unlink();outside = self.root.parent/'outside-guarded-fixture.json'
        outside.write_bytes(original);self.addCleanup(outside.unlink, missing_ok=True);path.symlink_to(outside)
        with self.assertRaisesRegex(ValueError, 'Symlink'):
            self.registry.authorize(argv, 'solve-fine', self.ident, fine_grid=True)

    def test_profile_pins_new_untracked_helper_and_guard_source(self):
        passport = self.passport();passport.check()
        self.assertIn('tools/caps_centre_guarded.py', passport.expected['sources'])
        self.assertEqual(passport.expected['execution']['rss_limit'], self.config.rss_limit)
        self.assertEqual(passport.guard.rss_limit, self.config.campaign_config(self.manifest_path).rss_limit)
        (self.root/'tools/caps_centre_guarded.py').write_text('changed independently injected runner\n')
        with self.assertRaisesRegex(ValueError, 'profile/source changed'):
            passport.check()

    def test_changed_profile_rejects_resume_without_relabeling(self):
        old = self.passport();original = old.path.read_bytes();self.config.rss_limit += guarded.batch.GIB
        with self.assertRaisesRegex(ValueError, 'profile/source changed'):
            self.passport()
        self.assertEqual(old.path.read_bytes(), original)

    def test_existing_progress_without_adapter_passport_is_not_adopted(self):
        guarded.repair.atomic_json(self.config.progress, {'fake': 'not a passport'})
        with self.assertRaisesRegex(ValueError, 'no injected-runner passport'):
            self.passport()

    def test_success_returns_actual_guarded_receipt_and_single_thread_overlay(self):
        adapter = self.adapter()
        receipt = adapter.run(['lake', 'build', 'fixture', '--wfail'], 'fine-export', self.ident, fine_grid=True)
        record = guarded.read(receipt)
        self.assertEqual(record['actual_exit'], 0)
        self.assertEqual(record['state'], 'complete')
        self.assertEqual(record['argv'][1:3], ['-f', record['lake_overlay']['path']])
        self.assertEqual(record['lean_child_threads'], 1)
        self.assertEqual(self.popen.call_args.kwargs['env']['LEAN_NUM_THREADS'], '1')
        auth = list(self.config.run_dir.glob('authorization-*.json'))
        self.assertEqual(guarded.read(auth[0])['receipt_sha256'], guarded.sweep.sha(receipt))
        self.killpg.assert_not_called()

    def test_startup_foreign_or_disk_guard_pauses_without_spawn(self):
        adapter = self.adapter(observations=[{'pause_reason': 'busy CI/foreign Lean', 'rss': 0}])
        with self.assertRaises(guarded.campaign.ResourcePaused):
            adapter.run(['fixture'], 'solve-stored', self.ident)
        self.popen.assert_not_called();self.killpg.assert_not_called()
        self.assertFalse(list(adapter.passport.guard.run_dir.glob('batch-*.json')))

    def test_rss_pause_stops_only_created_group_and_keeps_real_exit(self):
        values = [{'pause_reason': None, 'rss': 0},
                  {'pause_reason': 'aggregate RSS exceeded', 'rss': 13*guarded.batch.GIB},
                  {'pause_reason': None, 'rss': 0}]
        adapter = self.adapter(observations=values)
        with self.assertRaises(guarded.campaign.ResourcePaused):
            adapter.run(['fixture'], 'solve-stored', self.ident)
        self.assertEqual(self.killpg.call_args.args[0], Child.pid)
        record = guarded.read(list(adapter.passport.guard.run_dir.glob('batch-*-solve-stored.json'))[0])
        self.assertEqual(record['state'], 'paused')
        self.assertEqual(record['pause_reason'], 'aggregate RSS exceeded')
        self.assertIsNone(adapter.runner.child)

    def test_nonzero_child_cannot_be_reported_as_success(self):
        adapter = self.adapter(code=3)
        with self.assertRaisesRegex(RuntimeError, 'actual receipt'):
            adapter.run(['fixture'], 'solve-stored', self.ident)
        record = guarded.read(list(adapter.passport.guard.run_dir.glob('batch-*-solve-stored.json'))[0])
        self.assertEqual(record['actual_exit'], 3)

    def test_child_failure_and_resource_pause_cannot_complete_a_centre(self):
        self.raw_export()
        adapter = self.adapter(code=3)
        adapter.registry = self.registry
        owner = guarded.GuardedCampaign(self.config.campaign_config(self.manifest_path),
                                         runner_factory=lambda *_: adapter)
        self.assertEqual(owner.run(), 1)
        self.assertEqual(owner.state['summary']['completed_centres'], 0)
        self.assertEqual(owner.state['status'], 'failed')

    def test_resource_pause_keeps_scientific_acceptance_pending(self):
        self.raw_export()
        normal = {'pause_reason': None, 'rss': 0}
        adapter = self.adapter(observations=[normal, normal,
                                             {'pause_reason': 'aggregate RSS exceeded', 'rss': 13*guarded.batch.GIB},
                                             normal])
        adapter.registry = self.registry
        owner = guarded.GuardedCampaign(self.config.campaign_config(self.manifest_path),
                                         runner_factory=lambda *_: adapter)
        self.assertEqual(owner.run(), 75)
        self.assertEqual(owner.state['summary']['completed_centres'], 0)
        self.assertEqual(owner.state['status'], 'paused')
        self.assertEqual(self.killpg.call_args.args[0], Child.pid)

    def test_input_mutation_during_successful_child_is_not_accepted(self):
        adapter = self.adapter()
        adapter.registry.authorize.side_effect = [{'before': 'bound'}, {'after': 'different'}]
        with self.assertRaisesRegex(ValueError, 'inputs/source changed'):
            adapter.run(['fixture'], 'solve-stored', self.ident)

    def test_signal_pause_after_child_prevents_another_child_for_same_centre(self):
        adapter = self.adapter()
        owner = guarded.GuardedCampaign(self.config.campaign_config(self.manifest_path),
                                         runner_factory=lambda *_: adapter)
        adapter.run(['fixture'], 'solve-stored', self.ident)
        owner.pause_signal(signal.SIGTERM, None)
        with self.assertRaises(guarded.campaign.Paused):
            adapter.run(['fixture'], 'fine-export', self.ident, fine_grid=True)
        self.assertEqual(self.popen.call_count, 1)
        self.assertEqual(owner.state['summary']['completed_centres'], 0)
        self.assertEqual(len(list(self.config.run_dir.glob('authorization-*.json'))), 1)

    def test_common_lock_rejects_duplicate_cli_before_any_runtime_metadata(self):
        lock = self.root/'handoff/caps-centre/campaign.lock'
        lock.parent.mkdir(parents=True, exist_ok=True)
        with lock.open('a+') as stream, patch.object(guarded, 'ROOT', self.root), \
                patch.object(guarded.os, 'getpid', return_value=9999), \
                patch.object(guarded.os, 'getpgrp', return_value=9999), contextlib.redirect_stderr(io.StringIO()):
            fcntl.flock(stream, fcntl.LOCK_EX|fcntl.LOCK_NB)
            with self.assertRaises(SystemExit) as error:
                guarded.main(['--portable-config', str(self.config.portable), '--agent-id', self.config.agent_id,
                              '--progress', str(self.config.progress), '--run-dir', str(self.config.run_dir)])
        self.assertEqual(error.exception.code, 1)
        self.assertFalse(self.config.progress.exists())
        self.assertFalse(self.config.run_dir.exists())

    def full_fixture(self):
        prepared = [dict(self.entry, i=i, export=f'data/caps-m/plan/exports/fixture-{i}.jsonl') for i in range(343)]
        historical = [dict(k=15, i=i, j=0, grid=2, nq=1024, search_status='historical_adopted') for i in range(15)]
        manifest = dict(self.manifest, entries=prepared+historical)
        guarded.repair.atomic_json(self.manifest_path, manifest)
        bundle = copy.deepcopy(self.bundle)
        bundle['manifest']['sha256'] = guarded.sweep.sha(self.manifest_path)
        keys = [guarded.sweep.key_string(e) for e in manifest['entries']]
        bundle['completed_keys'] = keys[:109];bundle['pending'] = [{'key': key}for key in keys[109:]]
        guarded.repair.atomic_json(self.config.portable, bundle)
        return manifest, prepared

    def test_preflight_requires_all343_prepared_exports_not_only249_pending(self):
        manifest, prepared = self.full_fixture()
        missing = guarded.sweep.key_string(prepared[0])  # Preserved, outside pending249.
        check = Mock(side_effect=lambda _r, _m, e: None if guarded.sweep.key_string(e) == missing else {'present': True})
        with patch.object(guarded.sweep, 'check_manifest'), patch.object(guarded.sweep, 'export_record', check):
            with self.assertRaisesRegex(ValueError, missing):
                guarded.preflight(self.config, checker=lambda *_: None)
        self.assertEqual(check.call_count, 343)
        self.assertFalse(self.config.run_dir.exists())
        with patch.object(guarded.sweep, 'check_manifest'), \
                patch.object(guarded.sweep, 'export_record', return_value={'present': True}):
            _, _, got = guarded.preflight(self.config, checker=lambda *_: None)
        self.assertEqual(len(got['entries']), 358)

    def test_subsets_and_duplicate_keys_are_rejected_before_campaign(self):
        manifest, _ = self.full_fixture()
        for invalid in [dict(manifest, entries=manifest['entries'][:-1]),
                        dict(manifest, entries=manifest['entries'][:-1]+[manifest['entries'][0]])]:
            with self.assertRaisesRegex(ValueError, 'Full358'):
                guarded.full_inventory(invalid)

    def test_inherited_campaign_records_full358_incremental_completions(self):
        manifest, _ = self.full_fixture()
        export = self.root/self.entry['export'];export.parent.mkdir(parents=True, exist_ok=True)
        export.write_text('fixture exact-matrix evidence\n')
        solved = self.plan/'solved/replayed-fixture.json';guarded.repair.atomic_json(solved, [])
        runner = Mock();runner.runner.guard.observe.return_value = {'pause_reason': None}
        runner.run.side_effect = AssertionError('No build or optimizer for resumed evidence')
        with patch.object(guarded.sweep, 'check_manifest'):
            owner = guarded.GuardedCampaign(self.config.campaign_config(self.manifest_path),
                                             runner_factory=lambda *_: runner)
            # Exact mathematics is covered by existing Campaign tests; here its
            # strict raw boundary supplies a deterministic successful replay.
            owner.raw = Mock(side_effect=lambda e: ({'cap_up': '0', 'status': 'fixed'}, None,
                                                    export.relative_to(self.root), solved.relative_to(self.root),
                                                    'fresh_or_resumed_exact_replay'))
            self.assertEqual(owner.run(), 0)
        self.assertEqual(owner.state['summary']['total_centres'], 358)
        self.assertEqual(owner.state['summary']['completed_centres'], 358)
        self.assertTrue(owner.state['summary']['is_global_maximum'])
        self.assertEqual(owner.raw.call_count, 358)
        runner.run.assert_not_called()

    def test_campaign_reuses_pinned_portable_relative_fine_without_reprepare_or_optimizer(self):
        fm = guarded.fine.prepare(self.root, '14:200', self.config.fine_tag, self.grid)
        e = fm['entry'];name = e['module'].split('.')[-1]
        payload = guarded.portable.source(self.nodes[0], e, name, grid_spec=e['grid_spec'], target=e['export'])
        (self.root/e['module_file']).write_bytes(payload)
        e['module_source_sha256'] = guarded.hashlib.sha256(payload).hexdigest()
        side = self.root/e['export_provenance'];metadata = guarded.read(side)
        metadata['module_source_sha256'] = e['module_source_sha256'];guarded.repair.atomic_json(side, metadata)
        path = self.plan/'fine-campaign/fine-portable-relative.json'
        guarded.repair.atomic_json(path, fm)
        names = [str(path.relative_to(self.root)), e['module_file'], e['export_provenance']]
        self.bundle['outputs'] = {n: guarded.sweep.sha(self.root/n) for n in names}
        guarded.repair.atomic_json(self.config.portable, self.bundle)
        before = {n: (self.root/n).read_bytes() for n in names}
        passport = self.passport()
        registry = guarded.Registry(self.config, self.bundle, self.manifest_path, self.manifest)
        calls = []
        outer = self
        class FixtureRunner:
            def __init__(self, c, update):
                self.c, self.update, self.guard = c, update, Guard()
            def run(self, argv, phase, keys):
                calls.append(phase)
                if phase == 'fine-export':
                    fixtures.FineTests.exported(outer, fm)
                elif phase == 'solve-fine':
                    result = {k: e[k] for k in ('k', 'i', 'j', 'grid', 'grid_spec')}
                    result.update(status='fixed', cap_up='0', lm=[['0', '0']],
                                  provenance={'fingerprint': fm['provenance']['fingerprint'],
                                              'export_sha256': guarded.sweep.sha(outer.root/e['export']),
                                              'grid_spec': e['grid_spec'],
                                              'baseline_capPad': fm['provenance']['baseline_capPad'],
                                              'cap_up_convention': fm['provenance']['cap_up_convention']})
                    guarded.fine.preserve_json(outer.root/e['solved'], [result])
                else:
                    raise AssertionError('Unexpected fixture process')
                log = self.c.run_dir/f'fixture-{len(calls)}.log'
                log.parent.mkdir(parents=True, exist_ok=True);log.write_text('fake child fixture\n')
                record = {'state': 'complete', 'actual_exit': 0, 'error': None, 'pause_reason': None,
                          'log': str(log.relative_to(outer.root)), 'argv': list(map(str, argv))}
                guarded.repair.atomic_json(log.with_suffix('.json'), record)
                return record
        owner = guarded.GuardedCampaign(self.config.campaign_config(self.manifest_path),
                                         runner_factory=lambda c, u: guarded.Adapter(c, u, passport, registry,
                                                                                   runner_factory=FixtureRunner))
        owner.update(current_piece=self.ident)
        with patch.object(guarded.fine, 'prepare', side_effect=AssertionError('Must reuse portable preparation')), \
                patch('caps_plan.verdict', side_effect=AssertionError('Must reuse exact saved fixture solution')):
            _, _, result, proof = owner.finer(self.entry)
        self.assertEqual(result['cap_up'], '0')
        self.assertEqual(proof['path'], str(path.relative_to(self.root)))
        self.assertEqual(calls, ['fine-export', 'solve-fine'])
        self.assertEqual(before, {n: (self.root/n).read_bytes() for n in names})
        passport.check()  # New exports/solutions are permitted; old pins did not change.
        (self.root/e['module_file']).write_text('changed pinned prepared module\n')
        with self.assertRaises(ValueError):
            passport.check()


if __name__ == '__main__':
    unittest.main()
