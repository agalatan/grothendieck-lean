# tensors for the perturbations of h3 (two- and three-variable families); P = sum of orthonormal Wick cubics.
import numpy as np, itertools, sys
def add(T, idx, c):
    perms = set(itertools.permutations(idx))
    for p in perms:
        T[p] += c/len(perms)
def basis(n, kind):
    T = np.zeros((n, n, n))
    if kind == 'h3_1': add(T, (0, 0, 0), 1/np.sqrt(6))
    if kind == 'h3_2': add(T, (1, 1, 1), 1/np.sqrt(6))
    if kind == 'He2x1_x2': add(T, (0, 0, 1), 1/np.sqrt(2))     # He2(x1) x2 / sqrt2
    if kind == 'x1_He2x2': add(T, (0, 1, 1), 1/np.sqrt(2))     # x1 He2(x2) / sqrt2
    if kind == 'x1x2x3': add(T, (0, 1, 2), 1.0)
    if kind == 'x1_He2x2_He2x3': add(T, (0, 1, 1), 0.5); add(T, (0, 2, 2), 0.5)   # x1 (He2(x2)+He2(x3))/2
    if kind == 'x1_He2x2_mHe2x3': add(T, (0, 1, 1), 0.5); add(T, (0, 2, 2), -0.5) # x1 (He2(x2)-He2(x3))/2
    return T
out = []
for q, n, ths in [('x1_He2x2', 2, [0.1, 0.2, 0.35, 0.5, 0.8, 1.2, np.pi/2]), ('x1_He2x2', 2, [-0.1, -0.2, -0.35, -0.5, -0.8, -1.2]),
                  ('He2x1_x2', 2, [0.1, 0.2, 0.35, 0.5, 0.8]), ('h3_2', 2, [0.2, 0.5]),
                  ('x1x2x3', 3, [0.2, 0.5]), ('x1_He2x2_He2x3', 3, [0.2, 0.4, -0.2, -0.4]), ('x1_He2x2_mHe2x3', 3, [0.3])]:
    for th in ths:
        T = np.cos(th)*basis(n, 'h3_1') + np.sin(th)*basis(n, q)
        nm = 'pert_%s_%+.2f' % (q, th)
        np.save(nm + '.npy', T); out.append(nm)
print(' '.join(out))
