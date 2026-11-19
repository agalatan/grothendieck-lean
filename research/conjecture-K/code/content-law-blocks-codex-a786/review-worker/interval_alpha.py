# Review of codex-a786's second content-law package (review worker of claude-b9ee, 16 Nov 2026).
# Own interval enclosure of the sign statistic alpha_m^2 (INTERVAL_PROOF.md, formula (1)):
#   alpha_m^2 = e^{-m}/(m-1)! * int_0^m phi(A_m(t), B_m(t)) dt + e^{-2m} sum_{j<m} (2m)^j/j!,
#   A_m = (m+t)^{m-1} e^{-t},  B_m = (m-t)^{m-1} e^{t},  phi(a, b) = (a-b)^2/(a+b).
# Independent of certify_phase.mjs in three ways: another arithmetic (mpmath.iv, 160-bit outward-rounded intervals),
# another partition (N panels, N not a power of two), and NO use of the monotonicity of A_m, B_m or of the convexity of phi:
# every panel is treated by the natural interval extension of the integrand on the t-interval of the panel.
# The first derivation of (1) is also checked here: a 30-digit quadrature of the folded density formula
#   alpha_m^2 = int_0^inf (f(p) - f(-p))^2/(f(p) + f(-p)) dp  must lie inside the enclosure.
# usage: interval_alpha.py <phase_intervals.json of the package> m:N [m:N ...]
import sys, json, time
from fractions import Fraction as Fr
from mpmath import iv, mp

def enclose(m, N):
    iv.prec = 160
    tot = iv.mpf(0); M = iv.mpf(m)
    for j in range(N):
        lo = (M * j / N).a; hi = (M * (j + 1) / N).b
        t = iv.mpf([lo, hi])
        A = (M + t) ** (m - 1) * iv.exp(-t)
        d = M - t
        if d.a < 0: d = iv.mpf([0, d.b])                 # t <= m exactly on the last panel; outward rounding may give a tiny negative lower end
        Bm = d ** (m - 1) * iv.exp(t)
        num = (A - Bm) ** 2; den = A + Bm
        assert den.a > 0
        tot += num / den
    integral = tot * M / N
    fact = iv.mpf(1)
    for j in range(2, m): fact *= j
    pref = iv.exp(-M) / fact
    pois = iv.mpf(0); term = iv.mpf(1)
    for j in range(m):
        if j > 0: term = term * (2 * M) / j
        pois += term
    return pref * integral + pois * iv.exp(-2 * M)

def reference(m):
    mp.dps = 30
    rt = mp.sqrt(m)
    f = lambda p: rt * mp.exp((m - 1) * mp.log(m + rt * p) - (m + rt * p) - mp.loggamma(m)) if m + rt * p > 0 else mp.mpf(0)
    return mp.quad(lambda p: (f(p) - f(-p)) ** 2 / (f(p) + f(-p)), list(mp.linspace(0, rt, 9)) + [rt + 1, rt + 6, rt + 30, rt + 120])

if __name__ == '__main__':
    saved = {b['m']: b for b in json.load(open(sys.argv[1]))['bounds']}
    for arg in sys.argv[2:]:
        m, N = (int(x) for x in arg.split(':')); t0 = time.time()
        e = enclose(m, N); ref = reference(m); b = saved[m]
        tn, td = (int(x) for x in b['target'].split('/'))
        plo = Fr(int(b['lowerNumerator']), int(b['denominator'])); phi_ = Fr(int(b['upperNumerator']), int(b['denominator']))
        lo = mp.mpf(e.a); hi = mp.mpf(e.b)
        inside_ref = lo <= ref <= hi and mp.mpf(plo.numerator) / plo.denominator <= ref <= mp.mpf(phi_.numerator) / phi_.denominator
        overlap = not (hi < mp.mpf(plo.numerator) / plo.denominator or lo > mp.mpf(phi_.numerator) / phi_.denominator)
        below = hi * td <= tn
        print('m = %2d, N = %5d panels: own enclosure [%s, %s] (width %.1e); package [%s, %s]; 30-digit value %s; target %s | upper end below target: %s; value inside both enclosures: %s; enclosures overlap: %s; %.0f s'
              % (m, N, mp.nstr(lo, 12), mp.nstr(hi, 12), float(hi - lo), b['decimalLower'], b['decimalUpper'], mp.nstr(ref, 14), b['target'], below, inside_ref, overlap, time.time() - t0), flush=True)
        assert below and inside_ref and overlap
    print('OWN ENCLOSURES CONFIRM THE TARGETS')
