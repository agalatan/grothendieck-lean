# Hill-climb for the worst C(q)^2/D(q) over one-driver cubics (10 shells, C^4 remote) at fixed u, peak row.
import numpy as np, sys, time
exec(open('scan_majorant.py').read().split("rng=np.random.default_rng(123)")[0])   # reuse tables phi, g, Bu
rng=np.random.default_rng(7); N=1_200_000
def cg(n): return (rng.standard_normal(n)+1j*rng.standard_normal(n))/np.sqrt(2)
X=cg(N); Y0,Y1,Y2=cg(N),cg(N),cg(N); S=abs(X)**2
basis=[X*(S-2), X*(abs(Y0)**2-1), X*np.conj(Y0)*Y1, np.conj(X)*Y0*Y0, (S-1)*Y0, X*X*np.conj(Y1),
       Y0*(abs(Y0)**2-2), Y0*(abs(Y1)**2-1), X*(abs(Y1)**2-1), np.conj(X)*Y0*Y1, X*(abs(Y2)**2-1), Y1*Y1*np.conj(Y2)]
Bm=np.array(basis); Ys=[Y0,Y1,Y2]
def ratio(c,u):
    q=c@Bm; q=q/np.sqrt(np.mean(abs(q)**2))*np.sqrt(u); rho=abs(q)**2
    D=Bu(u)-np.mean(np.interp(rho,vg,PHI)); Fq=q*np.interp(rho,vg,G)
    C2=abs(np.mean(np.conj(X)*Fq))**2+sum(abs(np.mean(np.conj(y)*Fq))**2 for y in Ys)
    return C2/D, D, C2
for u in [0.0055,0.01,0.02,0.0463]:
    best=(0,None); t0=time.time()
    for restart in range(6):
        c=rng.standard_normal(12)+1j*rng.standard_normal(12); r,_,_=ratio(c,u); step=0.6
        for it in range(25):
            c2=c+step*(rng.standard_normal(12)+1j*rng.standard_normal(12)); r2,_,_=ratio(c2,u)
            if r2>r: c,r=c2,r2
            else: step*=0.85
        if r>best[0]: best=(r,c/np.linalg.norm(c))
    r,D,C2=ratio(best[1],u); w=np.abs(best[1])**2
    print(f"u={u}: worst C^2/D found = {r:.4f} (D={D:.2e}, C^2={C2:.2e}) in {time.time()-t0:.0f}s; weights |c_j|^2 = {np.round(w,2)}",flush=True)
