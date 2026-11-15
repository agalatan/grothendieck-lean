import numpy as np
exec(open('bcontent.py').read().split("kA,kB,kAB")[0])
rho=GB/G; r0=rho[0]
rng=np.random.default_rng(5); N=2_000_000
def cg(n): return (rng.standard_normal(n)+1j*rng.standard_normal(n))/np.sqrt(2)
X=cg(N); Y=cg(N)
for name,q0 in [('Wick X(|X|^2-2)',X*(abs(X)**2-2)),('X(|Y|^2-1)',X*(abs(Y)**2-1))]:
    for u in [0.0463,0.02]:
        q=q0/np.sqrt(np.mean(abs(q0)**2))*np.sqrt(u); v=abs(q)**2
        g=np.interp(v,vg,G); gb=np.interp(v,vg,GB)
        CA=abs(np.mean(np.conj(X)*q*g)); CB=abs(np.mean(np.conj(X)*q*gb)); err=np.mean(abs(q)*abs(g)*(np.interp(v,vg,rho)-r0))
        print(f"{name:16s} u={u}: C_A={CA:.5f} C_B={CB:.5f} C_B/C_A={CB/CA:.4f}; bound rho0*C_A + E|q||g|(rho-rho0) = {r0*CA+err:.5f} (err={err:.2e}), ratio to C_A = {(r0*CA+err)/CA:.3f}")
