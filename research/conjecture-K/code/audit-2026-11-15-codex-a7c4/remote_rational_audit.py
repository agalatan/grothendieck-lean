"""Independent exact cut-algebra and coverage audit, with rejection controls.

Agent-ID: codex-a7c4. Run: python3 -I remote_rational_audit.py.
This does not certify profile integrals; remote_replay.py does that separately.
"""
from fractions import Fraction as Q
from pathlib import Path
import importlib.util
import json
import sys

sys.dont_write_bytecode = True
BASE = Path(__file__).resolve().parent
DATA = BASE / 'remote_stein_original'
spec = importlib.util.spec_from_file_location('original_exact', DATA / 'exact.py')
original = importlib.util.module_from_spec(spec)
spec.loader.exec_module(original)


def cover(boxes):
    """Verify by vertical slicing, independent of the original area argument."""
    edges = sorted({x for a, b, c, d in boxes for x in [a, b]})
    if edges[0] != 0 or edges[-1] != Q(3, 20):
        return False
    for a, b, c, d in boxes:
        if not (0 <= a < b <= Q(3, 20) and 0 <= c < d <= Q(31, 4)):
            return False
    for l, r in zip(edges, edges[1:]):
        spans = sorted((c, d) for a, b, c, d in boxes if a <= l and r <= b)
        cursor = Q(0)
        for c, d in spans:
            if c != cursor:
                return False
            cursor = d
        if cursor != Q(31, 4):
            return False
    return True


def direct_numerator(u, A, B, e, beta, t, lam, mu, nu):
    """Formula (11) evaluated before any polynomial expansion; u is nonzero."""
    phi = A + B * u
    primitive = e + A * u + B * u * u / 2
    d = phi - primitive / u
    f = -(phi + beta) / 2 + (2 * t + lam / 3) * u
    g = -d / 2 + (t + mu / 3 - nu / 2) * u
    G = f * f / lam + g * g / mu + primitive - phi + (nu / 3 - 2 * t) * (u*u - 2)
    return u*u*G


def audit_cut(row):
    knots, values = [list(map(Q, row[k])) for k in ['knots', 'phi']]
    beta, t, lam, mu, nu = [Q(row[k]) for k in ['beta', 't', 'lam', 'mu', 'nu']]
    primitives = original.test_pieces(knots, values)
    integral = Q(0)
    for i, (lo, hi, A, B, e) in enumerate(primitives):
        assert A + B * lo == values[i]
        assert e + A*lo + B*lo*lo/2 == integral
        if hi is not None:
            assert A + B*hi == values[i+1]
            integral += (hi-lo)*(values[i]+values[i+1])/2
        coefficients = original.cut_numerator(A, B, e, beta, t, lam, mu, nu)
        assert len(coefficients) <= 5
        # Both sides, after multiplication by u^2, have degree <= 4.
        # Equality at five distinct nonzero rational points proves identity.
        for u in map(Q, [1, 2, 3, 5, 7]):
            assert original.evaluate(coefficients, u) == direct_numerator(u, A, B, e, beta, t, lam, mu, nu)
    return len(primitives)


def main():
    boxes = [list(map(Q, row['box'])) for row in json.loads((DATA/'moment-boxes.json').read_text())]
    boxes.append([Q(7,200), Q(23,500), Q(0), Q(1,5)])
    assert cover(boxes)
    assert not cover(boxes[:-1]), 'The cover checker accepted a missing central rectangle.'
    assert not cover(boxes + [boxes[0]]), 'The cover checker accepted an overlap.'
    rows = json.loads((DATA/'stein-nodes.json').read_text())
    pieces = sum(audit_cut(row) for row in rows)
    # Directly exercise rejection at zero, in the interior, and at infinity.
    assert not original.positive([Q(-1)], Q(0), Q(1))
    assert not original.positive([Q(3,16), Q(-1), Q(1)], Q(0), Q(1))
    assert not original.tail_positive([Q(100), Q(0), Q(-1)], Q(128))
    assert original.positive([Q(1,4), Q(-1), Q(1)], Q(0), Q(1))
    cap = Q(1373953883, 10**9)
    slow = Q('1.3739535256614')
    allowance = Q(3)*Q(51,25)*Q(1,4000)**2/8
    assert allowance == Q(153,3200000000)
    assert slow + Q(9,25000000) - cap == Q(13307,5000000000000)
    # Exact usable error is smaller than the rounded 3.6e-7 allowance.
    gap = cap - slow
    assert gap == Q(1786693,5000000000000)
    # Profile tube: epsilon <= 19/25, lambda=epsilon/(1891/2500),
    # shape distance <= lambda/50000, and sqrt(pi)<2 analytically.
    tube_error = Q(1900,1891)*(Q(9,25000000)+Q(4,50000))
    assert tube_error < Q(81,1000000) < Q(1,10000)
    result = {'agent_id': 'codex-a7c4', 'status': 'PASS',
              'independent_vertical_slice_cover': len(boxes),
              'stein_nodes': len(rows), 'cut_piece_identities': pieces,
              'rejection_controls': ['cover hole', 'cover overlap', 'negative constant',
                                     'negative interior with positive endpoints', 'negative leading tail'],
              'interpolation_allowance': str(allowance),
              'cap_minus_certified_S_lower': str(gap),
              'profile_tube_uniform_error': str(tube_error),
              'scope': 'Exact algebra/coverage only; profile enclosures are separately replayed.'}
    (BASE/'remote_rational_result.json').write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
