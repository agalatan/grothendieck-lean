"""Re-evaluate the lowest Hessian eigen-directions of t05 on finer n=3 grids (label N)."""
import sys, os, math, time
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from dslib import *
from dsn import *
from t05_hessian_n3 import base_tensor, onb

base, spec = sys.argv[1], sys.argv[2]
prof = SqrtProfile(1.0) if spec == 'sqrt' else (peak_profile(float(spec[5:])) if spec.startswith('peak:') else buffer_profile(float(spec[4:])))
H = np.load(f'hess_n3_{base}_{spec.replace(":", "")}.npy')
ev, evec = np.linalg.eigh(H)
B = onb(3); dirs = [b for b in B] + [1j * b for b in B]
q0 = normalise(base_tensor(base), 1.0)
grids = [('coarse 24r x 8', ChunkGrid(3, [0, 1, 2.5, 5, 9, 15, 26], 4, 8)),
         ('medium 36r x 12', ChunkGrid(3, [0, .5, 1, 2, 3, 5, 8, 12, 18, 28], 4, 12)),
         ('fine 45r x 16', ChunkGrid(3, [0, .5, 1, 2, 3, 5, 8, 12, 18, 28], 5, 16))]
for idx in range(int(sys.argv[3]) if len(sys.argv) > 3 else 3):
    p = sum(evec[i, idx] * dirs[i] for i in range(len(dirs)))
    p = p / math.sqrt(2 * np.sum(abs(p) ** 2))
    line = f'eigvec {idx} (coarse eig/D {ev[idx]:+.3e}): '
    for lab, g in grids:
        (r0,), _ = g.run(normalise(q0, prof.u), [prof])
        vals = []
        for eps in (0.05, 0.1):
            (a,), _ = g.run(normalise(q0 + eps * p, prof.u), [prof]); (b,), _ = g.run(normalise(q0 - eps * p, prof.u), [prof])
            vals.append((0.5 * (a['T2'] + b['T2']) / eps ** 2 / r0['D'], min(a['T2'], b['T2']) / r0['D']))
        line += f"| {lab}: Q/D eps=.05: {vals[0][0]:+.5f}, eps=.1: {vals[1][0]:+.5f} (min T2/D at eps=.1: {vals[1][1]:+.2e}) "
        print(line, flush=True)
