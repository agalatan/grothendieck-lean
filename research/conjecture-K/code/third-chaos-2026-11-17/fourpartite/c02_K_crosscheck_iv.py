# claude-b9ee research worker (fourpartite): independent re-implementation, with mpmath.iv (interval arithmetic with
# outward rounding) instead of arb, of the Part B cell bound of c01_K_certify.py, on a subset of the s-cells.
# Same mathematics (PROOF_4PARTITE.md section 3.3), code written separately: grid built with integers, the two forms
# evaluated with explicit interval endpoints.  Usage: python c02_K_crosscheck_iv.py [stride]
import sys, time
from fractions import Fraction as Fr
from mpmath import iv, mpf

iv.prec = 80

def I(q):
    q = Fr(q)
    return iv.mpf(q.numerator)/q.denominator

def lowr(x):  # lower endpoint as an exact interval
    return iv.mpf(x.a)

def upr(x):
    return iv.mpf(x.b)

# t-grid identical in definition to c01: 1/500 steps to 8, then t -> ceil-ish(t(1+1/500)) on a 1e-6 lattice up to 100
nodes = [Fr(k, 500) for k in range(0, 4001)]
t = nodes[-1]
while t < 100:
    t = Fr(int(t*Fr(501, 500)*10**6) + 1, 10**6); nodes.append(t)
T = [I(x) for x in nodes]
T2 = [x*x for x in T]
EX = [iv.exp(-x/2) for x in T2]

def Gr(s):
    sv = I(s); G = []; R = []
    for t2 in T2:
        x = sv*t2
        L = iv.log(1 + x)
        G.append((x - L)/2 + (1 - sv)*x*t2/(2*(1 + x)))
        R.append(iv.exp(-L/2 - (1 - sv)*t2/(2*(1 + x))))
    return G, R

def cell(s1, s2):
    G1, R1 = Gr(s1); G2, R2 = Gr(s2)
    a1, a2 = I(s1), I(s2)
    pref = (1 - a1)*iv.sqrt(a2)/2
    OMC = []
    for t, t2 in zip(T, T2):
        th = pref*t*t2/(1 + a1*t2)
        if th.b < iv.pi.a:
            OMC.append(1 - iv.cos(th))
        else:
            OMC.append(iv.mpf(2))
    tot = iv.mpf(0)
    for k in range(len(nodes) - 1):
        dt = I(nodes[k+1] - nodes[k])
        best = None
        m1 = (iv.exp(G1[k]) - 1) - iv.exp(G2[k+1])*OMC[k+1]
        if m1.a > 0:
            c = (dt*EX[k+1]*lowr(m1)/T2[k+1]).a
        elif nodes[k] > 0:
            c = (dt*EX[k]*lowr(m1)/T2[k]).a
        else:
            c = None
        if c is not None: best = c
        n2 = R1[k+1] - EX[k] - R2[k]*OMC[k+1]
        if n2.a > 0:
            c = (dt*lowr(n2)/T2[k+1]).a
        elif nodes[k] > 0:
            c = (dt*lowr(n2)/T2[k]).a
        else:
            c = None
        if c is not None and (best is None or c > best): best = c
        if nodes[k+1] <= 1 and (best is None or best < 0): best = mpf(0)
        tot = tot + iv.mpf(best)
    tm = T[-1]
    tail = iv.exp(-(1 - a2)*tm*tm/(2*(1 + a2*tm*tm)))/(iv.sqrt(a2)*2*tm*tm) + iv.exp(-tm*tm/2)/tm**3
    return tot - tail

if __name__ == '__main__':
    stride = int(sys.argv[1]) if len(sys.argv) > 1 else 10
    edges = [Fr(1, 1000)]
    while edges[-1]*Fr(21, 20) < 1:
        e = edges[-1]*Fr(21, 20); edges.append(Fr(int(e*10**9) + 1, 10**9))
    edges.append(Fr(1))
    cells = list(zip(edges[:-1], edges[1:]))
    pick = sorted(set(list(range(0, len(cells), stride)) + [0, 1, len(cells) - 1]))
    t0 = time.time()
    print('mpmath.iv cross-check of %d of the %d cells (prec %d bits)' % (len(pick), len(cells), iv.prec))
    for i in pick:
        s1, s2 = cells[i]
        lb = cell(s1, s2)
        print('cell %3d [%.9f, %.9f]  K >= %s  %s' % (i, float(s1), float(s2), lb.a, 'OK' if lb.a > 0 else 'FAIL'))
        sys.stdout.flush()
    print('time %.0f s' % (time.time() - t0))
