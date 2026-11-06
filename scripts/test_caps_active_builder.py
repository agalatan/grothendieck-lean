#!/usr/bin/env python3
"""Isolated active-registry builder consumer fixtures. Agent-ID: codex-15b7.

Only temporary source trees and mocked process boundaries are used. No Lean,
Git, remote calls, actual active registry emission or actual worker inspection.
"""
import argparse
from contextlib import redirect_stdout, redirect_stderr
import copy
import io
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import build_caps_batches as b
from test_caps_active_registry import Fixture, BASE, CPP, PROOF
from test_build_caps_batches import Fixture as LegacyFixture

ERRORS = (b.BuildError, b.ClosureError, ValueError, OSError)


def census(root):
    return {p.relative_to(root).as_posix(): p.read_bytes() for p in root.rglob('*') if p.is_file()}


class ActiveBuilderTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name).resolve()
        self.f = Fixture(self.root)

    def registry(self):
        return b.make_registry(self.root, active_declaration_value=self.f.registry)

    def publish_fixture(self, value=None):
        value = self.registry() if value is None else value
        self.f.json(b.REGISTRY, value)
        return value

    def main(self, *args):
        out, err = io.StringIO(), io.StringIO()
        with redirect_stdout(out), redirect_stderr(err), \
             patch.object(b.subprocess, 'Popen', side_effect=AssertionError('No real process')), \
             patch.object(b, 'process_rows', side_effect=AssertionError('No live process reads')):
            result = b.main(['--root', str(self.root), *args])
        return result, out.getvalue(), err.getvalue()

    def test_v2_uses_shared_reader_and_derivation_never_legacy_census_or_graph(self):
        with patch.object(b, 'expected_roots', side_effect=AssertionError('No second row inventory')), \
             patch.object(b, 'Graph', side_effect=AssertionError('Use approved shared graph')):
            value = self.registry()
            self.assertIsNone(b.validate_registry(self.root, value))
        view = b.active_registry.read_active_registry(self.root, value)
        self.assertEqual(value['compute_roots'], view['compute_roots'])
        self.assertEqual(value['native_declarations_by_root'], view['native_declarations_by_root'])
        self.assertEqual(view['derived_counts'], {'compute_modules': 26, 'native_facts': 71})

    def test_plan_validates_materialized_multiroots_and_groups_without_writes(self):
        value = self.publish_fixture(); before = census(self.root)
        status, output, error = self.main('--plan', '--jobs', '2')
        self.assertEqual((status, error), (0, ''))
        plan = json.loads(output)
        self.assertEqual(plan['compute_roots'], 26)
        self.assertTrue(all(1 <= len(targets) <= 2 for _, targets in plan['groups']))
        phases = [phase for phase, _ in plan['groups']]
        self.assertEqual(phases, sorted(phases, key=lambda phase: phase == 'native'))
        self.assertEqual(census(self.root), before)
        self.assertTrue(plan['full_Grothe_audit_and_cache_upload_required_afterwards'])
        self.assertEqual(set(value['direct_hash_roots']), {'Grothe/LowerAnalytic/CapNodes.lean',
                         'Grothe/LowerAnalytic/CapRow12/Assembly.lean', 'Grothe/LowerAnalytic/CapRow13/Assembly.lean'})

    def test_v2_census_false_cannot_bypass_approved_source_inventory(self):
        value = self.registry()
        with self.assertRaisesRegex(b.BuildError, 'cannot bypass'):
            b.validate_registry(self.root, value, census=False)

    def test_omitted_duplicated_forged_native_root_and_hidden_dependency_reject(self):
        value = self.registry()
        for change in ('omitted', 'duplicate', 'forged_name'):
            changed = copy.deepcopy(value)
            if change == 'omitted': changed['compute_roots'].pop()
            elif change == 'duplicate': changed['compute_roots'].append(changed['compute_roots'][0])
            else: changed['native_declarations_by_root'][changed['compute_roots'][0]][0] += '_forged'
            with self.subTest(change=change), self.assertRaises(ERRORS): b.validate_registry(self.root, changed)
        pure = self.root/'Grothe/LowerAnalytic/FixturePure.lean'
        pure.write_text(pure.read_text().replace('end Grothe.LowerAnalytic', 'theorem ghost : True := by native_decide\nend Grothe.LowerAnalytic'))
        with self.assertRaises(ERRORS): self.registry()

    def test_missing_materialization_blocks_plan_and_build_before_process(self):
        value = self.publish_fixture()
        (self.root/(CPP+'R12x3_0.lean')).unlink()
        for args in (('--plan',), ()):
            with self.subTest(args=args):
                status, _, _ = self.main(*args); self.assertEqual(status, 1)
        with self.assertRaises(ERRORS): b.validate_registry(self.root, value)

    def test_duplicate_serialized_registry_fields_reject_plan_and_build(self):
        value=self.publish_fixture();original=json.dumps(value)
        for field,duplicate in (('format',b.active_registry.ACTIVE_FORMAT),('compute_roots',[])):
            ambiguous='{'+json.dumps(field)+':'+json.dumps(duplicate)+','+original[1:]
            self.f.write(b.REGISTRY,ambiguous)
            for args in (('--plan',),()):
                with self.subTest(field=field,args=args):
                    status,output,_=self.main(*args)
                    self.assertEqual(status,1);self.assertFalse(output)

    def test_proposal_accepts_explicit_complete_inputs_before_materialization_stdout_only(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory).resolve(); fixture = Fixture(root, materialize=False)
            fixture.json('handoff/declaration.json', fixture.registry)
            before = census(root)
            out = io.StringIO()
            with redirect_stdout(out), patch.object(b.subprocess, 'Popen', side_effect=AssertionError('No child')):
                self.assertEqual(b.main(['--root', str(root), '--propose-active-registry', 'handoff/declaration.json']), 0)
            value = json.loads(out.getvalue())
            self.assertFalse(value['materialized']); self.assertFalse(value['active_registry_published'])
            self.assertFalse(value['native_verified']); self.assertFalse(value['cache_uploaded'])
            self.assertEqual(value['declaration_view']['source_sha256'], {})
            self.assertEqual(value['declaration_view']['derived_counts']['compute_modules'], 26)
            self.assertEqual(census(root), before)
            with self.assertRaises(ERRORS): b.validate_registry(root, value)

    def test_proposal_does_not_infer_active_rows_from_any_output_glob(self):
        incomplete = copy.deepcopy(self.f.registry); incomplete['active_rows'] = incomplete['active_rows'][:1]
        self.f.json('declaration.json', incomplete)
        status, output, _ = self.main('--propose-active-registry', 'declaration.json')
        self.assertEqual(status, 0)
        self.assertEqual([row['row'] for row in json.loads(output)['active_declaration']['active_rows']], [12])
        # A source proposal is declaration-only. Its unregistered canonical
        # Row13 output prevents using it as a materialized registry.
        with self.assertRaises(ERRORS): b.make_registry(self.root, active_declaration_value=incomplete)

    def test_proposal_rejects_partial_materialized_aliases_and_completion_claims(self):
        declaration = copy.deepcopy(self.f.registry)
        for mutate in (lambda value: value.pop('retained_proofs'),
                       lambda value: value.update(source_sha256={}),
                       lambda value: value['provenance'].update(native_verified=True)):
            value = copy.deepcopy(declaration); value['provenance'] = {}
            mutate(value); self.f.json('declaration.json', value)
            status, output, _ = self.main('--propose-active-registry', 'declaration.json')
            self.assertEqual(status, 1); self.assertFalse(output)

    def test_additive_declarations_preserve_existing_rows_and_retained_proofs(self):
        value = self.publish_fixture()
        for alter in ('drop', 'replace'):
            declaration = copy.deepcopy(self.f.registry)
            if alter == 'drop': declaration['active_rows'].pop()
            else:
                original = declaration['active_rows'][0]['pieces']
                target = BASE+'new/row12-pieces.json'
                self.f.write(target, (self.root/original).read_text())
                declaration['active_rows'][0]['pieces'] = target
            with self.subTest(alter=alter), self.assertRaisesRegex(b.BuildError, 'cannot be dropped/replaced'):
                b.derive_active_build_registry(self.root, declaration, materialized=False)
        self.assertEqual(self.f.value(b.REGISTRY), value)

    def test_addition_to_existing_active_rows_regenerates_only_on_explicit_call(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory).resolve(); old = Fixture(root, rows=(12,))
            old_value = b.make_registry(root, active_declaration_value=old.registry); old.json(b.REGISTRY, old_value)
            old_bytes = (root/b.REGISTRY).read_bytes()
            new = Fixture(root, rows=(12,13))
            value = b.make_registry(root, active_declaration_value=new.registry)
            self.assertEqual([item['row'] for item in value['active_rows']], [12,13])
            self.assertEqual((root/b.REGISTRY).read_bytes(), old_bytes)
            b.validate_registry(root, value)

    def test_v1_migration_requires_row12_and_original_input_declarations(self):
        value = self.registry()
        old = {'format': b.FORMAT, 'row':12}
        self.f.json(b.REGISTRY, old)
        declaration = copy.deepcopy(self.f.registry); declaration['active_rows'] = declaration['active_rows'][1:]
        with self.assertRaisesRegex(b.BuildError, 'Row12 must remain'):
            b.derive_active_build_registry(self.root, declaration, materialized=False)
        declaration = copy.deepcopy(self.f.registry)
        source = declaration['active_rows'][0]['pieces']; target = BASE+'new/row12-pieces.json'
        self.f.write(target, (self.root/source).read_text()); declaration['active_rows'][0]['pieces'] = target
        with self.assertRaisesRegex(b.BuildError, 'input declarations'):
            b.derive_active_build_registry(self.root, declaration, materialized=False)
        # An explicit complete v2 migration may prepare a value, but never writes.
        prepared = b.make_registry(self.root, active_declaration_value=self.f.registry)
        self.assertEqual(prepared, value); self.assertEqual(self.f.value(b.REGISTRY), old)

    def test_retained14x150_complete_native_closure_and_no_implicit_drop(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory).resolve(); fixture = Fixture(root, rows=(14,), retained=True)
            value = b.make_registry(root, active_declaration_value=fixture.registry); fixture.json(b.REGISTRY, value)
            b.validate_registry(root, value)
            self.assertEqual(value['derived_counts'], {'compute_modules':29, 'native_facts':74})
            self.assertTrue(set(b.active_registry._RETAINED_ROOTS) <= set(value['compute_roots']))
            broken = copy.deepcopy(value); broken['compute_roots'].remove(CPP+'R14x150p0Repair.lean')
            with self.assertRaises(ERRORS): b.validate_registry(root, broken)
            declaration = copy.deepcopy(fixture.registry); declaration['active_rows'][0]['retained_nodes'] = []
            with self.assertRaises(ERRORS): b.make_registry(root, active_declaration_value=declaration)
            # Even removing an existing proof source cannot silently authorize
            # dropping its retained declaration during declaration preparation.
            fixture.registry['active_rows'] = []
            declaration = copy.deepcopy(fixture.registry); declaration['retained_proofs'] = []
            (root/b.active_registry._RETAINED_NODE).unlink()
            with self.assertRaisesRegex(b.BuildError, 'active row cannot be dropped'):
                b.derive_active_build_registry(root, declaration, materialized=False)

    def test_retained_proof_only_drop_is_rejected_even_when_source_is_missing(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory).resolve(); fixture = Fixture(root, rows=(12,), retained=True)
            value = b.make_registry(root, active_declaration_value=fixture.registry); fixture.json(b.REGISTRY, value)
            declaration = copy.deepcopy(fixture.registry); declaration['retained_proofs'] = []
            (root/b.active_registry._RETAINED_NODE).unlink()
            with self.assertRaisesRegex(b.BuildError, 'retained proof cannot be dropped'):
                b.derive_active_build_registry(root, declaration, materialized=False)

    def test_polling_guards_input_pins_in_addition_to_source_and_execution(self):
        value = self.publish_fixture(); path = self.root/b.REGISTRY
        args = argparse.Namespace(root=self.root, registry=path, registry_sha256=b.sha(path.read_bytes()),
                run_dir=self.root/'.lake/caps-batches', stop_file=self.root/'.lake/STOP', jobs=2,
                rss_limit_gib=24, disk_floor_gib=3, lake='NEVER_EXECUTE', poll_seconds=0.1)
        runner = b.Runner(args,value,watch=lambda *a,**k:{'pause_reason':None})
        runner.check(full=True)
        selected = self.root/self.f.registry['active_rows'][0]['selection']
        selected.write_bytes(selected.read_bytes()+b'\n')
        with self.assertRaisesRegex(b.BuildError, 'pinned source metadata changed'): runner.check()

    def test_stale_input_or_execution_hashes_never_auto_regenerate_during_plan(self):
        self.publish_fixture(); original = (self.root/b.REGISTRY).read_bytes()
        target = self.root/'scripts/build_caps_batches.py'; target.write_bytes(target.read_bytes()+b'# changed\n')
        status, _, _ = self.main('--plan'); self.assertEqual(status,1)
        self.assertEqual((self.root/b.REGISTRY).read_bytes(),original)

    def test_explicit_v2_regeneration_refreshes_pins_but_preserves_declarations(self):
        self.publish_fixture(); original = (self.root/b.REGISTRY).read_bytes()
        target=self.root/'scripts/build_caps_batches.py'; target.write_bytes(target.read_bytes()+b'# new explicit source\n')
        value=b.make_registry(self.root)
        self.assertEqual(value['active_rows'],self.f.registry['active_rows'])
        self.assertEqual((self.root/b.REGISTRY).read_bytes(),original)
        self.assertEqual(value['execution_source_sha256']['scripts/build_caps_batches.py'],b.sha(target.read_bytes()))
        status, _, error=self.main('--write-registry');self.assertEqual((status,error),(0,''))
        b.validate_registry(self.root,self.f.value(b.REGISTRY))

    def test_builder_and_stamp_share_filtered_cache_projection_not_full_provenance(self):
        value=self.publish_fixture()
        with patch.object(b.active_registry,'ROOT',str(self.root)):
            before=b.active_registry.digest()
            self.f.registry['provenance']={'full_analytic_source_sha256':{PROOF:'a'*64},'global_allowlist_sha256':'b'*64}
            changed=b.make_registry(self.root,active_declaration_value=self.f.registry);self.f.json(b.REGISTRY,changed)
            self.assertEqual(before,b.active_registry.digest())
            core=b.active_registry.read_active_registry(self.root,changed)
            self.assertNotIn('provenance',core['cache_projection'])
            self.assertNotIn('input_sha256',core['cache_projection'])
            self.assertEqual(changed['source_sha256'],core['source_sha256'])

    def test_overlay_cannot_write_canonical_registry_or_alias_before_derivation(self):
        self.publish_fixture(); before=census(self.root)
        targets=[b.REGISTRY]
        alias=self.root/'alias';alias.symlink_to(self.root/'data',target_is_directory=True)
        targets.append('alias/caps-m/plan/row-certificates/row12-build.json')
        for target in targets:
            with patch.object(b,'make_registry',side_effect=AssertionError('No derivation')):
                status,_,_=self.main('--write-registry','--source-overlay','inactive','--registry',target)
            self.assertEqual(status,1)
        alias.unlink();self.assertEqual(census(self.root),before)

    def test_overlay_proposal_is_new_confined_inactive_and_never_buildable(self):
        value=self.registry();name='.lake/caps-registry-proposals/candidate.json'
        with patch.object(b,'make_registry',return_value=value):
            status,_,error=self.main('--write-registry','--source-overlay','inactive','--registry',name)
        self.assertEqual((status,error),(0,''))
        proposal=self.f.value(name);self.assertEqual(proposal['format'],'caps-build-registry-overlay-proposal/v1')
        self.assertFalse(proposal['active_registry_published'])
        with self.assertRaises(ERRORS):b.validate_registry(self.root,proposal)
        status,_,_=self.main('--plan','--registry',name);self.assertEqual(status,1)
        with patch.object(b,'make_registry',side_effect=AssertionError('No overwrite')):
            status,_,_=self.main('--write-registry','--source-overlay','inactive','--registry',name)
        self.assertEqual(status,1)
        self.assertEqual(self.f.value(name),proposal)

    def test_overlay_cannot_be_used_for_materialized_v2_or_ordinary_plan(self):
        self.publish_fixture()
        with self.assertRaisesRegex(b.BuildError,'materialized canonical'):
            b.make_registry(self.root,self.root/'inactive')
        status,_,_=self.main('--plan','--source-overlay','inactive');self.assertEqual(status,1)
        self.f.json('declaration.json',self.f.registry)
        status,_,_=self.main('--propose-active-registry','declaration.json','--source-overlay','inactive');self.assertEqual(status,1)

    def test_overlay_publication_collision_keeps_the_existing_proposal(self):
        value=self.registry();name='.lake/caps-registry-proposals/raced.json';target=self.root/name
        def collision(*args,**kw):
            target.parent.mkdir(parents=True);target.write_bytes(b'concurrent owned proposal\n');return value
        with patch.object(b,'make_registry',side_effect=collision):
            status,_,_=self.main('--write-registry','--source-overlay','inactive','--registry',name)
        self.assertEqual(status,1);self.assertEqual(target.read_bytes(),b'concurrent owned proposal\n')

    def test_unknown_current_registry_state_never_becomes_absence(self):
        value=self.publish_fixture();before=(self.root/b.REGISTRY).read_bytes()
        for error in (PermissionError('unknown current registry'),OSError('filesystem state unknown')):
            with patch.object(b.active_registry,'_active_path',return_value=self.root/b.REGISTRY), \
                 patch.object(Path,'lstat',side_effect=error),self.assertRaises(type(error)):
                b.current_active_registry(self.root)
        self.assertEqual((self.root/b.REGISTRY).read_bytes(),before)
        self.assertEqual(self.f.value(b.REGISTRY),value)

    def test_existing_null_nonobject_or_unknown_registry_is_not_absence(self):
        self.f.json('declaration.json',self.f.registry)
        malformed_values=[None,[], 'unreadable lineage', {'format':'unknown-source-plan'}, {'format':b.FORMAT}]
        malformed_values += [{'format':b.FORMAT,'row':row} for row in (True,12.0,'12',13)]
        for malformed in malformed_values:
            self.f.json(b.REGISTRY,malformed);before=(self.root/b.REGISTRY).read_bytes()
            status,output,_=self.main('--propose-active-registry','declaration.json')
            self.assertEqual(status,1);self.assertFalse(output)
            self.assertEqual((self.root/b.REGISTRY).read_bytes(),before)
            with self.assertRaisesRegex(b.BuildError,'malformed or has an unknown format'):
                b.make_registry(self.root,active_declaration_value=self.f.registry)

    def test_proposal_path_symlink_escape_duplicate_json_and_snapshot_race(self):
        self.f.json('declaration.json',self.f.registry)
        path=self.root/'alias.json';path.symlink_to(self.root/'declaration.json')
        status,_,_=self.main('--propose-active-registry','alias.json');self.assertEqual(status,1)
        status,_,_=self.main('--propose-active-registry','../escape.json');self.assertEqual(status,1)
        self.f.write('duplicate.json','{"format":"caps-bounded-build-v2","format":"caps-bounded-build-v2"}')
        status,_,_=self.main('--propose-active-registry','duplicate.json');self.assertEqual(status,1)
        old=b.active_registry.derive_active_registry
        def changed(*args,**kw):
            result=old(*args,**kw);self.f.json(b.REGISTRY,self.f.registry|{'scope':'concurrent registry change'});return result
        with patch.object(b.active_registry,'derive_active_registry',side_effect=changed),self.assertRaisesRegex(b.BuildError,'changed during preparation'):
            b.derive_active_build_registry(self.root,self.f.registry,materialized=False)

    def test_v1_validate_groups_and_api_remain_compatible(self):
        legacy=LegacyFixture();legacy.setUp();self.addCleanup(legacy.doCleanups)
        legacy.validate()
        self.assertEqual(list(b.groups(legacy.registry,2)), [('pure',['GrotheCapsKernel.Basic','GrotheCapsKernel']),
                         ('pure',['Grothe.Data']),('native',['Grothe.A','Grothe.B'])])
        # The v1 writer retains its old format/census/field semantics. Existing
        # legacy tests exercise its full fake Runner and resource guards too.
        with patch.object(b,'expected_roots',return_value=['Grothe/A.lean','Grothe/B.lean']):
            value=b.make_registry(legacy.root)
        self.assertEqual(value['format'],b.FORMAT);self.assertEqual(value['row'],12)
        self.assertEqual(value['compute_count'],1322);self.assertEqual(value['row12_compute_count'],1307)


if __name__ == '__main__': unittest.main()
