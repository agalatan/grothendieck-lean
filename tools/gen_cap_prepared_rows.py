#!/usr/bin/env python3
"""Reproduce complete prepared row sources, without running Lean.

Agent-ID: codex-15b7. The immutable historical source seals and exact-centre
input plans are retained. A separate binding names today's canonical piece
writer; old writer hashes are never rewritten. Canonical CI checks feasibility.
"""
import argparse
import contextlib
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import re
import sys
import tempfile
import warnings

sys.dont_write_bytecode = True
from nodecaps_prepared_renderers import anchors12, anchors13, assembly12, assembly13

ROOT = Path(__file__).resolve().parents[1]
BASE = Path('data/caps-m/plan/row-certificates')
SHARED = {'Grothe/LowerAnalytic/CapPieceRange.lean',
          'Grothe/LowerAnalytic/CapPieceNodes.lean', 'Grothe/LowerAnalytic/CapRows.lean'}


def require(ok, message):
    if not ok:
        raise ValueError(message)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def render(root, row):
    root = Path(root).resolve()
    binding = json.loads((root / BASE / 'prepared-binding.json').read_text())
    writer = root / binding['writer_path']
    require(sha(writer.read_bytes()) == binding['writer_sha256'], 'canonical writer binding changed')
    policy_path = binding.get('coverage_policy')
    if policy_path is not None:
        require(binding['format'] == 'nodecaps-prepared-source-binding/v2'
                and policy_path == 'data/caps-m/plan/row-certificates/coverage-slicing.json', 'unsupported coverage source binding')
        require(sha((root / policy_path).read_bytes()) == binding['coverage_policy_sha256'], 'coverage policy changed')
    seal_path = root / BASE / f'row{row}-source.json'
    require(sha(seal_path.read_bytes()) == binding['source_manifests_sha256'][seal_path.name],
            'historical source seal changed')
    seal = json.loads(seal_path.read_text())
    for name, digest in seal['inputs_sha256'].items():
        # These effective-tree dependencies are separately checked by the shared
        # active registry and the explicit writer binding. All actual row inputs
        # and the kernel must still match the original source generation.
        if name in SHARED or name == binding['writer_path']:
            continue
        require(sha((root / name).read_bytes()) == digest, 'prepared input changed: ' + name)
    plan = json.loads((root / BASE / f'row{row}.json').read_text())
    require(plan['row'] == row and plan['row_complete_research_gate'] is True
            and plan['capPad'] == '1/100000000000' and plan['cap_up'] == '0', 'incomplete row input gate')
    centres = plan['centres']
    require(len(centres) == 88 and len({c['key'] for c in centres}) == 88
            and all(c['exact_matrix_replayed'] is True for c in centres), 'missing exact centre input')
    anchor = json.loads((root / BASE / f'row{row}-anchors.json').read_text())
    outputs = (anchors12 if row == 12 else anchors13)(anchor)
    pieces = root / BASE / f'row{row}-pieces.json'
    selection = root / BASE / f'row{row}-selection.json'
    nodes = json.loads(pieces.read_text())
    indices = sorted(n['i'] for n in nodes)
    ranges = [(p['lo'], p['hi']) for p in anchor['ranges']]
    outputs[f'Grothe/LowerAnalytic/CapRow{row}/Assembly.lean'] = (
        assembly12(indices, ranges) if row == 12 else assembly13(row, indices, ranges))
    # The canonical writer operates only on an isolated output root.
    spec = importlib.util.spec_from_file_location('canonical_caps_piece_writer', writer)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    with tempfile.TemporaryDirectory(prefix=f'nodecaps{row}-') as name:
        module.ROOT = Path(name)
        if policy_path is not None:
            target = module.ROOT / policy_path
            target.parent.mkdir(parents=True)
            target.write_bytes((root / policy_path).read_bytes())
        with warnings.catch_warnings(), contextlib.redirect_stdout(io.StringIO()):
            warnings.simplefilter('ignore', ResourceWarning)
            module.write_nodes(str(pieces), str(selection))
        outputs.update({p.relative_to(name).as_posix(): p.read_bytes()
                        for p in Path(name).rglob('*.lean')})
    expected = {n: h for n, h in seal['files_sha256'].items() if n not in SHARED}
    if policy_path is not None:
        # Coverage checks have a separately bound equivalent implementation.
        # The original certificate inputs, seals and all D/R/N bytes stay fixed.
        pattern = rf'Grothe/LowerAnalytic/CapPieces/C{row}x\d+(?:_\d+)?\.lean'
        expected = {n: h for n, h in expected.items() if not re.fullmatch(pattern, n)}
        expected.update({n: h for n, h in binding['coverage_sources_sha256'].items() if re.fullmatch(pattern, n)})
    require(set(outputs) == set(expected), 'missing or unexpected generated source')
    for name, data in outputs.items():
        require(sha(data) == expected[name], 'canonical reproduction differs: ' + name)
    return outputs


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args(argv)
    try:
        outputs = {}
        for row in (12, 13):
            outputs.update(render(ROOT, row))
        row14_binding = ROOT / BASE / 'row14-binding.json'
        if row14_binding.exists():
            from nodecaps_row14_render import render_sealed
            outputs.update(render_sealed(ROOT))
        else:
            require(not (ROOT / BASE / 'row14.json').exists() and
                    not (ROOT / 'Grothe/LowerAnalytic/CapRow14/Assembly.lean').exists(),
                    'Row14 inputs/assembly require an explicit complete source binding')
        for name, data in outputs.items():
            path = ROOT / name
            require(not path.is_symlink(), 'refusing source symlink: ' + name)
            if args.check:
                require(path.is_file() and path.read_bytes() == data, 'source differs: ' + name)
            else:
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_bytes(data)
        print(f'{len(outputs)} prepared row files reproduced; native verification pending canonical CI')
    except (ValueError, KeyError, OSError) as error:
        parser.exit(1, 'FAIL: ' + str(error) + '\n')


if __name__ == '__main__':
    main()
