"""Chaos content of bounded functions of a cubic chaos q with ONE spike: q = c*H21(X1) + sqrt(1-c^2)*W_diffuse(N).
Measures theta_{(1,0)} = sum_j |E[conj(X_j) G(q)]|^2 for G = phase and G = clipped cubic, vs m-2 = 42 c^4 + 42(1-c^2)^2/N.
Claim under test: theta is NOT controlled by m-2 alone (spiky q has large content at small m-2)."""
import numpy as np, math
rng = np.random.default_rng(7)
def run(c, N, n=600000, reps=4):
    acc = np.zeros(4)
    for _ in range(reps):
        X = (rng.standard_normal((n, N+1)) + 1j*rng.standard_normal((n, N+1)))/math.sqrt(2)
        H = X*(np.abs(X)**2 - 2)/math.sqrt(2)                      # H21 of each coordinate, unit variance
        q = c*H[:,0] + math.sqrt(1-c*c)*H[:,1:].sum(1)/math.sqrt(N)
        m = np.mean(np.abs(q)**4)
        ph = q/np.abs(q)
        cub = q*np.abs(q)**2 - 2*q; cub = cub/np.sqrt(np.mean(np.abs(cub)**2))   # unit-norm cubic of q (unbounded)
        clip = np.clip(np.abs(cub), 0, 3)*cub/np.maximum(np.abs(cub),1e-300); clip /= np.sqrt(np.mean(np.abs(clip)**2))
        lin_ph  = np.sum(np.abs(np.mean(np.conj(X)*ph[:,None], 0))**2)      # first-chaos content of phase(q)
        lin_cl  = np.sum(np.abs(np.mean(np.conj(X)*clip[:,None], 0))**2)    # of the clipped cubic (unit norm)
        spike_ph = np.abs(np.mean(np.conj(X[:,0])*ph))**2                   # along the spike coordinate only
        acc += [m-2, lin_ph, lin_cl, spike_ph]
    return acc/reps
print(" c     N    m-2     theta_phase  theta_clipcubic  (spike dir)   theta_phase/(m-2)")
for c, N in [(0.0,128),(0.0,32),(0.2,128),(0.3,128),(0.3,32),(0.4,128),(0.5,128),(0.6,128),(0.3,8),(1.0,1)]:
    r = run(c, N)
    print(f"{c:4.2f} {N:4d}  {r[0]:7.3f}   {r[1]:.5f}      {r[2]:.5f}       {r[3]:.5f}      {r[1]/max(r[0],1e-9):.4f}")
