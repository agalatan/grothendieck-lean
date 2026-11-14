# Decompose the best driver response pair of a game by degree in the driver w:
# h=(f+g)/2 (even in w), k=(f-g)/2 (odd in w); energies of h in w-Wick-degree 0 (visible), 2, >=4; of k in degree 1, >=3.
import numpy as np, sys, tailmodel as tm
lam=tuple(float(x) for x in sys.argv[1].split(',')); nu=float(sys.argv[2])
M=tm.Model(96,64,64); sh=M.r.shape
res=M.best(lam,nu,starts=(0.3,0.5),warm=False,quiet=True)
kr=[t for t in res if not t[1].startswith('vis')][0]; u,v=kr[2].reshape(sh),kr[3].reshape(sh)
print('game',lam,'tail',nu,' driver value %.7f'%kr[0],' visible value %.7f'%max(t[0] for t in res if t[1].startswith('vis')))
h=(u+v)/2; k=(u-v)/2; w=M.w; S=np.abs(w)**2
Wr=M.W.sum(axis=(1,2)); Wc=M.W/Wr[:,None,None]            # conditional weights given r
E=lambda F: np.sum(F*M.W).real
def slice_energy(F, basis):                                 # sum over basis of E_r |E_w[F conj(e)]|^2
    return sum(np.sum(Wr*np.abs(np.sum(F*np.conj(e)*Wc,axis=(1,2)))**2) for e in basis)
one=np.ones(sh)
deg0=[one]; deg1=[w,np.conj(w)]; deg2=[(S-1),w*w/np.sqrt(2),np.conj(w)**2/np.sqrt(2)]
deg3=[w*(S-2)/np.sqrt(2),np.conj(w)*(S-2)/np.sqrt(2),w**3/np.sqrt(6),np.conj(w)**3/np.sqrt(6)]
deg4=[(S*S-4*S+2)/2, w*w*(S-3)/np.sqrt(6), np.conj(w)**2*(S-3)/np.sqrt(6), w**4/np.sqrt(24), np.conj(w)**4/np.sqrt(24)]
Eh=E(np.abs(h)**2); Ek=E(np.abs(k)**2)
h0=slice_energy(h,deg0); h2=slice_energy(h,deg2); h4=slice_energy(h,deg4)
k1=slice_energy(k,deg1); k3=slice_energy(k,deg3)
print('||h||^2=%.5f  visible %.5f  w-degree 2: %.5f  degree 4: %.5f  degree>=6: %.5f   (non-visible total %.5f)'%(Eh,h0,h2,h4,Eh-h0-h2-h4,Eh-h0))
print('||k||^2=%.5f  w-degree 1: %.5f  degree 3: %.5f  degree>=5: %.5f'%(Ek,k1,k3,Ek-k1-k3))
print('   breakdown of h degree 2: (|w|^2-1): %.5f   w^2: %.5f   conj(w)^2: %.5f'%tuple(slice_energy(h,[e]) for e in deg2))
print('   var of |h| given z: %.5f ; phase-fluctuation part: %.5f'%(E(np.abs(h)**2)-np.sum(Wr*np.sum(np.abs(h)*Wc,axis=(1,2))**2), np.sum(Wr*np.sum(np.abs(h)*Wc,axis=(1,2))**2)-h0))
