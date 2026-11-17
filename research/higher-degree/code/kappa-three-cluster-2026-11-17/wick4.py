# E|R|^4 for R = A(xbar,y,w) + B(x,ybar,w) + C(x,y,wbar), x,y,w standard complex Gaussian in C^c.
# (1) exact Wick formula vs Monte Carlo; (2) the claimed lower bound
#     E|R|^4 >= 2 S^2 + (2/c)[(a+b)^2 + g^2 + (b+g)^2 + a^2 + (a+g)^2 + b^2],  S = a+b+g, a = |A|^2, b = |B|^2, g = |C|^2.
import numpy as np, itertools
rng = np.random.default_rng(1)
def crandn(*s): return (rng.standard_normal(s) + 1j*rng.standard_normal(s))/np.sqrt(2)
def single(T):
    # E|T(.,.,.)|^4 for one trilinear form (any conjugation pattern): 2|T|^4 + 2 sum_k |P_k|_F^2
    n2 = np.vdot(T, T).real
    tot = 2*n2**2
    for k in range(3):
        M = np.moveaxis(T, k, 0).reshape(T.shape[k], -1); P = M @ M.conj().T
        tot += 2*np.vdot(P, P).real
    return tot
def cross(S, Tn, common):
    # E|S T|^2 for two types sharing exactly one unconjugated cluster 'common'; generic Wick sum over 8 pairings.
    # Index order (x,y,w) = (0,1,2). For clusters other than 'common', the conjugation differs between S and T.
    c = S.shape[0]
    tot = 0.0
    # build generic: E[S(1) T(2) conj(S)(3) conj(T)(4)], each cluster: two pairings
    others = [k for k in range(3) if k != common]
    for pat in itertools.product([0, 1], repeat=3):
        # pat[k] = 0: 'cross/straight' pairing S<->conjS, T<->conjT ; 1: the other pairing
        # Build einsum over indices: S[i0,i1,i2] T[j0,j1,j2] Sc[k0,k1,k2] Tc[l0,l1,l2]
        sub = {}
        letters = iter('abcdefghijklmnop')
        idx = {('S', k): None for k in range(3)}
        expr_S, expr_T, expr_Sc, expr_Tc = [], [], [], []
        for k in range(3):
            if k == common:
                # S has z_k, T has z_k, conjS has zbar_k, conjT has zbar_k: pairings S<->Sc,T<->Tc (0) or S<->Tc,T<->Sc (1)
                u, v = next(letters), next(letters)
                if pat[k] == 0: s_, t_, sc_, tc_ = u, v, u, v
                else: s_, t_, sc_, tc_ = u, v, v, u
            else:
                # S and T have opposite conjugation in cluster k: S<->Sc, T<->Tc (0, 'cross') or S<->T, Sc<->Tc (1, 'self')
                u, v = next(letters), next(letters)
                if pat[k] == 0: s_, t_, sc_, tc_ = u, v, u, v
                else: s_, t_, sc_, tc_ = u, u, v, v
            expr_S.append(s_); expr_T.append(t_); expr_Sc.append(sc_); expr_Tc.append(tc_)
        e = ''.join(expr_S) + ',' + ''.join(expr_T) + ',' + ''.join(expr_Sc) + ',' + ''.join(expr_Tc) + '->'
        tot += np.einsum(e, S, Tn, S.conj(), Tn.conj()).real
    return tot
def exact4(A, B, C):
    return single(A) + single(B) + single(C) + 4*(cross(A, B, 2) + cross(A, C, 1) + cross(B, C, 0))
def mc4(A, B, C, N=2_000_000):
    c = A.shape[0]; tot = 0.0; done = 0
    while done < N:
        m = min(200_000, N - done)
        x, y, w = crandn(m, c), crandn(m, c), crandn(m, c)
        R = (np.einsum('abd,na,nb,nd->n', A, x.conj(), y, w) + np.einsum('abd,na,nb,nd->n', B, x, y.conj(), w)
             + np.einsum('abd,na,nb,nd->n', C, x, y, w.conj()))
        tot += np.sum(np.abs(R)**4); done += m
    return tot/N
def bound(A, B, C):
    a, b, g = [np.vdot(T, T).real for T in (A, B, C)]; c = A.shape[0]
    return 2*(a + b + g)**2 + (2/c)*((a + b)**2 + g**2 + (b + g)**2 + a**2 + (a + g)**2 + b**2)
for c in (2, 3):
    for trial in range(3):
        A, B, C = crandn(c, c, c), crandn(c, c, c)*rng.uniform(0, 1), crandn(c, c, c)*rng.uniform(0, 1)
        e, m = exact4(A, B, C), mc4(A, B, C)
        print('c=%d trial %d: exact %.5f  MC %.5f  rel.diff %.1e  | bound %.5f  (exact >= bound: %s)' % (c, trial, e, m, abs(e - m)/e, bound(A, B, C), e >= bound(A, B, C) - 1e-9), flush=True)
# the c = 2 example of the ledger: R = w2 (xbar1 y1 + xbar2 y2) + wbar1 (x1 y2 - x2 y1): kappa = 4/3
c = 2; A = np.zeros((2, 2, 2), complex); B = np.zeros_like(A); C = np.zeros_like(A)
A[0, 0, 1] = 1; A[1, 1, 1] = 1; C[0, 1, 0] = 1; C[1, 0, 0] = -1
e = exact4(A, B, C); n2 = 4.0
print('ledger c=2 example: E|R|^4/(E|R|^2)^2 = %.6f, kappa = %.6f (expect 4/3 = 1.333333), bound kappa >= %.6f' % (e/n2**2, (c/(c+1))**3*e/n2**2, (c/(c+1))**3*bound(A, B, C)/n2**2))
