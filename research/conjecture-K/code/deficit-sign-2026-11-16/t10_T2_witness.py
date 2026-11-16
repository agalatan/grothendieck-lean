"""Explicit witness for T2 < 0 with phi = sqrt(v) (label N, three grids).

Family: q_theta = cos(theta) X^2 conj(Y)/sqrt2 + sin(theta) X(|X|^2+|Y|^2-3)/sqrt3   (real coefficients, E|q|^2 = 1).
"""
import sys, os, math
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from dslib import *

def q_theta(th):
    t = np.zeros((2, 2, 2), complex)
    t[0, 0, 1] = math.cos(th) / math.sqrt(2) / math.sqrt(2)                  # X^2 conj(Y)/sqrt2 has 2|t|^2 = 1/... normalised below
    b = np.zeros((2, 2, 2), complex); b[0, 0, 0] = 1; b[0, 1, 1] = b[1, 0, 1] = 0.5   # X(|X|^2-2) + X(|Y|^2-1)
    a = np.zeros((2, 2, 2), complex); a[0, 0, 1] = 1
    return math.cos(th) * normalise(a) + math.sin(th) * normalise(b)

if __name__ == '__main__':
    prof = SqrtProfile(1.0)
    g = Grid(2, PANELS_FINE, 8, 48)
    print('theta   u        chi      D          T1         T2          T2/D     (T1+T2-D)/D')
    best = (1, None)
    for th in np.linspace(0, 0.6, 25):
        t = q_theta(th); f = stein_fields(t, g.Y); s = split(g, t, prof, f); m = moments(g, t, f)
        print(f"{th:.3f}  {m['u']:.6f} {m['delta']:.4f}  {s['D']:.6f}  {s['T1']:.6f}  {s['T2']:+.7f}  {s['T2']/s['D']:+.6f}  {(s['T1']+s['T2']-s['D'])/s['D']:+.1e}")
        if s['T2'] / s['D'] < best[0]: best = (s['T2'] / s['D'], th)
    th = best[1]
    print('best theta on the scan:', th)
    grids = [('fine 8x48', g), ('other panels 10x64', Grid(2, [0, .1, .3, .6, 1, 1.4, 1.9, 2.5, 3.2, 4, 5, 6.2, 7.6, 9.3, 11.5, 14, 17, 21, 26, 33, 44], 10, 64)),
             ('fine 12x40', Grid(2, PANELS_FINE, 12, 40))]
    for th in (th, 0.2, 0.25):
        t = q_theta(th)
        for lab, gg in grids:
            s = split(gg, t, prof)
            print(f"theta={th:.3f} {lab:20s}: D={s['D']:.9f} T1={s['T1']:.9f} T2={s['T2']:+.9f} T2/D={s['T2']/s['D']:+.6f} err={s['T1']+s['T2']-s['D']:+.1e}")
