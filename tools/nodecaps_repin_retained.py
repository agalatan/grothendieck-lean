#!/usr/bin/env python3
"""Re-pin the retained Row14 proof closure after master changed modules it imports.

Agent-ID: claude-b9ee. `row14-binding.json` pins the import closure of the retained independent proof
`Grothe/LowerAnalytic/CapPieces/Node14x150.lean` (exactly `caps_stamp._active_graph` of that module plus
the three retained inputs), and `row14-source.json`, the archived baseline copy of the binding and the
noncentre source binding mirror those pins. When master edits or removes a module of that closure (a
proof-layer change unrelated to the caps), the sealed reproduction refuses to run until the closure is
re-pinned. This script recomputes the closure from the current tree and propagates the hashes; it changes
no Lean source and no certificate input. Run `tools/gen_cap_prepared_rows.py --check` afterwards.
"""
import hashlib
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'scripts'))
sys.dont_write_bytecode = True
import caps_stamp as stamp

BASE = 'data/caps-m/plan/row-certificates/'
RETAINED = 'Grothe/LowerAnalytic/CapPieces/Node14x150.lean'
RETAINED_INPUTS = {'data/caps-m-pieces/' + name + '.json' for name in ('pieces', 'sel', 'repairs')}
NONCENTRE = BASE + 'noncentre-source-binding.json'


def sha(data):
    return hashlib.sha256(data).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + '\n').encode()


def load(name):
    raw = (ROOT / name).read_bytes(); value = json.loads(raw)
    if encoded(value) != raw:
        raise SystemExit('unexpected serialisation: ' + name)
    return value


def main():
    reads = stamp._ActiveReads(ROOT)
    closure = set(stamp._active_graph(reads, [RETAINED[:-5].replace('/', '.')])) | RETAINED_INPUTS
    pins = {name: sha((ROOT / name).read_bytes()) for name in sorted(closure)}
    source = load(BASE + 'row14-source.json'); binding = load(BASE + 'row14-binding.json'); noncentre = load(NONCENTRE)
    old = dict(binding['retained_sha256'])
    changed = sorted(n for n in pins if old.get(n) != pins[n]); dropped = sorted(set(old) - set(pins))
    source['retained_sha256'] = pins
    source_bytes = encoded(source)
    (ROOT / BASE / 'row14-source.json').write_bytes(source_bytes)
    binding['retained_sha256'] = pins
    binding['source_manifest_sha256'] = sha(source_bytes)
    binding_bytes = encoded(binding)
    (ROOT / BASE / 'row14-binding.json').write_bytes(binding_bytes)
    archive = noncentre['baseline_files'][BASE + 'row14-binding.json']['path']
    (ROOT / archive).write_bytes(binding_bytes)
    # every sealed baseline that pins these files at their canonical path follows (idempotent)
    # the per-row noncentre repair binding of row 14 names the seal and the archived binding by hash
    repair_name = noncentre['repair_bindings']['14']['path']
    repair = load(repair_name)
    repair['historical_seal'] = {'path': BASE + 'row14-source.json', 'sha256': sha(source_bytes)}
    repair['historical_provenance'] = {'path': archive, 'sha256': sha(binding_bytes)}
    for gone in dropped:
        repair['source_sha256'].pop(gone, None)
    for item, digest in pins.items():
        if item in repair['source_sha256']:
            repair['source_sha256'][item] = digest
    repair_bytes = encoded(repair)
    (ROOT / repair_name).write_bytes(repair_bytes)
    noncentre['repair_bindings']['14'] = {'path': repair_name, 'sha256': sha(repair_bytes)}
    (ROOT / NONCENTRE).write_bytes(encoded(noncentre))
    for name in sorted(p.relative_to(ROOT).as_posix() for p in (ROOT / BASE).glob('*.json')):
        value = json.loads((ROOT / name).read_bytes())
        files = value.get('baseline_files') if isinstance(value, dict) else None
        if not isinstance(files, dict):
            continue
        value = load(name)
        for gone in dropped:
            if gone in files and files[gone]['path'] == gone:
                del files[gone]
        for item, digest in pins.items():
            if item in files and files[item]['path'] == item:
                files[item] = {'path': item, 'sha256': digest}
        if BASE + 'row14-binding.json' in files:
            files[BASE + 'row14-binding.json'] = {'path': archive, 'sha256': sha(binding_bytes)}
        if BASE + 'row14-source.json' in files and files[BASE + 'row14-source.json']['path'] == BASE + 'row14-source.json':
            files[BASE + 'row14-source.json'] = {'path': BASE + 'row14-source.json', 'sha256': sha(source_bytes)}
        (ROOT / name).write_bytes(encoded(value))
    print(f'retained closure re-pinned: {len(changed)} changed, {len(dropped)} dropped; {len(pins)} pins')
    for name in changed: print('  changed', name)
    for name in dropped: print('  dropped', name)


if __name__ == '__main__':
    main()
