import numpy as np, itertools, importlib.util, sys
spec = importlib.util.spec_from_file_location('w4', 'wick4.py')
src = open('wick4.py').read().split('for c in (2, 3):')[0]          # reuse the definitions only
ns = {}; exec(src, ns)
crandn, single, exact4, bound = ns['crandn'], ns['single'], ns['exact4'], ns['bound']
rng = np.random.default_rng(7)
def term(S, Tn, common, pat):
    letters = iter('abcdefghijklmnop'); eS, eT, eSc, eTc = [], [], [], []
    for k in range(3):
        u, v = next(letters), next(letters)
        if k == common: s_, t_, sc_, tc_ = (u, v, u, v) if pat[k] == 0 else (u, v, v, u)
        else:           s_, t_, sc_, tc_ = (u, v, u, v) if pat[k] == 0 else (u, u, v, v)
        eS.append(s_); eT.append(t_); eSc.append(sc_); eTc.append(tc_)
    e = ''.join(eS) + ',' + ''.join(eT) + ',' + ''.join(eSc) + ',' + ''.join(eTc) + '->'
    return np.einsum(e, S, Tn, S.conj(), Tn.conj())
worst = {}
for c in (2, 3, 4, 5):
    for trial in range(200):
        A = ns['crandn'](c, c, c); B = ns['crandn'](c, c, c)
        t = {pat: term(A, B, 2, pat) for pat in itertools.product([0, 1], repeat=3)}
        assert all(abs(v.imag) < 1e-9*abs(v) + 1e-9 for v in t.values())
        nA, nB = np.vdot(A, A).real, np.vdot(B, B).real
        PA = A.reshape(-1, c).T @ A.reshape(-1, c).conj(); PB = B.reshape(-1, c).T @ B.reshape(-1, c).conj()
        assert abs(t[(0, 0, 0)].real - nA*nB) < 1e-9*nA*nB
        assert abs(t[(0, 0, 1)].real - np.trace(PA @ PB).real) < 1e-9*nA*nB      # tr(P_A^w P_B^w), common cluster w
        for px, py in [(1, 1), (1, 0), (0, 1)]:
            s = (t[(px, py, 0)] + t[(px, py, 1)]).real
            worst[(px, py)] = min(worst.get((px, py), 1e9), s/(nA*nB))
print('pairing identities: (c,c,st) = |A|^2|B|^2 and (c,c,tw) = tr(P_A^w P_B^w) hold (rel. 1e-9) on 800 random pairs')
print('smallest normalised sums of the three remaining pairs (each must be >= 0):', {k: '%.3e' % v for k, v in worst.items()})
# chain: E|R|^4 >= 2S^2 + (2/c)[...]: margin on random mixed tensors, including near-extremal structured ones
mins = {}
for c in (2, 3, 4, 6, 8):
    m = 1e9
    for trial in range(300):
        A, B, C = [crandn(c, c, c)*rng.uniform(0, 1) for _ in range(3)]
        n2 = sum(np.vdot(T, T).real for T in (A, B, C))
        m = min(m, (exact4(A, B, C) - bound(A, B, C))/n2**2)
    mins[c] = m
print('min over random mixed R of (E|R|^4 - bound)/(E|R|^2)^2:', {c: '%.4f' % v for c, v in mins.items()})
