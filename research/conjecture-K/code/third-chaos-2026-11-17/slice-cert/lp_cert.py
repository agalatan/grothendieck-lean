# claude-b9ee, 17 Nov 2026.  PART B: restricted rotation LP, rigorous certificate.
# For F in V_3(n) and f = sign F: x_r = cos(pi r/N) U + sin(pi r/N) V (U, V iid gamma_n), sigma_r = f(x_r), sigma_{r+N} = -sigma_r.
# Mehler: E[sigma_r sigma_{r+k}] = sum_{m odd} c_k^m W_m(f), c_k = cos(k pi/N).  Almost surely sigma has 1 or 3 sign
# changes per half-turn (sign of an odd trigonometric polynomial of degree <= 3).  For integer weights w_k with
#   delta_m := sum_k w_k c_k^m >= 0 for every odd m != 3  and  delta_3 > 0:
#   delta_3 W_3(f) <= sum_{m odd} delta_m W_m(f) = E[sum_k w_k A_sigma(k)] <= t := max over restricted patterns of
#   sum_k w_k A_sigma(k),  A_sigma(k) = (1/N) sum_{r<N} sigma_r sigma_{r+k};  and (E|F|)^2 <= W_3(sign F) ||F||_2^2.
# The LP is solved in floating point only to FIND w.  The certificate: integer weights, an exact integer maximum over
# all restricted patterns, a hand lemma (checked here) giving delta_m >= 0 for every m >= 1, an Arb enclosure of delta_3.
# Run:  python3 -I lp_cert.py      (needs numpy, scipy, python-flint)
import itertools, math, time, sys
from fractions import Fraction as Fr
import numpy as np
from scipy.optimize import linprog
from flint import arb, fmpq, ctx
ctx.prec = 256

def restricted_patterns(N):
    """All sigma in {+-1}^N with sigma_0 = +1 whose antiperiodic extension (sigma_{r+N} = -sigma_r) has exactly 1 or 3
    sign changes among the N gaps (r, r+1), r = 0..N-1.  Cuts r_1 < ... < r_c (c = 1, 3) at gaps; sigma_r = (-1)^#{j: r_j < r}.
    The gap (N-1, N) is a change iff the number of cuts at gaps < N-1 is even; so the number of changes is exactly c."""
    S = []
    for c in (1, 3):
        cuts = np.array(list(itertools.combinations(range(N), c)), dtype=np.int16)          # (P, c)
        cnt = (cuts[:, :, None] < np.arange(N, dtype=np.int16)[None, None, :]).sum(1)       # (P, N)
        S.append((1 - 2*(cnt % 2)).astype(np.int8))
    S = np.vstack(S)
    ext = np.hstack([S, -S])
    ch = (ext[:, 1:N + 1] != ext[:, 0:N]).sum(1)
    assert set(np.unique(ch).tolist()) <= {1, 3} and len(S) == N + math.comb(N, 3) and (S[:, 0] == 1).all()
    assert len(np.unique(S, axis=0)) == len(S)
    return S

def autocorr(S, N, lags):                 # NA[s, i] = N * A_sigma(lags[i]) = sum_{r<N} sigma_r sigma_{r+k}  (exact integers)
    ext = np.hstack([S, -S]).astype(np.int16)
    return np.stack([(ext[:, 0:N]*ext[:, k:k + N]).sum(1, dtype=np.int64) for k in lags], 1)

def solve_lp(N, S, M=6001):
    K = (N - 1)//2
    U = np.unique(autocorr(S, N, range(1, K + 1)), axis=0)/N
    ck = np.cos(np.arange(1, K + 1)*np.pi/N); ms = np.arange(1, M + 1, 2)
    C = ck[None, :]**ms[:, None]
    A_ub = np.vstack([np.hstack([U, -np.ones((len(U), 1)), np.zeros((len(U), 1))]),
                      np.hstack([-C, np.zeros((len(ms), 1)), -np.ones((len(ms), 1))])])
    b_ub = np.concatenate([np.zeros(len(U)), -(ms == 3).astype(float)])
    r = linprog(np.r_[np.zeros(K), 1, 1], A_ub=A_ub, b_ub=b_ub, bounds=[(None, None)]*(K + 1) + [(0, None)], method='highs')
    assert r.status == 0
    return r.fun, r.x[:K], r.x[K + 1], len(U)

def certify(N):
    t0 = time.time(); K = (N - 1)//2
    S = restricted_patterns(N)
    lpval, w, mu, nu = solve_lp(N, S)
    # integer weights from the LP solution: divide by the smallest |w_k| > 1e-6 and rationalize
    nz = [k for k in range(K) if abs(w[k]) > 1e-6]
    base = min(abs(w[k]) for k in nz)
    Wq = {k + 1: Fr(w[k]/base).limit_denominator(1000) for k in nz}
    den = math.lcm(*[x.denominator for x in Wq.values()])
    support = sorted((k, int(x*den)) for k, x in Wq.items() if x != 0)
    lags = [k for k, _ in support]; Wi = np.array([x for _, x in support], dtype=np.int64)
    # exact maximum over ALL restricted patterns:  N t = max_sigma sum_k w_k (N A_sigma(k))   (int64, |values| < 2^20)
    NA = autocorr(S, N, lags); vals = NA @ Wi
    tN = int(vals.max()); arg = int(vals.argmax()); t = Fr(tN, N)
    sig = S[arg]; e = np.hstack([sig, -sig]); nch = int((e[1:N + 1] != e[0:N]).sum())
    ties = int((vals == tN).sum())
    # Lemma: if every positive weight sits at a cosine >= every cosine carrying a negative weight, all cosines are
    # positive and sum(positive weights) >= sum |negative weights|, then delta_m >= 0 for every m >= 1.
    c = {k: arb.cos_pi(arb(k)/N) for k in lags}
    P = [(k, x) for k, x in support if x > 0]; Ng = [(k, x) for k, x in support if x < 0]
    lemma = all(bool(c[k] > 0) for k in lags) and bool(min(c[k] for k, _ in P) > max(c[k] for k, _ in Ng)) \
        and sum(x for _, x in P) >= -sum(x for _, x in Ng)
    sweep_ok = all(bool(sum((x*c[k]**m for k, x in support), arb(0)) > 0) for m in range(1, 20002, 2) if m != 3)
    D = sum((x*c[k]**3 for k, x in support), arb(0)); assert D > 0
    cN = arb(fmpq(t.numerator, t.denominator))/D
    print('N = %d: %d restricted patterns (= N + C(N,3)), %d distinct autocorrelation rows, lags k = 1..%d' % (N, len(S), nu, K))
    print('   floating LP (odd m <= 6001): value %.9f, mu = %.1e, support: %s' % (lpval, mu, ', '.join('w_%d = %.6f' % (k + 1, w[k]) for k in nz)))
    print('   integer weights (LP solution / %.6f): %s   (sum = %d)' % (base*den, ', '.join('w_%d = %d' % kx for kx in support), int(Wi.sum())))
    print('   exact max over the restricted patterns: N t = %d, t = %s; attained by %d pattern(s), e.g. one with %d sign change(s) per half-turn' % (tN, t, ties, nch))
    print('   delta_m = %s:  >= 0 for every m >= 1 by the lemma: %s;  Arb sweep, odd m <= 20001 (m != 3): %s' % (
          ' '.join('%+d c_%d^m' % (x, k) for k, x in support), lemma, 'all > 0' if sweep_ok else 'FAIL'))
    print('   delta_3 = %s' % D.str(25))
    print('   CERTIFIED: (E|F|)^2 <= W_3(sign F) ||F||^2 <= c_%d ||F||^2, c_%d = t/delta_3 = %s, sqrt = %s  [LP %.9f]  (%.1fs)' % (
          N, N, cN.str(20), cN.sqrt().str(20), lpval, time.time() - t0), flush=True)
    assert lemma and sweep_ok
    return dict(t=t, support=support, D=D, cN=cN, lpval=lpval)

if __name__ == '__main__':
    print('Python %s, numpy %s, Arb precision %d bits' % (sys.version.split()[0], np.__version__, ctx.prec))
    out = {}
    for N in (21, 31, 45, 61, 121):
        out[N] = certify(N); print()
    r = out[61]; t, support, cN = r['t'], r['support'], r['cN']
    assert support == [(11, 5), (12, -4), (27, -1)] and t == Fr(40, 61)
    # one-cut pattern: A(k) = 1 - 2k/N, and sum w_k = 0, so t = -(2/N) sum k w_k = -(2/61)(55 - 48 - 27) = 40/61
    assert Fr(-2*sum(k*x for k, x in support), 61) == Fr(40, 61)
    print('MAIN RESULT (N = 61): for every n and every F in V_3(n):  (E|F|)^2 <= c_61 ||F||_2^2,')
    print('   c_61 = (40/61) / (5 cos^3(11 pi/61) - 4 cos^3(12 pi/61) - cos^3(27 pi/61)) in %s' % cN.str(18))
    print('   hence (E|F|)^2 <= 0.7878635 ||F||_2^2 and E|F| <= 0.8876168 ||F||_2:  %s, %s' % (bool(cN < arb('0.7878635')), bool(cN.sqrt() < arb('0.8876168'))))
    assert cN < arb('0.7878635') and cN.sqrt() < arb('0.8876168')
    r = out[121]
    print('BONUS (N = 121): c_121 = (%s) / (%s) in %s: (E|F|)^2 <= 0.7870815 ||F||_2^2, E|F| <= 0.8871762 ||F||_2:  %s, %s' % (
          r['t'], ' '.join('%+d cos^3(%d pi/121)' % (x, k) for k, x in r['support']), r['cN'].str(18),
          bool(r['cN'] < arb('0.7870815')), bool(r['cN'].sqrt() < arb('0.8871762'))))
    assert r['cN'] < arb('0.7870815') and r['cN'].sqrt() < arb('0.8871762')
    # N-level information: the restriction is essential.  N = 21, same weights, maximum over ALL 2^20 patterns:
    N = 21; sup21 = out[21]['support']
    allS = ((np.arange(2**(N - 1))[:, None] >> np.arange(N - 1)) & 1).astype(np.int8)*2 - 1
    allS = np.hstack([np.ones((allS.shape[0], 1), np.int8), allS])
    tall = int((autocorr(allS, N, [k for k, _ in sup21]) @ np.array([x for _, x in sup21], dtype=np.int64)).max())
    print('info (N = 21, same weights): the maximum over all 2^20 sign patterns is %s, giving %.4f instead of %.6f' % (
          Fr(tall, N), float((arb(fmpq(tall, N))/out[21]['D']).mid()), float(out[21]['cN'].mid())))
