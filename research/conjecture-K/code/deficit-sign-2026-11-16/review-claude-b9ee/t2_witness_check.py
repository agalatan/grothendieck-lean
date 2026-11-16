# claude-b9ee, 16 Nov 2026: independent evaluation of D = T1 + T2 (ledger 6.3.24, phi = sqrt v, u = 1) on
# q_theta = cos(theta) X^2 conj(Y)/sqrt2 + sin(theta) X(|X|^2+|Y|^2-3)/sqrt3.
# Own formulas. Radii s_i = |.|, composite Gauss-Legendre on [0, 7]; relative phase by the midpoint rule.
import sys
import numpy as np
from scipy.special import erfcx

def nodes(P, k=8, smax=7.0):
    g, w = np.polynomial.legendre.leggauss(k)
    edges = np.linspace(0, smax, P + 1)
    xs, ws = [], []
    for a, b in zip(edges[:-1], edges[1:]):
        xs.append((a + b)/2 + (b - a)/2*g); ws.append((b - a)/2*w)
    x = np.concatenate(xs); w = np.concatenate(ws)
    return x, w*2*x*np.exp(-x*x)          # r = s^2 ~ Exp(1)

def run(theta, P, m):
    s_, w_ = nodes(P)
    psi = 2*np.pi*(np.arange(m) + 0.5)/m
    c, s = np.cos(theta), np.sin(theta)
    K0 = np.sqrt(np.pi)/2
    acc = np.zeros(9)
    S2, PS = np.meshgrid(s_, psi, indexing='ij')
    W2 = w_[:, None]/m*np.ones_like(PS)
    Y = S2*np.exp(1j*PS); Yb = np.conj(Y); r2 = S2**2
    for s1, w1 in zip(s_, w_):
        X = s1 + 0j; r1 = s1*s1
        q = c*X*X*Yb/np.sqrt(2) + s*X*(r1 + r2 - 3)/np.sqrt(3)
        dX = c*2*X*Yb/np.sqrt(2) + s*(2*r1 + r2 - 3)/np.sqrt(3)
        dY = s*X*Yb/np.sqrt(3)
        dbX = s*X*X/np.sqrt(3) + 0*Y
        dbY = c*X*X/np.sqrt(2) + s*X*Y/np.sqrt(3)
        a = dX*dbX + dY*dbY
        c1 = abs(dX)**2 + abs(dY)**2
        c2 = abs(dbX)**2 + abs(dbY)**2
        V = abs(q)**2; sv = np.sqrt(V)
        Kp = K0*erfcx(sv); K = sv + Kp
        num = K - K0 - V*Kp
        # series of v^2 gamma'(v) for small v:  v^{3/2}/3 - (sqrt(pi)/4) v^2 + (8/15) v^{5/2} ...  (from K = sqrt v + K0 erfcx(sqrt v))
        ser = sv**3/3 - (np.sqrt(np.pi)/4)*V**2 + (8/15)*sv**5
        gpV2 = np.where(V < 1e-4, ser, num)
        with np.errstate(divide='ignore', invalid='ignore'):
            t2 = np.where(V > 0, np.real(np.conj(q)**2*a)*gpV2/np.maximum(V, 1e-300)**2, 0.0)
        Wt = w1*W2
        acc += np.array([np.sum(Wt), np.sum(Wt*V), np.sum(Wt*c1), np.sum(Wt*c2), np.sum(Wt*sv),
                         np.sum(Wt*(c2 - 1)*Kp), np.sum(Wt*t2), np.sum(Wt*K), np.sum(Wt*(c1 - c2)*Kp)])
    one, u, Ec1, Ec2, Eabs, t1, T2, EK, EJKp = acc
    D = K0 - Eabs; T1 = -t1
    return dict(one=one, u=u, Ec1=Ec1, Ec2=Ec2, D=D, T1=T1, T2=T2, split=D - T1 - T2, rot=EK - K0 - EJKp)

for theta in [float(t) for t in sys.argv[1:]] or [0.2]:
    for P, m in [(14, 96), (20, 128), (28, 192)]:
        r = run(theta, P, m)
        print(f"theta={theta} P={P} m={m} 1={r['one']:.12f} u={r['u']:.10f} Ec1={r['Ec1']:.8f} Ec2={r['Ec2']:.8f} D={r['D']:.8f} "
              f"T1={r['T1']:.8f} T2={r['T2']:+.5e} T2/D={r['T2']/r['D']:+.3e} split_err={r['split']:+.1e} rot_err={r['rot']:+.1e}", flush=True)
