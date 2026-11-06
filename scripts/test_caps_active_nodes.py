#!/usr/bin/env python3
"""Isolated shared-registry node-generator tests; Agent-ID: codex-15b7.

Only temporary fixture outputs are emitted. No Lean, numerical search, Git,
network, actual canonical source activation or native/cache claim occurs.
"""
from contextlib import redirect_stdout, redirect_stderr
import copy
import importlib.util
import io
import json
from pathlib import Path
import re
import tempfile
import unittest
from unittest.mock import patch
from test_caps_active_registry import Fixture

GENERATOR = Path(__file__).resolve().parents[1] / 'tools/gen_cap_nodes.py'
spec = importlib.util.spec_from_file_location('active_caps_nodes_generator', GENERATOR)
gen = importlib.util.module_from_spec(spec)
spec.loader.exec_module(gen)


class ActiveNodeTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name).resolve()
        self.fixture = Fixture(self.root, materialize=False)
        self.rows = list(gen.caps_stamp.CAP_ROWS)
        self.registry = self.fixture.registry
        self.name = gen.caps_stamp.BUILD_REGISTRY
        self.fixture.json(self.name, self.registry)

    def plan(self, **kwargs):
        return gen.source_plan(self.root, kwargs.pop('rows', self.rows), registry=kwargs.pop('registry', self.name), **kwargs)

    def test_import_is_safe_and_official_rows_txt_cli_is_unchanged(self):
        args = gen.parse_args((self.root/'data/cap-nodes/rows.txt').read_text().split())
        self.assertEqual(args.rows, self.rows)
        self.assertEqual(args.size, 49)
        self.assertFalse(args.check)
        self.assertEqual(args.registry, self.name)
        self.assertFalse(hasattr(gen, 'PROVED_ROWS'))
        with redirect_stdout(io.StringIO()), self.assertRaises(SystemExit) as result:gen.parse_args(['--help'])
        self.assertEqual(result.exception.code,0)

    def test_explicit_multirow_union_assembly_and_unconditional_dispatch(self):
        outputs,count = self.plan();text=outputs['Grothe/LowerAnalytic/CapNodes.lean']
        self.assertEqual(count,2)
        union=sorted(self.rows+[12,13])
        self.assertIn('def capRowsDone : List ℕ := '+str(union),text)
        self.assertIn('def capRowsWithExclusions : List ℕ := '+str(self.rows),text)
        for row in (12,13):
            self.assertIn(f'import Grothe.LowerAnalytic.CapRow{row}.Assembly',text)
            self.assertIn(f'    · exact Grothe.LowerAnalytic.vertexCapsRow{row}\n',text)
            self.assertNotIn(f'Grothe/LowerAnalytic/CapRow{row}.lean',outputs)
            self.assertNotIn(f'vertexCapsRow{row} (h.2',text)
        for row in self.rows:self.assertIn(f'    · exact vertexCapsRow{row:02d} (h.2 {row} ',text)
        self.assertEqual(len(outputs),16)
        self.assertIn('def CapsRest : Prop :=\n  (∀ k,',text)
        self.assertNotIn('def CapsRest : Prop := True',text)
        self.assertIn('Grothe.Research.RefinedLowerCheck.lower_bound_of_refined_cover_data',text)

    def test_source_producer_does_not_require_old_capnodes_to_match(self):
        # The actual reader declaration path is exercised, with no missing-output bypass mock.
        stale=self.root/'Grothe/LowerAnalytic/CapNodes.lean';stale.write_text('stale generated source\n')
        outputs,count=self.plan()
        self.assertEqual(count,2);self.assertNotEqual(stale.read_text(),outputs['Grothe/LowerAnalytic/CapNodes.lean'])
        self.assertFalse((self.root/'Grothe/LowerAnalytic/CapRow13/Assembly.lean').exists())
        self.assertEqual(stale.read_text(),'stale generated source\n')
        with self.assertRaises(gen.caps_stamp.ClosureError):self.plan(check=True)

    def test_check_is_always_materialized_with_no_cli_bypass(self):
        original=gen.caps_stamp.read_active_registry
        calls=[]
        def reader(*args,**kw):calls.append(kw.get('require_materialized'));return original(*args,**kw)
        with patch.object(gen.caps_stamp,'read_active_registry',side_effect=reader):
            self.plan()
            with self.assertRaises(gen.caps_stamp.ClosureError):self.plan(check=True)
        self.assertEqual(calls,[False,True])
        for flag in ('--declarations-only','--skip-census','--no-materialized','--source-overlay'):
            with redirect_stderr(io.StringIO()),self.assertRaises(SystemExit):gen.parse_args([flag,*map(str,self.rows)])

    def test_registry_input_is_explicit_not_candidate_discovery(self):
        self.fixture.write('handoff/inactive/CapRow15/Assembly.lean','inactive source\n')
        alternate='data/caps-m/plan/row-certificates/reviewed-declaration.json';self.fixture.json(alternate,self.registry)
        self.fixture.write(self.name,'malformed active registry\n')
        with self.assertRaises(gen.caps_stamp.ClosureError):self.plan()
        outputs,count=self.plan(registry=alternate)
        self.assertEqual(count,2);self.assertNotIn('CapRow15.Assembly',outputs['Grothe/LowerAnalytic/CapNodes.lean'])
        with self.assertRaises(gen.caps_stamp.ClosureError):self.plan(registry='../escaped.json')
        with self.assertRaises(gen.caps_stamp.ClosureError):self.plan(registry={**self.registry,'active_rows':[],'legacy_rows':[12]})

    def test_legacy_subsets_duplicates_unknown_rows_and_overlap_reject(self):
        for rows in (self.rows[:-1],self.rows+[12],self.rows+[13],self.rows+[14],self.rows+[15],self.rows+[19],self.rows+[0],[],[False,*self.rows]):
            with self.subTest(rows=rows),self.assertRaises(gen.caps_stamp.ClosureError):self.plan(rows=rows)
        for size in (0,1,48,50,98,True,49.0):
            with self.subTest(size=size),self.assertRaises(gen.caps_stamp.ClosureError):self.plan(size=size)
        outputs,_=self.plan(rows=list(reversed(self.rows)))
        self.assertIn('def capRowsWithExclusions : List ℕ := '+str(self.rows),outputs['Grothe/LowerAnalytic/CapNodes.lean'])

    def test_malformed_active_rows_are_rejected_by_shared_authority(self):
        for rows in ([{'row':True}],[{'row':12.0}],[{'row':'12'}],[{'row':0}],self.registry['active_rows']+[copy.deepcopy(self.registry['active_rows'][0])]):
            broken=copy.deepcopy(self.registry);broken['active_rows']=rows
            with self.assertRaises(gen.caps_stamp.ClosureError):self.plan(registry=broken)
        for field,value in (('assembly','Grothe/LowerAnalytic/Fake.lean'),('vertex_theorem','Grothe.LowerAnalytic.wrong')):
            broken=copy.deepcopy(self.registry);broken['active_rows'][0][field]=value
            with self.assertRaises(gen.caps_stamp.ClosureError):self.plan(registry=broken)

    def test_all_remaining_rows_are_done_but_capsrest_is_still_actual_hypothesis(self):
        fixture=Fixture(self.root,rows=(12,13,14,15),materialize=False)
        outputs,count=self.plan(registry=fixture.registry)
        self.assertEqual(count,4);text=outputs['Grothe/LowerAnalytic/CapNodes.lean']
        self.assertIn('def capRowsDone : List ℕ := '+str(list(range(19))),text)
        self.assertIn('def CapsRest : Prop :=\n  (∀ k,',text)
        self.assertIn('∀ k ∈ capRowsWithExclusions, ExclCaps k (capExcl k)',text)
        self.assertNotIn('capsRest_complete',text)

    def test_retained_master_node14x150_source_and_selection_preserved(self):
        fixture=Fixture(self.root,rows=(12,14),materialize=False,retained=True)
        names=[gen.caps_stamp._RETAINED_NODE,'data/caps-m-pieces/repairs.json']
        before={name:(self.root/name).read_bytes() for name in names}
        outputs,count=self.plan(registry=fixture.registry)
        self.assertEqual(count,2)
        self.assertIn('    · exact Grothe.LowerAnalytic.vertexCapsRow14\n',outputs['Grothe/LowerAnalytic/CapNodes.lean'])
        self.assertTrue(all(name not in outputs for name in names))
        self.assertEqual(before,{name:(self.root/name).read_bytes() for name in names})
        bad=copy.deepcopy(fixture.registry);bad['active_rows'][1]['retained_nodes']=[]
        with self.assertRaises(gen.caps_stamp.ClosureError):self.plan(registry=bad)
        bad=copy.deepcopy(fixture.registry);bad['retained_proofs']=[]
        with self.assertRaises(gen.caps_stamp.ClosureError):self.plan(registry=bad)

    def test_actual_legacy_range_outputs_and_proof_bodies_stay_byte_identical(self):
        actual_root=GENERATOR.parents[1]
        prior=(actual_root/'Grothe/LowerAnalytic/CapNodes.lean').read_text()
        for row in self.rows:
            self.assertEqual(gen.row_module(row),(actual_root/f'Grothe/LowerAnalytic/CapRow{row:02d}.lean').read_text())
            self.assertIn(gen.vertex_proof(row).rstrip(),prior)
        self.assertIn('0\n      49 = true := by',gen.row_module(0))
        self.assertIn('(rowData.getD 18 row01).nodeList.length = true',gen.row_module(18))

    def test_main_temp_generation_and_materialized_check_never_writes_registry(self):
        fixture=Fixture(self.root,rows=(12,13),materialize=True)
        for module in ('CapRangeDefs','CapRecipeData'):fixture.write('Grothe/LowerAnalytic/'+module+'.lean','namespace Grothe.LowerAnalytic\ndef fixture := 1\nend Grothe.LowerAnalytic\n')
        fixture.json(self.name,fixture.registry);before=(self.root/self.name).read_bytes()
        argv=(self.root/'data/cap-nodes/rows.txt').read_text().split()
        with redirect_stdout(io.StringIO()) as out:self.assertEqual(gen.main(argv,root=self.root),0)
        self.assertIn('wrote 15 legacy row modules (4 ranges each) and CapNodes.lean with 2 separately proved rows',out.getvalue())
        self.assertEqual((self.root/self.name).read_bytes(),before)
        fixture.publish()
        before=(self.root/self.name).read_bytes()
        sources={name:(self.root/name).read_bytes() for name in gen.source_plan(self.root,self.rows,registry=self.name)[0]}
        with redirect_stdout(io.StringIO()) as out:self.assertEqual(gen.main(['--check',*argv],root=self.root),0)
        self.assertIn('checked 15 legacy row modules',out.getvalue())
        self.assertEqual((self.root/self.name).read_bytes(),before)
        self.assertEqual(sources,{name:(self.root/name).read_bytes() for name in sources})
        (self.root/'Grothe/LowerAnalytic/CapNodes.lean').write_text('changed\n')
        with self.assertRaises(gen.caps_stamp.ClosureError):gen.main(['--check',*argv],root=self.root)

    def test_main_failure_preflights_all_destinations_before_any_write(self):
        outputs,_=self.plan();target=self.root/'Grothe/LowerAnalytic/CapRow00.lean';old=target.read_bytes()
        broken=self.root/'Grothe/LowerAnalytic/CapNodes.lean';broken.unlink();broken.symlink_to(self.root/'missing')
        with self.assertRaises(gen.caps_stamp.ClosureError):gen.main(list(map(str,self.rows)),root=self.root)
        self.assertEqual(target.read_bytes(),old)
        self.assertFalse((self.root/'missing').exists())
        self.assertEqual(set(outputs),{f'Grothe/LowerAnalytic/CapRow{row:02d}.lean' for row in self.rows}|{'Grothe/LowerAnalytic/CapNodes.lean'})

    def test_render_uses_the_explicit_supplied_theorem_not_name_inference(self):
        # Pure string renderer has no source/publication authority. Production
        # mappings always come from the strict shared reader tested above.
        proved={13:{'assembly':'Declared.WholeRow13','theorem':'Declared.explicit_row_proof'}}
        outputs=gen.render_modules(self.rows,49,proved);text=outputs['Grothe/LowerAnalytic/CapNodes.lean']
        self.assertIn('import Declared.WholeRow13',text)
        self.assertIn('    · exact Declared.explicit_row_proof\n',text)
        self.assertNotIn('    · exact vertexCapsRow13\n',text)


if __name__=='__main__':unittest.main()
