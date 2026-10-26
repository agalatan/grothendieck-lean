# Step 24 stage 1: gains of the pointwise-optimal rank-one test under the law relaxation OF THE CURRENT CERTIFICATE (master,
# cert-jointmoment-lifted-codex): step-4 SOCP (moments, E sqrt U <= rho, IBP for every hat test, separate budgets, covariance order) PLUS
#   contraction invariants v = (n,h,b,y,z) >= 0 with the exact spectral values P = 16n+4h+16b/3+32y, Q = 64b/3+32y, chi = 32n+8h+32b+96y = x^2,
#   EX^2 <= (80n+20h+16b+96y+32z)/9, Er^2 <= E|c|^2 = (128b+96y)/9, Gram PSD G0 = [[n,z],[z,h]], G1 = [[h,T],[T,(n+b+2T)/4]], T = (3y-z)/2,
#   n >= b, z >= y, ||U4||^2 = 16n+4h+16b+96y-32z >= 0, h0 >= 0,
#   joint sixth moment (J2),(J3) optimised over a, at x_* = x:  EU^3 <= 6+9x^2 + x*(11781/32 h0 + 135 sqrt(s0 h0)),  <= 6+9x^2 + x*(198 h0 + 300 sqrt(s0 h0)),
#   plus the scalar EU^3 <= 6+9x^2+C6 x^3.   (closure of every node family used by the certificate; nodes realise finite dual points of it)  [F]
# Output per (tag, x, tau): v0 = max E Psi_0, vT = max E[Psi_T + (w'Ew) f^2 + 2 c_k s f] (- s_E w1^2 kappa^2 if KEEPQ=1), gain = v0 - vT.
import sys, os, json, numpy as np, cvxpy as cp
from multiprocessing import Pool
from step22_lib import *
import step22_socp as S22
u, n, Phi, invu = S22.u, S22.n, S22.Phi, S22.invu
RHO = S22.RHO; C6 = S22.C6
MODE = os.environ.get('RELAX', 'tensor')      # 'tensor' (current certificate) or 'socp' (step 22)
def build(x):
    rho = cp.Variable(n, nonneg=True); a = cp.Variable(n); b = cp.Variable(n)
    obj = cp.Parameter(n); g = cp.Parameter(n); cq = cp.Parameter(nonneg=True)
    Pa = u@a; Qb = u@b
    EX2 = cp.sum([cp.quad_over_lin(a[k], rho[k]) for k in range(n)]); Er2 = cp.sum([cp.quad_over_lin(b[k], rho[k]) for k in range(1, n)])
    cons = [b[0] == 0, a == Phi@rho-rho-b+Phi@cp.multiply(b, invu), cp.sum(rho) == 1, u@rho == 1, (u**2)@rho == 2+x*x,
            (u**3)@rho <= 6+9*x*x+C6*x**3, np.sqrt(u)@rho <= RHO, EX2 <= 2/3*Pa, Er2 <= 2/3*Qb, 2*Pa+Qb == x*x, Qb <= x*x/3]
    if MODE == 'tensor':
        v = cp.Variable(5, nonneg=True); nn, hh, bb, yy, zz = v[0], v[1], v[2], v[3], v[4]; T = (3*yy-zz)/2
        s0 = 8*nn+2*hh+8*bb+8*zz; h0 = (8*nn+2*hh+8*bb+72*yy-16*zz)/3; mg = cp.Variable(nonneg=True)
        G0 = cp.Variable((2, 2), symmetric=True); G1 = cp.Variable((2, 2), symmetric=True)
        cons += [G0[0, 0] == nn, G0[0, 1] == zz, G0[1, 1] == hh, G0 >> 0, G1[0, 0] == hh, G1[0, 1] == T, G1[1, 1] == (nn+bb+2*T)/4, G1 >> 0,
                 nn >= bb, zz >= yy, 16*nn+4*hh+16*bb+96*yy-32*zz >= 0, h0 >= 0,
                 32*nn+8*hh+32*bb+96*yy == x*x, Pa == 16*nn+4*hh+16*bb/3+32*yy, Qb == 64*bb/3+32*yy,
                 EX2 <= (80*nn+20*hh+16*bb+96*yy+32*zz)/9, Er2 <= (128*bb+96*yy)/9,
                 mg <= cp.geo_mean(cp.hstack([s0, h0])),
                 (u**3)@rho <= 6+9*x*x+x*(11781/32*h0+135*mg), (u**3)@rho <= 6+9*x*x+x*(198*h0+300*mg)]
    prob = cp.Problem(cp.Maximize(obj@rho-cq*cp.square(g@rho)), cons)
    return prob, obj, g, cq, rho
KEEPQ = os.environ.get('KEEPQ', '0') == '1'
def work(args):
    tag, x, taus = args; m, P0, tests = S22.load(tag); prob, obj, g, cq, rho = build(x); out = []
    tst, PT = tests['opt']
    for tau in taus:
        s = tau*np.sqrt(u); obj.value = P0(s); g.value = np.zeros(n); cq.value = 0.0
        try:
            prob.solve(solver=cp.CLARABEL); v0 = prob.value; r0 = rho.value.copy()
            f = tst.f(s); obj.value = PT(s)+tst.wEw*f*f+2*tau*tst.ck*f*np.sqrt(u); g.value = f*np.sqrt(u); cq.value = m['sE']*tst.w[0]**2 if KEEPQ else 0.0
            prob.solve(solver=cp.CLARABEL); vT = prob.value; rT = rho.value
            out.append(dict(tag=tag, var='opt', x=x, tau=round(tau, 4), v0=v0, vT=vT, gain=v0-vT, kappa=float(g.value@rT),
                            EU3=float((u**3)@rT), EU3_0=float((u**3)@r0), status=prob.status))
        except Exception as e:
            out.append(dict(tag=tag, var='opt', x=x, tau=round(tau, 4), v0=None, vT=None, gain=None, err=str(e)))
    return out
if __name__ == '__main__':
    tags = sys.argv[1].split(','); xs = [float(v) for v in sys.argv[2].split(',')]; taus = [float(v) for v in sys.argv[3].split(',')]
    with Pool(int(os.environ.get('NJ', '8'))) as pool:
        res = pool.map(work, [(t, x, taus) for t in tags for x in xs], chunksize=1)
    flat = [r for c in res for r in c]
    for r in flat:
        if r['gain'] is None: print('%-7s x=%.3f tau=%.3f ERROR %s' % (r['tag'], r['x'], r['tau'], r['err'])); continue
        print('%-7s %s x=%.3f tau=%.3f  val0=%.8f valT=%.8f gain=%.3e kappa*=%.2e EU3 %.4f/%.4f %s' % (r['tag'], MODE, r['x'], r['tau'], r['v0'], r['vT'], r['gain'], r['kappa'], r['EU3_0'], r['EU3'], r['status']))
    json.dump(flat, open(sys.argv[4], 'w'), indent=1)
