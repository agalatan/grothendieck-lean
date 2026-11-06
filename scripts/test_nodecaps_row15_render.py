#!/usr/bin/env python3
"""Source-gate regressions for the complete Row15 input binding; no Lean/solver. Agent-ID: codex-15b7."""
import copy,json,sys,unittest
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'tools'))
import nodecaps_row15_render as m
class Gates(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  cls.snapshot=None
  if (ROOT/(m.BASE+'row15-repaired-source-binding.json')).exists():
   import nodecaps_row15_repaired_render as repaired
   cls.snapshot,_=repaired.capture_baseline(ROOT)
  read=lambda n:cls.snapshot[n] if cls.snapshot is not None else (ROOT/n).read_bytes()
  cls.plan=json.loads(read(m.BASE+'row15.json'));cls.anchor=json.loads(read(m.BASE+'row15-anchors.json'));cls.nodes=json.loads(read(m.BASE+'row15-pieces.json'));cls.selection=json.loads(read(m.BASE+'row15-selection.json'));cls.binding=json.loads(read(m.BASE+'row15-binding.json'))
 def inputs(self):return [copy.deepcopy(x) for x in (self.plan,self.anchor,self.nodes,self.selection)]
 def validate(self,values):
  snapshot=self.snapshot
  class OriginalReads(m.STAMP._ActiveReads):
   def read(self,name,**kwargs):return snapshot[name] if snapshot is not None and name in snapshot else super().read(name,**kwargs)
  m.validate_plan(*values,OriginalReads(ROOT))
 def test_complete92_gate(self):self.validate(self.inputs())
 def test_missing_centre(self):
  v=self.inputs();v[0]['centres'].pop()
  with self.assertRaises(ValueError):self.validate(v)
 def test_duplicate_centre(self):
  v=self.inputs();v[0]['centres'][1]=copy.deepcopy(v[0]['centres'][0])
  with self.assertRaises(ValueError):self.validate(v)
 def test_no_matrix_free_exception(self):
  v=self.inputs();v[0]['centres'][0]['exact_matrix_replayed']=False
  with self.assertRaisesRegex(ValueError,'exact matrix'):self.validate(v)
 def test_exact_boolean_gate(self):
  v=self.inputs();v[0]['centres'][0]['exact_matrix_replayed']=1
  with self.assertRaises(ValueError):self.validate(v)
 def test_no_native_claim(self):
  v=self.inputs();v[0]['centres'][0]['native_verified']=True
  with self.assertRaises(ValueError):self.validate(v)
 def test_no_anchor_native_claim(self):
  v=self.inputs();v[1]['native_verified']=True
  with self.assertRaises(ValueError):self.validate(v)
 def test_unchanged_padding(self):
  v=self.inputs();v[0]['capPad']='1/10000000000'
  with self.assertRaises(ValueError):self.validate(v)
 def test_zero_additional_cap(self):
  v=self.inputs();v[0]['cap_up']='1/100000000000'
  with self.assertRaises(ValueError):self.validate(v)
 def test_full358_authority(self):
  v=self.inputs();v[0]['full_snapshot_centres']=357
  with self.assertRaises(ValueError):self.validate(v)
 def test_incomplete_row(self):
  v=self.inputs();v[0]['row_complete_research_gate']=False
  with self.assertRaises(ValueError):self.validate(v)
 def test_unsupported_partition(self):
  v=self.inputs();v[0]['centres'][0]['best_kind']='interval_partition'
  with self.assertRaises(ValueError):self.validate(v)
 def test_ordered_grid(self):
  v=self.inputs();v[0]['centres'][0]['certificate_grid_spec']=[1600,1024,'1/200']
  c=self.plan['centres'][0]
  if v[0]['centres'][0]['certificate_grid_spec']==c['certificate_grid_spec']:v[0]['centres'][0]['certificate_grid_spec']=[1,2,'1/3']
  with self.assertRaises(ValueError):self.validate(v)
 def test_no_omitted_node(self):
  v=self.inputs();v[2].pop()
  with self.assertRaises(ValueError):self.validate(v)
 def test_noncentre_recipe_preserved(self):
  v=self.inputs();i=int(v[0]['centres'][0]['key'].split(':')[1]);j=v[0]['centres'][0]['original_piece_index'];n=next(n for n in v[2] if n['i']==i);other=next(k for k in range(len(n['pieces'])) if k!=j);n['pieces'][other]['recipe']+='0'
  with self.assertRaises(ValueError):m.validate_unchanged_pieces(v[2],v[3],v[0]['centres'],m.STAMP._ActiveReads(ROOT))
 def test_incomplete_assembly(self):
  with self.assertRaises(ValueError):m.assembly([1,2],[(0,16)])
 def test_unreviewed_tool_rejected(self):
  b=copy.deepcopy(self.binding);b['tools_sha256']['tools/nodecaps_row15_render.py']='0'*64
  with self.assertRaises(ValueError):m.render(ROOT,b)
 def test_no_binding_verification_claim(self):
  b=copy.deepcopy(self.binding);b['native_verified']=True
  with self.assertRaises(ValueError):m.render(ROOT,b)
 def test_historical_policy_is_byte_bound(self):
  import nodecaps_repaired_render as old
  top=json.loads((ROOT/old.BINDING).read_bytes());policy=top['baseline_files'][m.POLICY]
  self.assertNotEqual(policy['path'],m.POLICY)
  self.assertEqual(m.sha((ROOT/policy['path']).read_bytes()),policy['sha256'])
  self.assertEqual(json.loads((ROOT/policy['path']).read_bytes())['rows'],[12,13,14])
  self.assertEqual(json.loads((ROOT/m.POLICY).read_bytes())['rows'],[12,13,14,15])
 def test_current_policy_cannot_replace_archived_snapshot(self):
  import nodecaps_repaired_render as old
  top=json.loads((ROOT/old.BINDING).read_bytes());top['baseline_files'][m.POLICY]['path']=m.POLICY
  with self.assertRaises(ValueError):old.render(ROOT,top)
 def test_global_retained_proof_is_preserved(self):
  d=m.declaration(m.STAMP);self.assertEqual(d['retained_proofs'][0]['theorem'],'Grothe.LowerAnalytic.nodeCap_14x150_done');self.assertEqual(d['active_rows'][0]['retained_nodes'],[])
if __name__=='__main__':unittest.main()
