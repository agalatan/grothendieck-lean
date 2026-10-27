#!/usr/bin/env python3
"""Optional TWO-fine research prefetch, preserving the full358 Campaign.

Agent-ID: codex-15b7. Optional orchestration prepared by fine_pair_tooling.
NOT native verification, a certificate build, a cache operation or a math change.
Default is ONE prefetch export group, for an actual measured pilot. Do not use
--pair-export-limit0 (unlimited) until that pilot has been reviewed. Fine leaves
are actual-j1 and at most TWO; serial acceptance/repairs remain under12GiB.
The reviewed serial helper remains the fallback/default until this is reviewed.
"""
from __future__ import annotations

import argparse
from dataclasses import dataclass
import fcntl
import hashlib
import os
from pathlib import Path
import signal
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
import caps_centre_guarded as guarded

batch, campaign, fine = guarded.batch, guarded.campaign, guarded.fine
portable, repair, sweep = guarded.portable, guarded.repair, guarded.sweep
ROOT = Path(__file__).resolve().parents[1]
PURPOSE = 'Optional two-fine numerical prefetch only; inherited full358 acceptance; no native/cache claim'


@dataclass
class Config(guarded.Config):
    pair_rss_limit: int = 24 * batch.GIB
    pair_export_limit: int = 1

    def validate(self):
        super().validate()
        if not self.progress.name.startswith('guarded-campaign-'+self.agent_id+'-paired-'):
            raise ValueError('Use NEW guarded-campaign-<agent-id>-paired-* progress')
        if not self.run_dir.name.startswith(self.agent_id+'-guarded-paired-'):
            raise ValueError('Use NEW <agent-id>-guarded-paired-* run directory')
        if not 0 < self.rss_limit <= 12*batch.GIB or not self.rss_limit <= self.pair_rss_limit <= 24*batch.GIB:
            raise ValueError('Serial RSS must be at most12GiB and pair RSS at most24GiB')
        if type(self.pair_export_limit) is not int or self.pair_export_limit < 0:
            raise ValueError('Export limit is1 by default (pilot);0 is explicit reviewed continuation')
        self.pair_config().validate()

    def pair_config(self):
        return batch.Config(self.root, self.portable,
                            self.root/sweep.PLAN/('batch-'+self.agent_id+'-'+self.progress.stem+'-prefetch.json'),
                            self.run_dir/(self.agent_id+'-batch-pair-prefetch'), self.stop_file,
                            agent_id=self.agent_id, batch_size=2, initial_batch_size=2,
                            lake_threads=2, rss_limit=self.pair_rss_limit,
                            disk_floor=self.disk_floor, poll_seconds=self.poll_seconds)


class CommonLock:
    """Keep one exact common lock inode open throughout both execution paths."""
    def __init__(self, root):
        self.path = root/'handoff/caps-centre/campaign.lock'
        self.path.parent.mkdir(parents=True, exist_ok=True)
        self.stream = self.path.open('a+')
        try:
            self.check()
        except BaseException:
            self.stream.close()
            raise

    def check(self):
        if self.stream.closed or os.fstat(self.stream.fileno()).st_ino != self.path.stat().st_ino:
            raise ValueError('The common campaign lock was closed/replaced')
        fcntl.flock(self.stream, fcntl.LOCK_EX|fcntl.LOCK_NB)

    def close(self):
        self.stream.close()


class Passport:
    """Pin the NEW pair implementation/profile separately from the serial one."""
    def __init__(self, config, serial):
        self.c, self.serial = config, serial
        self.guard = config.pair_config()
        self.path = config.run_dir/'paired-execution-profile.json'
        self.expected = self.current()
        if self.path.exists():
            if guarded.read(self.path) != self.expected:
                raise ValueError('Pair source/profile changed; use NEW progress and run paths')
        else:
            if self.guard.progress.exists() or config.progress.exists():
                raise ValueError('Existing pair/Campaign progress has no pair passport; do not adopt it')
            repair.atomic_json(self.path, self.expected)

    def current(self):
        self.serial.check()
        return {'schema': 1, 'purpose': PURPOSE,
                'pair_implementation_sha256': sweep.sha(self.c.root/'tools/caps_centre_paired.py'),
                'serial_execution_profile_sha256': sweep.sha(self.serial.path),
                'serial_execution_profile': self.serial.expected,
                'execution': {'pair_progress': str(self.guard.progress), 'pair_run_dir': str(self.guard.run_dir),
                              'pair_rss_limit': self.c.pair_rss_limit, 'pair_export_limit': self.c.pair_export_limit,
                              'max_fine_leaves': 2, 'lake_threads': 2, 'lean_threads': 1,
                              'serial_rss_limit': self.c.rss_limit,
                              'stop_file': str(self.c.stop_file), 'disk_floor': self.c.disk_floor,
                              'poll_seconds': self.c.poll_seconds,
                              'common_lock': str(self.c.root/'handoff/caps-centre/campaign.lock')},
                'pair_lake_overlay': batch.overlay_pin(self.guard, create=True)}

    def check(self):
        if (not self.path.exists() or guarded.read(self.path) != self.expected or
                self.current() != self.expected):
            raise ValueError('Pair execution source/profile changed; preserve evidence and use NEW paths')


class SerialAdapter(guarded.Adapter):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.boundary = None

    def check(self):
        super().check()
        if self.boundary is not None:
            self.boundary()

    def run(self, *args, **kwargs):
        receipt = super().run(*args, **kwargs)
        # The old adapter rechecks its own passport after each child; also
        # recheck this NEW orchestration/profile, including for solver/repair
        # children which were deliberately routed through the serial budget.
        if self.boundary is not None:
            self.boundary()
        return receipt


class Registry:
    """Only exact portable fine leaves or normalized, already-guarded solvers."""
    def __init__(self, config, bundle, serial):
        self.c, self.bundle, self.serial = config, bundle, serial
        self.pending = {p['key']: p for p in bundle['pending']}

    def fine(self, key):
        item = self.pending[key]
        path, fm = self.serial.fine_manifest(key, path=item['fine_manifest'])
        entry = fm['entry']
        if entry['module'] != item['fine_module']:
            raise ValueError('Portable fine module binding changed')
        # This additionally rejects absolute-I/O templates, even if replayable.
        target = batch.module_target(self.c.root, entry)
        binding = self.serial.authorize(['lake', 'build', target, '--wfail'],
                                        'fine-export', key, fine_grid=True)
        return path, fm, binding

    def authorize(self, argv, phase, keys):
        argv, keys = list(map(str, argv)), list(keys)
        if not 1 <= len(keys) <= 2 or len(set(keys)) != len(keys) or any(k not in self.pending for k in keys):
            raise ValueError('Prefetch needs one or two distinct portable-pending keys')
        if phase == 'fine-export':
            bindings = [self.fine(k) for k in keys]
            expected = ['lake', 'build', *[fm['entry']['module'] for _, fm, _ in bindings], '--wfail']
            if argv != expected:
                raise ValueError('Only the exact one/two portable pure fine targets are permitted')
            return {'phase': phase, 'keys': keys, 'leaves': [b for _, _, b in bindings]}, None
        if len(keys) != 1 or phase not in ('raw-solve', 'fine-solve'):
            raise ValueError('No raw builds, generic processes or parallel solvers are permitted')
        key = keys[0]
        action = 'solve-stored' if phase == 'raw-solve' else 'solve-fine'
        prefix = [sys.executable, 'tools/caps_centre_campaign.py', '_worker', action,
                  '--manifest', self.bundle['manifest']['path']]
        tail = ['--key', key] if phase == 'raw-solve' else ['--fine-manifest', self.pending[key]['fine_manifest']]
        if argv != prefix+tail:
            raise ValueError('Unexpected portable solver command')
        if phase == 'fine-solve':
            path, _, _ = self.fine(key)
            tail = ['--fine-manifest', str(path)]
        normalized = [sys.executable, str(self.c.root/'tools/caps_centre_campaign.py'), '_worker', action,
                      '--manifest', str(self.serial.manifest_path), *tail]
        binding = self.serial.authorize(normalized, action, key, fine_grid=phase == 'fine-solve')
        return binding, (normalized, action, key, phase == 'fine-solve')

    def check_closed_sources(self, binding):
        """Check unchanged source/input bindings WITHOUT parsing child outputs.

        Batch.exports owns the following all-peer output inspection, including
        malformed/partial JSONL after a resource pause. Parsing exports here
        would skip its genuine receipt append and pause/peer classification.
        """
        for key, before in zip(binding['keys'], binding['leaves']):
            item = self.pending[key]
            path = self.serial.path(item['fine_manifest'])
            fm = guarded.read(path);entry = fm['entry']
            self.serial.fine_layout(entry)
            target = batch.module_target(self.c.root, entry)
            if (str(path) != before['manifest'] or sweep.sha(path) != before['manifest_sha256'] or
                    sweep.key_string(entry) != key or entry['module'] != item['fine_module'] or
                    entry['grid_spec'] != before['grid_spec'] or
                    entry['grid_spec'] != self.serial.wanted_spec(self.serial.entries[key]) or
                    entry['module_source_sha256'] != before['module_sha256'] or
                    sweep.sha(self.serial.path(entry['module_file'])) != before['module_sha256'] or
                    ['lake','build',target,'--wfail'] != before['argv']):
                raise ValueError('Pair source/grid/manifest binding changed while child ran')
            # Exact source bytes were template checked before spawning and are
            # SHA-identical now. Passport.check additionally pins the entire
            # immutable portable manifest/module/sidecar/source inventory.

    def completed_discovery(self, key):
        # Mirror inherited Campaign.finer's completed-first discovery order.
        # Do not make the portable tag take precedence over completed aliases.
        self.serial.validate_discovery(key)
        plan = self.c.root/sweep.PLAN
        candidates = sorted([*plan.glob('fine-*.json'), *(plan/'fine-campaign').glob('*.json')])
        found, aliases = [], {}
        wanted = self.serial.wanted_spec(self.serial.entries[key])
        for path in candidates:
            fm = guarded.read(path)
            if sweep.key_string(fm['entry']) == key and fm['entry'].get('grid_spec') == wanted:
                exported = fine.validate(self.c.root, fm)
                aliases.setdefault(fm['entry']['module'], set()).add(guarded.digest(fm))
                found.append((exported is None, str(path), exported))
        if any(len(values) != 1 for values in aliases.values()):
            raise ValueError('Conflicting aliases for the same finer module')
        # Different tags are distinct preparations, not conflicting aliases of
        # the SAME module. Campaign legitimately prefers a completed old tag.
        if not found:
            raise ValueError('Portable pending centre lacks its prepared matching fine manifest')
        found.sort(key=lambda row: (row[0], row[1]))
        return found[0][2] is not None


class PairRunner:
    """Exactly one live child across the pair runner and serial adapter."""
    def __init__(self, config, update, owner_update, serial, passport, registry, lock_check,
                 *, runner_factory=batch.Runner):
        self.c, self.update, self.owner_update = config, update, owner_update
        self.serial, self.passport, self.registry, self.lock_check = serial, passport, registry, lock_check
        self.sequence = 0
        self.runner = runner_factory(passport.guard, self.child_update)
        serial.boundary = self.boundary

    def child_update(self, **changes):
        self.update(**changes)
        self.owner_update(**changes)  # Real liveness/receipts only; never acceptance.

    def boundary(self):
        self.lock_check()
        self.passport.check()
        if self.runner.child is not None:
            raise RuntimeError('Pair child still lives; serial execution cannot overlap it')

    def check(self):
        self.serial.check()
        if self.serial.runner.child is not None:
            raise RuntimeError('Serial child still lives; pair execution cannot overlap it')

    def run(self, argv, phase, keys):
        self.check()
        binding, serial_call = self.registry.authorize(argv, phase, keys)
        if serial_call is not None:
            normalized, action, key, fine_grid = serial_call
            path = self.serial.run(normalized, action, key, fine_grid=fine_grid)
            return guarded.read(path)  # The actual unchanged persisted serial receipt.
        self.sequence += 1
        auth = self.c.run_dir/f'pair-authorization-{os.getpid()}-{self.sequence:05d}.json'
        if auth.exists():
            raise ValueError('Preserve prior pair authorization; do not overwrite it')
        event = {'purpose': PURPOSE, 'state': 'authorized', 'binding': binding,
                 'execution_profile_sha256': sweep.sha(self.passport.path)}
        repair.atomic_json(auth, event)
        try:
            record = self.runner.run(argv, phase, list(keys))
        except batch.Pause as exc:
            repair.atomic_json(auth, dict(event, state='paused_before_spawn', reason=str(exc)))
            raise
        receipt = guarded.inside(self.c.root, Path(record['log']).with_suffix('.json'))
        if not receipt.exists() or guarded.read(receipt) != record:
            raise RuntimeError('Pair child lacks its real persisted receipt')
        repair.atomic_json(auth, dict(event, state='executed', receipt=str(receipt),
                                      receipt_sha256=sweep.sha(receipt), actual_exit=record.get('actual_exit')))
        self.boundary()
        self.registry.check_closed_sources(binding)
        # Batch.exports MUST inspect every peer even when the real child failed.
        # Its unchanged failure/pause path raises before inherited acceptance.
        return record


class Prefetch:
    def __init__(self, config, owner, serial_passport, registry, lock_check,
                 *, checker=portable.check, runner_factory=batch.Runner, batch_factory=batch.Batch):
        self.c, self.owner = config, owner
        self.passport = Passport(config, serial_passport)
        self.registry = Registry(config, registry.bundle, registry)
        self.batch = batch_factory(config.pair_config(), checker=checker,
            runner_factory=lambda c, update: PairRunner(config, update, owner.update, owner.runner,
                self.passport, self.registry, lock_check, runner_factory=runner_factory))
        if set(self.batch.selected_keys) != set(self.registry.pending) or self.batch.c.pilot_limit is not None:
            raise ValueError('Pair Batch must retain the full portable-pending inventory')
        self.prepared = set()

    def check(self):
        self.owner.check_pause()
        self.batch.check_pause()
        self.batch.runner.check()

    def pause_signal(self, signum, frame):
        self.batch.pause_signal(signum, frame)

    def window(self, entry):
        key = sweep.key_string(entry)
        if key not in self.registry.pending or key in self.prepared:
            return
        ordered = sorted(self.owner.entries, key=lambda k: (self.owner.entries[k]['search_status'] != 'historical_adopted',
            self.owner.entries[k]['grid'], self.owner.entries[k]['k'], self.owner.entries[k]['i'], self.owner.entries[k]['j']))
        index = ordered.index(key)
        keys = [k for k in ordered[index:] if k in self.registry.pending and k not in self.prepared][:2]
        try:
            self.check()
            inspected = self.batch.inspect(keys, 'raw')
            if any(x != 'valid' for x in inspected.values()):
                raise ValueError('All window raw exports must already strictly validate')
            self.batch.solve(keys, 'raw')
            positive = []
            for k in keys:
                # Unknown/missing state can NEVER become a zero via default0.
                row = self.batch.state['centres'][k]
                if 'raw_cap_up' not in row or row.get('raw_status') not in sweep.SUCCESS:
                    raise ValueError('Unknown raw solve blocks optional prefetch; preserve evidence')
                _, result = campaign.stored_solution(self.c.root, self.owner.manifest, self.owner.entries[k])
                if campaign.F(result['cap_up']) != campaign.F(row['raw_cap_up']):
                    raise ValueError('Batch raw summary disagrees with independently replayed result')
                if campaign.F(result['cap_up']) > 0 and not self.registry.completed_discovery(k):
                    positive.append(k)
            if positive:
                used = sum(g.get('phase') == 'fine-export' and g.get('state') == 'complete' and g.get('actual_exit') == 0
                           for g in self.batch.state['groups'])
                if self.c.pair_export_limit and used >= self.c.pair_export_limit:
                    raise campaign.ResourcePaused('Measured-pilot export limit reached; review receipts before a NEW continuation profile')
                self.check()
                self.batch.exports(positive, 'fine')
                self.check()
                self.batch.solve(positive, 'fine')
            self.prepared.update(keys)  # Scheduling only, not scientific completion.
        except batch.Pause as exc:
            raise campaign.ResourcePaused(str(exc)) from exc


class PairedCampaign(guarded.GuardedCampaign):
    def pause_signal(self, signum, frame):
        super().pause_signal(signum, frame)
        if getattr(self, 'prefetch', None) is not None:
            self.prefetch.pause_signal(signum, frame)

    def process(self, entry):
        self.prefetch.window(entry)
        return super().process(entry)


def execute(config, *, lock_check, checker=portable.check, runner_factory=batch.Runner,
            snapshot=guarded.git_snapshot, batch_factory=batch.Batch):
    lock_check()
    bundle, manifest_path, manifest = guarded.preflight(config, checker=checker)
    batch.previous_jobs(config.root, guarded.read(config.progress) if config.progress.exists() else {})
    for c in (config.guard_config(), config.pair_config()):
        observation = batch.Guard(c).observe()
        if observation['pause_reason']:
            raise campaign.ResourcePaused(observation['pause_reason'])
    serial_passport = guarded.Passport(config, bundle, manifest_path, snapshot=snapshot)
    registry = guarded.Registry(config, bundle, manifest_path, manifest)
    registry.validate_discovery()
    owner = PairedCampaign(config.campaign_config(manifest_path), runner_factory=lambda c, update:
        SerialAdapter(c, update, serial_passport, registry, runner_factory=runner_factory))
    if set(owner.state['centres']) != {sweep.key_string(e) for e in manifest['entries']}:
        raise ValueError('Campaign must retain the complete358 inventory')
    owner.prefetch = Prefetch(config, owner, serial_passport, registry, lock_check, checker=checker,
                             runner_factory=runner_factory, batch_factory=batch_factory)
    start = config.run_dir/f'controller-start-{os.getpid()}.json'
    if start.exists():
        raise ValueError('Prior controller receipt exists; inspect before restart')
    repair.atomic_json(start, {'agent_id': config.agent_id, 'pid': os.getpid(), 'pgid': os.getpgrp(),
        'started_at_utc': campaign.now(), 'purpose': PURPOSE,
        'serial_profile_sha256': sweep.sha(serial_passport.path),
        'pair_profile_sha256': sweep.sha(owner.prefetch.passport.path)})
    (config.run_dir/'controller.pid').write_text(str(os.getpid())+'\n')
    owner.update(execution_profile={'serial': str(serial_passport.path),
                                    'pair': str(owner.prefetch.passport.path)}, injected_execution_purpose=PURPOSE)
    return owner.run()


def main(argv=None):
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument('--portable-config', type=Path, required=True)
    p.add_argument('--agent-id', required=True)
    p.add_argument('--progress', type=Path, required=True)
    p.add_argument('--run-dir', type=Path, required=True)
    p.add_argument('--stop-file', type=Path)
    p.add_argument('--pair-rss-limit-gib', type=int, default=24)
    p.add_argument('--serial-rss-limit-gib', type=int, default=12)
    p.add_argument('--pair-export-limit', type=int, default=1,
                   help='Default1: measured pilot;0 only after reviewed actual fine-pair evidence, NEW paths required')
    p.add_argument('--poll-seconds', type=float, default=2)
    p.add_argument('--fine-tag', default='Codex15b7PortableFine')
    p.add_argument('--fine-nq', type=int, default=1152)
    p.add_argument('--medium-np', type=int, default=3200)
    p.add_argument('--repair-depth', type=int, choices=(0,1), default=1)
    p.add_argument('--fine-supplement', type=Path, action='append', default=[])
    p.add_argument('--pause-on-fine-failure', action='store_true')
    a = p.parse_args(argv)
    if not __debug__ or os.getpid() != os.getpgrp():
        p.error('Use normal Python in an owned controller process group/session')
    resolve = lambda x: x if x.is_absolute() else ROOT/x
    run = resolve(a.run_dir)
    c = Config(ROOT, resolve(a.portable_config), resolve(a.progress), run,
               resolve(a.stop_file) if a.stop_file else run/'STOP_REQUESTED', agent_id=a.agent_id,
               rss_limit=a.serial_rss_limit_gib*batch.GIB, pair_rss_limit=a.pair_rss_limit_gib*batch.GIB,
               pair_export_limit=a.pair_export_limit, poll_seconds=a.poll_seconds,
               fine_tag=a.fine_tag, fine_nq=a.fine_nq, medium_np=a.medium_np,
               repair_depth=a.repair_depth,
               fine_supplements=tuple(resolve(path) for path in a.fine_supplement),
               continue_inconclusive=not a.pause_on_fine_failure)
    c.validate()
    try:
        lock = CommonLock(ROOT)
    except BlockingIOError:
        p.exit(1, 'Another controller owns campaign.lock; no job started.\n')
    try:
        run.mkdir(parents=True, exist_ok=True)
        exit_path = run/'actual-exit.txt'
        if exit_path.exists():
            old = exit_path.read_bytes()
            prior = run/('actual-exit-prior-'+hashlib.sha256(old).hexdigest()[:16]+'.receipt')
            if prior.exists() and prior.read_bytes() != old:
                raise ValueError('Prior exit receipt differs; preserve it before resuming')
            if not prior.exists(): prior.write_bytes(old)
        try:
            code = execute(c, lock_check=lock.check)
        except campaign.Paused as exc:
            code = campaign.PAUSED_EXIT
            repair.atomic_json(run/'startup-paused.json', {'state':'paused', 'actual_exit':code, 'reason':str(exc)})
        except BaseException as exc:
            code = 1
            repair.atomic_json(run/'startup-failure.json', {'state':'failed', 'actual_exit':code,
                                                          'error':f'{type(exc).__name__}: {exc}'})
        # Exit evidence closes BEFORE the common lock is released.
        exit_path.write_text(str(code)+'\n')
        return code
    finally:
        lock.close()


if __name__ == '__main__':
    sys.exit(main())
