"""The corner family q = X^2 (a conj X + b conj Y) (Proposition 14): l1 = 2u, l2 = u, chi = 8p^2 + 24p + 10 with
p = |a|^2/(|a|^2+|b|^2). Content, deficit, (F) (= Theorem 9 for chi >= 10), Corollary 6.1 with exact shadows, and the
Bessel losses, at the peak row (label N)."""
import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from influence import evaluate, GAMMA
from twovar import Grid
from core import B
gr=Grid(44,40)
for lab in ["tilt","raw"]:
    for u in [0.02,0.0463]:
        Bu=B(u)
        for chi in [10,12,16,20,30,42]:
            p=(-3+np.sqrt(9+(chi-10)/2))/2
            c=[np.sqrt(p),0,0,0,0,np.sqrt(1-p)]       # twovar basis: H(X) = :X^2 conj X:/sqrt2, X^2 conj(Y)/sqrt2
            r=evaluate(gr,c,u,lab,Bu,exact_shadows=True)
            F=u*(np.sqrt(2)*r['sA']+r['sB'])**2
            s=(f"{lab} u={u} chi={chi:2d} (measured {r['chi']:.2f}): l1/u={r['l1']/u:.3f} l2/u={r['l2']/u:.3f} | C2/D={r['C2']/r['D']:.4f} "
               f"Cor6.1/D={r['T6']/r['D']:.4f} (F)/D={F/r['D']:.4f} | (F)/C2={F/r['C2']:.2f} Cor6.1/C2={r['T6']/r['C2']:.2f} "
               f"| Bessel sA^2/|A|^2={r['sA']**2/r['nA2']:.2f} sB^2/|B|^2={r['sB']**2/r['nB2']:.2f} | D/delta={r['D']/r['dl']:.3f}")
            if lab=="tilt": s+=f" | gamma*delta/D={GAMMA[u]*r['dl']/r['D']:.4f}"
            print(s,flush=True)
