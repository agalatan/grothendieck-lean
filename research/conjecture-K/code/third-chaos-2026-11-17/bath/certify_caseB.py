#!/usr/bin/env python3
"""Rigorous certificate (C) for Case B of PROOF_BATH.md: J(p, q) < sqrt(2/pi) for 1/9 < p <= 1/5, 3p + 5q < 1.

claude-b9ee, 17 Nov 2026.  Interval arithmetic (Arb through python-flint); no floating-point value decides anything.

Statement certified.  For a box B = [p0, p1] x [q0, q1] (dyadic rationals, p1 + q1 < 1) put
    M_B(x) = sqrt(p1/6) (x^3 - 3x),
    V_B(x) = 1 - p0 + q0 (x^2 - 1)   for |x| < 1,      V_B(x) = 1 - p0 + q1 (x^2 - 1)   for |x| >= 1,
    U(B)   = int_R Psi(M_B(x), V_B(x)) phi(x) dx,     Psi(mu, v) = sqrt(2v/pi) e^{-mu^2/(2v)} + mu erf(mu/sqrt(2v)).
By Lemma 4 of PROOF_BATH.md (Psi is nondecreasing in |mu| and in v), J(p, q) <= U(B) for every (p, q) in B.
The script covers the set {14/128 <= p <= 26/128, 0 <= q <= (1 - 3p)/5}, which contains Case B, by boxes of side
1/128 (bisected if needed) and proves U(B) < sqrt(2/pi) for each of them.

Evaluation of U(B).  U(B) = 2 (I[0,1] + I[1,3] + I[3,6] + I[6,10]) + 2 T, where each I is computed by
acb.integral (Arb's rigorous Gauss-Legendre integration, acb_calc_integrate; the integrand is analytic on the
complex neighbourhoods it uses: polynomials, exp and erf are entire and sqrt is called with the analytic flag, so
Arb returns a non-finite ball whenever the branch cut could be touched) and T bounds the tail:
for x >= 10, Psi(M, V) <= |M| + sqrt(2/pi) sqrt(V) (triangle inequality), sqrt(V_B) <= sqrt(1 + x^2) <= 1 + x,
int_L^oo (x^3 - 3x) phi = (L^2 - 1) phi(L), int_L^oo phi <= phi(L)/L, int_L^oo x phi = phi(L), so
T <= (sqrt(p1/6)(L^2 - 1) + 2 sqrt(2/pi)) phi(L).  The integrand is even in x (Psi is even in mu).

As a cross-check (not needed by the proof, whose Case C is proved by hand in Section 9) the same is run on
{25/128 <= p <= 43/128, 0 <= q <= (1 - 3p)/5}, which contains Case C.

usage: python3 -I certify_caseB.py > certify_caseB.log      (python-flint >= 0.6; about 10 seconds)
Exit status 0 iff every box of Case B is certified.
"""
import sys
import time
from fractions import Fraction as Fr
import flint
from flint import arb, acb, ctx, fmpq

ctx.prec = 80
PI = arb.pi()
S = (2 / PI).sqrt()
SQ2 = arb(2).sqrt()
INV_SQRT_2PI = 1 / (2 * PI).sqrt()
L = 10
STEP = Fr(1, 128)
TOL = arb(2) ** -40


def q_arb(fr):
    return arb(fmpq(fr.numerator, fr.denominator))   # dyadic rationals: exact


def piece(sp1, a, b, lo, hi):
    """rigorous enclosure of int_lo^hi Psi(sp1 (x^3 - 3x), a + b x^2) phi(x) dx"""
    sp1c, ac, bc = acb(sp1), acb(a), acb(b)

    def f(x, analytic):
        m = sp1c * (x * x * x - 3 * x)
        V = ac + bc * x * x
        s = V.sqrt(analytic=analytic)
        psi = S * s * (-(m * m) / (2 * V)).exp() + m * (m / (SQ2 * s)).erf()
        return psi * (-(x * x) / 2).exp() * INV_SQRT_2PI

    res = acb.integral(f, lo, hi, rel_tol=TOL, abs_tol=TOL)
    return res.real


def U(p0, p1, q0, q1):
    P0, P1, Q0, Q1 = q_arb(p0), q_arb(p1), q_arb(q0), q_arb(q1)
    sp1 = (P1 / 6).sqrt()
    inner = piece(sp1, 1 - P0 - Q0, Q0, 0, 1)
    outer = piece(sp1, 1 - P0 - Q1, Q1, 1, 3) + piece(sp1, 1 - P0 - Q1, Q1, 3, 6) + piece(sp1, 1 - P0 - Q1, Q1, 6, L)
    phiL = (arb(-L * L) / 2).exp() * INV_SQRT_2PI
    tail = (sp1 * (L * L - 1) + 2 * S) * phiL         # one-sided tail bound, x >= L
    tail_ball = arb(0).union(2 * tail)                 # contains [0, upper bound of the two-sided tail]
    return 2 * (inner + outer) + tail_ball


def certify(p0, p1, q0, q1, depth, log, stats):
    """certify U(B) < S on B, bisecting up to `depth` times"""
    assert p1 + q1 < 1 and p0 < p1 and q0 < q1
    u = U(p0, p1, q0, q1)
    margin = S - u
    ok = margin > 0
    log.append('%-9s %-9s %-9s %-9s  U = %-34s  S - U = %-34s %s' % (p0, p1, q0, q1, u.str(12, radius=True), margin.str(6, radius=True), 'ok' if ok else 'FAIL'))
    if ok:
        stats['boxes'] += 1
        lo = margin.lower()
        if stats['min'] is None or lo < stats['min'][0]:
            stats['min'] = (lo, (p0, p1, q0, q1))
        return True
    if depth == 0:
        stats['failed'] += 1
        return False
    pm, qm = (p0 + p1) / 2, (q0 + q1) / 2
    return all([certify(a, b, c, d, depth - 1, log, stats) for a, b in ((p0, pm), (pm, p1)) for c, d in ((q0, qm), (qm, q1))])


def cover(pstart, pend, label):
    """cover {pstart <= p <= pend, 0 <= q <= (1-3p)/5} by columns [p0, p0 + STEP] x [0, qtop(p0)]"""
    log, stats = [], {'boxes': 0, 'failed': 0, 'min': None}
    t0 = time.time()
    p0 = pstart
    while p0 < pend:
        p1 = p0 + STEP
        qneed = (1 - 3 * p0) / 5                       # every q of the region with p in [p0, p1] is < qneed
        q0 = Fr(0)
        while q0 < qneed:
            certify(p0, p1, q0, q0 + STEP, 3, log, stats)
            q0 += STEP
        p0 = p1
    print('--- %s: region {%s <= p <= %s, 0 <= q <= (1-3p)/5}, boxes of side %s ---' % (label, pstart, pend, STEP))
    print('    p0        p1        q0        q1         U(B) (Arb ball)                         sqrt(2/pi) - U(B)')
    for line in log:
        print(line)
    lo, box = stats['min']
    print('%s: %d boxes certified, %d failed; smallest certified margin sqrt(2/pi) - U(B) >= %s on box %s; %.1f s'
          % (label, stats['boxes'], stats['failed'], lo.str(6), tuple(str(b) for b in box), time.time() - t0))
    return stats['failed'] == 0


if __name__ == '__main__':
    print('certify_caseB.py, claude-b9ee, python-flint %s, Arb precision %d bits' % (flint.__version__, ctx.prec))
    print('sqrt(2/pi) = %s' % S.str(20, radius=True))
    # sanity (N-level, not part of the proof): on a degenerate box U equals J; compare with numerics.log (numpy
    # quadrature and Monte Carlo there).  The assert in certify() is not used here.
    for (p, q) in [(Fr(1, 9), Fr(0)), (Fr(3, 20), Fr(1, 20)), (Fr(1, 5), Fr(2, 25)), (Fr(3, 10), Fr(1, 50))]:
        print('sanity: J(%s, %s) = U(degenerate box) = %s' % (p, q, U(p, p, q, q).str(15, radius=True)))
    okB = cover(Fr(14, 128), Fr(26, 128), 'CASE B (proof)')
    okC = cover(Fr(25, 128), Fr(43, 128), 'CASE C (cross-check only)')
    print()
    print('CASE B CERTIFIED: J(p,q) < sqrt(2/pi) for 14/128 <= p <= 26/128, 0 <= q <= (1-3p)/5' if okB else 'CASE B NOT CERTIFIED')
    print('Cross-check of Case C: %s' % ('all boxes certified' if okC else 'some box FAILED'))
    sys.exit(0 if okB else 1)
