"""Family q_z = X[(|X|^2-2) + z(|Y|^2-1)] (normalised): split T1, T2 for sqrt, buffers and the peak (label N)."""
import sys, os, math, time
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from dslib import *
g = Grid(2, PANELS_FINE, 8, 48)
profs = [SqrtProfile(1.0), buffer_profile(0.05), buffer_profile(0.25), buffer_profile(1.0), buffer_profile(4.0)]
pk = peak_profile(0.0463)
print('z | profile: D, T1/D, T2/D')
for z in [0, 0.5j, 1j, 1.2j, 1.5j, 2j, 3j, 5j, 1.0, 2.0, 1+1j, -1.0, -0.5, 0.5, 3.0, 10j, 100j]:
    t = normalise(t_item5(z))
    f = stein_fields(t, g.Y)
    line = f'z={z!s:>8}: '
    for p in profs:
        r = split(g, t, p, f)
        line += f"{p.name}: D={r['D']:+.4f} T1/D={r['T1']/r['D']:+.3f} T2/D={r['T2']/r['D']:+.3f} | "
    tu = normalise(t_item5(z), 0.0463)
    r = split(g, tu, pk)
    line += f"peak: D={r['D']:+.3e} T1/D={r['T1']/r['D']:+.3f} T2/D={r['T2']/r['D']:+.3f} (err {abs(r['T1']+r['T2']-r['D'])/r['D']:.1e})"
    print(line)
