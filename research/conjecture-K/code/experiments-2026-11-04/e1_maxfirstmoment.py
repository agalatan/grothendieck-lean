"""E1: maximise E|q| / ||q||_2 over charge-one cubic chaos q in d complex variables.
q(w) = sum_{i<=j, k} a_{ijk} :w_i w_j conj(w_k):  (Wick product = w_i w_j conj(w_k) - delta_{ik} w_j - delta_{jk} w_i, up to the
symmetric normalisation); ||q||_2^2 computed from the Gram of the Wick basis (Monte Carlo-free: use the same samples for both to
cancel noise; ratio is scale-invariant).  Projected gradient ascent on the complex tensor with random restarts, common random numbers.
Gaussian value: E|W|/||W|| = sqrt(pi)/2 = 0.886227.  One-variable Wick monomial: 0.68956.  Diffuse family -> 0.886227 from below."""
import numpy as np, math, sys
rng = np.random.default_rng(int(sys.argv[2]) if len(sys.argv) > 2 else 0)
d = int(sys.argv[1]) if len(sys.argv) > 1 else 3
n = 200000
W = (rng.standard_normal((n, d)) + 1j*rng.standard_normal((n, d)))/math.sqrt(2)   # common random numbers
# Wick basis B_{ijk} = :w_i w_j conj w_k:  for i<=j
idx = [(i, j, k) for i in range(d) for j in range(i, d) for k in range(d)]
B = np.empty((n, len(idx)), complex)
for t, (i, j, k) in enumerate(idx):
    v = W[:, i]*W[:, j]*np.conj(W[:, k])
    if k == i: v = v - W[:, j]
    if k == j: v = v - W[:, i]
    B[:, t] = v
G = (B.conj().T @ B)/n                        # Gram (Hermitian PSD), ||q||^2 = a^H G a
def ratio(a):
    q = B @ a; return np.mean(np.abs(q))/math.sqrt(max((a.conj() @ G @ a).real, 1e-300))
def grad(a):
    q = B @ a; aq = np.abs(q); ph = q/np.maximum(aq, 1e-300)
    gE = (B.conj().T @ ph)/n                   # d E|q| / d conj(a)  (Wirtinger)
    nrm = math.sqrt((a.conj() @ G @ a).real); E = np.mean(aq)
    return gE/nrm - E*(G @ a)/nrm**3           # gradient of the ratio w.r.t. conj(a)
best = 0; bestA = None
for start in range(12):
    a = rng.standard_normal(len(idx)) + 1j*rng.standard_normal(len(idx))
    if start == 0: a = np.zeros(len(idx), complex); a[[t for t,(i,j,k) in enumerate(idx) if i==j==k]] = 1  # diffuse-like start
    a /= math.sqrt((a.conj() @ G @ a).real); lr = 0.3; r0 = ratio(a)
    for it in range(400):
        g = grad(a); a2 = a + lr*g; a2 /= math.sqrt((a2.conj() @ G @ a2).real); r2 = ratio(a2)
        if r2 > r0: a, r0 = a2, r2; lr *= 1.1
        else: lr *= 0.5
        if lr < 1e-6: break
    print(f"d={d} start {start:2d}: E|q|/||q|| = {r0:.5f}")
    if r0 > best: best, bestA = r0, a.copy()
q = B @ bestA; m = np.mean(np.abs(q)**4)/np.mean(np.abs(q)**2)**2
print(f"d={d}: BEST {best:.5f}  (Gaussian 0.88623; one-variable monomial 0.68956)  m = E|q|^4/(E|q|^2)^2 = {m:.3f}; |a| profile (diag share) = {np.sum(np.abs(bestA[[t for t,(i,j,k) in enumerate(idx) if i==j==k]])**2)/np.sum(np.abs(bestA)**2):.3f}")
