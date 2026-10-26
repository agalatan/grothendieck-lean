#!/usr/bin/env python3
"""Prepare explicit-grid centre SEARCH exports; never edit certificate grids or padding.

Example (preparation does not run Lean):
  python3 tools/caps_centre_fine.py prepare --node 14:200 --tag Codex15b7Fine \
    --np 3200 --nq 2048 --step 1/400 --out data/caps-m/plan/fine-14x200.json
Build the single scratch module printed by prepare, with one local process.
Then use validate MANIFEST and solve MANIFEST. Finer grids may need substantially
more memory; this helper never launches a build, publishes caches or changes data.
All explicit grids use label3 AND grid_spec=[NP,NQ,exact_step], so they cannot be
adopted as stored-grid centre evidence. Exact search feasibility is not Lean verification.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import re
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
import caps_centre_sweep as sweep

ROOT = Path(__file__).resolve().parents[1]
CUSTOM_GRID = 3


def grid_spec(np, nq, step):
    if type(np) is not int or type(nq) is not int or np <= 0 or nq <= 0:
        raise sweep.SweepError('Grid dimensions must be positive integers')
    if type(step) not in (str, int):
        raise sweep.SweepError('Grid step must be an exact rational string')
    step = Q(step)
    if step <= 0 or np*step != 8:
        raise sweep.SweepError('Research grid must retain the radial range [0,8]')
    return [np, nq, str(step)]


def provenance(root, spec):
    base = sweep.provenance(root)
    files = dict(base['files'])
    for name in ['caps_centre_fine.py', 'caps_centre_sweep.py', 'caps_centre_repair.py']:
        files['tools/'+name] = sweep.sha(root/'tools'/name)
    value = {'files': files, 'grid': CUSTOM_GRID, 'grid_spec': spec,
             'baseline_capPad': base['baseline_capPad'],
             'cap_up_convention': base['cap_up_convention']}
    return dict(value, fingerprint=hashlib.sha256(sweep.canonical(value)).hexdigest())


def preserve_json(path, value):
    if path.exists() and json.loads(path.read_text()) != value:
        raise sweep.SweepError(f'Refusing to overwrite changed output: {path}')
    sweep.write_json(path, value)


def selected(root, node):
    if not re.fullmatch(r'\d+:\d+', node):
        raise sweep.SweepError('Node must be k:i')
    k, i = map(int, node.split(':'))
    if k not in range(12, 16):
        raise sweep.SweepError('Only rows12–15 centres are supported')
    nodes = json.loads((root/sweep.PIECES).read_text())
    entries = [e for e in sweep.centres(nodes) if (e['k'], e['i']) == (k, i)]
    if len(entries) != 1:
        raise sweep.SweepError('Unknown or ambiguous centre node')
    return next(n for n in nodes if (n['k'], n['i']) == (k, i)), entries[0]


def prepare(root, node_key, tag, spec):
    if not re.fullmatch(r'[A-Za-z][A-Za-z0-9_]*', tag):
        raise sweep.SweepError('Tag must be a Lean identifier fragment')
    spec = grid_spec(*spec)
    node, entry = selected(root, node_key)
    if spec[0] < 1600 or spec[1] < entry['nq']:
        raise sweep.SweepError('Fine research grid may not coarsen the stored grid')
    prov = provenance(root, spec)
    entry = dict(entry, stored_grid=entry['grid'], grid=CUSTOM_GRID, grid_spec=spec)
    suffix = f"{tag}_{prov['fingerprint'][:12]}_{entry['k']}x{entry['i']}_j{entry['j']}_g3"
    name = 'Run_centreFine_'+suffix
    export = sweep.PLAN/'exports'/'fine'/('exp_centreFine_'+suffix+'.jsonl')
    module = Path('Grothe/LowerAnalytic/CapPlanRuns')/(name+'.lean')
    pcs = [f"{entry['stored_grid']};{p['recipe']};"+';'.join(p['cons']) for p in node['pieces']]
    target = str((root/export).resolve())
    step = Q(spec[2])
    source = '\n'.join([
        'import Grothe.LowerAnalytic.CapExport', '', 'namespace Grothe.LowerAnalytic', '',
        'set_option maxRecDepth 100000', '',
        f'def centreNode_{name} : Nat × Nat × List String × List String :=',
        f"  ({entry['k']}, {entry['i']}, {json.dumps(node['ds'])}, [",
        ',\n'.join('    '+json.dumps(piece) for piece in pcs)+'])', '',
        f'def run_{name} : IO Unit := do',
        f'  if ← System.FilePath.pathExists {json.dumps(target)} then',
        '    throw (IO.userError "Export already exists; validate/preserve it before resuming")',
        f"  exportPiecesOnGrid {json.dumps(target)} centreNode_{name} [{entry['j']}] "
        f'({spec[0]}, {spec[1]}, ({step.numerator} : ℚ) / {step.denominator})', '',
        f'#eval run_{name}', '', 'end Grothe.LowerAnalytic', ''])
    entry.update(module='Grothe.LowerAnalytic.CapPlanRuns.'+name,
                 module_file=module.as_posix(), module_source_sha256=hashlib.sha256(source.encode()).hexdigest(),
                 export=export.as_posix(), export_provenance=export.with_suffix('.provenance.json').as_posix(),
                 solved=(sweep.PLAN/'solved'/'fine'/('sol_centreFine_'+suffix+'.json')).as_posix())
    manifest = {'schema': 1, 'purpose': 'explicit finer-grid centre SEARCH, not stored-grid or Lean verification',
                'provenance': prov, 'entry': entry}
    sidecar = {'fingerprint': prov['fingerprint'], 'key': sweep.key_string(entry), 'grid': CUSTOM_GRID,
               'node_sha256': entry['node_sha256'], 'piece_sha256': entry['piece_sha256'],
               'module_source_sha256': entry['module_source_sha256']}
    module_path, side_path = root/module, root/entry['export_provenance']
    if module_path.exists() and module_path.read_text() != source:
        raise sweep.SweepError('Refusing to overwrite a changed scratch module')
    if (root/export).exists():
        validate(root, manifest)
        return manifest
    preserve_json(side_path, sidecar)
    module_path.parent.mkdir(parents=True, exist_ok=True)
    module_path.write_text(source)
    return manifest


def validate(root, manifest):
    entry, prov = manifest['entry'], manifest['provenance']
    spec = grid_spec(*entry['grid_spec'])
    if entry.get('grid') != CUSTOM_GRID or prov != provenance(root, spec):
        raise sweep.SweepError('Explicit-grid source provenance changed')
    _, original = selected(root, f"{entry['k']}:{entry['i']}")
    if spec[0] < 1600 or spec[1] < original['nq']:
        raise sweep.SweepError('Fine research grid may not coarsen the stored grid')
    if (entry.get('stored_grid') != original['grid'] or
            any(entry.get(k) != v for k, v in original.items() if k != 'grid')):
        raise sweep.SweepError('Fine manifest centre does not match canonical inputs')
    # Reuse the stored-grid parser's checks of scratch bytes, cap/location,
    # constraints and matrix dimensions. Its expected grid is this entry's3.
    row = sweep.export_record(root, {'provenance': prov}, entry)
    if row is None:
        return None
    if row.get('grid_spec') != spec:
        raise sweep.SweepError('Explicit export grid_spec is missing or changed')
    matrices = [row['N']]+[c[name] for c in row['cons'] for name in ['A', 'B']]
    if any(type(value) not in (str, int) for matrix in matrices for line in matrix for value in line):
        raise sweep.SweepError('Matrix coefficients must be exact rational strings or integers')
    from caps_centre_repair import load_exports, validate_matrix
    parsed = list(load_exports(root/entry['export']))[0]
    validate_matrix(parsed['N'])
    for constraint in parsed['cons']:
        validate_matrix(constraint['A'])
        validate_matrix(constraint['B'])
    return parsed


def solve(root, manifest):
    exported = validate(root, manifest)
    if exported is None:
        raise sweep.SweepError('Fine export is not complete')
    entry = manifest['entry']
    path = root/entry['solved']
    prov = {'fingerprint': manifest['provenance']['fingerprint'],
            'export_sha256': sweep.sha(root/entry['export']), 'grid_spec': entry['grid_spec'],
            'baseline_capPad': manifest['provenance']['baseline_capPad'],
            'cap_up_convention': manifest['provenance']['cap_up_convention']}
    from caps_centre_repair import checked_solution
    if path.exists():
        rows = json.loads(path.read_text())
        if len(rows) != 1 or rows[0].get('provenance') != prov:
            raise sweep.SweepError('Existing fine solution has stale provenance')
        result = rows[0]
    else:
        import caps_plan
        result = caps_plan.verdict(exported)
        result['grid_spec'], result['provenance'] = entry['grid_spec'], prov
    if result.get('grid_spec') != entry['grid_spec']:
        raise sweep.SweepError('Solved grid_spec does not match export')
    sweep.validate_solution(exported, result, checked_solution)
    preserve_json(path, [result])
    return result


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest='command', required=True)
    prep = sub.add_parser('prepare')
    prep.add_argument('--node', required=True)
    prep.add_argument('--tag', required=True)
    prep.add_argument('--np', type=int, default=3200)
    prep.add_argument('--nq', type=int, default=2048)
    prep.add_argument('--step', default='1/400')
    prep.add_argument('--out', type=Path, required=True)
    for command in ['validate', 'solve']:
        sub.add_parser(command).add_argument('manifest', type=Path)
    args = parser.parse_args(argv)
    try:
        if args.command == 'prepare':
            manifest = prepare(ROOT, args.node, args.tag, [args.np, args.nq, args.step])
            preserve_json(args.out, manifest)
            if validate(ROOT, manifest) is None:
                print(manifest['entry']['module'])
        else:
            manifest = json.loads(args.manifest.read_text())
            if args.command == 'validate':
                row = validate(ROOT, manifest)
                print(json.dumps({'complete': row is not None, 'grid': CUSTOM_GRID,
                                  'grid_spec': manifest['entry']['grid_spec']}))
            else:
                result = solve(ROOT, manifest)
                print(json.dumps({k: result.get(k) for k in ['k', 'i', 'j', 'grid', 'grid_spec', 'status', 'cap_up']}))
    except (sweep.SweepError, OSError, ValueError, KeyError) as error:
        parser.exit(1, f'FAIL: {error}\n')


if __name__ == '__main__':
    main()
