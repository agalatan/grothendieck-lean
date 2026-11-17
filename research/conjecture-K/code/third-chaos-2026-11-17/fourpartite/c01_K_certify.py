# claude-b9ee research worker (fourpartite), 17 Nov 2026.
# RIGOROUS (ball arithmetic, python-flint/arb) certificate that
#     K(s) > 0   for every s in (0, 1],
# where
#     K(s)  = int_0^inf [ r_s(t) C(Th_s(t)) - exp(-t^2/2) ] t^{-2} dt,
#     r_s(t)  = (1 + s t^2)^{-1/2} exp( -(1-s) t^2 / (2 (1 + s t^2)) ),
#     Th_s(t) = ((1-s)/2) sqrt(s) t^3 / (1 + s t^2),
#     C(th)   = cos(th) for 0 <= th <= pi,  C(th) = -1 for th > pi.
# K(c^2) is a lower bound for (pi/2)(sqrt(2/pi) - E|aX + bY + cXY|) when a^2 + b^2 + c^2 = 1
# (PROOF_4PARTITE.md, section 2).  G_s(t) := log r_s(t) + t^2/2.
#
# Facts used (proved in PROOF_4PARTITE.md, section 3):
#  (M1) r_s(t) and G_s(t) are increasing in s on [0,1];  (M2) r_s(t) is decreasing in t;
#  (M3) G_s(t) is increasing in t;  (M4) for s in [s1,s2]: Th_s(t) <= Ths(t) := (1-s1) sqrt(s2) t^3/(2(1+s1 t^2)),
#       increasing in t;  (M5) C is nonincreasing, 1 - C(th) <= min(2, th^2/2);  (M6) the integrand is >= 0 on (0,1].
#
# Part A: s in (0, s0], s0 = 1/1000: K(s)/s >= int_0^10 h(t) dt - E1 - E2(s0)/s0  (section 3.3).
# Part B: s in [s0, 1]: cells [s1,s2]; on each t-cell [ta,tb] two lower bounds of the integrand (section 3.2):
#   Form 1: e^{-t^2/2} t^{-2} [ expm1(G_{s1}(ta)) - exp(G_{s2}(tb)) (1 - C(Ths(tb))) ]
#   Form 2: t^{-2} [ r_{s1}(tb) - e^{-ta^2/2} - r_{s2}(ta) (1 - C(Ths(tb))) ]
#   (each bracket bounded below by a number m; the factor in front taken at the endpoint that makes m * factor smallest),
#   plus 0 on (0,1] by (M6); tail t >= TMAX bounded as in section 3.2.
import sys, time
from fractions import Fraction as Fr
from flint import arb, fmpq, ctx

ctx.prec = 128
PI = arb.pi()

def A(q):
    q = Fr(q)
    return arb(fmpq(q.numerator, q.denominator))

def lo(x):
    """exact lower endpoint of the ball x (radius 0)"""
    l = x.lower()
    assert l.rad() == 0
    return l

def tgrid(h=Fr(1, 500), tu=8, ratio=Fr(1, 500), tmax=100):
    nodes = [Fr(0)]
    k = 1
    while nodes[-1] < tu:
        nodes.append(h*k); k += 1
    t = nodes[-1]
    while t < tmax:
        t2 = Fr(int(t*(1 + ratio)*10**6) + 1, 10**6)
        nodes.append(t2); t = t2
    return nodes

TN = tgrid()
TA = [A(t) for t in TN]
T2 = [t*t for t in TA]
E = [(-t2/2).exp() for t2 in T2]   # exp(-t^2/2)

_cache = {}
def sarrays(s):
    """G_s(t_k) and r_s(t_k) at all nodes, as balls"""
    key = Fr(s)
    if key in _cache:
        return _cache[key]
    sa = A(s)
    G = []; R = []
    for t2 in T2:
        x = sa*t2
        l1 = x.log1p()
        g = (x - l1)/2 + (1 - sa)*x*t2/(2*(1 + x))
        r = (-l1/2 - (1 - sa)*t2/(2*(1 + x))).exp()
        G.append(g); R.append(r)
    _cache[key] = (G, R)
    if len(_cache) > 6:
        _cache.pop(next(iter(_cache)))
    return G, R

def one_minus_C(th):
    """upper bound ball/number for 1 - C(th), th a ball >= 0"""
    if th < PI:                      # whole ball below pi
        return 2*(th/2).sin()**2
    return arb(2)                    # 1 - C <= 2 always

def cell_lower_bound(s1, s2, verbose=False):
    G1, R1 = sarrays(s1)
    G2, R2 = sarrays(s2)
    a1 = A(s1); a2 = A(s2)
    pref = (1 - a1)*a2.sqrt()/2
    omc = []
    for ta, t2 in zip(TA, T2):
        ths = pref*ta*t2/(1 + a1*t2)
        omc.append(one_minus_C(ths))
    total = arb(0)
    n_f1 = n_f2 = n_zero = 0
    for k in range(len(TN) - 1):
        ta, tb = TA[k], TA[k+1]
        dt = A(TN[k+1] - TN[k])
        cands = []
        # Form 1
        m1 = G1[k].expm1() - G2[k+1].exp()*omc[k+1]
        if m1 > 0:
            cands.append(lo(dt*E[k+1]*lo(m1)/T2[k+1]))
        elif TN[k] > 0:
            cands.append(lo(dt*E[k]*lo(m1)/T2[k]))
        # Form 2
        n2 = R1[k+1] - E[k] - R2[k]*omc[k+1]
        if n2 > 0:
            cands.append(lo(dt*lo(n2)/T2[k+1]))
        elif TN[k] > 0:
            cands.append(lo(dt*lo(n2)/T2[k]))
        # (M6): integrand >= 0 on (0, 1]
        if TN[k+1] <= 1:
            cands.append(arb(0))
        best = max(cands, key=lambda z: float(z.mid()))
        # max of exact numbers chosen by midpoint (they are exact, radius 0) -- any choice is valid
        total += best
    # tail t >= TMAX
    tm = TA[-1]
    tail = a2.rsqrt()*(-(1 - a2)*tm*tm/(2*(1 + a2*tm*tm))).exp()/(2*tm*tm) + (-tm*tm/2).exp()/(tm**3)
    total -= tail
    return total

def partA(s0=Fr(1, 1000), T=10, h=Fr(1, 1000)):
    s = A(s0)
    # int_0^T h(t) dt, h(t) = e^{-t^2/2}[P(t) - Q(t)], P = (1-s0)t^2/(2(1+s0 t^2)), Q = exp(Gh(t)) t^4/8,
    # Gh(t) = s0^2 t^4/4 + (1-s0) s0 t^4/(2(1+s0 t^2)); P, Q increasing in t.
    def P(t): return (1 - s)*t*t/(2*(1 + s*t*t))
    def Q(t):
        t4 = t**4
        return (s*s*t4/4 + (1 - s)*s*t4/(2*(1 + s*t*t))).exp()*t4/8
    n = int(T/h)
    total = arb(0)
    for k in range(n):
        ta = A(h*k); tb = A(h*(k+1))
        d = P(ta) - Q(tb)
        if d > 0:
            total += lo(A(h)*(-tb*tb/2).exp()*lo(d))
        else:
            total += lo(A(h)*(-ta*ta/2).exp()*lo(d))
    # E1 = int_T^inf e^{-al t^2}(b2 t^2 + b4 t^4) <= (b2+b4)/T * e^{-al T^2}(al^2 T^4 + 2 al T^2 + 2)/(2 al^3)
    al = (1 - s)/4; b2 = s/4 + arb(1)/2; b4 = arb(1)/8; Ta = A(T)
    E1 = (b2 + b4)/Ta*(-al*Ta*Ta).exp()*(al*al*Ta**4 + 2*al*Ta*Ta + 2)/(2*al**3)
    # E2(s0)/s0 = s0^{-1/2} e^{-(1-s0)/(4 s0)}/2 + s0^{1/2} e^{-1/(2 s0)}
    E2 = s.rsqrt()*(-(1 - s)/(4*s)).exp()/2 + s.sqrt()*(-1/(2*s)).exp()
    return total, E1, E2

if __name__ == '__main__':
    t0 = time.time()
    print('claude-b9ee fourpartite: certificate K(s) > 0 on (0,1]; arb prec =', ctx.prec)
    print('t-grid: %d nodes, uniform 1/500 on [0,8], ratio 1+1/500 up to %s' % (len(TN), float(TN[-1])))
    I, E1, E2 = partA()
    print('Part A (s <= 1/1000): int_0^10 h >= %s ; E1 <= %s ; E2(s0)/s0 <= %s' % (I.lower().str(10), E1.upper().str(5), E2.upper().str(5)))
    boundA = I - E1 - E2
    print('Part A: K(s)/s >= %s for all s in (0, 1/1000]  -> %s' % (boundA.lower().str(10), 'OK' if boundA > 0 else 'FAIL'))
    okA = boundA > 0
    sys.stdout.flush()
    # Part B
    s0 = Fr(1, 1000)
    edges = [s0]
    q = Fr(21, 20)
    while edges[-1]*q < 1:
        e = edges[-1]*q
        edges.append(Fr(int(e*10**9) + 1, 10**9))
    edges.append(Fr(1))
    cells = list(zip(edges[:-1], edges[1:]))
    print('Part B: %d initial s-cells on [1/1000, 1]' % len(cells))
    nfail = 0; worst = None; nfinal = 0
    stack = list(reversed(cells))
    while stack:
        s1, s2 = stack.pop()
        lb = cell_lower_bound(s1, s2)
        ok = lb > 0
        ratio = float(lb.mid())/float(s1)
        if ok:
            nfinal += 1
            if worst is None or ratio < worst[0]:
                worst = (ratio, s1, s2)
            print('cell [%.9f, %.9f]  K >= %s   K/s1 >= %.5f  OK' % (float(s1), float(s2), lo(lb).str(8), ratio))
        else:
            if s2 - s1 < Fr(1, 10**8):
                print('cell [%.9f, %.9f]  K >= %s  FAIL (too small to split)' % (float(s1), float(s2), lb.str(8)))
                nfail += 1
            else:
                mid = Fr(int(((s1*s2)**0.5)*10**12) + 1, 10**12) if s1 > 0 else (s1 + s2)/2
                if not (s1 < mid < s2): mid = (s1 + s2)/2
                print('cell [%.9f, %.9f]  K >= %s  split at %.9f' % (float(s1), float(s2), lb.str(8), float(mid)))
                stack.append((mid, s2)); stack.append((s1, mid))
        sys.stdout.flush()
    print('Part B: %d final cells, %d failures; smallest certified K/s1 = %.5f on [%.9f, %.9f]' % (nfinal, nfail, worst[0], float(worst[1]), float(worst[2])))
    print('RESULT: K(s) > 0 for every s in (0,1]:', 'CERTIFIED' if (okA and nfail == 0) else 'NOT CERTIFIED')
    print('time %.0f s' % (time.time() - t0))
