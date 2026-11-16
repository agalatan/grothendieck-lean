# Dual side [N]: column generation over preprocessed phase roundings h o rho (sum|rho_j| <= 1), exact series.
# Master LP over mixtures: max c_0 - sum_{1<=k<=KL} |c_k|; pricing: max_rho sum_k lam_k [h o rho]_k (SLSQP, gradient).
# Then the omitted tail sum_{KL<k<=KT} |c_k(mu)| is measured with the exact series of every column.
import sys, json, time, numpy as np
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
from gm import *
from scipy.optimize import linprog, brentq

def comp(rho, KT):
    return compose_phase(np.pad(np.asarray(rho, float), (0, max(0, KT + 1 - len(rho))))[:KT + 1], KT)

def haagerup_rho(gam, J):
    """Taylor coefficients of h^{-1}(gam t) up to t^{2J+1} (series reversion), unnormalised"""
    h = phase_coeffs(J)
    # solve h(r(t)) = gam t for r(t) = sum r_j t^{2j+1}
    r = np.zeros(J + 1); r[0] = gam / h[0]
    for m in range(1, J + 1):
        c = comp(r, m)[m]           # coefficient of t^{2m+1} with r_m = 0
        r[m] = -c / h[0]
    return r

def master(cols, KL):
    C = np.array([c[:KL + 1] for c in cols]).T     # (KL+1, J)
    J = C.shape[1]
    # variables mu (J), s (KL): max c0.mu - sum s, s >= +-C_k mu
    cost = np.concatenate([-C[0], np.ones(KL)])
    Aub = np.block([[C[1:], -np.eye(KL)], [-C[1:], -np.eye(KL)]]); bub = np.zeros(2 * KL)
    Aeq = np.concatenate([np.ones(J), np.zeros(KL)])[None]
    r = linprog(cost, A_ub=Aub, b_ub=bub, A_eq=Aeq, b_eq=[1.0], bounds=[(0, None)] * (J + KL), method='highs')
    mu = r.x[:J]
    # dual multipliers of the |c_k| rows give the game: lam_k = y+_k - y-_k
    y = r.ineqlin.marginals; lam = np.concatenate([[1.0], (y[:KL] - y[KL:])])
    return -r.fun, mu, lam

def main():
    KL = int(sys.argv[1]) if len(sys.argv) > 1 else 20; KT = int(sys.argv[2]) if len(sys.argv) > 2 else 120
    rounds = int(sys.argv[3]) if len(sys.argv) > 3 else 40
    cols = []; rhos = []
    for J in (KL, ):
        for gam in np.linspace(0.705, 0.7125, 16):
            r = haagerup_rho(gam, J); n = np.abs(r).sum(); r = r / max(1.0, n)
            rhos.append(r); cols.append(comp(r, KT))
    cols.append(phase_coeffs(KT)); rhos.append(np.eye(KL + 1)[0])
    gH = brentq(lambda g: np.abs(haagerup_rho(g, KL)).sum() - 1, 0.70, 0.7125)
    for g in (gH, gH - 1e-5, gH - 1e-4):
        r = haagerup_rho(g, KL); r = r / max(1.0, np.abs(r).sum()); rhos.append(r); cols.append(comp(r, KT))
    t0 = time.time(); hist = []
    for it in range(rounds):
        val, mu, lam = master(cols, KL)
        rho, pv, _ = best_rho2(lam, warm=[rhos[i][:KL + 1] for i in np.argsort(-mu)[:4]], starts=8, seed=it)
        # reduced cost: pv - val (the LP value equals max over columns of lam . c at optimum)
        hist.append(dict(it=it, LP=val, price=pv, gain=pv - val, t=round(time.time() - t0)))
        print(json.dumps(hist[-1]), flush=True)
        if pv - val < 1e-10: break
        rhos.append(np.pad(rho, (0, max(0, KL + 1 - len(rho))))); cols.append(comp(rho, KT))
    val, mu, lam = master(cols, KL)
    cmix = sum(m * c for m, c in zip(mu, cols))
    tail = np.abs(cmix[KL + 1:]).sum()
    D_full = cmix[0] - np.abs(cmix[1:]).sum()
    best_single = max(c[0] - np.abs(c[1:]).sum() for c in cols)
    out = dict(KL=KL, KT=KT, LP_truncated=val, c0=cmix[0], head_residual=float(np.abs(cmix[1:KL + 1]).sum()),
               tail_KL_to_KT=float(tail), D_full_to_KT=float(D_full), K_upper=1 / D_full, best_single_column_D=float(best_single),
               weights=[float(m) for m in mu if m > 1e-9], hist=hist)
    print(json.dumps({k: v for k, v in out.items() if k != 'hist'}), flush=True)
    json.dump(out, open(f'dualcg_KL{KL}.json', 'w'), indent=1)

if __name__ == '__main__':
    main()
