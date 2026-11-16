"""The smoothing sign in J-form on explicit cubics (label N).

For q in H_{2,1}, V = |q|^2, J = c1 - c2, u = 1:
  C_F(alpha) = E[(J-1) iota(alpha V)] = E[(V-1) iota(alpha V) + V exp(-alpha V) I1(alpha V)],  iota(t) = exp(-t) I0(t)   (two evaluations: with J, and law-only)
  N(lam) = (1+lam) E exp(-lam V) - 1 = -lam Cov(J, exp(-lam V))                                   (Laplace gap; negative values are item 5 of the ledger)
  E|q| = (1/2) E[J/|q|]  and the endpoint  E[(1-J)/|q|] >= 0.
"""
import sys, os, math, json
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy import special
from dslib import *

if __name__ == '__main__':
    g = Grid(2, [0, .05, .125, .25, .5, .75, 1, 1.5, 2, 2.5, 3, 4, 5, 6, 8, 10, 13, 16, 20, 25, 32, 42], 10, 64)
    cases = [('Wick monomial', normalise(t_monomial(2))), ('item-5 cubic (z = i)', normalise(t_item5(1j))), ('X^2 conj(Y)', normalise(t_z0sq_z1bar())),
             ('H(X)+H(Y)', normalise(t_sum_monomials(2)))]
    try:
        r = min(json.load(open('search_n2_sqrt_T2.json')), key=lambda r: r['fine']['T2'] / r['fine']['D'])
        cases.append(('T2-minimiser of section 3', np.array(r['t_re']) + 1j * np.array(r['t_im'])))
    except Exception as ex:
        print('no search file', ex)
    alphas = [0.01, 0.1, 0.3, 1, 3, 10, 30, 100, 300]
    for name, t in cases:
        V, c1, c2, rhoV = stein_fields(t, g.Y); J = c1 - c2
        mod = np.sqrt(V)
        print(f'== {name}: E V = {g.E(V):.8f}, E J = {g.E(J):.8f}, E|q| = {g.E(mod):.6f}, (1/2)E[J/|q|] = {0.5*g.E(J/np.maximum(mod,1e-300)):.6f}, endpoint E[(1-J)/|q|] = {g.E((1-J)/np.maximum(mod,1e-300)):+.5f}')
        line1 = '   alpha:        ' + ' '.join(f'{a:>10g}' for a in alphas)
        cj = [g.E((J - 1) * special.ive(0, a * V)) for a in alphas]
        cl = [g.E((V - 1) * special.ive(0, a * V) + V * special.ive(1, a * V)) for a in alphas]
        nl = [(1 + a) * g.E(np.exp(-a * V)) - 1 for a in alphas]
        nj = [-a * g.E((J - 1) * np.exp(-a * V)) for a in alphas]
        print(line1)
        print('   C_F via J:    ' + ' '.join(f'{x:+10.6f}' for x in cj))
        print('   C_F law-only: ' + ' '.join(f'{x:+10.6f}' for x in cl))
        print('   N(lam) law:   ' + ' '.join(f'{x:+10.6f}' for x in nl))
        print('   N(lam) via J: ' + ' '.join(f'{x:+10.6f}' for x in nj))
