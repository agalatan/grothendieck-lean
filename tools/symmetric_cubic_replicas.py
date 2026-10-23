#!/usr/bin/env python3
"""FLOAT controls for an EXACT original-Gaussian two-replica construction.

Two 2x2 Wishart states replace the large X and residual-Y blocks. Projection
coordinates keep q and norm(Y) coupled. Gaussian noise acts on ORIGINAL X,Y,
not on independently relabeled scalar R,G,V. Dimension is 20 real uniforms.
This is a simulation/control tool, not an interval kernel certificate.
"""
import argparse
import json
from pathlib import Path
import numpy as np
from scipy.special import gammaincinv,ndtri
from scipy.stats import qmc

def cn(a,b):return (ndtri(a)+1j*ndtri(b))/np.sqrt(2)

def radii(k,rho,u):
    r=gammaincinv(k,u[:,0]);h=cn(u[:,1],u[:,2])
    s=gammaincinv(k-1,u[:,3]) if k>1 else np.zeros(len(u))
    noise=np.sqrt(max(0,1-rho*rho))
    cross=rho*r+noise*np.sqrt(r)*h.conj()
    other=rho*rho*r+noise*noise*(abs(h)**2+s)+2*rho*noise*np.sqrt(r)*h.real
    return r,other,cross

def sample(m,rho,power,seed):
    assert m>=2 and 0<=rho<=1
    u=qmc.Sobol(20,scramble=True,seed=seed).random_base2(power)
    r,rp,C=radii(m,rho,u[:,:4]);d=m*(m+1)//2;D=m*(m+1)
    v,vp,_=radii(d-2,rho,u[:,4:8])
    noise=np.sqrt(max(0,1-rho*rho))
    y1=cn(u[:,8],u[:,9]);y2=cn(u[:,10],u[:,11])
    yp1=rho*y1+noise*cn(u[:,12],u[:,13])
    yp2=rho*y2+noise*cn(u[:,14],u[:,15])
    a1=C.conj()**2/r
    residual=rp*rp-abs(a1)**2
    assert np.min(residual)>-1e-7*(1+np.max(rp*rp))
    a2=np.sqrt(np.maximum(0,residual))
    q=r*y1.conj()/np.sqrt(D);qp=(a1*yp1.conj()+a2*yp2.conj())/np.sqrt(D)
    sy=abs(y1)**2+abs(y2)**2+v;syp=abs(yp1)**2+abs(yp2)**2+vp
    z=cn(u[:,16],u[:,17]);zp=rho*z+noise*cn(u[:,18],u[:,19])
    def modes(z,r,sy,q):
        return np.column_stack([z,z*(abs(z)**2-2)/np.sqrt(2),z*(r-m)/np.sqrt(m),z*(sy-d)/np.sqrt(d),q])
    return modes(z,r,sy,q),modes(zp,rp,syp,qp),{'mean_q_cross':float(np.mean(q.conj()*qp).real),
        'conditional_covariance_algebra_error':float(np.max(abs(r*a1.conj()-C*C))),
        'conditional_variance_algebra_error':float(np.max(abs(abs(a1)**2+a2*a2-rp*rp)))}

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--out',type=Path,required=True)
    p.add_argument('--power',type=int,default=18);a=p.parse_args();rr=[]
    for m in [4,128]:
        for rho in [0.,.5,.9,1.]:
            B,C,control=sample(m,rho,a.power,77)
            exact=np.diag([rho]+[rho**3]*4)
            cross=B.conj().T@C/len(B)
            r={'m':m,'rho':rho,'power':a.power,'scope':__doc__,
               'cross_gram_max_error':float(np.max(abs(cross-exact))),
               'cross_gram_diagonal':[[float(z.real),float(z.imag)] for z in np.diag(cross)],
               **control}
            rr.append(r);print(m,rho,r['cross_gram_max_error'],flush=True)
            a.out.write_text(json.dumps(rr,indent=2)+'\n')

if __name__=='__main__':main()
