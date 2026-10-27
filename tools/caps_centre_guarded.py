#!/usr/bin/env python3
"""Guarded, serial, incremental #87 research after ALL raw exports exist.

Agent-ID: codex-15b7 (execution tooling prepared by codex-7d19).
This does not verify native facts, build certificates, publish caches, change
mathematics, or alter the scientific Campaign. Run in an owned process group.
Only Campaign.process marks centres complete, after its unchanged exact replay.
Fine exports are serial, not paired. Existing pinned scientific tools stay intact.
"""
from __future__ import annotations

import argparse
from dataclasses import dataclass
import fcntl
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
import caps_centre_batch as batch
import caps_centre_campaign as campaign
import caps_centre_fine as fine
import caps_centre_portable as portable
import caps_centre_repair as repair
import caps_centre_restore as restore
import caps_centre_sweep as sweep

ROOT = Path(__file__).resolve().parents[1]
TOTAL, PREPARED, HISTORICAL = 358, 343, 15
PURPOSE = 'Exact numerical research only; no native verification, minimality or cache claim'
SOURCE_NAMES = ('caps_centre_guarded.py', 'caps_centre_batch.py', 'caps_centre_campaign.py',
                'caps_centre_portable.py', 'caps_centre_checkpoint.py', 'caps_centre_restore.py',
                'caps_centre_sweep.py', 'caps_centre_fine.py', 'caps_centre_repair.py',
                'caps_plan.py', 'caps_lmi.py')


def read(path):
    return json.loads(Path(path).read_text())


def digest(value):
    return hashlib.sha256(sweep.canonical(value)).hexdigest()


def inside(root, path):
    return portable.safe(root, portable.argument_name(root, path))


def git_snapshot(root):
    """Tracked diff plus explicit new-helper SHA: git diff omits untracked code."""
    return {'head': subprocess.check_output(['git', '-C', str(root), 'rev-parse', 'HEAD'], text=True).strip(),
            'tracked_diff': subprocess.check_output(['git', '-C', str(root), 'diff', '--binary', 'HEAD', '--'], text=True)}


@dataclass
class Config:
    root: Path
    portable: Path
    progress: Path
    run_dir: Path
    stop_file: Path
    agent_id: str = 'codex-15b7'
    rss_limit: int = 12 * batch.GIB
    disk_floor: int = 3 * batch.GIB
    poll_seconds: float = 2.0
    fine_tag: str = 'Codex15b7PortableFine'
    fine_nq: int = 1152
    medium_np: int = 3200
    repair_depth: int = 1
    fine_supplements: tuple[Path, ...] = ()
    continue_inconclusive: bool = True

    def validate(self):
        if self.root != self.root.resolve():
            raise ValueError('Use the canonical absolute research root')
        if not re.fullmatch(r'(codex|claude)-[0-9a-f]{4}', self.agent_id):
            raise ValueError('An identifiable agent ID is required')
        for path in (self.portable, self.progress, self.run_dir, self.stop_file, *self.fine_supplements):
            inside(self.root, path)
        if (self.progress.parent != self.root / sweep.PLAN or
                not self.progress.name.startswith('guarded-campaign-'+self.agent_id+'-') or
                self.progress.suffix != '.json'):
            raise ValueError('Use a new data/caps-m/plan/guarded-campaign-<agent-id>-*.json progress path')
        relative = self.run_dir.relative_to(self.root)
        if relative.parts[:2] != ('handoff', 'caps-centre') or not relative.name.startswith(self.agent_id+'-guarded-'):
            raise ValueError('Use an owned handoff/caps-centre/<agent-id>-guarded-* directory')
        if self.disk_floor < 3 * batch.GIB:
            raise ValueError('Keep at least3GiB of disk free')
        self.campaign_config(self.root / sweep.PLAN / 'unused-manifest.json').validate()
        self.guard_config().validate()

    def campaign_config(self, manifest):
        return campaign.Config(self.root, manifest, self.progress, self.run_dir, self.stop_file,
                               agent_id=self.agent_id, fine_tag=self.fine_tag, fine_nq=self.fine_nq,
                               medium_np=self.medium_np, repair_depth=self.repair_depth,
                               rss_limit=self.rss_limit, poll_seconds=self.poll_seconds,
                               fine_supplements=self.fine_supplements,
                               continue_inconclusive=self.continue_inconclusive)

    def guard_config(self):
        # The tested Runner, not Batch.run, owns children. Its directory/profile
        # remain distinct from mathematical Campaign progress and old journals.
        return batch.Config(self.root, self.portable,
                            self.root / sweep.PLAN / ('batch-'+self.agent_id+'-'+self.progress.stem+'.json'),
                            self.run_dir / (self.agent_id+'-batch-children'), self.stop_file,
                            agent_id=self.agent_id, batch_size=1, initial_batch_size=1,
                            lake_threads=1, rss_limit=self.rss_limit, disk_floor=self.disk_floor,
                            poll_seconds=self.poll_seconds)


def full_inventory(manifest):
    entries = manifest.get('entries', [])
    keys = [sweep.key_string(e) for e in entries]
    prepared = [e for e in entries if 'export' in e]
    historical = [e for e in entries if e.get('search_status') == 'historical_adopted']
    if (len(entries) != TOTAL or len(set(keys)) != TOTAL or len(prepared) != PREPARED or
            len(historical) != HISTORICAL or any('export' in e for e in historical)):
        raise ValueError('Full358 inventory is required:343 prepared exports plus15 historical entries; no subsets')
    return prepared


def preflight(config, *, checker=portable.check):
    """Read-only and fail closed before Campaign/profile/child state is touched."""
    config.validate()
    checker(config.root, config.portable)
    bundle = read(config.portable)
    if bundle.get('format') != portable.FORMAT:
        raise ValueError('Expected the immutable full portable research configuration')
    batch.pins(config.root, bundle)
    manifest_path = inside(config.root, bundle['manifest']['path'])
    manifest = read(manifest_path)
    sweep.check_manifest(config.root, manifest)
    prepared = full_inventory(manifest)
    if set(bundle.get('completed_keys', [])) | {p['key'] for p in bundle.get('pending', [])} != {
            sweep.key_string(e) for e in manifest['entries']}:
        raise ValueError('Portable complete/pending partition omits part of the full358 inventory')
    missing = [sweep.key_string(e) for e in prepared if sweep.export_record(config.root, manifest, e) is None]
    if missing:
        raise ValueError('Raw prefetch is not complete; missing prepared exports: '+','.join(missing))
    # portable.check validates preserved and prepared finer evidence as well;
    # its unchanged science/provenance checks are not replaced by this census.
    return bundle, manifest_path, manifest


class Passport:
    """The injected runner is separately pinned; Campaign's fingerprint omits it."""
    def __init__(self, config, bundle, manifest_path, *, snapshot=git_snapshot):
        self.c, self.bundle, self.manifest_path, self.snapshot = config, bundle, manifest_path, snapshot
        self.guard = config.guard_config()
        self.path = config.run_dir / 'execution-profile.json'
        self.expected = self.current()
        if self.path.exists():
            if read(self.path) != self.expected:
                raise ValueError('Execution profile/source changed; use NEW progress and run paths')
        else:
            if config.progress.exists():
                raise ValueError('Existing Campaign progress has no injected-runner passport; do not adopt it')
            repair.atomic_json(self.path, self.expected)

    def current(self):
        batch.pins(self.c.root, self.bundle)
        return {'schema': 1, 'purpose': PURPOSE, 'agent_id': self.c.agent_id,
                'portable': {'path': self.c.portable.relative_to(self.c.root).as_posix(),
                             'sha256': sweep.sha(self.c.portable)},
                'manifest': {'path': self.manifest_path.relative_to(self.c.root).as_posix(),
                             'sha256': sweep.sha(self.manifest_path)},
                'sources': {'tools/'+name: sweep.sha(portable.safe(self.c.root, 'tools/'+name))
                            for name in SOURCE_NAMES},
                'source_state': self.snapshot(self.c.root),
                'python': {'executable': str(Path(sys.executable).resolve()), 'version': sys.version},
                'execution': {'root': str(self.c.root), 'progress': str(self.c.progress),
                              'run_dir': str(self.c.run_dir), 'stop_file': str(self.c.stop_file),
                              'serial_children': 1, 'lake_threads': 1, 'lean_threads': 1,
                              'rss_limit': self.c.rss_limit, 'disk_floor': self.c.disk_floor,
                              'poll_seconds': self.c.poll_seconds,
                              'fine_tag': self.c.fine_tag, 'fine_nq': self.c.fine_nq,
                              'medium_np': self.c.medium_np, 'repair_depth': self.c.repair_depth,
                              'continue_inconclusive': self.c.continue_inconclusive,
                              'fine_supplements': {str(p): sweep.sha(p) for p in self.c.fine_supplements}},
                'lake_overlay': batch.overlay_pin(self.guard, create=True)}

    def check(self):
        if not self.path.exists() or read(self.path) != self.expected or self.current() != self.expected:
            raise ValueError('Execution profile/source changed during campaign; preserve evidence and use NEW paths')


class Registry:
    """Only the exact child forms constructed by pinned Campaign are eligible."""
    def __init__(self, config, bundle, manifest_path, manifest):
        self.c, self.bundle, self.manifest_path, self.manifest = config, bundle, manifest_path, manifest
        self.entries = {sweep.key_string(e): e for e in manifest['entries']}
        self.legacy = set(manifest.get('portable', {}).get('legacy_modules_never_build', []))

    def path(self, value):
        return inside(self.c.root, value)

    def wanted_spec(self, entry):
        return ([self.c.medium_np, 256, str(campaign.F(8, self.c.medium_np))] if entry['nq'] == 256
                else [1600, max(self.c.fine_nq, entry['nq']), '1/200'])

    def fine_layout(self, e):
        for field in ('module_file', 'export', 'export_provenance', 'solved'):
            portable.safe(self.c.root, e[field])
        module = e.get('module', '')
        name = module.split('.')[-1]
        if not re.fullmatch(r'Run_centreFine_[A-Za-z0-9_]+', name):
            raise ValueError('Not a canonical finer research module')
        suffix = name[len('Run_centreFine_'):]
        restore.check_layout(self.c.root, e, name,
                             sweep.PLAN/'exports/fine'/('exp_centreFine_'+suffix+'.jsonl'),
                             sweep.PLAN/'solved/fine'/('sol_centreFine_'+suffix+'.json'))

    def validate_discovery(self, ident=None):
        """Also protect synchronous replay, which may need no child at all."""
        paths = sorted((self.c.root/sweep.PLAN).glob('fine-*.json'))
        paths += sorted((self.c.root/sweep.PLAN/'fine-campaign').glob('*.json'))
        for path in paths:
            path = self.path(path)
            fm = read(path);e = fm['entry'];key = sweep.key_string(e)
            if key not in self.entries or (ident is not None and key != ident):
                continue
            if e.get('grid_spec') != self.wanted_spec(self.entries[key]):
                continue  # Preserve unrelated research grids without adopting them.
            self.fine_layout(e)
            fine.validate(self.c.root, fm)

    def fine_manifest(self, ident, *, path=None, module=None, export=None):
        candidates = ([self.path(path)] if path is not None else
                      sorted((self.c.root/sweep.PLAN).glob('fine-*.json'))+
                      sorted((self.c.root/sweep.PLAN/'fine-campaign').glob('*.json')))
        matches = []
        entry = self.entries[ident]
        wanted = self.wanted_spec(entry)
        for p in candidates:
            p = self.path(p)
            plan = self.c.root/sweep.PLAN
            if not (p.suffix == '.json' and
                    ((p.parent == plan and p.name.startswith('fine-')) or p.parent == plan/'fine-campaign')):
                raise ValueError('Fine manifest is outside the Campaign discovery registry')
            fm = read(p)
            e = fm.get('entry', {})
            if (sweep.key_string(e) != ident or e.get('grid_spec') != wanted or
                    (module is not None and e.get('module') != module) or
                    (export is not None and self.path(e['export']) != self.path(export))):
                continue
            # These are stored manifest fields, not CLI path arguments: require
            # canonical relative paths before a solver can write anything.
            self.fine_layout(e)
            fine.validate(self.c.root, fm)
            matches.append((p, fm))
        if not matches:
            raise ValueError('No source/grid-bound finer manifest for this exact child')
        # Duplicated identical registry aliases are harmless, conflicting ones
        # are not. Campaign's selected path is explicit for solve-fine.
        if len({digest(fm) for _, fm in matches}) != 1:
            raise ValueError('Ambiguous finer manifest registry')
        matches.sort(key=lambda pair: (not self.path(pair[1]['entry']['export']).exists(), str(pair[0])))
        return matches[0]

    def authorize(self, argv, phase, ident, *, fine_grid=False):
        argv = list(map(str, argv))
        if ident not in self.entries:
            raise ValueError('Child centre is outside the full inventory')
        entry = self.entries[ident]
        binding = {'phase': phase, 'key': ident, 'argv': argv, 'fine_grid': fine_grid}
        if phase == 'stored-export':
            raise ValueError('All raw exports must already exist; legacy/raw rebuilding is forbidden')
        if phase == 'fine-export':
            if len(argv) != 4 or argv[:2] != ['lake', 'build'] or argv[3] != '--wfail' or not fine_grid:
                raise ValueError('Only one registered pure finer-export leaf is permitted')
            module = argv[2]
            if module in self.legacy:
                raise ValueError('Legacy absolute-I/O modules are validation-only, never build targets')
            path, fm = self.fine_manifest(ident, module=module)
            e = fm['entry']; name = module.split('.')[-1]
            if (not re.fullmatch(r'Run_centreFine_[A-Za-z0-9_]+', name) or
                    module != 'Grothe.LowerAnalytic.CapPlanRuns.'+name or
                    e['module_file'] != 'Grothe/LowerAnalytic/CapPlanRuns/'+name+'.lean'):
                raise ValueError('Not a registered fine research module')
            node, _ = fine.selected(self.c.root, f"{e['k']}:{e['i']}")
            source_path = self.path(e['module_file']); payload = source_path.read_bytes()
            allowed = [portable.source(node, e, name, grid_spec=e['grid_spec'], target=target)
                       for target in (e['export'], str(self.path(e['export'])))]
            if payload not in allowed or sweep.sha(source_path) != e['module_source_sha256']:
                raise ValueError('Finer source differs from the exact pure exporter template')
            binding.update(manifest=str(path), manifest_sha256=sweep.sha(path),
                           module_sha256=e['module_source_sha256'], grid_spec=e['grid_spec'])
        elif phase in ('solve-stored', 'solve-fine'):
            prefix = [sys.executable, str(self.c.root/'tools/caps_centre_campaign.py'), '_worker', phase,
                      '--manifest', str(self.manifest_path)]
            if phase == 'solve-stored':
                expected = prefix+['--key', ident]
                if argv != expected or fine_grid or entry.get('search_status') == 'historical_adopted':
                    raise ValueError('Unexpected stored-solver argv/key/grid')
                if sweep.export_record(self.c.root, self.manifest, entry) is None:
                    raise ValueError('Stored solve lacks a complete raw export')
                binding.update(export=entry['export'], export_sha256=sweep.sha(self.path(entry['export'])))
            else:
                if len(argv) != len(prefix)+2 or argv[:len(prefix)] != prefix or argv[-2] != '--fine-manifest' or not fine_grid:
                    raise ValueError('Unexpected fine-solver argv')
                path, fm = self.fine_manifest(ident, path=argv[-1])
                if fine.validate(self.c.root, fm) is None:
                    raise ValueError('Fine solve lacks its complete export')
                binding.update(manifest=str(path), manifest_sha256=sweep.sha(path),
                               export_sha256=sweep.sha(self.path(fm['entry']['export'])))
        elif phase in ('stored-repair', 'fine-repair'):
            if (len(argv) != 12 or argv[:2] != [sys.executable, 'tools/caps_centre_repair.py'] or
                    argv[4:6] != ['--agent-id', self.c.agent_id] or argv[6] != '--output-dir' or
                    argv[8:12] != ['--max-depth', str(self.c.repair_depth), '--piece', ident]):
                raise ValueError('Unexpected interval-repair argv')
            export_path, solved_path, folder = map(self.path, (argv[2], argv[3], argv[7]))
            if phase == 'stored-repair':
                if entry.get('search_status') == 'historical_adopted':
                    baseline = campaign.historical_result(self.c.root, self.manifest, entry)
                    exported, expected_export = campaign.find_historical_export(self.c.root, self.manifest, entry, baseline)
                    expected_solved = entry['historical']['file']
                else:
                    exported, baseline = campaign.stored_solution(self.c.root, self.manifest, entry)
                    expected_export, expected_solved = entry['export'], entry['solved']
                if expected_export is None or export_path != self.path(expected_export) or solved_path != self.path(expected_solved) or fine_grid:
                    raise ValueError('Stored repair inputs differ from strict stored/historical replay')
            else:
                _, fm = self.fine_manifest(ident, export=export_path)
                exported = fine.validate(self.c.root, fm)
                if exported is None or solved_path not in {self.path(fm['entry']['solved']), *self.c.fine_supplements} or not fine_grid:
                    raise ValueError('Fine repair inputs are not independently bound')
                if not self.path(fm['entry']['solved']).is_file():
                    raise ValueError('Fine repair primary result is missing; do not optimize in the controller')
                primary = fine.solve(self.c.root, fm)
                rows = [x for x in read(solved_path) if sweep.key_string(x) == ident and x.get('grid') == 3 and
                        x.get('grid_spec') == fm['entry']['grid_spec'] and x.get('provenance') == primary['provenance']]
                if len(rows) != 1:
                    raise ValueError('Fine repair needs one exact bound baseline')
                baseline = rows[0]; campaign.checked_result(exported, baseline)
            if campaign.F(baseline['cap_up']) <= 0 or not folder.is_relative_to(self.c.root/sweep.PLAN/'repairs'):
                raise ValueError('Only a positive exact baseline and owned repair folder are eligible')
            fp = campaign.repair_fingerprint(export_path, solved_path, self.c.repair_depth)
            expected_folder = self.c.root/sweep.PLAN/'repairs/campaign'/digest(fp)[:16]
            checkpoint = folder/f"repair_centre_{entry['k']}x{entry['i']}_j{entry['j']}_g{exported['grid']}.json"
            if folder != expected_folder and not checkpoint.exists():
                raise ValueError('Unregistered repair output folder')
            if checkpoint.exists():
                prior = read(checkpoint)
                if prior.get('fingerprint') != fp or prior.get('piece') != [exported[k] for k in ('k', 'i', 'j', 'grid')] or prior.get('state') not in ('in_progress', 'complete'):
                    raise ValueError('Repair resume folder is not bound to this exact baseline')
            binding.update(export=str(export_path), export_sha256=sweep.sha(export_path),
                           solved=str(solved_path), solved_sha256=sweep.sha(solved_path),
                           output_dir=str(folder), fingerprint=fp)
        else:
            raise ValueError('Unknown child phase; no generic build/process permission')
        return binding


class Adapter:
    def __init__(self, config, update, passport, registry, *, runner_factory=batch.Runner):
        self.c, self.update, self.passport, self.registry = config, update, passport, registry
        self.runner = runner_factory(passport.guard, update)
        self.sequence = 0
        self.stop_requested = None

    def request_stop(self, reason):
        self.stop_requested = reason

    def check(self):
        if self.stop_requested or self.c.stop_file.exists():
            raise campaign.Paused(self.stop_requested or 'Graceful stop requested before the next owned child')
        self.passport.check()

    def run(self, argv, phase, ident, *, fine_grid=False):
        self.check()
        binding = self.registry.authorize(argv, phase, ident, fine_grid=fine_grid)
        self.sequence += 1
        auth = self.c.run_dir/f'authorization-{os.getpid()}-{self.sequence:05d}.json'
        if auth.exists():
            raise ValueError('Prior authorization receipt exists; preserve it rather than overwrite it')
        event = {'purpose': PURPOSE, 'agent_id': self.c.agent_id, 'state': 'authorized',
                 'binding': binding, 'execution_profile_sha256': sweep.sha(self.passport.path)}
        repair.atomic_json(auth, event)
        try:
            record = self.runner.run(argv, phase, [ident])
        except batch.Pause as exc:
            repair.atomic_json(auth, dict(event, state='paused_before_spawn', reason=str(exc)))
            raise campaign.ResourcePaused(str(exc)) from exc
        receipt = inside(self.c.root, Path(record['log']).with_suffix('.json'))
        if not receipt.exists() or read(receipt) != record:
            raise RuntimeError('Guarded child lacks its real persisted execution receipt')
        repair.atomic_json(auth, dict(event, state='executed', receipt=str(receipt),
                                      receipt_sha256=sweep.sha(receipt), actual_exit=record.get('actual_exit')))
        if record.get('pause_reason'):
            raise campaign.ResourcePaused(str(record['pause_reason']))
        if record.get('actual_exit') != 0 or record.get('error') or record.get('state') != 'complete':
            raise RuntimeError(f'Owned research child failed; preserve actual receipt {receipt}')
        self.passport.check()
        if self.registry.authorize(argv, phase, ident, fine_grid=fine_grid) != binding:
            raise ValueError('Authorized child inputs/source changed while it ran')
        return receipt


class GuardedCampaign(campaign.Campaign):
    """Science remains inherited; only execution boundary checks are added."""
    def check_pause(self):
        super().check_pause()
        self.runner.check()
        observation = self.runner.runner.guard.observe()
        if observation['pause_reason']:
            raise campaign.ResourcePaused(observation['pause_reason'])

    def pause_signal(self, signum, frame):
        super().pause_signal(signum, frame)
        # Finish the already-owned child, then stop before another solve,
        # repair or fine export within the same centre can be launched.
        self.runner.request_stop(self.stop_reason)

    def finer(self, entry):
        # Existing exports and solutions can take an entirely in-process replay
        # path. Validate its destinations before the inherited code can call
        # fine.solve/preserve_json, not only when authorizing child commands.
        self.runner.registry.validate_discovery(sweep.key_string(entry))
        return super().finer(entry)


def execute(config, *, checker=portable.check, runner_factory=batch.Runner, snapshot=git_snapshot):
    """Caller holds the common lock. No process is spawned by a failed preflight."""
    bundle, manifest_path, manifest = preflight(config, checker=checker)
    prior = read(config.progress) if config.progress.exists() else {}
    batch.previous_jobs(config.root, prior)
    observation = batch.Guard(config.guard_config()).observe()
    if observation['pause_reason']:
        raise campaign.ResourcePaused(observation['pause_reason'])
    passport = Passport(config, bundle, manifest_path, snapshot=snapshot)
    registry = Registry(config, bundle, manifest_path, manifest)
    registry.validate_discovery()
    owner = GuardedCampaign(config.campaign_config(manifest_path),
                            runner_factory=lambda c, update: Adapter(c, update, passport, registry,
                                                                    runner_factory=runner_factory))
    if set(owner.state['centres']) != {sweep.key_string(e) for e in manifest['entries']}:
        raise ValueError('Campaign progress does not retain the full358 inventory')
    start = config.run_dir/f'controller-start-{os.getpid()}.json'
    if start.exists():
        raise ValueError('Prior controller-start receipt exists; preserve it and use a new process')
    repair.atomic_json(start, {'agent_id': config.agent_id, 'pid': os.getpid(), 'pgid': os.getpgrp(),
                              'started_at_utc': campaign.now(), 'purpose': PURPOSE,
                              'execution_profile_sha256': sweep.sha(passport.path)})
    (config.run_dir/'controller.pid').write_text(str(os.getpid())+'\n')
    (config.run_dir/'controller.pgid').write_text(str(os.getpgrp())+'\n')
    owner.update(execution_profile={'path': str(passport.path), 'sha256': sweep.sha(passport.path)},
                 injected_execution_purpose=PURPOSE)
    return owner.run()


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('--portable-config', type=Path, required=True)
    parser.add_argument('--agent-id', required=True)
    parser.add_argument('--progress', type=Path, required=True)
    parser.add_argument('--run-dir', type=Path, required=True)
    parser.add_argument('--stop-file', type=Path)
    parser.add_argument('--rss-limit-gib', type=int, default=12)
    parser.add_argument('--disk-floor-gib', type=int, default=3)
    parser.add_argument('--poll-seconds', type=float, default=2)
    parser.add_argument('--fine-tag', default='Codex15b7PortableFine')
    parser.add_argument('--fine-nq', type=int, default=1152)
    parser.add_argument('--medium-np', type=int, default=3200)
    parser.add_argument('--repair-depth', type=int, choices=(0, 1), default=1)
    parser.add_argument('--fine-supplement', type=Path, action='append', default=[])
    parser.add_argument('--pause-on-fine-failure', action='store_true')
    args = parser.parse_args(argv)
    if not __debug__ or os.getpid() != os.getpgrp():
        parser.error('Use normal Python and an owned controller process group/session')
    resolve = lambda p: p if p.is_absolute() else ROOT/p
    run = resolve(args.run_dir)
    config = Config(ROOT, resolve(args.portable_config), resolve(args.progress), run,
                    resolve(args.stop_file) if args.stop_file else run/'STOP_REQUESTED',
                    agent_id=args.agent_id, rss_limit=args.rss_limit_gib*batch.GIB,
                    disk_floor=args.disk_floor_gib*batch.GIB, poll_seconds=args.poll_seconds,
                    fine_tag=args.fine_tag, fine_nq=args.fine_nq, medium_np=args.medium_np,
                    repair_depth=args.repair_depth,
                    fine_supplements=tuple(resolve(p) for p in args.fine_supplement),
                    continue_inconclusive=not args.pause_on_fine_failure)
    config.validate()
    lock = ROOT/'handoff/caps-centre/campaign.lock'
    lock.parent.mkdir(parents=True, exist_ok=True)
    with lock.open('a+') as stream:
        try:
            fcntl.flock(stream, fcntl.LOCK_EX|fcntl.LOCK_NB)
        except BlockingIOError:
            parser.exit(1, 'Another campaign/controller owns campaign.lock; no progress changed.\n')
        # Only the lock holder may write owned runtime/exit evidence.
        config.run_dir.mkdir(parents=True, exist_ok=True)
        exit_path = config.run_dir/'actual-exit.txt'
        if exit_path.exists():
            old = exit_path.read_bytes()
            previous = config.run_dir/('actual-exit-prior-'+hashlib.sha256(old).hexdigest()[:16]+'.receipt')
            if previous.exists() and previous.read_bytes() != old:
                raise ValueError('Prior exit receipt differs; preserve it for inspection')
            if not previous.exists():
                previous.write_bytes(old)
        try:
            code = execute(config)
        except campaign.Paused as exc:
            code = campaign.PAUSED_EXIT
            repair.atomic_json(config.run_dir/'startup-paused.json',
                               {'state': 'paused', 'actual_exit': code, 'reason': str(exc), 'purpose': PURPOSE})
        except BaseException as exc:
            code = 1
            repair.atomic_json(config.run_dir/'startup-failure.json',
                               {'state': 'failed', 'actual_exit': code, 'error': f'{type(exc).__name__}: {exc}',
                                'purpose': PURPOSE})
        (config.run_dir/'actual-exit.txt').write_text(str(code)+'\n')
        return code


if __name__ == '__main__':
    sys.exit(main())
