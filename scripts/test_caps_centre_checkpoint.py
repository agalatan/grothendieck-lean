#!/usr/bin/env python3
"""Small structural backup tests: no optimizers, Lean, jobs or real checkpoints."""
import contextlib
import copy
import io
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
import caps_centre_checkpoint as C


class CheckpointTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.agent = 'codex-15b7'
        self.manifest_path = str(C.PLAN/'centre-sweep-codex-15b7.json')
        self.progress_path = str(C.PLAN/'centre-campaign-progress-codex-15b7.json')
        self.source = 'tools/frozen.py'
        self.put(self.source, b'# unchanged\n')
        self.entry = {'k': 12, 'i': 140, 'j': 0, 'grid': 2, 'nq': 1024,
                      'node_sha256': 'a'*64, 'piece_sha256': 'b'*64,
                      'search_status': 'pending', 'module_source_sha256': 'e'*64,
                      'module': 'Grothe.LowerAnalytic.CapPlanRuns.Run_complete',
                      'module_file': 'Grothe/LowerAnalytic/CapPlanRuns/Run_complete.lean',
                      'export_provenance': str(C.PLAN/'exports/complete.provenance.json'),
                      'export': str(C.PLAN/'exports/complete.jsonl')}
        self.pending = dict(self.entry, i=141, export=str(C.PLAN/'exports/live.jsonl'),
                            export_provenance=str(C.PLAN/'exports/live.provenance.json'))
        self.manifest = {'entries': [self.entry, self.pending],
                         'provenance': {'baseline_capPad': '1/100000000000', 'fingerprint': 'c'*64,
                                        'files': {self.source: C.digest((self.root/self.source).read_bytes())}}}
        self.save(self.manifest_path, self.manifest)
        self.save_stored_sidecar()
        solved = str(C.PLAN/'solved/complete.json')
        self.save(solved, [dict(self.entry, status='fixed', cap_up='0')])
        self.save(self.entry['export'], self.entry)
        self.put(self.pending['export'], b'')
        self.record = {'status': 'complete', 'residual_accepted': True, 'best_residual': '0',
                       'completed_at_utc': '2026-10-26T16:00:00Z', 'raw_exact_replayed': True,
                       'raw_result': self.ref(solved), 'raw_export': self.ref(self.entry['export']),
                       'evidence': [self.ref(solved)]}
        self.state = {'agent_id': self.agent, 'status': 'running', 'actual_exit': None,
                      'updated_at_utc': '2026-10-26T16:01:00Z', 'current_piece': '12:141:0',
                      'summary': {'completed_centres': 1, 'raw_checked_centres': 2, 'total_centres': 2},
                      'capPad_unchanged': '1/100000000000',
                      'fingerprint': {'manifest_sha256': C.digest((self.root/self.manifest_path).read_bytes()),
                                      'config': {'medium_grid': [3200, 256, '1/400'],
                                                 'fine_np': 1600, 'fine_nq': 1152, 'fine_step': '1/200'}},
                      'centres': {'12:140:0': self.record,
                                  '12:141:0': {'status': 'in_progress', 'residual_accepted': False,
                                               'evidence': [{'path': '../unselected-missing', 'sha256': '0'*64}]}}}
        self.save(self.progress_path, self.state)

    def put(self, name, value):
        path = self.root/name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(value)

    def save(self, name, value):
        self.put(name, (json.dumps(value, sort_keys=True)+'\n').encode())

    def ref(self, name, **extra):
        return dict(path=name, sha256=C.digest((self.root/name).read_bytes()), **extra)

    def save_stored_sidecar(self):
        self.save(self.entry['export_provenance'],
                  {'fingerprint': self.manifest['provenance']['fingerprint'], 'key': '12:140:0',
                   'grid': self.entry['grid'],
                   **{k: self.entry[k] for k in ('node_sha256', 'piece_sha256', 'module_source_sha256')}})

    def collect(self):
        self.save(self.progress_path, self.state)
        return C.collect(self.root, self.agent, self.manifest_path, self.progress_path,
                         context={'created_at_utc': '2026-10-26T16:02:00Z', 'branch': 'codex/test',
                                  'integrated_master': 'd'*40})

    def add_fine(self):
        prefix = C.PLAN/'fine/test'
        entry = dict(self.entry, grid=3, stored_grid=self.entry['grid'], grid_spec=[1600, 1152, '1/200'],
                     module_source_sha256='e'*64, export=str(prefix)+'.jsonl',
                     solved=str(prefix)+'-solved.json', export_provenance=str(prefix)+'-provenance.json')
        self.save(entry['export'], entry)
        self.save(entry['solved'], [dict(entry, status='fixed', cap_up='0')])
        prov = dict(self.manifest['provenance'], grid=3, grid_spec=entry['grid_spec'])
        side = {'fingerprint': prov['fingerprint'], 'key': '12:140:0', 'grid': 3,
                **{k: entry[k] for k in ('node_sha256', 'piece_sha256', 'module_source_sha256')}}
        self.save(entry['export_provenance'], side)
        path = str(prefix)+'-manifest.json'
        self.save(path, {'entry': entry, 'provenance': prov})
        self.record['evidence'] += [self.ref(path, kind='independently_pinned_fine_manifest'),
                                    self.ref(entry['export']), self.ref(entry['solved'])]
        self.record['fine_grid_spec'] = entry['grid_spec']
        return path, entry

    def test_live_incomplete_artifacts_excluded_full_observation_preserved(self):
        checkpoint, meta = self.collect()
        self.assertEqual(checkpoint['progress_snapshot'], self.state)
        self.assertEqual(meta['count'], 1)
        self.assertEqual(meta['observed_status'], 'running')
        self.assertNotIn(self.pending['export'], meta['all_evidence_paths'])
        self.assertEqual((self.root/self.pending['export']).read_bytes(), b'')
        self.assertEqual(json.loads((self.root/self.progress_path).read_text()), self.state)
        self.assertFalse((self.root/meta['snapshot_path']).exists())

    def test_paused_and_failed_observations_not_relabelled(self):
        for status, code in [('paused', 75), ('failed', 1)]:
            self.state.update(status=status, actual_exit=code)
            checkpoint, meta = self.collect()
            self.assertEqual(checkpoint['progress_snapshot']['status'], status)
            self.assertEqual(checkpoint['progress_snapshot']['actual_exit'], code)
            self.assertEqual(checkpoint['progress_snapshot']['summary'], self.state['summary'])

    def test_unaccepted_complete_record_does_not_select_evidence(self):
        self.record['residual_accepted'] = False
        checkpoint, meta = self.collect()
        self.assertEqual(meta['count'], 0)
        self.assertEqual(meta['all_evidence_paths'], [])
        self.assertEqual(checkpoint['progress_snapshot']['centres']['12:140:0']['status'], 'complete')

    def test_missing_or_changed_recorded_hash_rejected(self):
        path = self.record['raw_result']['path']
        self.put(path, b'[]\n')
        with self.assertRaisesRegex(ValueError, 'changed hash'):
            self.collect()
        (self.root/path).unlink()
        with self.assertRaises(FileNotFoundError):
            self.collect()

    def test_partial_references_in_complete_records_are_rejected(self):
        for reference in [{'path': '../missing-repair'}, {'sha256': 'a'*64}]:
            self.record['evidence'].append(reference)
            with self.assertRaisesRegex(ValueError, 'Partial evidence'):
                self.collect()
            self.record['evidence'].pop()

    def test_explicit_null_hash_cannot_disable_a_pin(self):
        for reference in [self.record['raw_result'], self.record['evidence'][0]]:
            original = reference['sha256']; reference['sha256'] = None
            with self.assertRaisesRegex(ValueError, 'Malformed SHA256'):
                self.collect()
            reference['sha256'] = original
        self.manifest['provenance']['files'][self.source] = None
        self.save(self.manifest_path, self.manifest)
        self.state['fingerprint']['manifest_sha256'] = C.digest((self.root/self.manifest_path).read_bytes())
        with self.assertRaisesRegex(ValueError, 'Malformed SHA256'):
            self.collect()

    def test_selected_artifact_cannot_be_an_arbitrary_root_source(self):
        self.record['evidence'].append(self.ref(self.source))
        with self.assertRaisesRegex(ValueError, 'artifact must be under PLAN'):
            self.collect()

    def test_root_escape_and_symlink_escape_rejected(self):
        self.record['raw_result']['path'] = '../outside.json'
        with self.assertRaisesRegex(ValueError, 'traversal'):
            self.collect()
        with tempfile.TemporaryDirectory() as outside:
            p = Path(outside)/'out.json'; p.write_text('[]')
            (self.root/'escape.json').symlink_to(p)
            self.record['raw_result']['path'] = 'escape.json'
            with self.assertRaisesRegex(ValueError, 'escapes'):
                self.collect()

    def test_manifest_and_source_hash_mismatches_rejected(self):
        self.put(self.source, b'# foreign\n')
        with self.assertRaisesRegex(ValueError, 'changed hash'):
            self.collect()
        self.put(self.source, b'# unchanged\n')
        self.state['fingerprint']['manifest_sha256'] = 'f'*64
        with self.assertRaisesRegex(ValueError, 'manifest hash'):
            self.collect()

    def test_complete_evidence_identity_must_match(self):
        path = self.record['raw_result']['path']
        self.save(path, [dict(self.entry, i=141)])
        self.record['raw_result'] = self.ref(path)
        self.record['evidence'] = [self.ref(path)]
        with self.assertRaisesRegex(ValueError, 'identity/grid mismatch'):
            self.collect()

    def test_fine_dependencies_are_expanded_and_bound(self):
        _, entry = self.add_fine()
        _, meta = self.collect()
        self.assertIn(entry['export_provenance'], meta['all_evidence_paths'])
        self.assertEqual(meta['evidence_hashes'], 5)
        (self.root/entry['export_provenance']).unlink()
        with self.assertRaises(FileNotFoundError):
            self.collect()

    def test_stored_sidecar_is_required_without_inventing_an_evidence_pin(self):
        _, meta = self.collect()
        self.assertIn(self.entry['export_provenance'], meta['all_evidence_paths'])
        self.assertEqual(meta['evidence_hashes'], 2)
        (self.root/self.entry['export_provenance']).unlink()
        with self.assertRaises(FileNotFoundError):
            self.collect()

    def test_stored_sidecar_mismatch_and_substituted_raw_path_rejected(self):
        path = self.entry['export_provenance']
        side = json.loads((self.root/path).read_bytes()); side['key'] = '12:141:0'
        self.save(path, side)
        with self.assertRaisesRegex(ValueError, 'Stored export provenance mismatch'):
            self.collect()
        self.save_stored_sidecar()
        alternative = str(C.PLAN/'exports/substituted.jsonl')
        self.put(alternative, (self.root/self.entry['export']).read_bytes())
        self.record['raw_export'] = self.ref(alternative)
        with self.assertRaisesRegex(ValueError, 'raw_export path does not match'):
            self.collect()

    def test_historical_adoption_keeps_its_explicit_evidence(self):
        self.entry['search_status'] = 'historical_adopted'
        self.save(self.manifest_path, self.manifest)
        self.state['fingerprint']['manifest_sha256'] = C.digest((self.root/self.manifest_path).read_bytes())
        (self.root/self.entry['export_provenance']).unlink()
        self.assertEqual(self.collect()[1]['count'], 1)

    def test_fine_manifest_identity_and_unrecorded_dependency_rejected(self):
        path, entry = self.add_fine()
        doc = json.loads((self.root/path).read_text()); doc['entry']['i'] = 141
        self.save(path, doc); self.record['evidence'][1] = self.ref(path, kind='independently_pinned_fine_manifest')
        with self.assertRaisesRegex(ValueError, 'centre/source mismatch'):
            self.collect()
        doc['entry']['i'] = 140; doc['entry']['solved'] = str(C.PLAN/'solved/unrecorded.json')
        self.save(doc['entry']['solved'], [entry]); self.save(path, doc)
        self.record['evidence'][1] = self.ref(path, kind='independently_pinned_fine_manifest')
        with self.assertRaisesRegex(ValueError, 'lacks recorded hash'):
            self.collect()

    def test_grid_label_three_cannot_substitute_a_different_grid_spec(self):
        _, entry = self.add_fine()
        row = json.loads((self.root/entry['export']).read_text())
        row['grid_spec'] = [3200, 256, '1/400']
        self.save(entry['export'], row)
        self.record['evidence'][2] = self.ref(entry['export'])
        with self.assertRaisesRegex(ValueError, 'grid_spec mismatch'):
            self.collect()

    def test_fine_grid_is_bound_to_observed_record_and_fine_config(self):
        self.add_fine()
        self.record['fine_grid_spec'] = [3200, 256, '1/400']
        with self.assertRaisesRegex(ValueError, 'observed record/config'):
            self.collect()
        self.record['fine_grid_spec'] = [1600, 1152, '1/200']
        self.state['fingerprint']['config']['fine_nq'] = 2048
        with self.assertRaisesRegex(ValueError, 'observed record/config'):
            self.collect()

    def test_stored_grid_one_uses_medium_config(self):
        self.entry.update(grid=1, nq=256)
        self.save_stored_sidecar()
        self.save(self.manifest_path, self.manifest)
        self.state['fingerprint']['manifest_sha256'] = C.digest((self.root/self.manifest_path).read_bytes())
        solved = self.record['raw_result']['path']
        self.save(solved, [dict(self.entry, status='fixed', cap_up='0')])
        self.save(self.entry['export'], self.entry)
        self.record.update(raw_result=self.ref(solved), raw_export=self.ref(self.entry['export']),
                           evidence=[self.ref(solved)])
        self.add_fine()
        with self.assertRaisesRegex(ValueError, 'observed record/config'):
            self.collect()
        self.state['fingerprint']['config']['medium_grid'] = [1600, 1152, '1/200']
        self.assertEqual(self.collect()[1]['count'], 1)

    def test_owned_writes_preflight_and_explicit_replace(self):
        checkpoint, meta = self.collect(); path = meta['snapshot_path']
        C.write_owned(self.root, self.agent, {path: checkpoint})
        self.put(path, b'{"reviewed":true}\n')
        with self.assertRaisesRegex(ValueError, 'review before'):
            C.write_owned(self.root, self.agent, {path: checkpoint})
        self.assertEqual((self.root/path).read_bytes(), b'{"reviewed":true}\n')
        with self.assertRaisesRegex(ValueError, 'Unowned'):
            C.write_owned(self.root, self.agent, {path: checkpoint, 'tools/foreign.py': {}}, replace=True)
        self.assertEqual((self.root/path).read_bytes(), b'{"reviewed":true}\n')
        C.write_owned(self.root, self.agent, {path: checkpoint}, replace=True)
        self.assertEqual(json.loads((self.root/path).read_bytes()), checkpoint)

    def test_default_cli_is_read_only(self):
        before = {p.relative_to(self.root): p.read_bytes() for p in self.root.rglob('*') if p.is_file()}
        with patch.object(C.subprocess, 'check_output', return_value='a'*40), contextlib.redirect_stdout(io.StringIO()):
            C.main(['--root', str(self.root), '--manifest', self.manifest_path, '--progress', self.progress_path])
        after = {p.relative_to(self.root): p.read_bytes() for p in self.root.rglob('*') if p.is_file()}
        self.assertEqual(after, before)

    def test_git_queries_are_prefix_bounded_and_cannot_select_live_changes(self):
        complete_path = self.entry['export']
        present = '\n'.join([complete_path, self.record['raw_result']['path'], self.entry['export_provenance']])
        def git_output(argv, **_):
            if 'ls-tree' in argv:
                return present
            if 'diff' in argv:
                return complete_path+'\n'+self.pending['export']+'\n'
            return 'a'*40
        with patch.object(C.subprocess, 'check_output', side_effect=git_output) as git, \
             patch.object(C, 'write_owned') as write, contextlib.redirect_stdout(io.StringIO()):
            C.main(['--root', str(self.root), '--manifest', self.manifest_path, '--progress', self.progress_path,
                    '--handoff-prefix', 'handoff/caps-centre/backup-codex-15b7-test'])
        outputs = write.call_args.args[2]
        meta = next(value for path, value in outputs.items() if path.endswith('-meta.json'))
        self.assertEqual(meta['files'], [complete_path])
        for call in git.call_args_list:
            argv = call.args[0]
            if 'ls-tree' in argv or 'diff' in argv:
                self.assertEqual(argv[-2:], ['--', str(C.PLAN)])
                self.assertLess(len(argv), 11)

    def test_optimized_python_rejected_before_writing(self):
        result = subprocess.run([sys.executable, '-O', C.__file__, '--root', str(self.root)], capture_output=True, text=True)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('Reject optimized Python', result.stderr)


if __name__ == '__main__':
    unittest.main()
