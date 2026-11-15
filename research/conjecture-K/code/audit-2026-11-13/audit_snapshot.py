#!/usr/bin/env python3
"""Lightweight post-hoc provenance and run-completeness snapshot.

Agent-ID: codex-a713. Reads only small source/text files and JSONL metadata.
Does not load sample arrays, hash large data, or run an optimization. Re-run
after final changes. These are snapshot-time hashes, not run-start attestations.
"""
import sys
sys.dont_write_bytecode = True
from pathlib import Path
import collections
import datetime
import hashlib
import importlib.metadata
import json
import os
import platform

ROOT = Path(__file__).resolve().parent
timestamp = datetime.datetime.now(datetime.timezone.utc).isoformat()
warnings = []


def records(path):
    result = []
    for number, line in enumerate(path.read_text().splitlines(), 1):
        try:
            result.append(json.loads(line))
        except json.JSONDecodeError:
            warnings.append(f'Invalid or concurrently incomplete JSONL: {path}:{number}')
    return result


def version(package):
    try:
        return importlib.metadata.version(package)
    except importlib.metadata.PackageNotFoundError:
        return None


originals = [ROOT.parent/name for name in (
    'CONJECTURE_K_MONOGRAPH.md', 'ASSESSMENT_2026-11-04.md',
    'MANUSCRIPT_DIGEST_K.md', 'e11_scan_majorant.py',
    'e11_scan_opt.py', 'e11_scan_opt_peak.log')]
sources = set(originals)
for ext in ('*.py', '*.cpp', '*.mjs', '*.md'):
    sources.update(p for p in ROOT.rglob(ext) if 'dependencies' not in p.relative_to(ROOT).parts)
manifest = []
for path in sorted(sources):
    if not path.is_file():
        warnings.append(f'Missing source: {path}'); continue
    if path.stat().st_size > 2_000_000:
        warnings.append(f'Skipped large source (>2MB): {path}'); continue
    content = path.read_bytes()
    manifest.append(dict(path=str(path), bytes=len(content),
        sha256=hashlib.sha256(content).hexdigest(),
        role='supplied_record' if path in originals else 'audit_directory_snapshot_ownership_not_inferred'))
provenance = dict(agent='codex-a713', snapshot_utc=timestamp,
    status='Post-hoc snapshot; hashes establish neither authorship nor which historical version ran. Unrequested files may have appeared from another chat in this shared directory.',
    python_executable=sys.executable, python_version=sys.version,
    platform=platform.platform(), machine=platform.machine(),
    packages={p:version(p) for p in ('numpy', 'scipy', 'threadpoolctl')},
    thread_environment={k:os.environ.get(k) for k in
        ('OPENBLAS_NUM_THREADS', 'OMP_NUM_THREADS', 'VECLIB_MAXIMUM_THREADS')},
    sources=manifest)
(ROOT/'SOURCE_MANIFEST.json').write_text(json.dumps(provenance, indent=2)+'\n')

training = []
for refined in (False, True):
    for n in range(2, 7):
        for u in ('0.02', '0.03', '0.0463'):
            path = ROOT/f'optim_{"refined_" if refined else ""}peak_n{n}_u{u}.jsonl'
            rr = records(path) if path.exists() else []
            last = {r['restart']:r for r in rr}
            gradients = [r.get('intrinsic_gradient_norm', r.get('unit_sphere_tangent_gradient_norm'))
                         for r in last.values()]
            gradients = [g for g in gradients if g is not None]
            training.append(dict(n=n, u=float(u), refined=refined, log=str(path),
                records=len(rr), unique_restarts=len(last),
                missing_restarts=sorted(set(range(50))-set(last)),
                unexpected_restarts=sorted(set(last)-set(range(50))),
                all_50_present=set(last)==set(range(50)),
                converged_flags=sum(bool(r['converged']) for r in last.values()),
                messages=dict(collections.Counter(r['message'] for r in last.values())),
                powers=sorted({r['power'] for r in rr}), seeds=sorted({r['seed'] for r in rr}),
                max_intrinsic_gradient=max(gradients, default=None),
                intrinsic_gradients_recorded=len(gradients),
                tensor_files_exist=all(Path(r['tensor']).exists() for r in last.values())))

validation = []
for path in sorted(ROOT.glob('validation_*.jsonl')):
    rr = records(path); grouped = collections.defaultdict(dict)
    for r in rr:
        grouped[(r['tensor'], r['digest'], r['power'], r['seed_family'])][r['replicate']] = r
    validation.append(dict(path=str(path), records=len(rr), candidate_configurations=len(grouped),
        complete_eight_scrambles=sum(set(g)==set(range(8)) for g in grouped.values()),
        powers=sorted({r['power'] for r in rr}),
        minimum_deficit=min((r['D'] for r in rr), default=None)))

holdout = []
for path in sorted(ROOT.glob('holdout_*_summary.json')):
    for r in json.loads(path.read_text()):
        holdout.append({k:r.get(k) for k in
            ('n', 'u', 'tensor', 'digest', 'complete', 'replicates', 'points_per_replicate',
             'total_points', 'R', 'SE', 'halfwidth95', 'selection_source')})
snapshot = dict(agent='codex-a713', snapshot_utc=timestamp,
    status='Completeness snapshot at the stated time; configuration-level results below determine completion. This snapshot alone does not inspect active processes.',
    training=training, validation=validation, holdout=holdout, warnings=warnings)
(ROOT/'RUN_INTEGRITY_SNAPSHOT.json').write_text(json.dumps(snapshot, indent=2)+'\n')
print(json.dumps(dict(sources_hashed=len(manifest),
    original_cells_complete=sum(r['all_50_present'] for r in training if not r['refined']),
    refined_cells_complete=sum(r['all_50_present'] for r in training if r['refined']),
    holdout_candidates_complete=sum(bool(r['complete']) for r in holdout), warnings=warnings)), flush=True)
