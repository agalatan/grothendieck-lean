#!/usr/bin/env python3
"""Temporary synthetic Row15 renderer tests; no certificate/proof claims.

Actual original sealed inputs are replayed. A clearly synthetic diagonal matrix
exercises only the repair/source binding path, never feasibility of real data.
Agent-ID: codex-15b7. No canonical writes, optimizer, Lean or remote calls.
"""
import copy
import json
from pathlib import Path
import sys
import tempfile
import unittest
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
import nodecaps_row15_repaired_render as r

ROOT=Path(__file__).resolve().parents[1]
class RenderTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.snapshot,cls.outputs=r.capture_baseline(ROOT)
        cls.assertion_fixture_is_synthetic=True

    def fixture(self):
        files=dict(self.snapshot);B=r.BASE;enc=r.repair.encoded;ref=lambda n:{'path':n,'sha256':r.sha(files[n])}
        original=files[B+'row15-pieces.json'];nodes=r.decode(original);plan=r.decode(files[B+'row15.json'])
        node=nodes[0];i=node['i'];centre=next(c['original_piece_index'] for c in plan['centres'] if int(c['key'].split(':')[1])==i)
        j=next(j for j,p in enumerate(node['pieces']) if j!=centre and p['cons']);p=node['pieces'][j]
        selection=r.decode(files[B+'row15-selection.json']);grid=selection[f'15:{i}']['grids'][j]
        matrix=lambda q:[[str(q if a==b else 0) for b in range(13)] for a in range(13)]
        witness={'k':15,'i':i,'j':j,'grid':grid,'cap':node['cap'],'s':node['s'],'capPad':'1/100000000000',
                 'polyOK':True,'encl':True,'ok':False,'N':matrix(1),'cons':[]}
        lm=[]
        for text in p['cons']:
            c=text.split(',');witness['cons'].append({'lo':c[2],'hi':None if c[3]=='*' else c[3],
                'lam':c[4],'mu':c[5],'A':matrix(0),'B':matrix(0)});lm.append([c[4],c[5]])
        lm[0][1]=str(r.repair.rational(lm[0][1])+1)
        effective=copy.deepcopy(nodes)
        for index,pair in enumerate(lm):
            fields=effective[0]['pieces'][j]['cons'][index].split(',');effective[0]['pieces'][j]['cons'][index]=','.join(fields[:4]+pair)
        archive='data/synthetic-row15/original-pieces.json';files[archive]=original
        evidence='data/synthetic-row15/DIAGONAL-TEST-ONLY.jsonl';files[evidence]=(json.dumps(witness,sort_keys=True,separators=(',',':'))+'\n').encode()
        pp='data/synthetic-row15/patches.json';files[pp]=enc({'format':r.repair.PATCH_FORMAT,'row':15,
          'baseline_sha256':r.sha(original),'selection_sha256':r.sha(files[B+'row15-selection.json']),
          'centre_plan_sha256':r.sha(files[B+'row15.json']),'capPad':'1/100000000000','cap_up':'0','repairs':[{
          'key':f'15:{i}:{j}','grid':grid,'baseline_piece_sha256':r.sha(enc(p)),
          'node_context_sha256':r.sha(enc({k:v for k,v in node.items() if k!='pieces'})),
          'multipliers':lm,'evidence':ref(evidence),'matrix_source_provenance':'unverified'}]})
        rb='data/synthetic-row15/repair-binding.json';files[rb]=enc({'format':r.repair.FORMAT,'row':15,
          'baseline_archive':ref(archive),'historical_provenance':ref(r.ORIGINAL),
          'historical_seal':ref(B+'row15-source.json'),'centre_plan':ref(B+'row15.json'),
          'selection':ref(B+'row15-selection.json'),'patches':ref(pp),
          'effective':{'path':B+'row15-pieces.json','sha256':r.sha(enc(effective))},
          'source_sha256':{evidence:r.sha(files[evidence])}})
        mapping={n:ref(n) for n in self.snapshot};mapping[B+'row15-pieces.json']=ref(archive)
        for name in r.decode(self.snapshot[r.ORIGINAL])['tools_sha256']:
            stored='data/synthetic-row15/original-tools/'+r.sha(self.snapshot[name])+'/'+name
            files[stored]=self.snapshot[name];mapping[name]=ref(stored)
        files[B+'row15-pieces.json']=enc(effective)
        for name in r.CURRENT_TOOLS:files[name]=(ROOT/name).read_bytes()
        with tempfile.TemporaryDirectory() as directory:
            temp=Path(directory).resolve()
            for name,data in self.snapshot.items():
                target=temp/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(data)
            generated=r.shared.render_pieces(temp,15,enc(effective))
        D=f'Grothe/LowerAnalytic/CapPieces/D15x{i}.lean'
        top={'format':r.FORMAT,'baseline_files':mapping,'current_tools_sha256':{n:r.sha(files[n])for n in r.CURRENT_TOOLS},
             'repair_binding':ref(rb),'effective_sources_sha256':{D:r.sha(generated[D])}}
        return files,top,D

    def run_render(self, files, top):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory).resolve()
            for n,data in files.items():
                target=root/n;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(data)
            return r.render(root,top)

    def test_original_sealed_reproduction_byte_exact(self):
        self.assertEqual(r.original_outputs(self.snapshot),self.outputs)

    def test_capture_original_after_repair_activation(self):
        files,top,_=self.fixture();files[r.BINDING]=r.repair.encoded(top)
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory).resolve()
            for name,data in files.items():
                p=root/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(data)
            snapshot,outputs=r.capture_baseline(root)
        self.assertEqual(snapshot,self.snapshot);self.assertEqual(outputs,self.outputs)

    def test_only_named_D15_changes_and_anchors_preserved(self):
        files,top,D=self.fixture();outputs,receipt=self.run_render(files,top)
        self.assertEqual(set(outputs),set(self.outputs))
        self.assertEqual({n for n in outputs if outputs[n]!=self.outputs[n]},{D})
        self.assertFalse(receipt['native_verified']);self.assertFalse(receipt['cache_uploaded'])
        self.assertFalse(receipt['repair_receipt']['current_source_feasibility_verified'])

    def test_changed_historical_input_rejected(self):
        snap=dict(self.snapshot);snap[r.BASE+'row15-selection.json']+=b' '
        with self.assertRaisesRegex(ValueError,'original Row15 pin'):r.original_outputs(snap)

    def test_wrong_effective_D_pin_rejected(self):
        files,top,D=self.fixture();top['effective_sources_sha256'][D]='0'*64
        with self.assertRaisesRegex(ValueError,'effective D15 hash'):self.run_render(files,top)

    def test_extra_unlisted_D_rejected(self):
        files,top,D=self.fixture();top['effective_sources_sha256']['Grothe/LowerAnalytic/CapPieces/D15x999.lean']='0'*64
        with self.assertRaisesRegex(ValueError,'source inventory'):self.run_render(files,top)

    def test_forbidden_baseline_alias_rejected(self):
        files,top,D=self.fixture();files['data/synthetic-row15/unreviewed']=b'byte'
        top['baseline_files']['data/unreviewed.json']={'path':'data/synthetic-row15/unreviewed','sha256':r.sha(b'byte')}
        with self.assertRaisesRegex(ValueError,'unreviewed Row15 baseline alias'):self.run_render(files,top)

if __name__=='__main__':unittest.main()
