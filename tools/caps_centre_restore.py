#!/usr/bin/env python3
"""Restore missing scratch centre-export modules from a backed-up manifest.

    python3 tools/caps_centre_restore.py restore MANIFEST.json

This writes only missing CapPlanRuns .lean files whose rendered bytes match the
manifest's exact module SHA. It never builds Lean or writes exports, solutions,
sidecars or numerical inputs. Existing matching source is preserved; changed
source, unsafe paths and changed mathematical provenance are rejected.
The frozen templates contain absolute I/O targets: a clone at a different path
must use the original AGENTS worktree path before these old hashes can match.
"""
import argparse
from fractions import Fraction
import hashlib
import json
from pathlib import Path, PurePosixPath
import re
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
import caps_centre_sweep as sweep
import caps_centre_fine as fine

ROOT = Path(__file__).resolve().parents[1]
RUNS = PurePosixPath('Grothe/LowerAnalytic/CapPlanRuns')
MODULE_PREFIX = 'Grothe.LowerAnalytic.CapPlanRuns.'


def safe_path(root, value):
    if type(value) is not str or not value or '\\' in value or '\x00' in value:
        raise sweep.SweepError('Unsafe manifest path')
    relative = PurePosixPath(value)
    if (relative.is_absolute() or relative.as_posix() != value
            or any(part in ('.', '..') for part in relative.parts)):
        raise sweep.SweepError('Unsafe manifest path: '+value)
    root = Path(root).resolve()
    path = root.joinpath(*relative.parts)
    current = root
    for part in relative.parts:
        current = current/part
        if current.is_symlink():
            raise sweep.SweepError('Refusing symlink in manifest path: '+value)
    if not path.resolve(strict=False).is_relative_to(root):
        raise sweep.SweepError('Manifest path escapes the worktree: '+value)
    return path


def validate_paths(root, manifest):
    for value in manifest.get('provenance', {}).get('files', {}):
        safe_path(root, value)
    entries = manifest.get('entries', [manifest.get('entry', {})])
    for entry in entries:
        for key in ('module_file', 'export', 'export_provenance', 'solved'):
            if key in entry:
                safe_path(root, entry[key])
        if entry.get('historical'):
            safe_path(root, entry['historical']['file'])


def check_layout(root, entry, name, export, solved):
    expected = {'module': MODULE_PREFIX+name,
                'module_file': (RUNS/(name+'.lean')).as_posix(),
                'export': export.as_posix(),
                'export_provenance': export.with_suffix('.provenance.json').as_posix(),
                'solved': solved.as_posix()}
    for key, value in expected.items():
        if entry.get(key) != value:
            raise sweep.SweepError('Manifest '+key+' differs from the frozen generator layout')
    path = safe_path(root, expected['module_file'])
    if path.suffix != '.lean' or PurePosixPath(entry['module_file']).parent != RUNS:
        raise sweep.SweepError('Only own CapPlanRuns .lean source may be restored')
    return path


def stored_source(root, manifest, entry, node):
    tag = manifest.get('campaign_tag')
    if not isinstance(tag, str) or not re.fullmatch(r'[A-Za-z][A-Za-z0-9_]*', tag):
        raise sweep.SweepError('Prepared stored manifest needs its original campaign_tag')
    prefix = tag+'_'+manifest['provenance']['fingerprint'][:12]
    suffix = f"{entry['k']}x{entry['i']}_j{entry['j']}_g{entry['grid']}"
    name = f'Run_centre_{prefix}_{suffix}'
    export = sweep.PLAN/'exports'/f'exp_centre_{prefix}_{suffix}.jsonl'
    solved = sweep.PLAN/'solved'/f'sol_centre_{prefix}_{suffix}.json'
    path = check_layout(root, entry, name, export, solved)
    pieces = [f"{entry['grid']};{p['recipe']};"+';'.join(p['cons']) for p in node['pieces']]
    target = str(safe_path(root, export.as_posix()).resolve())
    # Exact frozen caps_centre_sweep.prepare template, including its final LF.
    source = '\n'.join([
        'import Grothe.LowerAnalytic.CapExport', '', 'namespace Grothe.LowerAnalytic', '',
        'set_option maxRecDepth 100000', '',
        f'def centreNode_{name} : Nat × Nat × List String × List String :=',
        f"  ({entry['k']}, {entry['i']}, {json.dumps(node['ds'])}, [",
        ',\n'.join('    '+json.dumps(piece) for piece in pieces)+'])', '',
        f'def run_{name} : IO Unit := do',
        f'  if ← System.FilePath.pathExists {json.dumps(target)} then',
        '    throw (IO.userError "Export already exists; validate/preserve it before resuming")',
        f"  exportPiecesOn {json.dumps(target)} centreNode_{name} [{entry['j']}] {entry['grid']}", '',
        f'#eval run_{name}', '', 'end Grothe.LowerAnalytic', ''])
    return path, source.encode()


def fine_source(root, manifest):
    entry, prov = manifest['entry'], manifest['provenance']
    spec = fine.grid_spec(*entry['grid_spec'])
    if entry.get('grid') != fine.CUSTOM_GRID or prov != fine.provenance(root, spec):
        raise sweep.SweepError('Explicit-grid source provenance changed')
    node, original = fine.selected(root, f"{entry['k']}:{entry['i']}")
    if spec[0] < 1600 or spec[1] < original['nq']:
        raise sweep.SweepError('Fine research grid may not coarsen the stored grid')
    if (entry.get('stored_grid') != original['grid']
            or any(entry.get(k) != v for k, v in original.items() if k != 'grid')):
        raise sweep.SweepError('Fine manifest centre does not match canonical inputs')
    module = entry.get('module', '')
    prefix = MODULE_PREFIX+'Run_centreFine_'
    ending = f"_{prov['fingerprint'][:12]}_{entry['k']}x{entry['i']}_j{entry['j']}_g3"
    if not isinstance(module, str) or not module.startswith(prefix) or not module.endswith(ending):
        raise sweep.SweepError('Fine module name does not match its manifest')
    tag = module[len(prefix):-len(ending)]
    if not re.fullmatch(r'[A-Za-z][A-Za-z0-9_]*', tag):
        raise sweep.SweepError('Invalid fine campaign tag')
    suffix = tag+ending
    name = 'Run_centreFine_'+suffix
    export = sweep.PLAN/'exports'/'fine'/('exp_centreFine_'+suffix+'.jsonl')
    solved = sweep.PLAN/'solved'/'fine'/('sol_centreFine_'+suffix+'.json')
    path = check_layout(root, entry, name, export, solved)
    pieces = [f"{entry['stored_grid']};{p['recipe']};"+';'.join(p['cons']) for p in node['pieces']]
    target = str(safe_path(root, export.as_posix()).resolve())
    step = Fraction(spec[2])
    # Exact frozen caps_centre_fine.prepare template, including its final LF.
    source = '\n'.join([
        'import Grothe.LowerAnalytic.CapExport', '', 'namespace Grothe.LowerAnalytic', '',
        'set_option maxRecDepth 100000', '',
        f'def centreNode_{name} : Nat × Nat × List String × List String :=',
        f"  ({entry['k']}, {entry['i']}, {json.dumps(node['ds'])}, [",
        ',\n'.join('    '+json.dumps(piece) for piece in pieces)+'])', '',
        f'def run_{name} : IO Unit := do',
        f'  if ← System.FilePath.pathExists {json.dumps(target)} then',
        '    throw (IO.userError "Export already exists; validate/preserve it before resuming")',
        f"  exportPiecesOnGrid {json.dumps(target)} centreNode_{name} [{entry['j']}] "
        f'({spec[0]}, {spec[1]}, ({step.numerator} : ℚ) / {step.denominator})', '',
        f'#eval run_{name}', '', 'end Grothe.LowerAnalytic', ''])
    return [(entry, path, source.encode())]


def restoration_plan(root, manifest):
    root = Path(root).resolve()
    if ('entries' in manifest) == ('entry' in manifest):
        raise sweep.SweepError('Expected exactly one stored or fine manifest shape')
    validate_paths(root, manifest)
    if 'entries' in manifest:
        sweep.check_manifest(root, manifest)
        nodes = {(n['k'], n['i']): n for n in json.loads((root/sweep.PIECES).read_text())}
        plan = []
        for entry in manifest['entries']:
            if not any(key in entry for key in ('module', 'module_file', 'module_source_sha256')):
                continue
            path, source = stored_source(root, manifest, entry, nodes[entry['k'], entry['i']])
            plan.append((entry, path, source))
        kind = 'stored'
    else:
        plan, kind = fine_source(root, manifest), 'fine'
    destinations = set()
    for entry, path, source in plan:
        if path in destinations:
            raise sweep.SweepError('Duplicate scratch destination in manifest')
        destinations.add(path)
        expected = entry.get('module_source_sha256')
        if (not isinstance(expected, str) or not re.fullmatch(r'[0-9a-f]{64}', expected)
                or hashlib.sha256(source).hexdigest() != expected):
            raise sweep.SweepError('Rendered scratch source SHA does not match the manifest. '
                                   'Frozen templates contain absolute I/O targets: restore the original '
                                   'AGENTS worktree path and the pinned helper versions, then retry. '
                                   'No exports or solutions were changed.')
        if path.exists() and (not path.is_file() or path.read_bytes() != source):
            raise sweep.SweepError('Refusing to overwrite foreign or changed scratch source: '+str(path))
    return kind, plan


def restore(root, manifest):
    kind, plan = restoration_plan(root, manifest)  # Preflight every entry before any write.
    restored, preserved = [], []
    for entry, path, source in plan:
        safe_path(root, entry['module_file'])
        if path.exists():
            if not path.is_file() or path.read_bytes() != source:
                raise sweep.SweepError('Scratch source changed after preflight; refusing overwrite')
            preserved.append(entry['module_file'])
            continue
        path.parent.mkdir(parents=True, exist_ok=True)
        safe_path(root, entry['module_file'])
        try:
            with path.open('xb') as stream:
                stream.write(source)
        except FileExistsError:
            if path.is_symlink() or not path.is_file() or path.read_bytes() != source:
                raise sweep.SweepError('Scratch source appeared with different bytes; refusing overwrite')
            preserved.append(entry['module_file'])
        else:
            restored.append(entry['module_file'])
    return {'kind': kind, 'restored': restored, 'preserved': preserved,
            'source_provenance_verified': True,
            'scope': 'Scratch source recovery only; exports, solutions and numerical inputs untouched.'}


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest='command', required=True)
    sub.add_parser('restore').add_argument('manifest', type=Path)
    args = parser.parse_args(argv)
    try:
        result = restore(ROOT, json.loads(args.manifest.read_text()))
        print(json.dumps(result, sort_keys=True))
    except (sweep.SweepError, OSError, KeyError, TypeError, ValueError) as error:
        parser.exit(1, f'FAIL: {error}\n')


if __name__ == '__main__':
    main()
