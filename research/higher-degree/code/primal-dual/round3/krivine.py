# Upper-side test [N]: Krivine-type value V(mu) = c_0(mu) - sum_{k>=1} |c_k(mu)| of mixtures of rounding pairs.
# Columns: (a) W3-model best-response pairs at the degree-9 game (coefficients exact-in-model to k = KH, energy tail
#   bound beyond: sum_{k>KH} |c_k| <= sqrt((1-E_f)(1-E_g))); optionally with preprocessing of z and W;
# (b) exact preprocessed-phase columns h o rho (all coefficients to KH; tail bound via h o |rho|), incl. Haagerup's.
# LP: max c_0.mu - sum_{1<=k<=KH} s_k - sum_r mu_r tau_r,  s_k >= +-(C mu)_k,  sum mu = 1.
import sys, json, time, numpy as np, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from scipy.optimize import linprog, brentq
from gm import Var, phase_coeffs, compose_phase
from gm2 import Model2, alternate2
from gm3 import h_full
from hispec import HiSpec, pair_spectrum

KH = 30
def rho_column(rho, KT=300):
    """exact coefficients to KT; columns carry c_0..c_KH and tau = sum_{KH<k<=KT} |c_k| + geometric-decay estimate
    beyond KT (h o rho is analytic beyond |t| = 1 when |rho(1)| < 1; label N)"""
    rho = np.asarray(rho, float); rr = np.pad(rho, (0, max(0, KT + 1 - len(rho))))[:KT + 1]
    c = compose_phase(rr, KT); a = np.abs(c)
    tail = a[KH + 1:].sum()
    seg = a[KT - 60:KT + 1]; seg = seg[seg > 0]
    if len(seg) > 10:
        q = np.exp(np.polyfit(np.arange(len(seg)), np.log(seg), 1)[0])
        tail += a[KT] * q / (1 - q) if q < 1 else 1.0
    return c[:KH + 1], float(tail)

def haagerup(gam, J=KH):
    h = phase_coeffs(J); r = np.zeros(J + 1); r[0] = gam / h[0]
    for m in range(1, J + 1):
        r[m] = -compose_phase(r, m)[m] / h[0]
    return r

def lp(cols, taus):
    C = np.array(cols).T; J = C.shape[1]; tau = np.array(taus)
    cost = np.concatenate([-(C[0] - tau), np.ones(KH)])
    A = np.block([[C[1:], -np.eye(KH)], [-C[1:], -np.eye(KH)]])
    r = linprog(cost, A_ub=A, b_ub=np.zeros(2 * KH), A_eq=np.concatenate([np.ones(J), np.zeros(KH)])[None], b_eq=[1.0],
                bounds=[(0, None)] * (J + KH), method='highs')
    return -r.fun, r.x[:J]

def main():
    lam9 = [1, -0.9359993, 0.7205736, -0.5920172, 0.2346836]
    t0 = time.time(); H = HiSpec(KH)
    vz = Var('z', (1, 0), n1=176, R=11.0, q=8, name='z'); vw = Var('c', (2, 1), n1=144, n2=96, R=9.0, q=8, name='W3')
    M = Model2([vz, vw], 4)
    # fine W3 model for the search (standard grid), then evaluate the found pair on the HiSpec grid
    from attack import grid_vars
    from gm2 import SPECS
    S = grid_vars(SPECS['W3'], 4, 96, 96, 64); rng = np.random.default_rng(3); pairs = []
    for s in range(10):
        c0 = rng.choice([0.5, 1, 2]) * (rng.normal(size=S.nb) + 1j * rng.normal(size=S.nb)); c0[0] += 2
        r = alternate2(S, lam9, c0, iters=3000, tol=1e-13)
        if all(abs(r['value'] - p['value']) > 1e-7 for p in pairs): pairs.append(r)
    pairs.sort(key=lambda r: -r['value'])
    cols, taus, tags, info = [], [], [], []; cols_h, taus_h = [], []
    for p in pairs[:4]:
        hf = M.evaluate(p['cf']).reshape(len(H.r), len(H.s), H.nth); hg = M.evaluate(p['cg']).reshape(len(H.r), len(H.s), H.nth)
        c, ef, eg = pair_spectrum(H, hf / np.abs(hf), hg / np.abs(hg))
        tf, tg = max(0, 1 - ef.sum()), max(0, 1 - eg.sum()); tau = float(np.sqrt(tf * tg))
        q = np.exp(np.polyfit(np.arange(20, KH + 1), np.log(np.abs(c[20:]) + 1e-300), 1)[0])
        tau_h = float(abs(c[KH]) * q / (1 - q)) if q < 1 else tau
        cols.append(c); taus.append(tau); tags.append('W3pair')
        cols_h.append(c); taus_h.append(tau_h)
        info.append(dict(value_at_lam9=p['value'], c_head=[round(x, 6) for x in c[:6]], sum_abs_5_30=float(np.abs(c[5:]).sum()),
                         energy_tail_f=tf, energy_tail_g=tg, tau=tau, V_single=float(c[0] - np.abs(c[1:]).sum() - tau)))
        print(json.dumps(info[-1]), flush=True)
    # exact columns
    gH = brentq(lambda g: np.abs(haagerup(g)).sum() - 1, 0.70, 0.7125)
    for g in [gH, gH - 1e-5, gH - 5e-5, gH - 2e-4]:
        r = haagerup(g); r = r / max(1.0, np.abs(r).sum()); c, tau = rho_column(r); cols.append(c); taus.append(tau); tags.append(f'haag{g:.6f}')
    c, tau = rho_column([1.0]); cols.append(c); taus.append(tau); tags.append('plain')
    c, tau = rho_column([0.0, -1.0]); cols.append(c); taus.append(tau); tags.append('remoteW')
    print('Haagerup gamma_H =', gH, ' single-column V =', cols[len(pairs[:4])][0] - np.abs(cols[len(pairs[:4])][1:]).sum() - taus[len(pairs[:4])], flush=True)
    V, mu = lp(cols, taus)
    nW = len(cols_h); Vh, muh = lp(cols_h + cols[nW:], taus_h + taus[nW:])
    print(json.dumps(dict(V_heuristic_tails=Vh, weights={tags[i]: round(float(m), 6) for i, m in enumerate(muh) if m > 1e-9})), flush=True)
    print(json.dumps(dict(V=V, K_upper=1 / V, weights={tags[i]: round(float(m), 6) for i, m in enumerate(mu) if m > 1e-9},
                          gamma_dagger=0.711958659778, repo=0.7119483103461 - 1.542247969e-6, t=round(time.time() - t0))), flush=True)
    json.dump(dict(pairs=info, V=V, weights=list(map(float, mu)), tags=tags), open('krivine_out.json', 'w'), indent=1)

if __name__ == '__main__':
    main()
