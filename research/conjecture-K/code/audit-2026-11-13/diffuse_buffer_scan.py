# Agent ID: codex-a713. Fresh deterministic Rice/Bessel integration, no project imports.
import sys,json,time
from pathlib import Path
import numpy as np
from scipy.special import roots_laguerre,i0e,i1e
from scipy.optimize import minimize_scalar
U=.0463; A=699/1250; B=179/1250

def rice(r2,s):
    x=r2/(2*s)
    return .5*np.sqrt(np.pi*s)*((1+2*x)*i0e(x)+2*x*i1e(x))

class Calc:
    def __init__(self,n=96,nt=128):
        self.n=n; self.nt=nt
        t,w=roots_laguerre(n)
        self.R=t; self.w=w
        self.r=np.sqrt(t)*(A+B*t)
        self.co=np.cos(2*np.pi*(np.arange(nt)+.5)/nt)
        self.Bu=2*np.dot(w,rice(self.r**2,U))
    def eval(self,f):
        e=U*f; s=U-e
        z=np.sqrt(e/2)*np.sqrt(self.R)*(self.R-2)
        fvals=np.empty(self.n); cvals=np.empty(self.n)
        for j in range(self.n):
            x=z[j]+self.r[:,None]*self.co[None,:]
            r2=z[j]**2+self.r[:,None]**2+2*z[j]*self.r[:,None]*self.co[None,:]
            scaled=r2/(2*s)
            h=.5*np.sqrt(np.pi/s)*(i0e(scaled)+i1e(scaled))
            phase=np.mean(x*h,axis=1)
            fvals[j]=2*np.dot(self.w,np.mean(rice(r2,s),axis=1))
            cvals[j]=np.sqrt(self.R[j])*np.dot(self.w,(self.R-1)*phase)
        F=np.dot(self.w,fvals); C=np.dot(self.w,cvals); D=self.Bu-F
        return {'fraction':float(f),'energy':float(e),'buffer_variance':float(s),'F':float(F),'C':float(C),'D':float(D),'ratio':float(C*C/D)}

if __name__=='__main__':
    n=int(sys.argv[1]) if len(sys.argv)>1 else 80
    nt=int(sys.argv[2]) if len(sys.argv)>2 else 128
    q=Calc(n,nt); start=time.time()
    fracs=[.01,.025,.05,.10,.15,.2,.3,.4,.5,.6,.7,.8,.9,.95,.98]
    out=[]
    for f in fracs:
        ans=q.eval(f); out.append(ans); print(json.dumps(ans),flush=True)
    res=minimize_scalar(lambda f:-q.eval(f)['ratio'],bounds=(.1,.96),method='bounded',options={'xatol':1e-7})
    best=q.eval(res.x)
    obj={'n':n,'nt':nt,'seconds':time.time()-start,'B':float(q.Bu),'grid':out,'best':best}
    Path(__file__).with_name(f'diffuse_buffer_{n}_{nt}.json').write_text(json.dumps(obj,indent=2)+'\n')
    print(json.dumps({'best':best,'seconds':time.time()-start}),flush=True)
