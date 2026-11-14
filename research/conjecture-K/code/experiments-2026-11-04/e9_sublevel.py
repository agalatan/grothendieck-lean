"""E9: sublevel-set condition (stronger than the Key Lemma, scale-free): for a chaos Y of order k with |DY|^2 explicit,
   R(t) := E[|DY|^2 ; |Y| < t] / (k sigma^2 P(|Y| < t))  <= 1  for every t > 0   (ratio of conditional gradient energy to its mean).
Layer cake: this implies E[(tau_Y - sigma^2) h(|Y|)] <= 0 for every decreasing h, in particular the Key Lemma at every scale."""
import numpy as np, math
rng = np.random.default_rng(5); n = 6_000_000
G = rng.standard_normal((n, 4)); g1,g2,g3,g4 = G.T
def test(Y, DY2, k, label):
    s2 = np.mean(Y**2); ay = np.abs(Y); order = np.argsort(ay); cs = np.cumsum(DY2[order]); cnt = np.arange(1, n+1)
    R = cs/(k*s2*cnt)                       # ratio at thresholds t = sorted |Y|
    qs = [0.001,0.01,0.05,0.2,0.5,0.8,0.95,0.999]; idx = [int(q*n)-1 for q in qs]
    print(f"{label:34s} max R = {np.max(R[1000:]):.4f} at quantile {np.argmax(R[1000:])/n+0:.3f} | R at quantiles " + " ".join(f"{R[i]:.3f}" for i in idx))
# cubic families with explicit gradients
test(g1**3-3*g1, (3*g1**2-3)**2, 3, "H3(g)")
test((g1**2-1)*g2, (2*g1*g2)**2 + (g1**2-1)**2, 3, "(g1^2-1) g2")
test(g1*g2*g3, (g2*g3)**2+(g1*g3)**2+(g1*g2)**2, 3, "g1 g2 g3")
a,b = 1.0,1.0; test(a*(g1**3-3*g1)+b*(g1**2-1)*g2, (3*a*(g1**2-1)+2*b*g1*g2)**2+(b*(g1**2-1))**2, 3, "H3(g1) + (g1^2-1) g2")
a,b = 0.3,1.0; test(a*(g1**3-3*g1)+b*(g1**2-1)*g2, (3*a*(g1**2-1)+2*b*g1*g2)**2+(b*(g1**2-1))**2, 3, "0.3 H3(g1) + (g1^2-1) g2")
test(g1**2-1, (2*g1)**2, 2, "H2(g) (degree 2)")
test(g1*g2, g1**2+g2**2, 2, "g1 g2 (degree 2)")
test(g1**4-6*g1**2+3, (4*g1**3-12*g1)**2, 4, "H4(g)")
test(g1**5-10*g1**3+15*g1, (5*g1**4-30*g1**2+15)**2, 5, "H5(g)")
# random symmetric cubic form in 4 variables: Y = sum a_ijk g_i g_j g_k - 3 sum_k (sum_i a_iik) g_k ; grad computed analytically
A = rng.standard_normal((4,4,4)); A = (A+A.transpose(1,0,2)+A.transpose(0,2,1)+A.transpose(2,1,0)+A.transpose(1,2,0)+A.transpose(2,0,1))/6
tr = np.einsum('iik->k', A)
Y = np.einsum('ijk,ni,nj,nk->n', A, G, G, G) - 3*np.einsum('k,nk->n', tr, G)
grad = 3*np.einsum('ijk,nj,nk->ni', A, G, G) - 3*tr[None,:]
test(Y, np.sum(grad**2,1), 3, "random symmetric cubic form (4 vars)")
test(np.real((g1+1j*g2)/math.sqrt(2)*((g1**2+g2**2)/2-2)), None or 0*g1, 3, "placeholder") if False else None
