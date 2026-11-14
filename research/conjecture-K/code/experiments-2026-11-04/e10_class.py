"""E10: check Thread-2's class theorem by MC with common random numbers at the peak row:
G = z2 [alpha (T-1) + i lam (S3 - 1)]  (conditionally Gaussian given z1, z3), same-norm comparison F(G) <= F(sigma W) at several norms."""
import numpy as np, math
rng=np.random.default_rng(3); n=4_000_000
Z=(rng.standard_normal((n,3))+1j*rng.standard_normal((n,3)))/math.sqrt(2); W=(rng.standard_normal(n)+1j*rng.standard_normal(n))/math.sqrt(2)
T=np.abs(Z[:,0])**2; S3=np.abs(Z[:,2])**2
for (ell,beta,label) in [(0.8456,0.1432,"peak"),(0.87703,0.15175,"t=0.86")]:
    L=Z[:,0]*(ell+beta*(T-2))
    print(f"row {label}: F(G)-F(sigma W) (negative = Gaussian wins), s.e. ~ 3e-4")
    for (al,lam) in [(1,0),(0,1),(1,1),(1,-1),(1,0.3)]:
        base=Z[:,1]*(al*(T-1)+1j*lam*(S3-1)); nrm=math.sqrt(np.mean(np.abs(base)**2))
        out=[]
        for s in [0.05,0.1,0.2,0.4,0.8]:
            G=s*base/nrm; FG=np.mean(np.abs(L+G))+np.mean(np.abs(L-G)); FW=np.mean(np.abs(L+s*W))+np.mean(np.abs(L-s*W)); out.append(f"s={s}:{FG-FW:+.1e}")
        print(f"  alpha={al} lam={lam}: "+" ".join(out))
