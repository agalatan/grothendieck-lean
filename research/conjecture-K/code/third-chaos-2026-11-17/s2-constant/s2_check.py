import numpy as np, sympy as sp, mpmath as mp
c, a, b = sp.symbols('c a b', positive=True)
al = sp.Rational(1, 2) - c; be = sp.Rational(1, 4) - c**2/2
F = (3/a)*al**2 + sp.Rational(7, 4)/b*(5*be - 3*al)**2
F0 = F.subs(c, 0)
print('(a) zonal identity (a=b=1):', sp.simplify(F.subs({a: 1, b: 1}) - sp.Rational(55, 64) + c*(1-c)*(sp.Rational(17, 64) + sp.Rational(7, 16)*(5*c - sp.Rational(7, 2))**2)) == 0)
print('(b) weighted identity:', sp.simplify(F - F0 - c*(1-c)*(-3/a + sp.Rational(7, 16)/b*(5*c-1)*(6-5*c))) == 0,
      ' threshold b/a = 175/192:', sp.solve(sp.Eq(sp.Rational(7, 16)*sp.Rational(25, 4), 3*b), b)[0] == sp.Rational(175, 192))
# (c) hemisphere on S^(k-1): numeric projection vs closed form, sign of projection
def hem(k):
    k = mp.mpf(k); Z = mp.beta(0.5, (k-1)/2); w = lambda z: (1 - z**2)**((k-3)/2)/Z
    I1 = 2*mp.quad(lambda z: z*w(z), [0, 1]); q3 = lambda z: z**3 - 3*z/(k+2)
    n3 = mp.quad(lambda z: q3(z)**2*w(z), [-1, 1]); i3 = 2*mp.quad(lambda z: q3(z)*w(z), [0, 1])
    E1 = k*I1**2; E3 = i3**2/n3
    closed = 2*(k+2)*(7*k+1)/(3*mp.pi*k*(k+1)**2)*(mp.gamma(k/2+1)/mp.gamma((k+1)/2))**2
    return E1 + E3, closed, k*I1, i3/n3
for k in range(2, 9):
    v, cl, A, B = hem(k)
    # projection = A z + B (z^3 - 3z/(k+2)) ; ratio of z^3 to z coefficient should be -(k+4)/9
    r = B/(A - 3*B/(k+2))
    print('(c) k=%d: hemisphere energy %s closed %s | z^3/z coefficient %s vs -(k+4)/9 = %s' % (k, mp.nstr(v, 10), mp.nstr(cl, 10), mp.nstr(r, 8), mp.nstr(-mp.mpf(k+4)/9, 8)))
print('    k -> infinity limit 7/(3 pi) =', mp.nstr(7/(3*mp.pi), 8), ' k=400:', mp.nstr(hem(400)[1], 8))
# (d),(e),(f) on S^2 with a fine (z, phi) grid (midpoint rule; normalised measure dz dphi/(4 pi))
NZ, NP = 4000, 8000
z = (np.arange(NZ) + 0.5)/NZ*2 - 1; ph = (np.arange(NP) + 0.5)/NP*2*np.pi
Z, PH = np.meshgrid(z, ph, indexing='ij'); R = np.sqrt(1 - Z**2); X, Y = R*np.cos(PH), R*np.sin(PH)
basis = [np.sqrt(3)*X, np.sqrt(3)*Y, np.sqrt(3)*Z, np.sqrt(7)*(5*Z**3 - 3*Z)/2, np.sqrt(42)/4*(5*Z**2-1)*X, np.sqrt(42)/4*(5*Z**2-1)*Y,
         np.sqrt(105)/2*Z*(X**2-Y**2), np.sqrt(105)*X*Y*Z, np.sqrt(70)/4*(X**3-3*X*Y**2), np.sqrt(70)/4*(3*X**2*Y-Y**3)]
G = np.array([[np.mean(p*q) for q in basis] for p in basis]); print('    basis Gram max |G - I| =', np.abs(G - np.eye(10)).max())
def Psq(S): return sum(np.mean(S*e)**2 for e in basis)
print('(d) octant sign(xyz): %.6f   105/(16 pi^2) = %.6f' % (Psq(np.sign(X*Y*Z)), 105/(16*np.pi**2)))
print('(e) sector sign(x^3-3xy^2): %.6f   315/512 = %.6f' % (Psq(np.sign(X**3 - 3*X*Y**2)), 315/512))
H = Z*(9 - 7*Z**2); print('    hemisphere: %.6f   55/64 = %.6f' % (Psq(np.sign(H)), 55/64))
for eps in [0.4, 0.2, 0.1]:
    S = np.sign(H + eps*(X**3 - 3*X*Y**2)); pred = -(5/8)*(eps**2/162)
    print('(f) m=3 second variation, eps=%.2f: Delta = %.3e, predicted -(5/8) eps^2/162 = %.3e' % (eps, Psq(S) - 55/64, pred))
