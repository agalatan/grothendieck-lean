# [copy from research/higher-degree/code/degree5-content/ or degree5-cert/content5/code/ (the content study of claude-b9ee's workers);
#  claude-b9ee worker d5newcap, 16 Nov 2026: the game constants come from the environment (D5_E1, D5_ETA) and Clarabel is
#  single-threaded; nothing else changed unless noted]
# Round-2-style law-layer test with the T4 frame in place of (S).  N.
#   Hypothesis (the remaining lemma, in its low-influence form):  sup_e Omega_e <= theta * Omhat(law),
#       Omhat(law) = (3/2) E[V k'(V)^2] - (3/4) (E[V k'(V)])^2 / u        (concave in the law; k = K_u h)
#   Then  ||c_X||^2 <= delta * theta * Omhat_X(law)  (T4), and the test of section 8.4 becomes
#       max_law [ min(F_A, T_A) + min(F_B, T_B) - 4 mu kappa (D + Vsl) ] / (4 mu),   T_X = delta theta Omhat_X(law),
#   over the moment + Stein relaxation with the response cap and the Rice family (R1).
import sys, json, os, warnings; warnings.filterwarnings('ignore')
import numpy as np, cvxpy as cp, rowlib as R, lawstein as LS, combo as C, rice as RI, t4lib as T4

def solve_point_t4(row, U, u, chi, theta, mu, kappa, profs, kprofs, tlo, wgrid=(0.0, 0.5, 1.0), use_F=True):
    GA, GAp, GB, GBp = profs; S = np.sqrt(u * U); V = u * U
    aA, bA = C.ab_vec(GA, GAp, S); aB, bB = C.ab_vec(GB, GBp, S)
    psi = row.ps(S); B5 = row.B5(u); Vsl = row.Vsl(u); delta = chi * u * u
    kA = kprofs[0].kp_R(np.minimum(S, 6.0)); kB = kprofs[1].kp_R(np.minimum(S, 6.0))
    Ar, br = RI.rice_rows(U, u, tlo); best = None
    grid = wgrid if use_F else (0.0,)
    for wA in grid:
        for wB in grid:
            p, cons = RI.law_constraints(U, chi, True); cons += [Ar @ p >= br]
            FA = u * ((aA ** 2) @ p - cp.square(aA @ p)) + (u / 2) * ((bA ** 2) @ p)
            FB = u * ((aB ** 2) @ p - cp.square(aB @ p)) + (u / 2) * ((bB ** 2) @ p)
            TA = delta * theta * (1.5 * ((V * kA ** 2) @ p) - 0.75 * cp.square((V * kA) @ p) / u)
            TB = delta * theta * (1.5 * ((V * kB ** 2) @ p) - 0.75 * cp.square((V * kB) @ p) / u)
            X = 4 * mu * kappa * (B5 - psi @ p + Vsl)
            obj = wA * FA + (1 - wA) * TA + wB * FB + (1 - wB) * TB - X
            pr = cp.Problem(cp.Maximize(obj), cons)
            try: pr.solve(solver='CLARABEL', max_threads=1)
            except Exception: return 'fail', None
            if pr.status in ('infeasible', 'infeasible_inaccurate'): return None, None
            if best is None or pr.value < best[0]:
                pv = p.value
                best = (pr.value, wA, wB, float(1.5 * ((V * kA ** 2) @ pv) - 0.75 * ((V * kA) @ pv) ** 2 / u), float(1.5 * ((V * kB ** 2) @ pv) - 0.75 * ((V * kB) @ pv) ** 2 / u))
    return best, dict(delta=delta, Vsl=Vsl)

if __name__ == '__main__':
    k = int(sys.argv[1]); s, t, mu, tlo, theta = [float(x) for x in sys.argv[2:7]]
    fr = [float(x) for x in sys.argv[7].split(',')]; chis = [float(x) for x in sys.argv[8].split(',')]
    use_F = (len(sys.argv) < 10 or sys.argv[9] != 'noF')
    row = R.Row('out/prof_%d.npz' % k); profs = C.prof_derivs(row, s, t); U = LS.ugrid(); kappa = 0.82
    ucap = 4 * RI.E1 ** 2 * 0.432306903 * (0.886762780 - tlo); out = []
    for f in fr:
        u = min(f * row.ustar, 0.999 * ucap)
        kprofs = (T4.Profile(profs[0], u), T4.Profile(profs[2], u))
        for chi in chis:
            best, aux = solve_point_t4(row, U, u, chi, theta, mu, kappa, profs, kprofs, tlo, use_F=use_F)
            if best == 'fail':
                print('t=%.3f u/u*=%.3f chi=%5.1f: solver failed' % (row.t, u / row.ustar, chi), flush=True); out.append(dict(u=u, chi=chi, viol=None, failed=True)); continue
            if best is None:
                print('t=%.3f u/u*=%.3f chi=%5.1f: no response has this law' % (row.t, u / row.ustar, chi), flush=True); out.append(dict(u=u, chi=chi, viol=None)); continue
            out.append(dict(u=u, chi=chi, viol=best[0] / (4 * mu), OmA=best[3], OmB=best[4]))
            print('t=%.3f u/u*=%.3f chi=%5.1f: excess %+.3e gain-units (weights F: %.1f %.1f; Omhat at the extremal law A %.4f B %.4f)' % (
                row.t, u / row.ustar, chi, best[0] / (4 * mu), best[1], best[2], best[3], best[4]), flush=True)
    json.dump(out, open('out/combo3%s_%d_th%s%s.json' % (os.environ.get('TAG', ''), k, theta, '' if use_F else '_noF'), 'w'), indent=1)
