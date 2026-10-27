#!/usr/bin/env python3
"""Optional two-fine window regressions, fake processes/tiny exact fixtures only.

Agent-ID: codex-15b7. No Lean, optimizer, remote job or native verification.
"""
import copy
from dataclasses import replace
import importlib.util
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
import caps_centre_paired as paired

def module(name):
    spec = importlib.util.spec_from_file_location(name, ROOT/'scripts'/('test_caps_centre_'+name+'.py'))
    value = importlib.util.module_from_spec(spec);spec.loader.exec_module(value)
    return value

fixtures = module('batch')


class Child:
    pid = 987699
    def __init__(self, code=0):
        self.code, self.polled, self.ended = code, False, False
    def poll(self):
        if not self.polled:
            self.polled = True
            return None
        self.ended = True
        return self.code
    def wait(self, timeout=None):
        self.ended = True
        return self.code


class Guard:
    def __init__(self, observations=()):
        self.values = iter(observations)
    def observe(self, group=None):
        return next(self.values, {'pause_reason': None, 'rss': 0, 'free_disk': 9*paired.batch.GIB,
                                  'lean_count': 0, 'modules': []})


class Tests(unittest.TestCase):
    make_relative = fixtures.BatchTests.make_relative
    export = fixtures.BatchTests.export

    def setUp(self):
        fixtures.BatchTests.setup_batch_fixture(self, (201, 202))
        self.root = self.root.resolve()
        self.portable = self.portable.resolve()
        for name in (*paired.guarded.SOURCE_NAMES, 'caps_centre_paired.py'):
            shutil.copyfile(ROOT/'tools'/name, self.root/'tools'/name)
        self.bundle = paired.guarded.read(self.portable)
        self.manifest_path = self.root/self.bundle['manifest']['path']
        self.config = paired.Config(self.root, self.portable,
            self.root/'data/caps-m/plan/guarded-campaign-codex-15b7-paired-fixture.json',
            self.root/'handoff/caps-centre/codex-15b7-guarded-paired-fixture',
            self.root/'handoff/caps-centre/codex-15b7-guarded-paired-fixture/STOP_REQUESTED',
            poll_seconds=0.001, repair_depth=0)
        self.keys = list(self.fms)
        self.entries = {paired.sweep.key_string(e):e for e in self.manifest['entries']}
        for e in self.entries.values(): self.export(e)
        self.raw_increases = {k:'1/10' for k in self.keys}
        self.calls, self.factories = [], []
        self.code = 0
        self.export_peers = None
        self.fine_fail = False
        self.malformed_peers = set()
        self.observations = ()
        self.lock_check = Mock()
        self.owner = self.make_owner()

    def saved(self, entry, provenance, increase='0'):
        value = {k:entry[k] for k in ('k','i','j','grid')}
        value.update(status='fixed' if increase == '0' else 'cap_up', cap_up=increase,
                     lm=[['1/5','0']], encl=True, polyOK=True, provenance=provenance)
        if entry['grid'] == 3: value['grid_spec'] = entry['grid_spec']
        paired.repair.atomic_json(self.root/entry['solved'], [value])

    def solve_raw(self, key):
        e = self.entries[key]
        prov = {'fingerprint':self.manifest['provenance']['fingerprint'],
                'export_sha256':paired.sweep.sha(self.root/e['export']),
                'baseline_capPad':self.manifest['provenance']['baseline_capPad'],
                'cap_up_convention':self.manifest['provenance']['cap_up_convention']}
        self.saved(e, prov, self.raw_increases[key])

    def solve_fine(self, fm):
        e = fm['entry']
        prov = {'fingerprint':fm['provenance']['fingerprint'],
                'export_sha256':paired.sweep.sha(self.root/e['export']), 'grid_spec':e['grid_spec'],
                'baseline_capPad':fm['provenance']['baseline_capPad'],
                'cap_up_convention':fm['provenance']['cap_up_convention']}
        self.saved(e, prov)
        if self.fine_fail:
            path=self.root/e['solved'];rows=paired.guarded.read(path)
            rows[0].update(status='fail',cap_up=None,lm=None,error='fixture inconclusive search')
            paired.repair.atomic_json(path,rows)

    def factory(self, config, update):
        guard = Guard(self.observations)
        self.factories.append(config)
        def popen(argv, **kwargs):
            self.calls.append((argv, kwargs, config))
            if argv[0] == 'lake':
                modules = argv[4:-1]  # lake -f overlay build targets --wfail
                for key, fm in self.fms.items():
                    if fm['entry']['module'] in modules and (self.export_peers is None or key in self.export_peers):
                        path=self.export(fm['entry'])
                        if key in self.malformed_peers: path.write_text('{partial')
            elif 'solve-stored' in argv:
                self.solve_raw(argv[argv.index('--key')+1])
            elif 'solve-fine' in argv:
                self.solve_fine(paired.guarded.read(argv[argv.index('--fine-manifest')+1]))
            else:
                self.fail('Unregistered fake child: '+str(argv))
            return Child(self.code if argv[0] == 'lake' else 0)
        return paired.batch.Runner(config, update, guard=guard, popen=popen,
                                   killpg=Mock(), sleep=lambda _:None)

    def make_owner(self):
        serial_passport = paired.guarded.Passport(self.config, self.bundle, self.manifest_path,
            snapshot=lambda _: {'head':'fixture','tracked_diff':'explicit frozen fixture'})
        registry = paired.guarded.Registry(self.config, self.bundle, self.manifest_path, self.manifest)
        owner = paired.PairedCampaign(self.config.campaign_config(self.manifest_path),
            runner_factory=lambda c, update: paired.SerialAdapter(c, update, serial_passport, registry,
                                                                  runner_factory=self.factory))
        owner.prefetch = paired.Prefetch(self.config, owner, serial_passport, registry, self.lock_check,
                                         checker=lambda *_:None, runner_factory=self.factory)
        return owner

    def test_separate_serial_and_pair_configs_are_bounded(self):
        self.config.validate()
        self.assertEqual(self.config.guard_config().lake_threads, 1)
        self.assertEqual(self.config.pair_config().lake_threads, 2)
        self.assertEqual(self.config.pair_config().batch_size, 2)
        for c in (replace(self.config,pair_rss_limit=25*paired.batch.GIB),
                  replace(self.config,rss_limit=13*paired.batch.GIB),
                  replace(self.config,progress=self.root/'data/caps-m/plan/old.json'),
                  replace(self.config,pair_export_limit=-1)):
            with self.assertRaises(ValueError): c.validate()

    def test_registry_allows_only_exact_portable_one_or_two_fine_leaves(self):
        reg = self.owner.prefetch.registry
        keys=self.keys[:2];argv=['lake','build',*[self.fms[k]['entry']['module'] for k in keys],'--wfail']
        binding, serial = reg.authorize(argv,'fine-export',keys)
        self.assertIsNone(serial);self.assertEqual(len(binding['leaves']),2)
        for args,phase,ids in [(argv,'fine-export',self.keys),(['lake','build','Grothe','--wfail'],'fine-export',keys[:1]),
                               (argv,'raw-export',keys),(argv,'fine-export',[keys[0],keys[0]])]:
            with self.assertRaises(ValueError): reg.authorize(args,phase,ids)

    def test_fine_paths_and_absolute_io_or_native_templates_reject(self):
        key=self.keys[0];fm=self.fms[key]
        path=self.root/fm['entry']['module_file'];before=path.read_bytes()
        path.write_text(path.read_text()+'\ntheorem forbidden : True := by native_decide\n')
        with self.assertRaises(ValueError): self.owner.prefetch.registry.fine(key)
        path.write_bytes(before)
        manifest=self.root/next(p['fine_manifest'] for p in self.bundle['pending'] if p['key']==key)
        invalid=copy.deepcopy(fm);invalid['entry']['solved']='../escape.json'
        paired.repair.atomic_json(manifest,invalid)
        with self.assertRaises(ValueError): self.owner.prefetch.registry.fine(key)
        self.assertFalse((self.root.parent/'escape.json').exists())

    def test_actual_guarded_pair_receipts_then_inherited_acceptance(self):
        self.owner.process(self.entries[self.keys[0]])
        lakes=[c for c in self.calls if c[0][0]=='lake']
        self.assertEqual(len(lakes),1)
        self.assertEqual(len(lakes[0][0][4:-1]),2)
        self.assertEqual(lakes[0][1]['env']['LEAN_NUM_THREADS'],'2')
        overlay=self.root/lakes[0][0][2]
        self.assertIn('weakLeanArgs = ["-j1"]',overlay.read_text())
        self.assertEqual(self.owner.state['centres'][self.keys[0]]['status'],'complete')
        self.assertEqual(self.owner.state['centres'][self.keys[1]]['status'],'pending')
        self.assertEqual(len(self.owner.state['centres']),len(self.manifest['entries']))
        pair=self.owner.prefetch.batch.state['groups']
        exported=[g for g in pair if g['phase']=='fine-export']
        self.assertEqual(len(exported),1)
        self.assertEqual(exported[0]['state'],'complete')
        self.assertEqual(paired.guarded.read(self.root/Path(exported[0]['log']).with_suffix('.json')),exported[0])
        before=len(self.calls);self.owner.process(self.entries[self.keys[1]])
        self.assertEqual(len(self.calls),before)
        self.assertEqual(self.owner.state['centres'][self.keys[1]]['status'],'complete')

    def test_raw_zero_does_not_export_or_invent_positive_work(self):
        for key in self.keys:self.raw_increases[key]='0'
        self.owner.process(self.entries[self.keys[0]])
        self.assertFalse(any(argv[0]=='lake' for argv,_,_ in self.calls))
        self.assertEqual(self.owner.state['centres'][self.keys[0]]['best_residual'],'0')

    def test_unknown_raw_is_not_default_zero_or_acceptance(self):
        pre=self.owner.prefetch
        with patch.object(pre.batch,'solve',return_value=None):
            with self.assertRaisesRegex(ValueError,'Unknown raw'):
                self.owner.process(self.entries[self.keys[0]])
        self.assertFalse(self.calls)
        self.assertTrue(all(r['status']=='pending' for r in self.owner.state['centres'].values()))

    def test_completed_old_fine_alias_wins_without_portable_reexport(self):
        key=self.keys[0];e=self.entries[key]
        fm=paired.fine.prepare(self.root,f"{e['k']}:{e['i']}",'OlderCompletedTag',self.grid)
        path=self.root/'data/caps-m/plan/fine-campaign/older.json'
        paired.repair.atomic_json(path,fm);self.export(fm['entry']);self.solve_fine(fm)
        self.owner.process(e)
        self.assertTrue(self.owner.prefetch.registry.completed_discovery(key))
        self.assertFalse((self.root/self.fms[key]['entry']['export']).exists())
        for argv,_,_ in self.calls:
            if argv[0]=='lake':self.assertNotIn(self.fms[key]['entry']['module'],argv)
        self.assertEqual(self.owner.state['centres'][key]['status'],'complete')

    def test_partial_failed_pair_preserves_valid_peer_and_real_receipts(self):
        self.code=1;self.export_peers={self.keys[0]}
        with patch.object(paired.os,'getpid',return_value=987621):
            with self.assertRaisesRegex(ValueError,'Batch failed'):
                self.owner.process(self.entries[self.keys[0]])
        pre=self.owner.prefetch
        self.assertEqual(pre.batch.state['centres'][self.keys[0]]['fine_export'],'valid')
        self.assertEqual(pre.batch.state['centres'][self.keys[1]]['fine_export'],'missing')
        before=(self.root/self.fms[self.keys[0]]['entry']['export']).read_bytes()
        self.assertEqual(pre.batch.state['groups'][-1]['actual_exit'],1)
        self.assertTrue(all(r['status']=='pending' for r in self.owner.state['centres'].values()))
        self.code=0;self.export_peers=None;self.calls.clear()
        with patch.object(paired.os,'getpid',return_value=987622):
            resumed=self.make_owner();resumed.process(self.entries[self.keys[0]])
        targets=[argv[4:-1] for argv,_,_ in self.calls if argv[0]=='lake']
        self.assertEqual(targets,[[self.fms[self.keys[1]]['entry']['module']]])
        self.assertEqual((self.root/self.fms[self.keys[0]]['entry']['export']).read_bytes(),before)

    def test_pause_signal_reaches_both_paths_and_cannot_accept(self):
        self.owner.pause_signal(signal.SIGTERM,None)
        with self.assertRaises(paired.campaign.Paused):self.owner.process(self.entries[self.keys[0]])
        self.assertTrue(self.owner.prefetch.batch.stop_requested)
        self.assertTrue(self.owner.runner.stop_requested)
        self.assertFalse(self.calls)
        self.assertTrue(all(r['status']=='pending' for r in self.owner.state['centres'].values()))

    def test_stop_file_blocks_every_prefetch_or_serial_child(self):
        self.config.stop_file.parent.mkdir(parents=True,exist_ok=True)
        self.config.stop_file.touch()
        with self.assertRaises(paired.campaign.Paused):self.owner.prefetch.window(self.entries[self.keys[0]])
        self.assertFalse(self.calls)

    def test_pair_and_serial_children_cannot_overlap(self):
        pr=self.owner.prefetch.batch.runner
        pr.runner.child=Mock()
        with self.assertRaisesRegex(RuntimeError,'Pair child'):
            self.owner.runner.check()
        pr.runner.child=None;self.owner.runner.runner.child=Mock()
        with self.assertRaisesRegex(RuntimeError,'Serial child'):
            pr.check()
        self.owner.runner.runner.child=None
        self.assertFalse(self.calls)

    def test_pair_source_or_profile_drift_blocks_even_serial_children(self):
        path=self.root/'tools/caps_centre_paired.py';path.write_text(path.read_text()+'\n# changed\n')
        with self.assertRaisesRegex(ValueError,'Pair execution'):
            self.owner.runner.check()
        self.assertFalse(self.calls)

    def test_foreign_or_disk_pause_prevents_spawn_and_acceptance(self):
        for reason in ('Runner.Worker active','Disk below floor'):
            with self.subTest(reason=reason):
                pre=self.owner.prefetch;pr=pre.batch.runner
                pr.runner.guard=Guard([{'pause_reason':reason,'rss':0,'free_disk':2*paired.batch.GIB}])
                self.owner.runner.runner.guard=Guard()
                for key in self.keys[:2]:self.solve_raw(key)
                with self.assertRaises(paired.campaign.ResourcePaused):
                    self.owner.process(self.entries[self.keys[0]])
                self.assertFalse(self.calls)
                self.assertTrue(all(r['status']=='pending' for r in self.owner.state['centres'].values()))

    def test_rss_pause_stops_only_the_created_fake_pair_group(self):
        for key in self.keys[:2]:self.solve_raw(key)
        pr=self.owner.prefetch.batch.runner
        pr.runner.guard=Guard([{'pause_reason':None,'rss':0},
                               {'pause_reason':'RSS exceeds guard','rss':25*paired.batch.GIB},
                               {'pause_reason':None,'rss':0}])
        with self.assertRaises(paired.campaign.ResourcePaused):
            self.owner.process(self.entries[self.keys[0]])
        pr.runner.killpg.assert_called_with(Child.pid,signal.SIGTERM)
        self.assertTrue(all(r['status']=='pending' for r in self.owner.state['centres'].values()))
        self.assertEqual(self.owner.prefetch.batch.state['groups'][-1]['state'],'paused')

    def test_malformed_peer_resource_pause_keeps_all_peer_states_and_returns75(self):
        for key in self.keys[:2]:self.solve_raw(key)
        self.malformed_peers={self.keys[1]}
        pr=self.owner.prefetch.batch.runner
        pr.runner.guard=Guard([{'pause_reason':None,'rss':0},
                               {'pause_reason':'RSS exceeds guard','rss':25*paired.batch.GIB},
                               {'pause_reason':None,'rss':0}])
        self.assertEqual(self.owner.run(),75)
        pre=self.owner.prefetch
        self.assertEqual(pre.batch.state['centres'][self.keys[0]]['fine_export'],'valid')
        self.assertEqual(pre.batch.state['centres'][self.keys[1]]['fine_export'],'invalid_preserved')
        group=pre.batch.state['groups'][-1]
        self.assertEqual(group['phase'],'fine-export');self.assertEqual(group['state'],'paused')
        self.assertEqual(group['pause_reason'],'RSS exceeds guard')
        receipt=self.root/Path(group['log']).with_suffix('.json')
        self.assertEqual(paired.guarded.read(receipt),group)
        self.assertEqual((self.root/self.fms[self.keys[1]]['entry']['export']).read_text(),'{partial')
        self.assertEqual(self.owner.state['status'],'paused')
        self.assertEqual(self.owner.state['summary']['completed_centres'],0)
        pr.runner.killpg.assert_called_with(Child.pid,signal.SIGTERM)

    def test_malformed_peer_failed_child_preserves_valid_peer_and_failure_receipt(self):
        for key in self.keys[:2]:self.solve_raw(key)
        self.code=1;self.malformed_peers={self.keys[1]}
        with self.assertRaisesRegex(ValueError,'Batch failed'):
            self.owner.process(self.entries[self.keys[0]])
        pre=self.owner.prefetch
        self.assertEqual(pre.batch.state['centres'][self.keys[0]]['fine_export'],'valid')
        self.assertEqual(pre.batch.state['centres'][self.keys[1]]['fine_export'],'invalid_preserved')
        group=pre.batch.state['groups'][-1]
        self.assertEqual(group['actual_exit'],1)
        self.assertEqual(paired.guarded.read(self.root/Path(group['log']).with_suffix('.json')),group)
        before=(self.root/self.fms[self.keys[1]]['entry']['export']).read_bytes()
        calls=len(self.calls)
        with self.assertRaises(ValueError):self.owner.process(self.entries[self.keys[0]])
        self.assertEqual(len(self.calls),calls)
        self.assertEqual((self.root/self.fms[self.keys[1]]['entry']['export']).read_bytes(),before)
        self.assertTrue(all(r['status']=='pending' for r in self.owner.state['centres'].values()))

    def test_pilot_limit_pauses_before_another_export_but_preserves_completed_window(self):
        self.owner.process(self.entries[self.keys[0]])
        self.owner.process(self.entries[self.keys[1]])
        before=len(self.calls)
        with self.assertRaisesRegex(paired.campaign.ResourcePaused,'pilot export limit'):
            self.owner.process(self.entries[self.keys[2]])
        self.assertEqual(sum(argv[0]=='lake' for argv,_,_ in self.calls),1)
        self.assertEqual(self.owner.state['summary']['completed_centres'],2)
        self.assertFalse(self.owner.state['summary']['is_global_maximum'])
        self.assertGreater(len(self.calls),before) # Real raw solve can precede the next fine budget gate.

    def test_common_lock_rejects_second_owner_and_replaced_inode(self):
        a=paired.CommonLock(self.root)
        try:
            # Same-process second descriptor is independently locked on Linux/macOS.
            with self.assertRaises(BlockingIOError):paired.CommonLock(self.root)
            path=a.path;path.unlink();path.touch()
            with self.assertRaisesRegex(ValueError,'closed/replaced'):a.check()
        finally:a.close()

    def test_conflicting_aliases_of_same_module_fail_closed(self):
        key=self.keys[0];fm=copy.deepcopy(self.fms[key]);fm['different_alias_metadata']='conflict'
        paired.repair.atomic_json(self.root/'data/caps-m/plan/fine-conflicting-alias.json',fm)
        with self.assertRaisesRegex(ValueError,'Conflicting aliases'):
            self.owner.prefetch.registry.completed_discovery(key)
        self.assertFalse(self.calls)

    def test_pair_source_mutation_during_serial_worker_rejects_after_real_receipt(self):
        original=self.solve_raw
        def mutate(key):
            original(key)
            path=self.root/'tools/caps_centre_paired.py'
            path.write_text(path.read_text()+'\n# changed while serial worker ran\n')
        self.solve_raw=mutate
        with self.assertRaisesRegex(ValueError,'Pair execution'):
            self.owner.process(self.entries[self.keys[0]])
        self.assertEqual(len(self.calls),1)
        self.assertEqual(self.owner.state['last_child']['actual_exit'],0)
        receipt=self.root/Path(self.owner.state['last_child']['log']).with_suffix('.json')
        self.assertEqual(paired.guarded.read(receipt),self.owner.state['last_child'])
        self.assertTrue(all(r['status']=='pending' for r in self.owner.state['centres'].values()))

    def test_pair_profile_budget_change_requires_new_paths(self):
        self.config.pair_rss_limit=23*paired.batch.GIB
        with self.assertRaisesRegex(ValueError,'Pair execution'):
            self.owner.runner.check()
        self.assertFalse(self.calls)

    def test_inconclusive_fine_is_deferred_by_inherited_science(self):
        self.fine_fail=True
        with self.assertRaises(paired.campaign.FineSearchPaused):
            self.owner.process(self.entries[self.keys[0]])
        row=self.owner.state['centres'][self.keys[0]]
        self.assertEqual(row['status'],'awaiting_fine_search')
        self.assertFalse(row['fine_attempt_complete'])
        self.assertFalse(self.owner.state['summary']['is_global_maximum'])
        self.assertTrue(all(r['status']!='complete' for r in self.owner.state['centres'].values()))

    def test_full358_readiness_checks_all343_prepared_exports(self):
        # Census/dispatch boundary fixture; science replay itself is tested on
        # actual exact matrices above, not replaced by this synthetic inventory.
        first=self.manifest['entries'][0]
        entries=[dict(copy.deepcopy(first),i=i,search_status='pending') for i in range(343)]
        for i in range(343,358):
            e=dict(copy.deepcopy(first),i=i,search_status='historical_adopted')
            e.pop('export');entries.append(e)
        manifest=dict(self.manifest,entries=entries)
        paired.repair.atomic_json(self.manifest_path,manifest)
        bundle=copy.deepcopy(self.bundle)
        ref={'path':str(self.manifest_path.relative_to(self.root)),
             'sha256':paired.sweep.sha(self.manifest_path)}
        bundle['manifest']=ref;bundle['inputs']={'manifest':ref}
        ids=[paired.sweep.key_string(e) for e in entries]
        bundle['completed_keys']=ids[:109];bundle['pending']=[{'key':k} for k in ids[109:]]
        paired.repair.atomic_json(self.config.portable,bundle)
        runner=Mock(side_effect=AssertionError('Must not construct a runner'))
        def record(_root,_manifest,entry):
            return None if entry['i']==123 else {'exact_fixture':True}
        with patch.object(paired.sweep,'check_manifest'),patch.object(paired.sweep,'export_record',side_effect=record) as replay:
            with self.assertRaisesRegex(ValueError,'Raw prefetch is not complete'):
                paired.execute(self.config,lock_check=self.lock_check,checker=lambda *_:None,runner_factory=runner)
        self.assertEqual(replay.call_count,343);runner.assert_not_called()

    def test_cli_preserves_old_exit_and_closes_new_exit_under_lock(self):
        run=self.config.run_dir;run.mkdir(parents=True,exist_ok=True)
        (run/'actual-exit.txt').write_text('0\n')
        real_lock=paired.CommonLock;closed=[]
        def locked(root):
            lock=real_lock(root);close=lock.close
            def finish():
                self.assertEqual((run/'actual-exit.txt').read_text(),'75\n')
                self.assertTrue(list(run.glob('actual-exit-prior-*.receipt')))
                closed.append(True);close()
            lock.close=finish
            return lock
        supplement=self.root/'data/caps-m/plan/fixture-supplement.json';supplement.write_text('[]\n')
        args=['--portable-config',str(self.portable),'--agent-id','codex-15b7',
              '--progress',str(self.config.progress),'--run-dir',str(run),
              '--fine-supplement',str(supplement),'--repair-depth','0']
        with patch.object(paired,'ROOT',self.root),patch.object(paired.os,'getpid',return_value=987633), \
             patch.object(paired.os,'getpgrp',return_value=987633),patch.object(paired,'CommonLock',side_effect=locked), \
             patch.object(paired,'execute',return_value=75) as execute:
            self.assertEqual(paired.main(args),75)
            configured=execute.call_args.args[0]
            self.assertEqual(configured.fine_supplements,(supplement,))
            self.assertEqual(configured.repair_depth,0)
        self.assertEqual(closed,[True])
        self.assertEqual(next(run.glob('actual-exit-prior-*.receipt')).read_text(),'0\n')

    def test_preflight_rejects_subset_before_pair_child_or_progress(self):
        runner=Mock(side_effect=AssertionError('Must not construct a child runner'))
        with self.assertRaisesRegex(ValueError,'Full358'):
            paired.execute(self.config,lock_check=self.lock_check,checker=lambda *_:None,runner_factory=runner)
        runner.assert_not_called()


if __name__=='__main__':unittest.main()
