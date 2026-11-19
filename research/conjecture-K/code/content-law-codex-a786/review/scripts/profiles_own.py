# Review of codex-a786's content-law package (worker of claude-b9ee, 16 Nov 2026).  N.
# Independent recomputation of the radial profiles Gamma_A, Gamma_B, Gamma_0 of the six degree-5 rows, from the
# definitions of CONTENT_LEMMA_D5.md section 1 (not from prof.py's code path: own polynomials, own z-rule), and
# comparison with the stored tables out/prof_<k>.npz of the degree-5 study.  Also checks the facts used by the package's
# admissibility argument (PROOFS section 6).
#   A+-(z; s) = L'(z) +- s D(z),  L' = z (l + beta(|z|^2 - 2)) + nu5 e32(z),  D = 1 - bA e11(z) - bB e20(z),
#   e11 = |z|^2 - 1,  e20 = z^2/sqrt 2,  e32 = z (|z|^4 - 6|z|^2 + 6)/sqrt 12,
#   Gamma_A(s) = Re E_z[conj(e11)(ph A+ - ph A-)],  Gamma_B(s) = Re E_z[conj(e20)(ph A+ - ph A-)],  Gamma_0(s) = Re E_z[ph A+ - ph A-].
# usage: profiles_own.py <rows.json of the package> <dir with prof_<k>.npz> <outdir>
import sys, json, math, time
import numpy as np
from numpy.polynomial.legendre import leggauss

ROWK = {'0.80': 5, '0.82': 7, '0.84': 9, '0.845': 10, '0.85': 11, '0.855': 12}

def zrule(npan=60, nq=8, nth_half=480, R=7.0):
    """own rule: Gauss-Legendre panels in r with density 2 r exp(-r^2); midpoints in theta on [0, pi] (z -> conj z symmetry)."""
    x, w = leggauss(nq); ed = np.linspace(0.0, R, npan + 1)
    r = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(npan)])
    wr = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(npan)]) * 2 * r * np.exp(-r * r)
    th = (np.arange(nth_half) + 0.5) * np.pi / nth_half
    Rm, TH = np.meshgrid(r, th, indexing='ij')
    W = np.repeat(wr, nth_half) / nth_half
    return (Rm * np.exp(1j * TH)).ravel(), W, float(W.sum())

def tables(rec, S, rule):
    z, W, tot = rule
    T = (z * np.conj(z)).real
    e11 = T - 1.0; e20 = z * z / math.sqrt(2.0); e32 = z * (T * T - 6.0 * T + 6.0) / math.sqrt(12.0)
    Lp = z * (rec['l'] + rec['beta'] * (T - 2.0)) + rec['nu5'] * e32
    D = 1.0 - rec['bA'] * e11 - rec['bB'] * e20
    GA = np.zeros(len(S)); GB = np.zeros(len(S)); G0 = np.zeros(len(S))
    for i, s in enumerate(S):
        Ap = Lp + s * D; Am = Lp - s * D
        d = Ap / np.abs(Ap) - Am / np.abs(Am)
        GA[i] = float(np.real((e11 * d) @ W)); GB[i] = float(np.real((np.conj(e20) * d) @ W)); G0[i] = float(np.real(d @ W))
    return GA / tot, GB / tot, G0 / tot

if __name__ == '__main__':
    rows = json.load(open(sys.argv[1])); refdir = sys.argv[2]; outdir = sys.argv[3]
    full = len(sys.argv) > 4 and sys.argv[4] == 'full'
    rule = zrule(); rule2 = zrule(npan=44, nq=10, nth_half=331, R=6.6)       # second, coarser rule: an error estimate of mine
    print('own z-rule: %d nodes (weights sum to %.15f before normalisation); check rule: %d nodes' % (len(rule[0]), rule[2], len(rule2[0])))
    zr, Wr, _ = rule; Tz = np.abs(zr) ** 2
    print('E|e11| = %.6f (2/e = %.6f)   E|e20| = %.6f (1/sqrt2 = %.6f)   E|e32|^2 = %.6f   E|e11|^2 = %.6f' % (
        np.abs(Tz - 1) @ Wr, 2 / math.e, (Tz / math.sqrt(2)) @ Wr, 1 / math.sqrt(2), (Tz * (Tz * Tz - 6 * Tz + 6) ** 2 / 12) @ Wr, ((Tz - 1) ** 2) @ Wr))
    for row in rows:
        k = ROWK[row['t']]; t0 = time.time()
        rec = {a: float(row[a]) for a in ('l', 'beta', 'bA', 'bB', 'nu5')}          # the PACKAGE's 10-decimal row data
        ref = np.load('%s/prof_%d.npz' % (refdir, k)); S = ref['S']
        GA, GB, G0 = tables(rec, S, rule)
        idx = np.unique(np.concatenate([np.arange(0, len(S), 16), [1, 2, 5, len(S) - 1]]))
        GA2, GB2, G02 = tables(rec, S[idx], rule2)
        dref = [np.abs(GA - ref['GA']).max(), np.abs(GB - ref['GB']).max(), np.abs(G0 - ref['G0']).max()]
        drule = [np.abs(GA[idx] - GA2).max(), np.abs(GB[idx] - GB2).max(), np.abs(G0[idx] - G02).max()]
        hA = (GA + 0.4 * G0)[1:] / S[1:]; hB = (GB + 0.3 * G0)[1:] / S[1:]
        print('t=%-5s (prof_%d): max|own - stored| GA %.1e GB %.1e G0 %.1e | own rule vs own check rule (%d pts) %.1e %.1e %.1e | sup|GA| %.4f (bound 2E|e11| = %.4f) sup|GB| %.4f (bound sqrt2) sup|G0| %.4f (bound 2)'
              % (row['t'], k, dref[0], dref[1], dref[2], len(idx), drule[0], drule[1], drule[2], np.abs(GA).max(), 4 / math.e, np.abs(GB).max(), np.abs(G0).max()))
        print('        G(s)/s at s = %.4g: A %.5f B %.5f 0 %.5f | tilted h_A = (GA+0.4 G0)(s)/s in [%.4f, %.4f], h_B = (GB+0.3 G0)(s)/s in [%.4f, %.4f] on (0, 6]; sup sqrt(v)|h_A| = %.4f (package: 14/5), sup sqrt(v)|h_B| = %.4f (package: 21/10); 1+bA = %.6f; %.0f s'
              % (S[1], GA[1] / S[1], GB[1] / S[1], G0[1] / S[1], hA.min(), hA.max(), hB.min(), hB.max(), np.abs(GA + 0.4 * G0).max(), np.abs(GB + 0.3 * G0).max(), 1 + rec['bA'], time.time() - t0), flush=True)
        np.savez('%s/prof_own_%d.npz' % (outdir, k), S=S, GA=GA, GB=GB, G0=G0, rec=json.dumps(rec), t=row['t'])
