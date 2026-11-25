#!/usr/bin/env python3
"""The cluster family of cubics and the largest sector-A ratio in it (PROBLEM_V2.md, section 3).   Floating point (N).

With X = y_0 the content direction and the other variables in clusters of sizes c_1, c_2, ..., c_K (n = 1 + sum c_k):

    q = sqrt(u) [ a H(X) + X sum_j m_j (|y_j|^2 - 1) + R3 ],
    R3 = sum of B_{ab,c} y_a y_b conj(y_c) over the triples with a, b, c in three DIFFERENT clusters,

a real, m_j and B complex.  For three clusters of two variables it has 31 coefficients and contains the largest ratio
found over all cubics in seven variables.  The search and the evaluation are those of ref/bipartite.py (exact delta;
fitting sample of 2^M2 points; the value printed first is on two independent samples of 2^21 points and is the one to
quote).  Reference values, row 0.80:
    clusters 2,2,2 (n = 7):   0.2483 at u = 0.85 u*,  0.2209 at u*        (full search over all cubics: 0.2474, 0.2206)
    clusters 3,3,3 (n = 10):  0.2572 at 0.85 u*,      0.2310 at u*
    clusters 4,4,4 (n = 13):  0.2709 at 0.85 u*,      0.2402 at u*        (205 coefficients; the fit is 7 to 8 % above)
For c >= 4 the search returns too little (by 1.5 and 3 % at 4,4,4): with the bulk fixed to the one of smallest kappa and
8 free parameters (ref/kappa.py) the family gives 0.2743 at 0.85 u* and 0.2470 at u* for 4,4,4, and 0.2766, 0.2508 for 8,8,8.
The search is local: a second start (SID 1) can end a little higher or lower (0.2481 and 0.2483 for 2,2,2).
Run time on one core with M2 = 20: 2,2,2 about 3.5 minutes (209 s measured, 0.2481); 3,3,3 about 10 minutes (625 s measured
on a shared core, 0.2573); 4,4,4 10 to 15 minutes.

usage:  python3 ref/clusters.py ROW U_OVER_USTAR SIZES [SID] [M2] [KIT]
        e.g.  python3 ref/clusters.py 0.80 0.85 2,2,2        (from the folder that contains kit/ and ref/)
Needs numpy and scipy, and ref/bipartite.py beside it.
"""
import sys, os, math, time
import numpy as np
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))          # ref/bipartite.py is beside this file
from bipartite import Model

def in_family(sizes):
    cl = {}; j = 1
    for ci, s in enumerate(sizes):
        for _ in range(s): cl[j] = ci; j += 1
    def keep(lab):
        if lab == ('H', 0) or (lab[0] == 'cof' and lab[1] == 0): return True                      # the junta and X (|y_j|^2 - 1)
        return lab[0] == 'mix' and 0 not in lab[1:] and len({cl[lab[1]], cl[lab[2]], cl[lab[3]]}) == 3
    return keep, cl

if __name__ == '__main__':
    if len(sys.argv) < 4: print(__doc__); sys.exit(1)
    from bipartite import report
    row = sys.argv[1]; frac = float(sys.argv[2]); sizes = [int(x) for x in sys.argv[3].split(',')]; sid = int(sys.argv[4]) if len(sys.argv) > 4 else 0; m2 = int(sys.argv[5]) if len(sys.argv) > 5 else 20
    kit = sys.argv[6] if len(sys.argv) > 6 else 'kit/profiles/'; n = 1 + sum(sizes); keep, cl = in_family(sizes); t0 = time.time(); M = Model(row, frac, n, keep, seed=11 + sid, m2=m2, kit=kit)
    fam = 'multi:' + ','.join(str(x) for x in sizes); rng = np.random.default_rng(12000 + 100 * n + sid + len(fam)); K = len(sizes); nR = sum(1 for lab in M.labels if lab[0] == 'mix'); c0 = np.zeros(M.dim, complex)
    for i, lab in enumerate(M.labels):                                # start: eigenvalue phases by cluster as at the maximisers found, R3 random
        if lab == ('H', 0): c0[i] = 0.33
        elif lab[0] == 'cof':
            ph = (-0.23, 0.0, 0.23)[cl[lab[2]]] if K == 3 else np.linspace(-0.23, 0.23, K)[cl[lab[2]]]; c0[i] = 0.62 / math.sqrt(n - 1) * (0.8 if abs(ph) < 0.05 else 1.07) * np.exp(1j * ph * np.pi)
        else: c0[i] = 0.71 * (rng.standard_normal() + 1j * rng.standard_normal()) / math.sqrt(2 * max(nR, 1))
    report(M, c0, 'row %s, u = %.2f u*, clusters %s (n = %d, %d coefficients), start %d:' % (row, frac, sys.argv[3], n, M.dim, sid), m2, t0)
