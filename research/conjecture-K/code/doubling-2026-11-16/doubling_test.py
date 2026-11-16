"""Test doubling monotonicity  E|(X+X')/sqrt2| >= E|X|  for X in the complex cubic chaos H_{2,1},
X' an independent copy.  If it held on all of H_{2,1}, iterating plus the CLT would give the sharp
radius bound E|q| <= (sqrt(pi)/2)||q||_2.  Monte Carlo with common random numbers.

Wick cubic in n complex variables:  q(z) = sum_{i<=j,k} c_{ijk} :z_i z_j conj(z_k):
:z_i z_j zbar_k: = z_i z_j zbar_k - delta_{ik} z_j - delta_{jk} z_i .
"""
import numpy as np

rng = np.random.default_rng(12345)
SQPI2 = np.sqrt(np.pi) / 2


def cgauss(shape):
    return (rng.standard_normal(shape) + 1j * rng.standard_normal(shape)) / np.sqrt(2)


def wick_cubic(C, z):
    # C[i,j,k] symmetric in i,j ; z shape (M, n)
    zz = np.einsum('mi,mj,mk,ijk->m', z, z, z.conj(), C)
    # contractions: delta_{ik} z_j and delta_{jk} z_i
    lin = np.einsum('mj,iji->m', z, C) + np.einsum('mi,ijj->m', z, C)
    return zz - lin


def norm2(C):
    # E|q|^2 = sum over (i,j,k) of |sym coefficient|^2 * multiplicity; compute numerically exactly via
    # orthogonality: E|:z_i z_j zbar_k:|^2 with symmetric C -> 2 * sum |C_ijk|^2 (i,j ordered pairs)
    return 2.0 * np.sum(np.abs(C) ** 2)


def ratio(C, M=2_000_000):
    n = C.shape[0]
    z = cgauss((M, n)); w = cgauss((M, n))
    q1 = wick_cubic(C, z); q2 = wick_cubic(C, w)
    nrm = np.sqrt(norm2(C))
    e1 = 0.5 * (np.abs(q1).mean() + np.abs(q2).mean()) / nrm
    e2 = np.abs((q1 + q2) / np.sqrt(2)).mean() / nrm
    emp = np.sqrt(0.5 * (np.mean(np.abs(q1) ** 2) + np.mean(np.abs(q2) ** 2))) / nrm
    return e1, e2, emp


def rand_sym(n, imag=True):
    C = rng.standard_normal((n, n, n)) + (1j * rng.standard_normal((n, n, n)) if imag else 0)
    return 0.5 * (C + C.transpose(1, 0, 2))


if __name__ == "__main__":
    print(f"Gaussian value sqrt(pi)/2 = {SQPI2:.5f}")
    C = np.zeros((1, 1, 1), complex); C[0, 0, 0] = 1
    print("Wick monomial z(|z|^2-2):", ["%.5f" % v for v in ratio(C)])
    C = np.zeros((2, 2, 2), complex); C[0, 1, 1] = C[1, 0, 1] = 0.5   # z1 |z2|^2 - z1  type
    print("z1(|z2|^2-1):            ", ["%.5f" % v for v in ratio(C)])
    C = np.zeros((3, 3, 3), complex); C[0, 1, 2] = C[1, 0, 2] = 0.5   # z1 z2 zbar3
    print("z1 z2 zbar3:              ", ["%.5f" % v for v in ratio(C)])
    worst = 1e9
    for n in (1, 2, 3, 4):
        for t in range(12 if n > 1 else 4):
            C = rand_sym(n)
            e1, e2, emp = ratio(C, M=1_000_000)
            worst = min(worst, e2 - e1)
            print(f"n={n} rand#{t:2d}: E|q|/||q|| = {e1:.5f}  doubled = {e2:.5f}  gain = {e2-e1:+.5f}  (norm check {emp:.4f})")
    print("smallest gain observed:", worst)
