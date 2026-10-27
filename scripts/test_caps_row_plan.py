#!/usr/bin/env python3
"""Exact proposal-conversion tests: no optimizer, Lean, native builds or jobs.

Agent-ID: codex-718a. Synthetic matrices are identity/zero; the real immutable
row test replays saved rational matrices only and does not publish outputs.
"""
import copy
from fractions import Fraction as F
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
import caps_row_plan as R


class Fixture:
    def __init__(self, root):
        self.root=Path(root);self.nodes=[];self.entries=[];self.records={}
        zeros=','.join(['0']*12)
        recipe=zeros+'|1'
        # One nonzero centre index verifies that conversion never assumes j=0.
        for i in range(88):
            j=1 if i==7 else 0
            pieces=[{'nq':1024,'slack':0.1,'recipe':recipe,
                     'cons':['1,+,-1,1,0,0','2,+,-1,1,0,0']} for _ in range(3)]
            pieces[j]['slack']=0
            if i==1:pieces[j]['nq']=256  # Actual radial-fine case starts from stored grid1.
            self.nodes.append({'k':12,'i':i,'s':str(F(i,400)),'cap':'2',
                               'ds':[zeros]*3,'pieces':pieces})
        # Full inventory contains an unfinished OTHER row, which must not gate row12.
        other=copy.deepcopy(self.nodes[0]);other.update(k=13,i=0)
        self.nodes.append(other)
        self.save(R.PIECES,self.nodes)
        node_string=';'.join(f'{F(i,400)}:2' for i in range(396))
        self.save('data/lower-rows/row13.json',{'name':'0.84','nodes':node_string})
        self.put('Grothe/Lower/RowData.lean',
                 'def rowData : List Row :=\n  ['+', '.join(f'row{i:02d}' for i in range(1,20))+']\n')
        self.put('Grothe/Lower/RowData13.lean','def row13 : Row :=\n  '+json.dumps(node_string)+'\n')
        self.put('Grothe/Lower/RowDataTypes.lean','def capPad : ℚ := 1 / 100000000000\n')
        names=[R.PIECES,'Grothe/Lower/RowData.lean','Grothe/Lower/RowData13.lean',
               'Grothe/Lower/RowDataTypes.lean']
        self.prov={'files':{n:self.sha(n) for n in names},
                   'baseline_capPad':str(R.BASELINE_PAD),
                   'cap_up_convention':'additional to baseline_capPad, not the final capPad'}
        self.prov['fingerprint']=R.digest(R.canonical(self.prov['files']))
        for base in R.sweep.centres(self.nodes):
            ident=R.key(base); stem=ident.replace(':','x')
            entry=dict(base,search_status='pending',historical=None,
                       module_file=f'Grothe/LowerAnalytic/CapPlanRuns/Raw{stem}.lean',
                       export=f'data/caps-m/plan/exports/raw-{stem}.jsonl',
                       export_provenance=f'data/caps-m/plan/exports/raw-{stem}.provenance.json',
                       solved=f'data/caps-m/plan/solved/raw-{stem}.json')
            self.put(entry['module_file'],'-- fixture numerical exporter\n')
            entry['module_source_sha256']=self.sha(entry['module_file'])
            self.entries.append(entry)
            if base['k']!=12:
                self.records[ident]={'status':'awaiting_fine_search','residual_accepted':False,
                                     'evidence':[{'path':'../live-pending-must-not-read','sha256':'f'*64}]}
                continue
            export=self.export(base)
            self.put(entry['export'],json.dumps(export)+'\n')
            self.save(entry['export_provenance'],self.sidecar(entry,self.prov))
            result=self.result(base,entry['export'],self.prov)
            self.save(entry['solved'],[result])
            self.records[ident]={'status':'complete','residual_accepted':True,'best_residual':'0',
                'best_kind':'stored_grid','origin':'fresh_or_resumed','raw_exact_replayed':True,
                'raw_export':self.ref(entry['export']),'raw_result':self.ref(entry['solved']),
                'evidence':[self.ref(entry['solved'])]}
        self.manifest_name='data/caps-m/plan/fixture-manifest.json'
        self.checkpoint_name='data/caps-m/plan/checkpoints/fixture.json'
        self.manifest={'entries':self.entries,'provenance':self.prov,'historical_review_note':'fixture reviewed history'}
        self.checkpoint={'format':'caps-centre-backup/v1','agent_id':'codex-15b7',
            'manifest':self.manifest_name,'actual_source_head':'a'*40,'integrated_master':None,
            'progress_observation':{'path':'archived-observation.json','sha256':'d'*64},
            'scope':'fixture frozen research, not canonical verification',
            'progress_snapshot':{'agent_id':'codex-15b7','capPad_unchanged':str(R.BASELINE_PAD),
                'fingerprint':{'helpers_sha256':{
                    'caps_centre_repair.py':R.digest(Path(R.repair.__file__).read_bytes()),
                    'caps_centre_sweep.py':R.digest(Path(R.sweep.__file__).read_bytes()),
                    'caps_centre_fine.py':R.digest(Path(R.repair.__file__).with_name('caps_centre_fine.py').read_bytes()),
                    'caps_lmi.py':R.digest(Path(R.repair.caps_lmi.__file__).read_bytes())}},
                'centres':self.records}}
        self.refresh()

    def put(self,name,data):
        path=self.root/name;path.parent.mkdir(parents=True,exist_ok=True)
        path.write_bytes(data.encode() if isinstance(data,str) else data)

    def save(self,name,value):self.put(name,R.encoded(value))
    def sha(self,name):return R.digest((self.root/name).read_bytes())
    def ref(self,name,**kw):return {'path':name,'sha256':self.sha(name),**kw}
    def entry(self,i):return next(e for e in self.entries if e['k']==12 and e['i']==i)
    def record(self,i):return self.records[R.key(self.entry(i))]
    def node(self,i):return next(n for n in self.nodes if n['k']==12 and n['i']==i)

    def sidecar(self,entry,prov):
        return {'fingerprint':prov['fingerprint'],'key':R.key(entry),'grid':entry['grid'],
                **{k:entry[k] for k in ('node_sha256','piece_sha256','module_source_sha256')}}

    def export(self,entry):
        node=next(n for n in self.nodes if n['k']==entry['k'] and n['i']==entry['i'])
        constraints=[]
        for source in node['pieces'][entry['j']]['cons']:
            f=R.constraint_fields(source)
            constraints.append({'lo':f[2],'hi':None if f[3]=='*' else f[3],'lam':f[4],'mu':f[5],
                                'A':[['0']*13 for _ in range(13)],'B':[['0']*13 for _ in range(13)]})
        value={k:entry[k] for k in ('k','i','j','grid')}
        value.update(s=node['s'],cap=node['cap'],capPad=str(R.BASELINE_PAD),encl=True,polyOK=True,ok=False,
                     N=[['1' if i==j else '0' for j in range(13)] for i in range(13)],cons=constraints)
        if entry['grid']==3:value['grid_spec']=entry['grid_spec']
        return value

    def result(self,entry,export_path,prov):
        result={k:entry[k] for k in ('k','i','j','grid')}
        result.update(status='fixed',cap_up='0',lm=[['1/3','2/5'],['7/11','13/17']],
                      provenance={'fingerprint':prov['fingerprint'],'export_sha256':self.sha(export_path),
                                  'baseline_capPad':prov['baseline_capPad'],
                                  'cap_up_convention':prov['cap_up_convention']})
        if entry['grid']==3:
            result['grid_spec']=entry['grid_spec'];result['provenance']['grid_spec']=entry['grid_spec']
        return result

    def fine(self,i,spec=(1600,1152,'1/200'),*,supplement=False):
        entry=self.entry(i);ident=R.key(entry);stem=ident.replace(':','x')
        fe=dict(entry,stored_grid=entry['grid'],grid=3,grid_spec=list(spec),
                module_file=f'Grothe/LowerAnalytic/CapPlanRuns/Fine{stem}.lean',
                export=f'data/caps-m/plan/exports/fine-{stem}.jsonl',
                export_provenance=f'data/caps-m/plan/exports/fine-{stem}.provenance.json',
                solved=f'data/caps-m/plan/solved/fine-{stem}.json')
        self.put(fe['module_file'],'-- fixture finer exporter\n');fe['module_source_sha256']=self.sha(fe['module_file'])
        prov={'files':copy.deepcopy(self.prov['files']),'grid':3,'grid_spec':list(spec),
              'baseline_capPad':str(R.BASELINE_PAD),'cap_up_convention':self.prov['cap_up_convention']}
        for name in ('caps_centre_fine.py','caps_centre_sweep.py','caps_centre_repair.py'):
            prov['files']['tools/'+name]=self.checkpoint['progress_snapshot']['fingerprint']['helpers_sha256'][name]
        prov['fingerprint']=R.digest(R.canonical(prov))
        self.put(fe['export'],json.dumps(self.export(fe))+'\n')
        self.save(fe['export_provenance'],self.sidecar(fe,prov))
        result=self.result(fe,fe['export'],prov);self.save(fe['solved'],[result])
        chosen=fe['solved']
        if supplement:
            chosen=f'data/caps-m/plan/solved/chosen-{stem}.json'
            self.save(chosen,[result]);primary=copy.deepcopy(result);primary['cap_up']='1';primary['status']='cap_up'
            self.save(fe['solved'],[primary])
        fm_name=f'data/caps-m/plan/fine-campaign/fine-{stem}.json'
        self.save(fm_name,{'entry':fe,'provenance':prov})
        record=self.record(i);record.update(best_kind='fine_grid',fine_grid_spec=list(spec))
        record['evidence'] += [self.ref(fm_name,kind='independently_pinned_fine_manifest',
                                      solution=self.ref(chosen),primary_result=self.ref(fe['solved'])),
                               self.ref(fe['export'],kind='fine_export'),self.ref(chosen,kind='fine_exact_solution')]
        self.refresh()
        return fm_name,fe,chosen

    def historical(self,i,*,without_matrices=False):
        entry=self.entry(i);record=self.record(i);rows=json.loads((self.root/entry['solved']).read_text())
        entry['search_status']='historical_adopted'
        entry['historical']={'file':entry['solved'],'file_sha256':self.sha(entry['solved']),
                             'result_sha256':R.digest(R.canonical(rows[0]))}
        record.update(best_kind='historical_adopted',origin='historical_adopted')
        if without_matrices:record.pop('raw_export');record['raw_exact_replayed']=False
        self.refresh()

    def refresh(self):
        self.save(self.manifest_name,self.manifest)
        self.checkpoint['progress_snapshot']['fingerprint']['manifest_sha256']=self.sha(self.manifest_name)
        self.save(self.checkpoint_name,self.checkpoint)

    def build(self):
        return R.build_plan(self.root,self.checkpoint_name)


class RowPlanTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup)
        self.f=Fixture(self.tmp.name)

    def test_complete_row_is_independent_of_pending_other_rows(self):
        plan,nodes,selection=self.f.build()
        self.assertEqual(plan['summary']['selected_centres'],88)
        self.assertEqual(plan['summary']['pieces'],264)
        self.assertEqual(plan['row_binding']['source_json'],'data/lower-rows/row13.json')
        self.assertEqual(plan['row_binding']['node_count'],396)
        self.assertFalse(plan['global_capsRest_discharged'])
        self.assertEqual(len(selection),88)
        self.assertNotIn('../live-pending-must-not-read',plan['lineage_files'])

    def test_nonzero_j_and_ordered_multipliers_only_replace_centre(self):
        _,nodes,selection=self.f.build();original=self.f.node(7);node=next(n for n in nodes if n['i']==7)
        self.assertEqual(node['pieces'][0],original['pieces'][0])
        self.assertEqual(node['pieces'][2],original['pieces'][2])
        self.assertEqual(node['pieces'][1]['recipe'],original['pieces'][1]['recipe'])
        self.assertEqual(node['pieces'][1]['cons'],['1,+,-1,1,1/3,2/5','2,+,-1,1,7/11,13/17'])
        self.assertEqual(selection['12:7']['grids'],[2,2,2])

    def test_fine_tuple_not_research_label_and_chosen_solution_not_primary(self):
        self.f.fine(0,supplement=True)
        self.f.fine(1,(3200,256,'1/400'))
        plan,_,selection=self.f.build()
        self.assertEqual(selection['12:0']['grids'][0],3)
        self.assertEqual(selection['12:1']['grids'][0],4)
        centre=next(c for c in plan['centres'] if c['key']=='12:0:0')
        self.assertIn('/chosen-',centre['solution']['path'])
        self.assertEqual(centre['certificate_grid_spec'],[1600,1152,'1/200'])
        self.assertEqual(plan['summary']['best_kind_counts']['fine_grid'],2)

    def test_historical_without_export_remains_unreplayed_proposal(self):
        self.f.historical(0,without_matrices=True)
        plan,_,_=self.f.build();c=plan['centres'][0]
        self.assertTrue(c['historical_proposal']);self.assertFalse(c['exact_matrix_replayed'])
        self.assertFalse(c['native_verified'])
        self.assertEqual(plan['summary']['centres_without_bound_matrices'],1)

    def test_bound_historical_result_is_replayed_but_keeps_history(self):
        self.f.historical(0)
        plan,_,_=self.f.build();c=plan['centres'][0]
        self.assertTrue(c['historical_proposal']);self.assertTrue(c['exact_matrix_replayed'])

    def test_complete_row_rejects_unknown_or_positive_record(self):
        for changes in ({'best_residual':'1/100'}, {'residual_accepted':False}, {'status':'repair_pending'}):
            old=copy.deepcopy(self.f.record(0));self.f.record(0).update(changes);self.f.refresh()
            with self.assertRaisesRegex(R.PlanError,'Entire selected row'):self.f.build()
            self.f.records['12:0:0']=old;self.f.refresh()

    def test_partitions_fail_closed_instead_of_omitting_leaves(self):
        self.f.record(0)['best_kind']='fine_interval_partition';self.f.refresh()
        with self.assertRaisesRegex(R.PlanError,'interval partitions require'):self.f.build()

    def test_missing_row_centre_or_extra_identity_rejected(self):
        self.f.records.pop('12:1:0');self.f.refresh()
        with self.assertRaisesRegex(R.PlanError,'complete source centre inventory'):self.f.build()

    def test_changed_evidence_hash_fails_without_adoption(self):
        self.f.put(self.f.entry(0)['solved'],'[]\n')
        with self.assertRaisesRegex(R.PlanError,'Evidence hash changed'):self.f.build()

    def test_invalid_multiplier_rejected_and_optimizer_never_called(self):
        entry=self.f.entry(0);rows=json.loads((self.f.root/entry['solved']).read_text())
        rows[0]['lm'][0]=['-1','0'];self.f.save(entry['solved'],rows)
        self.f.record(0)['raw_result']=self.f.ref(entry['solved'])
        self.f.record(0)['evidence']=[self.f.ref(entry['solved'])];self.f.refresh()
        with patch.object(R.repair.caps_lmi,'solve_piece',side_effect=AssertionError('Optimizer forbidden')):
            with self.assertRaisesRegex(R.sweep.SweepError,'exact admissibility/LDL'):self.f.build()

    def test_malformed_identity_and_stale_source_node_hash_rejected(self):
        self.f.entry(0)['j']=True;self.f.refresh()
        with self.assertRaisesRegex(R.PlanError,'centre identity'):self.f.build()
        self.f.entry(0)['j']=0;self.f.entry(0)['node_sha256']='f'*64;self.f.refresh()
        with self.assertRaisesRegex(R.PlanError,'Manifest source/centre hash'):self.f.build()

    def test_duplicate_selected_result_identity_rejected(self):
        entry=self.f.entry(0);rows=json.loads((self.f.root/entry['solved']).read_text())
        self.f.save(entry['solved'],rows+rows)
        self.f.record(0)['raw_result']=self.f.ref(entry['solved'])
        self.f.record(0)['evidence']=[self.f.ref(entry['solved'])];self.f.refresh()
        with self.assertRaisesRegex(R.PlanError,'missing or duplicated'):self.f.build()

    def test_false_zero_record_does_not_authorize_positive_selected_solution(self):
        entry=self.f.entry(0);rows=json.loads((self.f.root/entry['solved']).read_text())
        rows[0].update(status='cap_up',cap_up='1/100');self.f.save(entry['solved'],rows)
        self.f.record(0)['raw_result']=self.f.ref(entry['solved'])
        self.f.record(0)['evidence']=[self.f.ref(entry['solved'])];self.f.refresh()
        with self.assertRaisesRegex(R.PlanError,'positive cap increase'):self.f.build()

    def test_wrong_zero_based_row_source_binding_rejected(self):
        data=json.loads((self.f.root/'data/lower-rows/row13.json').read_text());data['nodes']='0:3'
        self.f.save('data/lower-rows/row13.json',data)
        with self.assertRaisesRegex(R.PlanError,'actual rowData module'):self.f.build()

    def test_unsupported_grid_tuple_rejected(self):
        self.f.fine(0,(1600,2048,'1/200'))
        with self.assertRaisesRegex(R.PlanError,'Unsupported exact certificate grid'):self.f.build()

    def test_native_halfspace_lambda_rule_and_constraint_dimensions(self):
        p={'cons':['1,+,0,*,0,1']}
        with self.assertRaisesRegex(R.PlanError,'halfspace lambda'):
            R.adopted_constraints(p,{'lm':[['1','0']]})
        with self.assertRaisesRegex(R.PlanError,'multiplier count'):
            R.adopted_constraints(p,{'lm':[]})

    def test_deterministic_outputs_check_and_no_overwrite(self):
        values=self.f.build()
        R.write_outputs(self.f.root,R.DEFAULT_OUT,12,values)
        R.write_outputs(self.f.root,R.DEFAULT_OUT,12,self.f.build(),check=True)
        target=self.f.root/R.DEFAULT_OUT/'row12-pieces.json';target.write_text('foreign bytes\n')
        with self.assertRaisesRegex(R.PlanError,'Existing prepared bytes differ'):
            R.write_outputs(self.f.root,R.DEFAULT_OUT,12,values)
        self.assertEqual(target.read_text(),'foreign bytes\n')
        with self.assertRaisesRegex(R.PlanError,'new owned row-certificate'):
            R.write_outputs(self.f.root,'data/caps-m/plan',12,values)

    def test_replay_helper_changes_rejected(self):
        self.f.checkpoint['progress_snapshot']['fingerprint']['helpers_sha256']['caps_lmi.py']='0'*64
        self.f.refresh()
        with self.assertRaisesRegex(R.PlanError,'replay implementation differs'):self.f.build()


class ActualRowTests(unittest.TestCase):
    def test_actual_row12_complete_saved_replay_and_all_piece_inventory(self):
        with patch.object(R.repair.caps_lmi,'solve_piece',side_effect=AssertionError('Optimizer forbidden')):
            p,nodes,selection=R.build_plan(R.ROOT)
        self.assertEqual(p['summary']['localized_nodes'],88)
        self.assertEqual(p['summary']['pieces'],4562)
        self.assertEqual(p['summary']['best_kind_counts'],{'fine_grid':48,'historical_adopted':2,'stored_grid':38})
        self.assertEqual(p['summary']['exact_saved_matrix_replays'],88)
        self.assertEqual(p['summary']['native_facts_verified'],0)
        self.assertEqual(p['row_binding']['source_lean'],'Grothe/Lower/RowData13.lean')
        nonzero={c['key'] for c in p['centres'] if c['original_piece_index']!=0}
        self.assertEqual(nonzero,{'12:270:350','12:272:380','12:276:287','12:280:103'})
        self.assertEqual(selection['12:280']['grids'][103],4)
        source={n['i']:n for n in json.loads((R.ROOT/R.PIECES).read_text()) if n['k']==12}
        centre={int(c['key'].split(':')[1]):c['original_piece_index'] for c in p['centres']}
        for n in nodes:
            for j,piece in enumerate(n['pieces']):
                if j!=centre[n['i']]:self.assertEqual(piece,source[n['i']]['pieces'][j])


if __name__=='__main__':unittest.main()
