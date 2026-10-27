#!/usr/bin/env python3
"""Generate the HJM origin right-witness native-runtime pilot.

Exact rational proposal data only. Lean recomputes each tested panel bound.
`--check` compares all four generated Lean files byte for byte. It does not
run Lean, prove the proposed inequalities, or validate the native inventory.
"""
from __future__ import annotations
import argparse
import hashlib
import json
from fractions import Fraction as Q
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
INPUTS = {
    'origin': ('data/hjm/origin/certificate.json', '7bbfe51ea6e74bac111d6d9e974de6badd0300a6046d89ef08acf6c07786af59'),
    'panels': ('data/hjm/origin/phase-panels-r8.json', '76b2d5f3df4dd7c39d3202d12269650f8b9712158026232f6a1dcd80390ff35d'),
    'witness': ('data/hjm/origin/visible-witnesses.json', 'd7119d6ef8506506ddb62c0acc31a9045e185fac8778880fb34368783b1500a7'),
    'candidate': ('data/hjm/origin/visible-moment-certificate.json', 'b30ab9633b9d83608a2ce455d7ddbc366d48fc233a79a623a868753bd991003c'),
}


def load_inputs():
    data = {}
    for name, (path, digest) in INPUTS.items():
        raw = (ROOT / path).read_bytes()
        if hashlib.sha256(raw).hexdigest() != digest:
            raise ValueError(f'{path}: SHA-256 mismatch')
        data[name] = json.loads(raw)
    origin, panels, witness, cert = (data[k] for k in ('origin', 'panels', 'witness', 'candidate'))
    if not (origin['upstream_commit'] == panels['pinned_upstream_commit'] == witness['upstream_commit']):
        raise ValueError('upstream revision mismatch')
    if panels['input_schema_sha256'] != INPUTS['origin'][1] or witness['panels_sha256'] != INPUTS['panels'][1]:
        raise ValueError('upstream input linkage mismatch')
    if cert['input_sha256'] != {k: INPUTS[{'witnesses':'witness'}.get(k,k)][1]
                               for k in ('origin','panels','witnesses')}:
        raise ValueError('candidate input linkage mismatch')
    if cert['scale'] != 10**18 or cert['order'] != 40 or not cert['sides']['right']['complete']:
        raise ValueError('incomplete or incompatible candidate')
    for part in ('Real', 'Imag'):
        key = 'right' + part
        if origin['definitions'][key] != panels['exact_phase_polynomial_inputs'][key]:
            raise ValueError(f'{key}: numerator mismatch')
    return data


def witness_coefficients(alpha):
    """Independent exact Fraction list version of signedLaguerrePair/sumQ."""
    if len(alpha) != 120:
        raise ValueError('expected 120 witness coefficients')
    out = [[Q(0)] * 120 for _ in range(2)]
    previous, current = [], [Q(1)]
    for n, pair in enumerate(alpha):
        if len(pair) != 2:
            raise ValueError('expected complex witness pair')
        a, b = map(Q, pair)
        for j, v in enumerate(current):
            out[0][j] += (2 * n + 1) * a * v
            out[1][j] += (2 * n + 1) * b * v
        nxt = [Q(0)] * (len(current) + 1)
        for j, v in enumerate(current):
            nxt[j] -= 2 * v
            nxt[j + 1] += v / (n + 1)
        for j, v in enumerate(previous):
            nxt[j] -= v
        previous, current = current, nxt
    return out


def split(a, b):
    if not a < b:
        raise ValueError('empty phase panel')
    c, h = (a + b) / 2, (b - a) / 2
    if 2 * c * h + h * h <= Q(1, 2):
        return [(a, b)]
    return split(a, c) + split(c, b)


def validated_rows(data):
    candidates = [r for r in data['panels']['runs'] if r['side'] == 'right' and r['degree_W'] == 16]
    if len(candidates) != 1:
        raise ValueError('expected one right phase panel run')
    rows, cursor = [], Q(0)
    for i, panel in enumerate(candidates[0]['certificate']):
        a, b = Q(panel['a']), Q(panel['b'])
        if a != cursor:
            raise ValueError('original cover not contiguous')
        for lo, hi in split(a, b):
            if lo != cursor or not (a <= lo < hi <= b):
                raise ValueError('invalid subdivision')
            rows.append((lo, hi, i))
            cursor = hi
    proposal = data['candidate']['sides']['right']['cells']
    if cursor != 8 or len(rows) != 98 or len(proposal) != 98:
        raise ValueError('wrong cover endpoint/count')
    for (a, b, parent), row in zip(rows, proposal):
        if (a, b, parent) != (Q(row['a']), Q(row['b']), row['parent']):
            raise ValueError('candidate cover differs from reconstructed cover')
        if not (type(row['lo']) is int and type(row['hi']) is int and row['lo'] <= row['hi']):
            raise ValueError('bad candidate integer enclosure')
    return rows, proposal


def leanq(q):
    q = Q(q)
    return f'({q.numerator} : ℚ)' if q.denominator == 1 else f'(({q.numerator} : ℚ) / {q.denominator})'


def render(data):
    real, imag = witness_coefficients(data['witness']['sides']['right']['alpha'])
    rows, proposal = validated_rows(data)
    def qlist(xs):
        return '([\n    ' + ',\n    '.join(leanq(x) for x in xs) + '\n  ] : List ℚ)'
    witness = '\n'.join([
        'import Grothe.HJM.OriginWitnessLaguerre',
        'import Grothe.HJM.OriginWitnessData', '',
        '/- Generated by tools/gen_hjm_origin_visible_pilot.py; do not edit. -/',
        'namespace Grothe.HJM.OriginMomentRightWitnessData',
        'open Grothe.HJM.OriginPanel',
        'set_option maxRecDepth 1000000', '',
        'def rightPolynomial : CList :=',
        f'  ⟨{qlist(real)},', f'   {qlist(imag)}⟩', '',
        'theorem rightPolynomial_eq :',
        '    rightPolynomial = Grothe.HJM.Origin.witnessPolynomial',
        '      Grothe.HJM.OriginWitnessData.rightAlpha 120 := by',
        '  native_decide', '',
        'end Grothe.HJM.OriginMomentRightWitnessData', ''])
    edges = [rows[0][0]] + [r[1] for r in rows]
    cells = '\n'.join([
        'import Grothe.HJM.OriginPanelsData',
        'import Grothe.HJM.OriginMomentEnclosure', '',
        '/- Generated by tools/gen_hjm_origin_visible_pilot.py; do not edit. -/',
        'namespace Grothe.HJM.OriginMomentRightCells',
        'open Grothe.HJM.OriginPanel Grothe.HJM.OriginPanels', '',
        'def rightEdgeList : List ℚ := [',
        '  ' + ',\n  '.join(leanq(x) for x in edges) + ']',
        'def rightParentList : List ℕ := [',
        '  ' + ', '.join(str(r[2]) for r in rows) + ']',
        'def rightEdges (i : ℕ) : ℚ := rightEdgeList.getD i 0',
        'def rightParent (i : ℕ) : Panel :=',
        '  rightPanels.getD (rightParentList.getD i 0) right000', '',
        'end Grothe.HJM.OriginMomentRightCells', ''])
    check_data = '\n'.join([
        'import Grothe.HJM.OriginMomentRightWitnessData',
        'import Grothe.HJM.OriginMomentRightCells', '',
        '/- Generated by tools/gen_hjm_origin_visible_pilot.py; do not edit. -/',
        'namespace Grothe.HJM.OriginMomentGenerated',
        'open Grothe.HJM.OriginMoment Grothe.HJM.OriginMomentRightCells',
        'open Grothe.HJM.OriginMomentRightWitnessData', '',
        'def rightLowerIntegers : List ℤ := [',
        '  ' + ',\n  '.join(str(row['lo']) for row in proposal) + ']',
        'def rightLower (i : ℕ) : ℚ := (rightLowerIntegers.getD i 0 : ℚ) / 10 ^ 18',
        'def rightCellCheck (i : ℕ) : Bool := decide (',
        '  rightLower i ≤ (panelBounds (signedCellPolynomial rightPolynomial',
        '    Grothe.HJM.OriginData.rightReal Grothe.HJM.OriginData.rightImag',
        '    (rightParent i) (panelCenter rightEdges i) (panelRadius rightEdges i))',
        '    (panelCenter rightEdges i) (panelRadius rightEdges i) 40).1)', '',
        'end Grothe.HJM.OriginMomentGenerated', ''])
    check = '\n'.join([
        'import Grothe.HJM.OriginMomentRightCheckData', '',
        '/- Generated by tools/gen_hjm_origin_visible_pilot.py; do not edit. -/',
        'namespace Grothe.HJM.OriginMomentGenerated',
        'set_option maxRecDepth 1000000',
        'theorem rightBlock13 :',
        '    ([91, 92, 93, 94, 95, 96, 97] : List ℕ).all rightCellCheck = true := by',
        '  native_decide',
        'end Grothe.HJM.OriginMomentGenerated', ''])
    return {
        'Grothe/HJM/OriginMomentRightWitnessData.lean': witness,
        'Grothe/HJM/OriginMomentRightCells.lean': cells,
        'Grothe/HJM/OriginMomentRightCheckData.lean': check_data,
        'Grothe/HJM/OriginMomentRightCheck13.lean': check,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true', help='compare generated bytes without writing')
    args = parser.parse_args()
    outputs = render(load_inputs())
    errors = []
    for rel, expected in outputs.items():
        path = ROOT / rel
        content = expected.encode('utf-8')
        if args.check:
            if not path.is_file() or path.read_bytes() != content:
                errors.append(rel)
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(content)
    if errors:
        raise SystemExit('generated output mismatch: ' + ', '.join(errors))
    print(('checked' if args.check else 'generated') + f' {len(outputs)} Lean files')

if __name__ == '__main__':
    main()
