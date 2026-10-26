#!/usr/bin/env python3
"""Guarded numerical RESEARCH prefetch, never native verification or cache work.

Consume a caps_centre_portable config. One Lake invocation defaults to two
initial centres, with up to seven when explicitly configured. A warm initial
group above two is permitted only for export-only research. Serial isolated workers
then solve stored matrices, and only exact positive raw results receive the
supplied fine export. No module/manifest/data generation occurs here.

Start the controller in its OWN process group. The shared campaign.lock excludes
the older controller. A busy CI worker/foreign Lean, aggregate RSS or disk guard
terminates ONLY this instance's child group, preserves every export, and exits75.
SIGTERM/INT and a stop file request a pause BETWEEN batches. Partial/stale output
is never overwritten or retried automatically. Prior checkpoint records are
preserved receipts, counted separately; this tool never declares a global maximum.
"""
from __future__ import annotations

import argparse
from dataclasses import dataclass
from datetime import datetime, timezone
from fractions import Fraction as Q
import fcntl
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import signal
import subprocess
import sys
import time
import tomllib

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
import caps_centre_campaign as campaign
import caps_centre_fine as fine
import caps_centre_repair as repair
import caps_centre_restore as restore
import caps_centre_sweep as sweep

ROOT = Path(__file__).resolve().parents[1]
PAUSED = 75
GIB = 1024**3
PURPOSE = 'Numerical research prefetch only; no native certificate, global maximum or shared cache claim.'


class Pause(Exception):
    pass


def utc():
    return datetime.now(timezone.utc).isoformat()


def read(path):
    return json.loads(Path(path).read_text())


def portable_check(root, path):
    from caps_centre_portable import check
    check(root, path)


def local(root, name):
    return restore.safe_path(root, str(name))


def pins(root, config):
    expected = {}
    for section in ('source_files', 'outputs', 'preserved_files'):
        for name, digest in config.get(section, {}).items():
            if name in expected and expected[name] != digest:
                raise ValueError('Conflicting source/output pins: '+name)
            expected[name] = digest
    for item in [config['manifest'], *config.get('inputs', {}).values(), config['generator']]:
        expected[item['path']] = item['sha256']
    for name, digest in expected.items():
        if not re.fullmatch('[0-9a-f]{64}', str(digest)) or sweep.sha(local(root, name)) != digest:
            raise ValueError('Missing or changed pinned file: '+name)


def module_target(root, entry):
    """Only pinned relative-I/O CapPlanRuns exports importing CapExport directly."""
    name = entry.get('module', '')
    prefix = 'Grothe.LowerAnalytic.CapPlanRuns.'
    if not name.startswith(prefix) or not re.fullmatch(r'Run_centre(?:Fine)?_[A-Za-z0-9_]+', name[len(prefix):]):
        raise ValueError('Not an allowed centre research module: '+name)
    expected = Path(*name.split('.')).with_suffix('.lean').as_posix()
    if entry.get('module_file') != expected:
        raise ValueError('Module/path mismatch')
    path = local(root, expected)
    if sweep.sha(path) != entry['module_source_sha256']:
        raise ValueError('Research module hash changed: '+name)
    spec = importlib.util.spec_from_file_location('batch_caps_stamp', root/'scripts/caps_stamp.py')
    stamp = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(stamp)
    if stamp.imports_of(str(path)) != ['Grothe.LowerAnalytic.CapExport']:
        raise ValueError('Research module has non-whitelisted imports')
    source = path.read_text()
    if re.search(r'\b(native_decide|Task\.spawn|implemented_by|extern|unsafe|initialize|run_cmd)\b|System\.Process|IO\.Process', source):
        raise ValueError('Forbidden verification/process command in research module')
    leaf = name[len(prefix):]
    evals = re.findall(r'^\s*#eval\s+([^\n]+)', source, re.M)
    if evals != ['run_'+leaf] or f'def run_{leaf} : IO Unit := do' not in source:
        raise ValueError('Research module needs exactly its pinned, typed IO export')
    io_paths = re.findall(r'(?:System\.FilePath\.pathExists|exportPiecesOn(?:Grid)?)\s+("(?:[^"\\]|\\.)*")', source)
    if len(io_paths) != 2 or any(json.loads(p) != entry['export'] for p in io_paths):
        raise ValueError('Research module must use its relative export path only')
    local(root, entry['export'])
    return name


@dataclass
class Config:
    root: Path
    portable: Path
    progress: Path
    run_dir: Path
    stop_file: Path
    agent_id: str = 'codex-15b7'
    batch_size: int = 2
    initial_batch_size: int = 2
    rss_limit: int = 8*GIB
    disk_floor: int = 3*GIB
    poll_seconds: float = 2.0
    export_only: bool = False
    pilot_limit: int | None = None
    lake_threads: int = 2

    def validate(self):
        if not re.fullmatch(r'(codex|claude)-[0-9a-f]{4}', self.agent_id):
            raise ValueError('A signed agent ID is required')
        if self.batch_size not in range(1, 8) or self.initial_batch_size not in range(1, 8):
            raise ValueError('Initial and configured groups must have1 through7 targets')
        if self.initial_batch_size > 2 and not self.export_only:
            raise ValueError('An initial group above2 requires explicit export-only research')
        if type(self.lake_threads) is not int or self.lake_threads not in range(1, 8):
            raise ValueError('Lake scheduler threads must be explicitly1 through7; default2')
        if self.rss_limit <= 0 or self.disk_floor < 3*GIB or self.poll_seconds <= 0:
            raise ValueError('RSS/poll must be positive and disk floor at least3GiB')
        if self.pilot_limit is not None and self.pilot_limit < 1:
            raise ValueError('Pilot limit must be positive')
        for path in (self.portable, self.progress, self.run_dir, self.stop_file):
            local(self.root, path.relative_to(self.root))
        relative = self.run_dir.relative_to(self.root)
        if relative.parts[:2] != ('handoff', 'caps-centre') or not relative.name.startswith(self.agent_id+'-batch'):
            raise ValueError('Use an owned handoff/caps-centre/<agent-id>-batch... run directory')
        if (self.progress.parent != self.root/'data/caps-m/plan'
                or not self.progress.name.startswith('batch-'+self.agent_id+'-') or self.progress.suffix != '.json'):
            raise ValueError('Use a separate data/caps-m/plan/batch-<agent-id>-...json progress file')


def overlay_bytes(source):
    """Copy the TOML exactly, adding only an untraced package-level -j1.

    Lake4.34.1 LeanConfig.weakLeanArgs is passed to Lean but excluded from
    module traces. Keeping -j1 here lets Lake's own runtime schedule independent
    jobs while each export process has one Lean worker. Later strong/library
    thread flags could override it, so reject them rather than guess precedence.
    """
    original = tomllib.loads(source.decode('utf-8'))
    if 'weakLeanArgs' in original:
        raise ValueError('Canonical package already defines weakLeanArgs; inspect before adapting')
    def reject_threads(value):
        if isinstance(value, dict):
            for key, item in value.items():
                if key in ('weakLeanArgs', 'moreLeanArgs'):
                    if not isinstance(item, list) or any(not isinstance(arg, str) for arg in item):
                        raise ValueError('Unexpected Lean arguments configuration')
                    if any(arg.startswith('-j') or arg.startswith('--threads') for arg in item):
                        raise ValueError('Canonical thread flags could override single-thread Lean')
                reject_threads(item)
        elif isinstance(value, list):
            for item in value:
                reject_threads(item)
    reject_threads(original)
    result = b'weakLeanArgs = ["-j1"]\n'+source
    parsed = tomllib.loads(result.decode('utf-8'))
    if parsed.pop('weakLeanArgs') != ['-j1'] or parsed != original:
        raise ValueError('Overlay changed package configuration beyond weakLeanArgs')
    return result


def overlay_pin(config, *, create=False):
    source = (config.root/'lakefile.toml').read_bytes()
    content = overlay_bytes(source)
    path = config.run_dir/(config.agent_id+'-lake-single-lean.toml')
    local(config.root, path.relative_to(config.root))
    if path.exists():
        if path.read_bytes() != content:
            raise ValueError('Owned Lake overlay changed; preserving it for inspection')
    elif create:
        path.parent.mkdir(parents=True, exist_ok=True)
        with path.open('xb') as stream:
            stream.write(content)
    else:
        raise ValueError('Pinned Lake overlay is missing')
    return {'path': path.relative_to(config.root).as_posix(),
            'sha256': hashlib.sha256(content).hexdigest(),
            'canonical_lakefile_sha256': hashlib.sha256(source).hexdigest()}


def process_rows():
    """Bounded attributes only; never persist process arguments/environment."""
    output = subprocess.check_output(['ps', '-axo', 'pid=,pgid=,ppid=,rss=,comm=,args='], text=True)
    rows = []
    for line in output.splitlines():
        fields = line.strip().split(None, 5)
        if len(fields) >= 5:
            args = fields[5].split() if len(fields) == 6 else []
            rows.append({'pid': int(fields[0]), 'pgid': int(fields[1]), 'ppid': int(fields[2]),
                         'rss': int(fields[3])*1024, 'comm': Path(fields[4]).name,
                         'exe': Path(args[0]).name if args else '',
                         'module': next((Path(arg).name for arg in args if arg.endswith('.lean')), None)})
    return rows


def busy(rows, own_group=None):
    return [{k: row[k] for k in ('pid', 'pgid', 'comm')} for row in rows
            if row['pgid'] != own_group and
            ({row['comm'], row.get('exe', '')} & {'Runner.Worker', 'Runner.Worker.exe', 'lean', 'lake'})]


class Guard:
    def __init__(self, config, *, snapshot=process_rows, disk=shutil.disk_usage):
        self.c, self.snapshot, self.disk = config, snapshot, disk

    def observe(self, own_group=None):
        rows = self.snapshot()
        foreign = busy(rows, own_group)
        rss = sum(row['rss'] for row in rows if row['pgid'] == own_group) if own_group else 0
        free = self.disk(self.c.root).free
        reason = 'busy CI/foreign Lean: '+json.dumps(foreign) if foreign else \
            'disk below floor' if free < self.c.disk_floor else \
            'aggregate RSS exceeded' if rss > self.c.rss_limit else None
        return {'rss': rss, 'free_disk': free, 'pause_reason': reason,
                'lean_count': sum(row['pgid'] == own_group and
                                  bool({row['comm'], row.get('exe', '')} & {'lean'}) for row in rows),
                'modules': sorted({row['module'] for row in rows
                                   if row['pgid'] == own_group and row.get('module')
                                   and {row['comm'], row.get('exe', '')} & {'lean'}})}


class Runner:
    """One owned session at a time; never signals a journalled/foreign PID."""
    def __init__(self, config, update, *, guard=None, popen=subprocess.Popen,
                 killpg=os.killpg, sleep=time.sleep, clock=time.monotonic):
        self.c, self.update = config, update
        self.guard, self.popen = guard or Guard(config), popen
        self.killpg, self.sleep, self.clock = killpg, sleep, clock
        self.child, self.sequence = None, 0
        self.overlay = None

    def stop_owned(self):
        child = self.child
        if child is None:
            raise RuntimeError('No owned child to stop')
        try:
            self.killpg(child.pid, signal.SIGTERM)
        except ProcessLookupError:
            pass
        try:
            child.wait(timeout=10)
        except subprocess.TimeoutExpired:
            self.killpg(child.pid, signal.SIGKILL)
            child.wait(timeout=10)
        # A Lake parent can exit before its children. Only its OWN session is eligible.
        for _ in range(10):
            if self.guard.observe(child.pid)['rss'] == 0:
                return
            self.sleep(0.2)
        try:
            self.killpg(child.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
        if self.guard.observe(child.pid)['rss']:
            raise RuntimeError('Owned child group still has RSS after termination; inspect before restart')

    def run(self, argv, phase, keys):
        if self.child is not None:
            raise RuntimeError('Refusing overlapping child groups')
        first = self.guard.observe()
        if first['pause_reason']:
            raise Pause(first['pause_reason'])
        argv = list(map(str, argv))
        is_lake = Path(argv[0]).name == 'lake'
        if is_lake:
            if len(argv) < 2 or argv[1] != 'build' or any(arg.startswith(('-f', '-d', '--file', '--dir')) for arg in argv[2:]):
                raise ValueError('Lake child must use the owned build overlay only')
            current = overlay_pin(self.c, create=self.overlay is None)
            if self.overlay is not None and current != self.overlay:
                raise ValueError('Canonical/overlay source changed between child groups')
            self.overlay = current
            argv = [argv[0], '-f', current['path'], *argv[1:]]
        self.c.run_dir.mkdir(parents=True, exist_ok=True)
        self.sequence += 1
        stem = f'batch-{os.getpid()}-{self.sequence:05d}-{phase}'
        log, receipt = self.c.run_dir/(stem+'.log'), self.c.run_dir/(stem+'.json')
        journal = self.c.run_dir/'batch-child.json'
        record = {'agent_id': self.c.agent_id, 'phase': phase, 'keys': keys, 'argv': list(map(str, argv)),
                  'log': str(log.relative_to(self.c.root)), 'started_at_utc': utc(),
                  'controller_pid': os.getpid(), 'controller_pgid': os.getpgrp(), 'state': 'starting',
                  'lake_parent_threads': self.c.lake_threads if is_lake else None,
                  'lean_child_threads': 1 if is_lake else None,
                  'lake_overlay': self.overlay if is_lake else None}
        env = dict(os.environ, LEAN_NUM_THREADS=str(self.c.lake_threads) if is_lake else '1', OPENBLAS_NUM_THREADS='1', OMP_NUM_THREADS='1',
                   MKL_NUM_THREADS='1', NUMEXPR_NUM_THREADS='1', PYTHONDONTWRITEBYTECODE='1')
        start, peak, paused, error, code = self.clock(), 0, None, None, None
        observed_modules = set()
        peak_lean = 0
        with log.open('xb') as stream:
            self.child = self.popen(list(map(str, argv)), cwd=self.c.root, env=env, stdout=stream,
                                    stderr=subprocess.STDOUT, start_new_session=True)
            child = self.child
            try:
                record.update(pid=child.pid, pgid=child.pid, state='running')
                repair.atomic_json(journal, record)
                repair.atomic_json(receipt, record)
                self.update(owned_child=dict(record, receipt=str(receipt.relative_to(self.c.root))))
                while child.poll() is None:
                    observation = self.guard.observe(child.pid)
                    peak = max(peak, observation['rss'])
                    peak_lean = max(peak_lean, observation.get('lean_count', 0))
                    observed_modules.update(observation.get('modules', []))
                    if observation['pause_reason']:
                        paused = observation['pause_reason']
                        self.stop_owned()
                        break
                    self.sleep(self.c.poll_seconds)
                code = child.wait()
                final = self.guard.observe(child.pid)
                peak = max(peak, final['rss'])
                peak_lean = max(peak_lean, final.get('lean_count', 0))
                observed_modules.update(final.get('modules', []))
                paused = paused or final['pause_reason']
                if final['rss']:
                    self.stop_owned()
                    error = 'Child exited with surviving group members; owned group stopped'
            except BaseException as exc:
                error = f'{type(exc).__name__}: {exc}'
                self.stop_owned()
                code = child.wait()
            finally:
                self.child = None
        record.update(state='paused' if paused else 'failed' if error or code else 'complete',
                      actual_exit=code, pause_reason=paused, error=error,
                      peak_aggregate_rss_bytes=peak, observed_modules=sorted(observed_modules),
                      peak_concurrent_lean=peak_lean,
                      runtime_seconds=self.clock()-start, completed_at_utc=utc())
        repair.atomic_json(receipt, record)
        repair.atomic_json(journal, record)
        self.update(owned_child=None, last_child=record)
        return record


def previous_jobs(root, state):
    """Read-only refusal; PID reuse or uncertain liveness always requires inspection."""
    campaign.check_previous_processes(state)
    paths = [root/'handoff/caps-centre/active-child.json']
    paths += list((root/'handoff/caps-centre').glob('**/batch-child.json'))
    for path in paths:
        if path.exists():
            campaign.check_previous_processes(read(path))


class Batch:
    def __init__(self, config, *, checker=portable_check, runner_factory=Runner):
        config.validate()
        self.c, self.checker = config, checker
        checker(config.root, config.portable)
        self.bundle = read(config.portable)
        if self.bundle.get('format') != 'caps-centre-portable/v1':
            raise ValueError('Expected portable numerical research config')
        pins(config.root, self.bundle)
        self.manifest = read(local(config.root, self.bundle['manifest']['path']))
        sweep.check_manifest(config.root, self.manifest)
        self.entries = {sweep.key_string(e): e for e in self.manifest['entries']}
        self.pending = self.bundle['pending']
        self.pending_keys = [p['key'] for p in self.pending]
        self.selected_keys = self.pending_keys[:config.pilot_limit] if config.pilot_limit else list(self.pending_keys)
        if len(set(self.pending_keys)) != len(self.pending_keys):
            raise ValueError('Duplicate pending centre')
        complete = set(self.bundle['completed_keys'])
        if complete & set(self.pending_keys) or complete | set(self.pending_keys) != set(self.entries):
            raise ValueError('Portable complete/pending partition is invalid')
        self.fine_manifests = {}
        for item in self.pending:
            entry = self.entries[item['key']]
            if entry['module'] != item['stored_module'] or entry['module'] in self.manifest.get('portable', {}).get('legacy_modules_never_build', []):
                raise ValueError('Pending entry tries to build a legacy/non-matching module')
            module_target(config.root, entry)
            fm = read(local(config.root, item['fine_manifest']))
            if sweep.key(fm['entry']) != sweep.key(entry) or fm['entry']['module'] != item['fine_module']:
                raise ValueError('Fine manifest is for another centre')
            module_target(config.root, fm['entry'])
            if local(config.root, fm['entry']['export']).exists():
                fine.validate(config.root, fm)
            self.fine_manifests[item['key']] = fm
        canonical = (config.root/'lakefile.toml').read_bytes()
        overlay = {'path': (config.run_dir/(config.agent_id+'-lake-single-lean.toml')).relative_to(config.root).as_posix(),
                   'sha256': hashlib.sha256(overlay_bytes(canonical)).hexdigest(),
                   'canonical_lakefile_sha256': hashlib.sha256(canonical).hexdigest()}
        fingerprint = {'config_sha256': sweep.sha(config.portable), 'driver_sha256': sweep.sha(__file__),
                       'lake_parent_threads': config.lake_threads, 'lean_child_threads': 1, 'lake_overlay': overlay,
                       'helpers_sha256': {name: sweep.sha(config.root/name) for name in [
                           'tools/caps_centre_campaign.py', 'tools/caps_centre_sweep.py', 'tools/caps_centre_fine.py',
                           'tools/caps_centre_repair.py', 'tools/caps_centre_restore.py', 'tools/caps_lmi.py', 'tools/caps_plan.py']},
                       'batch_size': config.batch_size, 'initial_batch_size': config.initial_batch_size,
                       'rss_limit': config.rss_limit, 'disk_floor': config.disk_floor,
                       'export_only': config.export_only, 'pilot_limit': config.pilot_limit,
                       'selected_keys': self.selected_keys, 'agent_id': config.agent_id}
        if config.progress.exists():
            self.state = read(config.progress)
            if self.state.get('fingerprint') != fingerprint:
                raise ValueError('Batch progress source/config changed; use a new progress path')
        else:
            self.state = {'schema': 1, 'agent_id': config.agent_id, 'purpose': PURPOSE, 'fingerprint': fingerprint,
                          'started_at_utc': utc(), 'status': 'new', 'groups': [],
                          'preserved_checkpoint_only': sorted(complete),
                          'centres': {key: {'state': 'pending'} for key in self.pending_keys}}
        previous_jobs(config.root, self.state)
        if overlay_pin(config, create=True) != overlay:
            raise ValueError('Overlay generation disagrees with its fingerprint')
        self.stop_requested = False
        self.runner = runner_factory(config, self.update)

    def update(self, **items):
        self.state.update(items, updated_at_utc=utc(), controller_pid=os.getpid(), controller_pgid=os.getpgrp())
        rows = list(self.state['centres'].values())
        self.state['summary'] = {'pending_inventory': len(rows),
            'selected_centres': len(self.selected_keys),
            'preserved_checkpoint_only': len(self.state['preserved_checkpoint_only']),
            'raw_exported': sum(r.get('raw_export') == 'valid' for r in rows),
            'raw_exact': sum('raw_cap_up' in r for r in rows),
            'raw_positive': sum(Q(r.get('raw_cap_up', '0')) > 0 for r in rows),
            'fine_exported': sum(r.get('fine_export') == 'valid' for r in rows),
            'fine_exact': sum('fine_cap_up' in r for r in rows),
            'unknown_or_failed': sum(r.get('state') in ('unknown', 'failed') for r in rows),
            'worker_failures': sum(len(r.get('worker_failures', [])) for r in rows),
            'positive_fine_residuals': sum(Q(r.get('fine_cap_up', '0')) > 0 for r in rows),
            'is_global_maximum': False}
        repair.atomic_json(self.c.progress, self.state)

    def pause_signal(self, signum, _frame):
        self.stop_requested = True
        self.update(pause_requested=signal.Signals(signum).name)

    def check_pause(self):
        if self.stop_requested or self.c.stop_file.exists():
            raise Pause('Graceful stop requested between batches')
        fingerprint = self.state['fingerprint']
        if (sweep.sha(self.c.portable) != fingerprint['config_sha256']
                or sweep.sha(__file__) != fingerprint['driver_sha256']
                or overlay_pin(self.c) != fingerprint['lake_overlay']
                or any(sweep.sha(self.c.root/name) != digest for name, digest in fingerprint['helpers_sha256'].items())):
            raise ValueError('Controller/config/helper source changed during this run')
        # The full portable structural audit ran once at startup. Re-hash its
        # immutable source/preparation/evidence pins, rather than reparsing every
        # centre/fine manifest before each small batch.
        pins(self.c.root, self.bundle)

    def exported(self, key, phase):
        if phase == 'raw':
            return sweep.export_record(self.c.root, self.manifest, self.entries[key])
        return fine.validate(self.c.root, self.fine_manifests[key])

    def inspect(self, keys, phase):
        result = {}
        for key in keys:
            try:
                value = self.exported(key, phase)
                result[key] = 'valid' if value is not None else 'missing'
            except (ValueError, KeyError, OSError) as error:
                result[key] = 'invalid_preserved'
                self.state['centres'][key].update(state='failed', error=f'{type(error).__name__}: {error}')
            self.state['centres'][key][phase+'_export'] = result[key]
        self.update()
        return result

    def exports(self, keys, phase):
        inspected = self.inspect(keys, phase)
        if 'invalid_preserved' in inspected.values():
            raise ValueError('Partial/stale export preserved; inspect it before resuming')
        missing = [k for k in keys if inspected[k] == 'missing']
        sent = 0
        while missing:
            self.check_pause()
            had_exports = any(g.get('phase', '').endswith('-export') for g in self.state['groups'])
            size = self.c.batch_size if had_exports else min(self.c.batch_size, self.c.initial_batch_size)
            group, missing = missing[:size], missing[size:]
            entries = [self.entries[k] if phase == 'raw' else self.fine_manifests[k]['entry'] for k in group]
            targets = [module_target(self.c.root, entry) for entry in entries]
            record = self.runner.run(['lake', 'build', *targets, '--wfail'], phase+'-export', group)
            self.state['groups'].append(record)
            accepted = self.inspect(group, phase)  # Always inspect EVERY peer, even after a failed Lake.
            self.update()
            sent += len(group)
            if record['pause_reason']:
                raise Pause(record['pause_reason'])
            if record['actual_exit'] or record['error'] or any(v != 'valid' for v in accepted.values()):
                raise ValueError('Batch failed; peer exports were individually preserved and classified')
        return sent

    def solve(self, keys, phase):
        for key in keys:
            self.check_pause()
            record = self.state['centres'][key]
            if record.get(phase+'_export') != 'valid':
                continue
            for field in (phase+'_cap_up', phase+'_status'):
                record.pop(field, None)
            if phase == 'raw':
                record.pop('fine_cap_up', None)
                record.pop('fine_status', None)
            entry = self.entries[key] if phase == 'raw' else self.fine_manifests[key]['entry']
            path = local(self.c.root, entry['solved'])
            if not path.exists():
                argv = [sys.executable, 'tools/caps_centre_campaign.py', '_worker', 'solve-stored' if phase == 'raw' else 'solve-fine',
                        '--manifest', self.bundle['manifest']['path']]
                if phase == 'raw':
                    argv += ['--key', key]
                else:
                    item = next(p for p in self.pending if p['key'] == key)
                    argv += ['--fine-manifest', item['fine_manifest']]
                child = self.runner.run(argv, phase+'-solve', [key])
                self.state['groups'].append(child)
                if child['actual_exit'] or child['error']:
                    record.setdefault('worker_failures', []).append(child)
                if child['pause_reason']:
                    self.update()
                    raise Pause(child['pause_reason'])
            try:
                if phase == 'raw':
                    _, result = campaign.stored_solution(self.c.root, self.manifest, self.entries[key])
                else:
                    if not path.exists():
                        raise ValueError('Fine optimizer produced no saved result')
                    result = fine.solve(self.c.root, self.fine_manifests[key])
                    campaign.checked_result(self.exported(key, phase), result)
                record[phase+'_cap_up'] = str(Q(result['cap_up']))
                record[phase+'_status'] = result['status']
                record['state'] = ('fine_pending' if phase == 'raw' and Q(result['cap_up']) > 0 else
                                   'positive_residual' if phase == 'fine' and Q(result['cap_up']) > 0 else 'exact_research')
            except (ValueError, KeyError, OSError) as error:
                record.update(state='unknown', error=f'{type(error).__name__}: {error}')
            self.update()

    def run(self):
        self.update(status='running', phase='raw_exports', actual_exit=None)
        try:
            keys = self.selected_keys
            self.exports(keys, 'raw')
            self.check_pause()
            if not self.c.export_only:
                self.update(phase='raw_solutions')
                self.solve(keys, 'raw')
                positive = [k for k in keys if Q(self.state['centres'][k].get('raw_cap_up', '0')) > 0]
                self.update(phase='fine_exports')
                self.exports(positive, 'fine')
                self.update(phase='fine_solutions')
                self.solve(positive, 'fine')
            unresolved = any(self.state['centres'][key].get('state') in ('unknown', 'failed')
                             or self.state['centres'][key].get('worker_failures') for key in keys)
            code = 1 if unresolved else 0
            self.update(status='incomplete_or_unknown' if unresolved else
                        'pilot_complete' if self.c.pilot_limit else 'complete_research', phase='done', actual_exit=code)
            return code
        except Pause as error:
            self.update(status='paused', pause_reason=str(error), actual_exit=PAUSED)
            return PAUSED
        except BaseException as error:
            self.update(status='failed', error=f'{type(error).__name__}: {error}', actual_exit=1)
            raise


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('--portable-config', type=Path, required=True)
    parser.add_argument('--agent-id', required=True)
    parser.add_argument('--progress', type=Path, required=True)
    parser.add_argument('--run-dir', type=Path, required=True)
    parser.add_argument('--stop-file', type=Path)
    parser.add_argument('--batch-size', type=int, choices=range(1, 8), default=2)
    parser.add_argument('--initial-batch-size', type=int, choices=range(1, 8), default=2,
                        help='Default pair; larger initial groups require export-only and warmed prerequisites')
    parser.add_argument('--lake-threads', type=int, choices=range(1, 8), default=2,
                        help='Lake scheduler workers; exported Lean processes always receive-j1 via owned overlay')
    parser.add_argument('--rss-limit-gib', type=int, default=8)
    parser.add_argument('--disk-floor-gib', type=int, default=3)
    parser.add_argument('--poll-seconds', type=float, default=2)
    parser.add_argument('--export-only', action='store_true')
    parser.add_argument('--pilot-limit', type=int)
    args = parser.parse_args(argv)
    if not __debug__:
        parser.error('Optimized Python is forbidden')
    if os.getpid() != os.getpgrp():
        parser.error('Start this controller in its own process group/session')
    resolve = lambda path: path if path.is_absolute() else ROOT/path
    run_dir = resolve(args.run_dir)
    config = Config(ROOT, resolve(args.portable_config), resolve(args.progress), run_dir,
                    resolve(args.stop_file) if args.stop_file else run_dir/'STOP_REQUESTED',
                    agent_id=args.agent_id, batch_size=args.batch_size, initial_batch_size=args.initial_batch_size,
                    lake_threads=args.lake_threads,
                    rss_limit=args.rss_limit_gib*GIB, disk_floor=args.disk_floor_gib*GIB,
                    poll_seconds=args.poll_seconds, export_only=args.export_only, pilot_limit=args.pilot_limit)
    config.validate()
    lock_path = ROOT/'handoff/caps-centre/campaign.lock'
    lock_path.parent.mkdir(parents=True, exist_ok=True)
    with lock_path.open('a+') as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            parser.exit(1, 'Another campaign/controller owns campaign.lock; no state changed.\n')
        try:
            batch = Batch(config)
            config.run_dir.mkdir(parents=True, exist_ok=True)
            (config.run_dir/'controller.pid').write_text(str(os.getpid())+'\n')
            (config.run_dir/'controller.pgid').write_text(str(os.getpgrp())+'\n')
            for sig in (signal.SIGTERM, signal.SIGINT):
                signal.signal(sig, batch.pause_signal)
            code = batch.run()
        except Pause as error:
            code = PAUSED
            print(f'Paused: {error}', file=sys.stderr)
        except BaseException as error:
            code = 1
            print(f'Failed: {type(error).__name__}: {error}', file=sys.stderr)
        # A surviving prior controller must not have its receipt overwritten.
        if 'batch' in locals():
            (config.run_dir/'actual-exit.txt').write_text(str(code)+'\n')
        return code


if __name__ == '__main__':
    sys.exit(main())
