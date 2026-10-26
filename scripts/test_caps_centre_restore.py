#!/usr/bin/env python3
"""Compare recovery bytes with frozen generators; no Lean, optimizer or real data edits."""
import copy
from contextlib import redirect_stdout
import io,json
from pathlib import Path
import shutil,sys,tempfile,unittest
from unittest.mock import patch
sys.dont_write_bytecode=True
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
import caps_centre_restore as restore
sweep,fine=restore.sweep,restore.fine


class RestoreTests(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup)
        self.root=Path(self.temp.name)
        for name in ['scripts','tools','Grothe/LowerAnalytic','Grothe/Lower','data/caps-m-pieces','data/caps-m/plan/solved']:
            (self.root/name).mkdir(parents=True)
        shutil.copyfile(ROOT/'scripts/caps_stamp.py',self.root/'scripts/caps_stamp.py')
        (self.root/'Grothe/LowerAnalytic/CapExport.lean').write_text('import Grothe.Lower.RowDataTypes\n')
        (self.root/'Grothe/Lower/RowDataTypes.lean').write_text('def capPad : ℚ := 1 / 100000000000\n')
        for name in ['GrotheCapsKernel.lean','lean-toolchain','lakefile.toml','lake-manifest.json']:
            (self.root/name).write_text('fixture\n')
        for name in ['caps_plan.py','caps_lmi.py','caps_centre_sweep.py','caps_centre_fine.py','caps_centre_repair.py']:
            shutil.copyfile(ROOT/'tools'/name,self.root/'tools'/name)
        self.nodes=[{'k':14,'i':200,'s':'1/5','cap':'7/5','ds':['1,0'],
                     'pieces':[{'nq':256,'slack':1e-5,'recipe':'1|1','cons':[]},
                               {'nq':1024,'slack':1e-12,'recipe':'2|1','cons':['0,+,-3/1000,3/1000,1/5,0']}]},
                    {'k':13,'i':141,'s':'1/4','cap':'3/2','ds':['1,0'],
                     'pieces':[{'nq':256,'slack':1e-12,'recipe':'3|1','cons':[]}]}]
        sweep.write_json(self.root/sweep.PIECES,self.nodes)

    def stored(self):
        manifest=sweep.inventory(self.root);sweep.prepare(self.root,manifest,'CodexRestore')
        return manifest

    def explicit(self):
        return fine.prepare(self.root,'14:200','CodexFineRestore',[1600,1152,'1/200'])

    def fake_export(self,entry):
        node=next(n for n in self.nodes if (n['k'],n['i'])==(entry['k'],entry['i']))
        identity=[['1' if i==j else '0' for j in range(13)] for i in range(13)]
        zero=[['0' for _ in range(13)] for _ in range(13)]
        row={k:entry[k] for k in ['k','i','j','grid']}
        row.update(s=node['s'],cap=node['cap'],capPad='1/100000000000',encl=True,polyOK=True,ok=True,N=identity)
        row['cons']=[]
        for encoded in node['pieces'][entry['j']]['cons']:
            _,_,lo,hi,lam,mu=encoded.split(',')
            row['cons'].append({'lo':lo,'hi':hi,'lam':lam,'mu':mu,'A':zero,'B':zero})
        if 'grid_spec' in entry:row['grid_spec']=entry['grid_spec']
        path=self.root/entry['export'];path.write_text(json.dumps(row)+'\n')
        return path

    def test_restore_stored_bytes_match_original_frozen_helper_exactly(self):
        manifest=self.stored();original=copy.deepcopy(manifest)
        expected={e['module_file']:(self.root/e['module_file']).read_bytes() for e in manifest['entries']}
        for name in expected:(self.root/name).unlink()
        result=restore.restore(self.root,manifest)
        self.assertEqual(result['kind'],'stored');self.assertEqual(set(result['restored']),set(expected))
        for name,content in expected.items():self.assertEqual((self.root/name).read_bytes(),content)
        self.assertEqual(manifest,original)
        again=restore.restore(self.root,manifest)
        self.assertEqual(again['restored'],[]);self.assertEqual(set(again['preserved']),set(expected))

    def test_completed_export_solution_sidecar_unchanged(self):
        manifest=self.stored();entry=manifest['entries'][0]
        export=self.fake_export(entry);solved=self.root/entry['solved'];solved.write_text('[{"test":"preserve"}]\n')
        sidecar=self.root/entry['export_provenance']
        snapshots={p:p.read_bytes() for p in [export,solved,sidecar]}
        (self.root/entry['module_file']).unlink()
        restore.restore(self.root,manifest)
        self.assertEqual(sweep.validate(self.root,manifest)['complete_exports'],[sweep.key_string(entry)])
        for path,before in snapshots.items():self.assertEqual(path.read_bytes(),before)

    def test_restore_fine_bytes_match_original_and_preserve_complete_export(self):
        manifest=self.explicit();entry=manifest['entry'];module=self.root/entry['module_file']
        expected=module.read_bytes();export=self.fake_export(entry);before=export.read_bytes()
        module.unlink();result=restore.restore(self.root,manifest)
        self.assertEqual(result['kind'],'fine');self.assertEqual(module.read_bytes(),expected)
        self.assertEqual(export.read_bytes(),before)
        self.assertEqual(fine.validate(self.root,manifest)['grid_spec'],[1600,1152,'1/200'])

    def test_changed_existing_source_is_preserved_and_no_partial_restore(self):
        manifest=self.stored();first,second=manifest['entries']
        a,b=self.root/first['module_file'],self.root/second['module_file']
        a.write_text('foreign source\n');b.unlink()
        with self.assertRaisesRegex(ValueError,'foreign or changed'):
            restore.restore(self.root,manifest)
        self.assertEqual(a.read_text(),'foreign source\n');self.assertFalse(b.exists())

    def test_wrong_source_hash_rejects_without_write(self):
        manifest=self.stored();entry=manifest['entries'][0]
        path=self.root/entry['module_file'];path.unlink();entry['module_source_sha256']='0'*64
        with self.assertRaisesRegex(ValueError,'original AGENTS worktree path'):
            restore.restore(self.root,manifest)
        self.assertFalse(path.exists())

    def test_changed_math_source_is_rejected_before_any_write(self):
        manifest=self.stored();entry=manifest['entries'][0];path=self.root/entry['module_file'];path.unlink()
        source=self.root/'Grothe/Lower/RowDataTypes.lean';source.write_text(source.read_text()+'-- changed\n')
        with self.assertRaisesRegex(ValueError,'provenance changed'):
            restore.restore(self.root,manifest)
        self.assertFalse(path.exists())

    def test_fine_canonical_identity_or_spec_tampering_rejected(self):
        original=self.explicit();path=self.root/original['entry']['module_file'];path.unlink()
        for field,value in [('node_sha256','0'*64),('stored_grid',1),('grid_spec',[1600,512,'1/200'])]:
            manifest=copy.deepcopy(original);manifest['entry'][field]=value
            with self.subTest(field=field),self.assertRaises(ValueError):restore.restore(self.root,manifest)
        self.assertFalse(path.exists())

    def test_path_escape_or_foreign_layout_rejected(self):
        original=self.stored()
        for field,value in [('module_file','../outside.lean'),('module_file','/tmp/outside.lean'),
                            ('module_file','Grothe/LowerAnalytic/CapPlanRuns/../outside.lean'),
                            ('export','../outside.jsonl'),('solved','../outside.json'),
                            ('module_file','Grothe/Other/foreign.lean')]:
            manifest=copy.deepcopy(original);manifest['entries'][0][field]=value
            with self.subTest(field=field,value=value),self.assertRaises(ValueError):restore.restore(self.root,manifest)

    def test_symlink_to_foreign_source_rejected_even_if_bytes_match(self):
        manifest=self.stored();entry=manifest['entries'][0];path=self.root/entry['module_file']
        outside=self.root/'foreign.lean';outside.write_bytes(path.read_bytes());path.unlink();path.symlink_to(outside)
        with self.assertRaisesRegex(ValueError,'symlink'):
            restore.restore(self.root,manifest)
        self.assertTrue(path.is_symlink())

    def test_different_clone_path_fails_clearly_without_guessing_new_hash(self):
        manifest=self.stored()
        with tempfile.TemporaryDirectory() as td:
            relocated=Path(td)/'clone';shutil.copytree(self.root,relocated)
            for entry in manifest['entries']:(relocated/entry['module_file']).unlink()
            with self.assertRaisesRegex(ValueError,'original AGENTS worktree path'):
                restore.restore(relocated,manifest)
            self.assertFalse(any((relocated/e['module_file']).exists() for e in manifest['entries']))

    def test_cli_auto_detects_both_manifest_kinds(self):
        for manifest in [self.stored(),self.explicit()]:
            path=self.root/'manifest.json';sweep.write_json(path,manifest)
            out=io.StringIO()
            with patch.object(restore,'ROOT',self.root),redirect_stdout(out):restore.main(['restore',str(path)])
            result=json.loads(out.getvalue());self.assertTrue(result['source_provenance_verified'])
            self.assertEqual(result['kind'],'stored' if 'entries' in manifest else 'fine')


if __name__=='__main__':unittest.main()
