"""Chaos content of BOUNDED functions of a cubic chaos q in the h-side shells of the degree-5 scheme (orders 2 and 4),
normalised by the function's energy; q = c*H21(X1) + sqrt(1-c^2) * diffuse(N).  Shells (w-bidegree, charge):
 (1,1) charge 0: basis |w_j|^2 - 1 (diagonal) and w_j conj(w_k), j!=k;   (2,0) charge 2: w_j w_k;
 (2,2) charge 0: H_{2,2} diagonal-type (|w_j|^2-1)(|w_k|^2-1), j<k, and (|w_j|^4 - 4|w_j|^2 + 2)/2;   (3,1) charge 2: w_j^2 (|w_j|^2 - 2)/sqrt2 and w_j w_k (|w_k|^2-1) ...
We measure the diagonal-type families only (the full shells are larger; this is a lower estimate of the content and an
upper-bound target for the lemma constant on these families).  G: charge 0 -> min(|q|,3), 1{|q|<1};  charge 2 -> phase(q)^2."""
import numpy as np, math
rng = np.random.default_rng(11)
def run(c, N, n=400000, reps=3):
    acc = np.zeros(7)
    for _ in range(reps):
        X = (rng.standard_normal((n, N+1)) + 1j*rng.standard_normal((n, N+1)))/math.sqrt(2)
        H = X*(np.abs(X)**2 - 2)/math.sqrt(2)
        q = c*H[:,0] + math.sqrt(1-c*c)*H[:,1:].sum(1)/math.sqrt(N)
        m = np.mean(np.abs(q)**4); aq = np.abs(q)
        G0 = np.minimum(aq, 3.0); G0 = G0 - G0.mean(); e0 = np.mean(G0**2)          # charge 0 bounded, centred
        G1 = (aq < 1).astype(float); G1 -= G1.mean(); e1 = np.mean(G1**2)
        G2 = (q/aq)**2; e2 = 1.0                                                     # charge 2 bounded
        A = np.abs(X)**2 - 1                                                         # (1,1) diagonal basis, unit norm
        Q4 = (np.abs(X)**4 - 4*np.abs(X)**2 + 2)/2.0                                 # (2,2) one-variable, unit norm
        B2 = X*X/math.sqrt(2)                                                        # (2,0) one-variable, unit norm
        B31 = X*X*(np.abs(X)**2-2)/math.sqrt(2*3)                                    # (3,1) one-variable: E|.|^2 = ?
        B31 /= np.sqrt(np.mean(np.abs(B31)**2, 0))
        s11_0 = np.sum(np.mean(A*G0[:,None],0)**2)/e0; s11_1 = np.sum(np.mean(A*G1[:,None],0)**2)/e1
        s22_0 = np.sum(np.mean(Q4*G0[:,None],0)**2)/e0; s22_1 = np.sum(np.mean(Q4*G1[:,None],0)**2)/e1
        s20_2 = np.sum(np.abs(np.mean(np.conj(B2)*G2[:,None],0))**2)/e2
        s31_2 = np.sum(np.abs(np.mean(np.conj(B31)*G2[:,None],0))**2)/e2
        acc += [m-2, s11_0, s11_1, s22_0, s22_1, s20_2, s31_2]
    return acc/reps
print(" c    N    m-2    (1,1)|q|  (1,1)ind  (2,2)|q|  (2,2)ind  (2,0)ph^2  (3,1)ph^2   | ratios to (m-2): (1,1)|q| (2,2)|q| (2,0) (3,1)")
for c, N in [(0.0,128),(0.0,64),(0.0,32),(0.0,16),(0.3,128),(0.4,64),(0.5,128),(0.3,16),(1.0,1)]:
    r = run(c, N); d = max(r[0],1e-9)
    print(f"{c:4.2f} {N:4d} {r[0]:7.3f}  {r[1]:.5f}   {r[2]:.5f}   {r[3]:.5f}   {r[4]:.5f}   {r[5]:.5f}    {r[6]:.5f}    | {r[1]/d:.4f} {r[3]/d:.4f} {r[5]/d:.4f} {r[6]/d:.4f}")
