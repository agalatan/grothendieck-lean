#!/usr/bin/env python3
"""Regenerate current upper data from canonical repository inputs.

Usage: python3 tools/gen_upper_data.py [data/upper-preprocess/certificate.json] [output.lean]
All parameters and caps come from that JSON. The finite head is independently
checked by Arb and by Lean's native headOK. No private handoff input is needed.
"""
import json
from fractions import Fraction as Q
from pathlib import Path
import sys

def lean_rat(q):
    q = Q(q)
    return f"({q.numerator} : ℚ)" if q.denominator == 1 else f"({q.numerator} : ℚ) / {q.denominator}"

def lean_list(qs, per=4):
    items = [lean_rat(q) for q in qs]
    lines = [", ".join(items[i:i + per]) for i in range(0, len(items), per)]
    return "[" + ",\n   ".join(lines) + "]"


def verify_linear_refinement(d):
    """Check optional derived assembly metadata against the same Hardy input.

    The frozen contour-tail assembly remains separate. These exact rational
    checks bind its sharper linear-coefficient deduction to the displayed
    residual, reciprocal and decimal; no floating estimate is accepted.
    """
    if not __debug__:
        raise ValueError('Reject -O/-OO: exact certificate checks required')
    if 'linear_budget_refinement' not in d:
        return None
    refined = d['linear_budget_refinement']
    slope, compare, head, error = map(Q, (d['slopeQ'], d['compare'], d['headCapQ'], d['energyErrQ']))
    radius, square_cap = Q(d['hardy_radius']), Q(d['hardy_square_cap'])
    assert radius == Q(4149, 4000) and square_cap == Q(7, 4), 'Unsupported canonical Hardy input'
    head_residual = compare+head+error
    linear_lower = slope-head_residual
    assert Q(refined['head_residual']) == head_residual and head_residual >= 0
    assert Q(refined['linear_lower']) == linear_lower and linear_lower > 0
    shifted_budget = (square_cap-linear_lower**2*radius**2)/radius**4
    assert shifted_budget >= 0, 'The shifted square budget is negative'
    tail = Q(refined['hardy_tail'])
    assert 0 < tail <= Q(d['hardy_tail']), 'The claimed tail is not a refinement'
    ratio = shifted_budget/(tail**2*(1-radius**-4))
    assert ratio.numerator*4000**1002 <= ratio.denominator*4149**1002, \
        'The linear-budget tail inequality fails'
    residual = head_residual+tail
    score = slope-residual
    assert Q(refined['delta']) == residual and score > 0
    assert Q(refined['incumbent_score']) == score and Q(refined['exact_bound']) == 1/score
    headline = Q(refined['headline_decimal'])
    assert (headline*10**12).denominator == 1 and headline-Q(1, 10**12) <= 1/score < headline, \
        'The strict decimal endpoint is not the next twelve-place ceiling'
    if 'headline_upper' in refined:
        assert Q(refined['headline_upper']) == headline
    return dict(status='PASS_EXACT_LINEAR_BUDGET_REFINEMENT',
                head_residual=str(head_residual), linear_lower=str(linear_lower),
                shifted_budget=str(shifted_budget), hardy_tail=str(tail),
                tail_integer_left=str(ratio.numerator), tail_integer_right=str(ratio.denominator),
                delta=str(residual), incumbent_score=str(score), exact_bound=str(1/score),
                headline_decimal=refined['headline_decimal'])

def head_float(table, P, Qp, K):
    """sum_{j<K} |c_j - c [j = 0]| in binary64, c_j = [X^j] sum E[n,m] X^(n//2 + m//2) P^n Q^m."""
    def mul(a, b):
        out = [0.0] * K
        for i, x in enumerate(a):
            if x == 0.0: continue
            for j, y in enumerate(b[:K - i]): out[i + j] += x * y
        return out
    Pf, Qf = [float(x) for x in P], [float(x) for x in Qp]
    nmax = max(n for r in table.values() for n, _, _ in r)
    pw = [[1.0] + [0.0] * (K - 1)]
    for _ in range(nmax): pw.append(mul(pw[-1], Pf))
    qm = [1.0] + [0.0] * (K - 1)
    c = [0.0] * K
    for m in range(max(table) + 1):
        if m: qm = mul(qm, Qf)
        if m not in table: continue
        S = [0.0] * K
        for n, num, k in table[m]:
            v, s = num / 2.0 ** k, n // 2
            for j in range(K - s): S[s + j] += v * pw[n][j]
        T = mul(S, qm)
        for j in range(K - m // 2): c[m // 2 + j] += T[j]
    return c[0], sum(abs(x) for x in c[1:])

def main():
    root=Path(__file__).resolve().parents[1]
    src=Path(sys.argv[1]) if len(sys.argv)>1 else root/'data/upper-preprocess/certificate.json'
    out=Path(sys.argv[2]) if len(sys.argv)>2 else root/'Grothe/Upper/Data.lean'
    d=json.loads(src.read_text());P=list(map(Q,d['pList']));R=list(map(Q,d['qList']))
    verify_linear_refinement(d)
    c,cap,err=map(Q,[d['slopeQ'],d['headCapQ'],d['energyErrQ']])
    delta=cap+err+Q(d['compare'])+Q(d['hardy_tail'])
    assert delta==Q(d['delta']) and c-delta==Q(d['incumbent_score'])
    assert 1/(c-delta)==Q(d['exact_bound'])<Q(d['headline_upper'])
    assert sum(map(abs,P))<=1 and sum(map(abs,R))<=1 and R[0]==0
    table={}
    for n,m,e in d['energies']:
        q=Q(e);k=q.denominator.bit_length()-1
        assert q>0 and q.denominator==2**k and (n+m)%2==1 and n+3*m<=501
        table.setdefault(m,[]).append((n,q.numerator,k))
    assert sum(map(len,table.values()))==21168
    h0,tail=head_float(table,P,R,251)
    assert abs(h0-float(c))+tail<float(cap)
    L=['import GrotheKernel.Table\nimport Mathlib.Data.Rat.Init\n']
    L.append(f'''/-!
# Exact data of the upper certificate

Generated by `tools/gen_upper_data.py` from `data/upper-preprocess/certificate.json`.
The raw rounder is `T = F₀ P₃(φ)` and the smoothing matrix is unchanged.
`profileQ`, `aQ`, `bQ`, `etaQ`, `phaseEpsQ`, `phaseStrs` specify it.

The tensor-power correlations are `p(t)=t P(t²)` and `q(t)=t Q(t²)`.
Both coefficient l1 norms are at most one and `Q(0)=0`; no restriction to
only two nonzero auxiliary coefficients is imposed.

`energyStrs` stores 21168 exact dyadic energies of the truncation X,
with `n+3m ≤ 501`. `energyErrQ` is inherited. The selected-block comparison
uses the Gaussian component-error inputs and exact finite masses in
`ComparisonData.lean`. The head and Schur/Hardy contour have independent replays.
Under the documented Gaussian inputs the bound is
`1/(c-{delta}) = {d['exact_bound']} < {d['headline_decimal']}`.
-/

namespace Grothe.Upper

open GrotheKernel
''')
    for name,doc in [('profileQ','The radial profile coefficients.'),('pList','Primary radial correlation coefficients.'),('qList','Auxiliary radial correlation coefficients; constant coefficient zero.')]:
        vals=list(map(Q,d[name]))
        L.append(f'/-- {doc} -/\ndef {name} : List ℚ :=\n  {lean_list(vals)}\n')
    for name,doc in [('aQ','The auxiliary amplitude.'),('bQ','The smoothing direction parameter.'),('etaQ','The smoothing parameter.'),('slopeQ','The working slope.'),('phaseEpsQ','The damping of the phase.'),('energyErrQ','The inherited l1 error of the stored energy table.'),('headCapQ','The certified finite-head residual bound.')]:
        L.append(f'/-- {doc} -/\ndef {name} : ℚ := {lean_rat(Q(d[name]))}\n')
    L.append('/-- Exact monomials of the damped phase polynomial. -/')
    terms=[]
    for term in d['phase']:
        i,j,k=term['powers'];q=Q(term['coefficient'])
        terms.append(f'  "{i},{j},{k}:{q.numerator}/{q.denominator}"')
    assert len(terms)==1140
    L.append('def phaseStrs : List String := [\n'+',\n'.join(terms)+']\n')
    rows=[]
    for m,row in sorted(table.items()):
        text=';'.join(f'{n},{num},{k}' for n,num,k in row)
        rows.append(f'  "{m}:{text}"')
    L.append('/-- Exact stored energies, one row per auxiliary degree. -/')
    L.append('def energyStrs : List String := [\n'+',\n'.join(rows)+']\n')
    L.append('def energyRows : List RowQ := energyStrs.map parseRow\n')
    L.append('end Grothe.Upper')
    out.write_text('\n'.join(L)+'\n')
    print(f'wrote {out}: 21168 entries; unrefined source upper {d["headline_decimal"]}; '
          'the sharper linear-budget endpoint is assembled in PolynomialBridge.lean')


if __name__=='__main__':main()
