#!/usr/bin/env python3
"""Audit a single progress observation; write owned backups only on explicit request.

Default: candidate, read-only. `snapshot --replace` explicitly updates the owned
checkpoint. --handoff-prefix explicitly writes candidate/meta/files JSON under
handoff/caps-centre. This tool checks identities, dependencies and bytes, never
numerical feasibility, process liveness or native verification.
"""
import argparse
import copy
from datetime import datetime, timezone
from fractions import Fraction
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
PLAN = Path('data/caps-m/plan')
OMITTED = object()


def require(condition, message):
    if not condition:
        raise ValueError(message)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def identity(row):
    parts = [row.get(k) for k in ('k', 'i', 'j')]
    require(all(type(v) is int and v >= 0 for v in parts), 'Invalid centre identity')
    return ':'.join(map(str, parts))


def local(root, name, existing=True):
    name = Path(name)
    require('..' not in name.parts, 'Parent traversal in checkpoint input/output')
    path = (root/name).resolve(strict=existing)
    require(path.is_relative_to(root) and path != root, 'Path escapes checkpoint root')
    if existing:
        require(path.is_file(), 'Checkpoint input is not a file')
    return path


def collect(root, agent, manifest_path, progress_path=None, *, checkpoint_path=None, context=None):
    """Capture one atomic JSON read; ignore incomplete-record artifact paths entirely."""
    if not __debug__:
        raise ValueError('Reject optimized Python')
    root = Path(root).resolve(strict=True)
    require(re.fullmatch(r'(codex|claude)-[0-9a-f]{4}', agent), 'Invalid owner agent ID')
    inputs, evidence = {}, {}

    def read(name, expected=OMITTED):
        path = local(root, name)
        key = path.relative_to(root).as_posix()
        payload = path.read_bytes()
        if expected is not OMITTED:
            require(isinstance(expected, str) and re.fullmatch('[0-9a-f]{64}', expected), 'Malformed SHA256')
            require(digest(payload) == expected, 'Missing/changed hash: '+key)
        require(key not in inputs or inputs[key] == payload, 'Input changed during checkpoint audit: '+key)
        inputs[key] = payload
        return key, payload

    def artifact(name, expected=OMITTED):
        require(local(root, name).is_relative_to(root/PLAN), 'Selected artifact must be under PLAN')
        return read(name, expected)

    manifest_name, manifest_bytes = read(manifest_path)
    manifest = json.loads(manifest_bytes)
    entries = {identity(e): e for e in manifest['entries']}
    require(len(entries) == len(manifest['entries']), 'Duplicate manifest centre')
    if checkpoint_path is not None:
        checkpoint = json.loads(local(root, checkpoint_path).read_bytes())
        require(checkpoint['format'] == 'caps-centre-backup/v1' and checkpoint['agent_id'] == agent,
                'Checkpoint format/owner mismatch')
        require(checkpoint['manifest'] == manifest_name, 'Checkpoint manifest mismatch')
        state = checkpoint['progress_snapshot']
    else:
        # Exactly one open/read. The campaign publishes this file by atomic rename;
        # later progress updates are allowed and are never reread or rewritten here.
        progress = local(root, progress_path)
        progress_bytes = progress.read_bytes()
        state = json.loads(progress_bytes)
        checkpoint = {'format': 'caps-centre-backup/v1', 'agent_id': agent,
                      'checkpoint_kind': 'live_completed_evidence',
                      'scope': 'Research observation, including incomplete records. Only completed accepted '
                               'records select backup dependencies; no feasibility or native-verification claim.',
                      **(context or {}), 'worktree': str(root), 'manifest': manifest_name,
                      'progress_observation': {'path': progress.relative_to(root).as_posix(),
                                               'sha256': digest(progress_bytes)},
                      'progress_snapshot': copy.deepcopy(state)}
    require(state.get('agent_id') == agent and set(state['centres']) == set(entries),
            'Progress owner/centre inventory mismatch')
    require(state.get('status') in ('running', 'paused', 'failed', 'complete'), 'Unknown observed progress status')
    fp = state['fingerprint']
    require(fp['manifest_sha256'] == digest(manifest_bytes), 'Progress manifest hash mismatch')
    for name, sha in manifest['provenance']['files'].items():
        read(name, sha)
    for name, sha in fp.get('helpers_sha256', {}).items():
        read('tools/'+name, sha)
    if 'driver_sha256' in fp:
        read('tools/caps_centre_campaign.py', fp['driver_sha256'])
    for name, sha in fp.get('fine_supplement_sha256', {}).items():
        read(name, sha)
    require(Fraction(state['capPad_unchanged']) == Fraction(manifest['provenance']['baseline_capPad']),
            'Observed capPad does not match manifest')
    complete = {key: r for key, r in state['centres'].items()
                if r.get('status') == 'complete' and r.get('residual_accepted') is True}

    def recorded(value):
        if isinstance(value, dict):
            if 'path' in value or 'sha256' in value:
                require('path' in value and 'sha256' in value, 'Partial evidence path/SHA256 reference')
                path, payload = artifact(value['path'], value['sha256'])
                require(path not in evidence or evidence[path] == digest(payload), 'Conflicting evidence hash')
                evidence[path] = digest(payload)
            for item in value.values():
                recorded(item)
        elif isinstance(value, list):
            for item in value:
                recorded(item)

    def matching(name, key, grid, lines=False):
        _, payload = artifact(name)
        rows = [json.loads(line) for line in payload.splitlines() if line.strip()] if lines else json.loads(payload)
        require(isinstance(rows, list), 'Expected evidence row list')
        found = [r for r in rows if identity(r) == key and r.get('grid') == grid]
        require(len(found) == 1, 'Complete-node evidence identity/grid mismatch: '+str(name))
        return found[0]

    dependencies = set()
    for key, record in complete.items():
        entry = entries[key]
        require(Fraction(record['best_residual']) >= 0 and record.get('evidence'), 'Incomplete completed record')
        recorded(record)
        require(all(k in record.get('raw_result', {}) for k in ('path', 'sha256')), 'Completed centre lacks hashed raw result')
        matching(record['raw_result']['path'], key, entry['grid'])
        if record.get('raw_exact_replayed'):
            require(all(k in record.get('raw_export', {}) for k in ('path', 'sha256')), 'Completed centre lacks hashed export')
            matching(record['raw_export']['path'], key, entry['grid'], lines=True)
        if entry.get('search_status') != 'historical_adopted':
            require(all(k in record.get('raw_export', {}) for k in ('path', 'sha256')), 'Prepared centre lacks hashed export')
            raw, _ = artifact(record['raw_export']['path'], record['raw_export']['sha256'])
            expected_export, _ = artifact(entry['export'])
            require(raw == expected_export, 'Prepared raw_export path does not match manifest entry.export')
            side, payload = artifact(entry['export_provenance'])
            expected = {'fingerprint': manifest['provenance']['fingerprint'], 'key': key, 'grid': entry['grid'],
                        **{k: entry[k] for k in ('node_sha256', 'piece_sha256', 'module_source_sha256')}}
            require(json.loads(payload) == expected, 'Stored export provenance mismatch')
            dependencies.add(side)
        for ev in record['evidence']:
            if ev.get('kind') != 'independently_pinned_fine_manifest':
                continue
            _, payload = artifact(ev['path'], ev['sha256'])
            fine = json.loads(payload); fe, prov = fine['entry'], fine['provenance']
            require(identity(fe) == key and fe['grid'] == 3 and fe['stored_grid'] == entry['grid'] and
                    all(fe[k] == entry[k] for k in ('node_sha256', 'piece_sha256', 'nq')),
                    'Fine manifest centre/source mismatch')
            require(fe['grid_spec'] == prov['grid_spec'] and prov['grid'] == 3 and
                    prov['baseline_capPad'] == manifest['provenance']['baseline_capPad'],
                    'Fine manifest grid/padding mismatch')
            config = fp.get('config', {})
            expected_grid = config.get('medium_grid') if entry['grid'] == 1 else [
                config.get('fine_np'), config.get('fine_nq'), config.get('fine_step')]
            require(entry['grid'] in (1, 2) and fe['grid_spec'] == record.get('fine_grid_spec') == expected_grid,
                    'Fine grid_spec differs from observed record/config')
            for name, sha in prov['files'].items():
                read(name, sha)
            for field in ('export', 'solved'):
                name, payload = artifact(fe[field])
                require(name in evidence, 'Fine manifest dependency lacks recorded hash: '+name)
                row = matching(name, key, 3, lines=field == 'export')
                require(row.get('grid_spec') == fe['grid_spec'], 'Fine dependency grid_spec mismatch')
            if 'solution' in ev:
                chosen = matching(ev['solution']['path'], key, 3)
                require(chosen.get('grid_spec') == fe['grid_spec'], 'Chosen fine solution grid_spec mismatch')
            side, payload = artifact(fe['export_provenance'])
            expected = {'fingerprint': prov['fingerprint'], 'key': key, 'grid': 3,
                        **{k: fe[k] for k in ('node_sha256', 'piece_sha256', 'module_source_sha256')}}
            require(json.loads(payload) == expected, 'Fine export provenance mismatch')
            dependencies.add(side)
    all_paths = set(evidence) | dependencies
    pending = {e.get('export') for key, e in entries.items() if key not in complete}
    require(not all_paths.intersection(pending), 'Incomplete live export selected as complete evidence')
    require(all(local(root, name).read_bytes() == payload for name, payload in inputs.items()),
            'Immutable input changed during checkpoint audit')
    metadata = {'agent_id': agent, 'count': len(complete), 'evidence_hashes': len(evidence),
                'files': sorted(all_paths), 'all_evidence_paths': sorted(all_paths),
                'snapshot_path': (PLAN/f'checkpoint-{agent}.json').as_posix(), 'active_job_preserved': True,
                'observed_status': state['status'], 'liveness_checked': False,
                'source_and_dependency_sha256': {name: digest(value) for name, value in sorted(inputs.items())},
                'scope': 'Structural/path/hash audit only; no feasibility, final maximum or native acceptance.'}
    return checkpoint, metadata


def write_owned(root, agent, outputs, replace=False):
    """Preflight every owned destination before replacing any file."""
    require(re.fullmatch(r'(codex|claude)-[0-9a-f]{4}', agent), 'Invalid owner agent ID')
    root = Path(root).resolve(strict=True)
    targets = []
    for name, value in outputs.items():
        path = local(root, name, existing=False)
        relative = path.relative_to(root)
        require(relative == PLAN/f'checkpoint-{agent}.json' or
                (path.is_relative_to(root/'handoff/caps-centre') and agent in path.name), 'Unowned backup destination')
        payload = (json.dumps(value, indent=2, sort_keys=True)+'\n').encode()
        require(not path.exists() or path.read_bytes() == payload or replace, 'Existing backup differs; review before --replace')
        targets.append((path, payload))
    for path, payload in targets:
        path.parent.mkdir(parents=True, exist_ok=True)
        fd, tmp = tempfile.mkstemp(prefix='.'+path.name, dir=path.parent)
        try:
            with os.fdopen(fd, 'wb') as stream:
                stream.write(payload); stream.flush(); os.fsync(stream.fileno())
            os.replace(tmp, path)
        finally:
            if os.path.exists(tmp):
                os.unlink(tmp)


def main(argv=None):
    if not __debug__:
        raise ValueError('Reject optimized Python')
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('mode', choices=('candidate', 'audit', 'snapshot'), nargs='?', default='candidate')
    parser.add_argument('--root', type=Path, default=ROOT)
    parser.add_argument('--agent-id', default='codex-15b7')
    parser.add_argument('--manifest', default=str(PLAN/'centre-sweep-codex-15b7.json'))
    parser.add_argument('--progress', default=str(PLAN/'centre-campaign-progress-codex-15b7.json'))
    parser.add_argument('--checkpoint')
    parser.add_argument('--handoff-prefix', help='Explicitly write owned candidate/meta/files JSON')
    parser.add_argument('--replace', action='store_true')
    parser.add_argument('--base-ref', default='HEAD')
    args = parser.parse_args(argv); root = args.root.resolve(strict=True)
    def git(*parts):
        return subprocess.check_output(['git', '-C', str(root), *parts], text=True).strip()
    require(args.mode != 'audit' or args.checkpoint, 'audit requires --checkpoint')
    context = {'created_at_utc': datetime.now(timezone.utc).isoformat(),
               'branch': git('branch', '--show-current'), 'integrated_master': git('merge-base', 'HEAD', 'origin/master')}
    checkpoint, meta = collect(root, args.agent_id, args.manifest, args.progress,
                               checkpoint_path=args.checkpoint if args.mode == 'audit' else None, context=context)
    base = git('rev-parse', args.base_ref+'^{commit}')
    paths = meta['all_evidence_paths']
    present = set(git('ls-tree', '-r', '--name-only', base, '--', str(PLAN)).splitlines()) if paths else set()
    changed = set(git('diff', '--name-only', base, '--', str(PLAN)).splitlines()) if paths else set()
    meta['files'] = sorted((set(paths)-present) | (set(paths) & changed)); meta['base_commit'] = base
    outputs = {}
    if args.mode == 'snapshot':
        outputs[meta['snapshot_path']] = checkpoint
    if args.handoff_prefix:
        prefix = local(root, args.handoff_prefix, existing=False)
        require(prefix.is_relative_to(root/'handoff/caps-centre') and args.agent_id in prefix.name,
                'Handoff prefix must be owned under handoff/caps-centre')
        outputs.update({str(prefix)+'.json': checkpoint, str(prefix)+'-meta.json': meta,
                        str(prefix)+'-files.json': meta['files']})
    write_owned(root, args.agent_id, outputs, args.replace)
    print(json.dumps({'mode': args.mode, 'completed': meta['count'], 'recorded_hashes': meta['evidence_hashes'],
                      'selected_files': len(meta['files']), 'observed_status': meta['observed_status'],
                      'written': sorted(outputs), 'scope': meta['scope']}))


if __name__ == '__main__':
    main()
