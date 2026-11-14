# claude-b9ee, 13 Nov 2026: maximise C(q)^2/D(q) over ALL of H_{2,1}(C^n) at fixed ||q||^2 = u (content lemma of Conjecture K).
# usage: python kscan.py <row> <n> <u> <log2N> <restarts> <seed> <outfile> [selftest]
import numpy as np, sys, json, time
from scipy.interpolate import CubicSpline
from scipy.optimize import minimize
from scipy import integrate
row, n, u, lgN, restarts, seed, out = sys.argv[1], int(sys.argv[2]), float(sys.argv[3]), int(sys.argv[4]), int(sys.argv[5]), int(sys.argv[6]), sys.argv[7]
T = np.load(f'tables-{row}.npz'); ys = T['y']; YMAX = ys[-1]
sphi = CubicSpline(ys, T['phi']); sg = CubicSpline(ys, T['g']); dphi = sphi.derivative(); dg = sg.derivative()
phi2, g2 = sphi.derivative(2)(0.0)/2, sg.derivative(2)(0.0)/2
def kern(rho):                                   # phi, dphi/dv, g, dg/dv at v = rho
    y = np.minimum(np.sqrt(rho), YMAX); ok = y > 1e-5; ysafe = np.where(ok, y, 1.0)
    return sphi(y), np.where(ok, dphi(y)/(2*ysafe), phi2), sg(y), np.where(ok, dg(y)/(2*ysafe), g2)
Bu = integrate.quad(lambda s: np.exp(-s)*sphi(min(np.sqrt(u*s), YMAX)), 0, 60, limit=400, epsabs=1e-13)[0]
kap = float(dphi(np.sqrt(u))/(2*np.sqrt(u)))
idx = [(i, j, k) for i in range(n) for j in range(i, n) for k in range(n)]; d = len(idx)
def sample(N, rng):
    W = (rng.standard_normal((N, n)) + 1j*rng.standard_normal((N, n)))/np.sqrt(2)
    E = np.empty((N, d), dtype=complex)
    for m, (i, j, k) in enumerate(idx):
        col = W[:, i]*W[:, j]*np.conj(W[:, k])
        if i == k: col = col - W[:, j]
        if j == k: col = col - W[:, i]
        E[:, m] = col/np.sqrt(2 if i == j else 1)
    return W, E
def parts(c, W, E):                              # c with |c|^2 = u
    N = len(W); q = E@c; rho = np.abs(q)**2; ph, dph, g, dgv = kern(rho)
    D = Bu - ph.mean() + kap*(rho.mean() - u)
    C = W.conj().T@(q*g)/N; C2 = float(np.sum(np.abs(C)**2))
    return q, rho, dph, g, dgv, D, C, C2
def fg(x, W, E):
    c0 = x[:d] + 1j*x[d:]; nr = np.linalg.norm(c0); c = np.sqrt(u)*c0/nr; N = len(W)
    q, rho, dph, g, dgv, D, C, C2 = parts(c, W, E)
    if D <= 0: return 0.0, np.zeros(2*d)
    R = C2/D; s = W@C
    v = (np.conj(s)*q*q*dgv + s*(g + rho*dgv)) - R*(kap - dph)*q
    gr = 2*(E.conj().T@v)/(N*D)                  # real gradient w.r.t. (Re c, Im c), as a complex vector
    gr = gr - c*np.real(np.vdot(c, gr))/u
    gr = gr*np.sqrt(u)/nr
    return -R, -np.concatenate([gr.real, gr.imag])
def evaluate(c, seed2, lg=20, batches=8):        # independent samples; jackknife standard error
    r = np.random.default_rng(seed2); Ds, Cs, m4 = [], [], []
    for _ in range(batches):
        W, E = sample(1 << lg, r); q, rho, dph, g, dgv, D, C, C2 = parts(c, W, E); Ds.append(D); Cs.append(C); m4.append(np.mean(rho*rho))
    Ds = np.array(Ds); Cs = np.array(Cs); R = np.sum(np.abs(Cs.mean(0))**2)/Ds.mean()
    jk = np.array([np.sum(np.abs(np.delete(Cs, b, 0).mean(0))**2)/np.delete(Ds, b).mean() for b in range(batches)])
    se = np.sqrt((batches - 1)/batches*np.sum((jk - jk.mean())**2))
    Cm = Cs.mean(0)
    return float(R), float(se), float(Ds.mean()), float(np.mean(m4)/u/u - 2), (np.abs(Cm)**2/np.sum(np.abs(Cm)**2)).tolist()
rng = np.random.default_rng(seed); W, E = sample(1 << lgN, rng)
mono = np.zeros(d, dtype=complex); mono[idx.index((0, 0, 0))] = 1
if len(sys.argv) > 8:                            # self-test: gradient check and the calibration values
    x = rng.standard_normal(2*d); f0, g0 = fg(x, W, E); h = 1e-6; e = rng.standard_normal(2*d)
    print('grad check', (fg(x + h*e, W, E)[0] - fg(x - h*e, W, E)[0])/(2*h), g0@e)
    print('monomial', evaluate(np.sqrt(u)*mono, 1)[:4])
    if n > 1:
        t = np.zeros(d, dtype=complex); t[idx.index((0, 1, 1))] = 1; print('template X(|Y|^2-1)', evaluate(np.sqrt(u)*t, 2)[:4])
    sys.exit()
for rs in range(restarts):
    t0 = time.time()
    if rs == 0: c0 = mono + 0.1*(rng.standard_normal(d) + 1j*rng.standard_normal(d))/np.sqrt(2*d)   # pass 2: start near the Wick monomial
    else: c0 = rng.standard_normal(d) + 1j*rng.standard_normal(d)
    res = minimize(fg, np.concatenate([c0.real, c0.imag]), args=(W, E), jac=True, method='L-BFGS-B', options={'maxiter': 500, 'maxfun': 700})
    c = res.x[:d] + 1j*res.x[d:]; c = np.sqrt(u)*c/np.linalg.norm(c)
    R, se, D, d4, split = evaluate(c, 10**6 + 1000*seed + rs)
    rec = dict(row=row, n=n, u=u, seed=seed, rs=rs, opt=-float(res.fun), R=R, se=se, D=D, d4=d4, split=split, iters=int(res.nit), secs=time.time() - t0,
               c_re=c.real.tolist(), c_im=c.imag.tolist())
    open(out, 'a').write(json.dumps(rec) + '\n')
