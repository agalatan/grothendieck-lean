# L1_5 remote-law LP at the degree-5 peak row with the repository's Stein cuts (PROOF.md section 4, eq. (11)-(12)):
#   for phi continuous piecewise affine (constant after its last knot), Phi=int phi, d=phi-Phi/u, A=Phi-phi,
#   f0=-(phi+beta)/2+(2t+lam/3)u, g0=-d/2+(t+mu/3-nu/2)u,
#   G(u)=f0^2/lam+g0^2/mu+A(u)+(nu/3-2t)(u^2-2),   E G(U) >= 0 for every genuine H_{2,1} cubic.
# Constraints: E U=1, E U^2=m, E U^3 <= 9m-12+C6(m-2)^{3/2}, plus E G_k(U) >= 0 for imported/generated cuts.
import sys,os; sys.path.insert(0,os.path.dirname(os.path.abspath(__file__)))
import numpy as np, json
from fractions import Fraction as Fr
from scipy.optimize import linprog
from scipy.interpolate import CubicSpline
import d5row as D
C6=4045313/100000
def G_eval(u, knots, vals, beta, t, lam, mu, nu):
    """Evaluate the Stein cut G at points u (numpy array, u>=0)."""
    knots=np.asarray(knots,float); vals=np.asarray(vals,float)
    u=np.asarray(u,float); out=np.empty_like(u)
    # piece data
    seg=np.searchsorted(knots,u,side='right')-1      # index of piece; last piece constant
    seg=np.clip(seg,0,len(knots)-1)
    # cumulative integral at knots
    cum=np.concatenate([[0.0],np.cumsum(np.diff(knots)*(vals[:-1]+vals[1:])/2)])
    a=knots[seg]; fa=vals[seg]
    last=(seg==len(knots)-1)
    fb=np.where(last,fa,vals[np.minimum(seg+1,len(knots)-1)])
    b=np.where(last,a+1.0,knots[np.minimum(seg+1,len(knots)-1)])
    Bs=np.where(last,0.0,(fb-fa)/(b-a))
    phi=fa+Bs*(u-a)
    Phi=cum[seg]+(u-a)*(fa+phi)/2
    with np.errstate(divide='ignore',invalid='ignore'):
        d=np.where(u>0,phi-Phi/u,0.0)
    A=Phi-phi
    f0=-(phi+beta)/2+(2*t+lam/3)*u
    g0=-d/2+(t+mu/3-nu/2)*u
    return f0**2/lam+g0**2/mu+A+(nu/3-2*t)*(u**2-2)
def load_nodes(path):
    rows=json.load(open(path)); out=[]
    for r in rows:
        f=lambda s: float(Fr(s))
        out.append(dict(knots=[f(x) for x in r['knots']],vals=[f(x) for x in r['phi']],beta=f(r['beta']),t=f(r['t']),lam=f(r['lam']),mu=f(r['mu']),nu=f(r['nu'])))
    return out
class LP:
    def __init__(self,row,X=None,S=None):
        self.row=row; G=json.load(open('gauss_%s.json'%row)); self.S5=G['S5']; self.u0,self.nu3,self.nu5,self.a,self.b=G['x']
        self.S=np.linspace(0,9.0,901) if S is None else S
        self.sp=CubicSpline(self.S,D.Psi_on(self.S,row,self.nu3,self.nu5,self.a,self.b))
        N=1200; self.X=440.0*(np.arange(N+1)/N)**2 if X is None else X
        self.cuts=[]
    def add_cut_values(self,gx): self.cuts.append(np.asarray(gx))
    def solve(self,u,m):
        X=self.X; f=self.sp(np.minimum(np.sqrt(u*X),self.S[-1]))
        Aeq=np.vstack([np.ones_like(X),X,X**2]); beq=[1,1,m]
        Aub=[X**3]; bub=[9*m-12+C6*max(m-2,0)**1.5]
        for g in self.cuts: Aub.append(-g); bub.append(0.0)
        res=linprog(-f,A_ub=np.array(Aub),b_ub=bub,A_eq=Aeq,b_eq=beq,bounds=(0,None),method='highs')
        if res.status!=0: return None,None
        return -res.fun-D.cost(u,self.row,self.nu3,self.nu5,self.a,self.b)-self.S5,res.x
    def scan(self,us,ms):
        best=(-9,None,None,None)
        for m in ms:
            for u in us:
                g,p=self.solve(u,m)
                if g is not None and g>best[0]: best=(g,u,m,p)
        return best
if __name__=='__main__':
    lp=LP('peak')
    us=np.linspace(0.75*lp.u0,1.35*lp.u0,25); ms=[2.0,2.005,2.01,2.02,2.04,2.08,2.15,2.3]
    g,u,m,p=lp.scan(us,ms); print('moments only: gap %+.4e at u=%.5f m=%.3f'%(g,u,m))
    nodes=load_nodes('/Users/alingalatan/workspaces/grothe/research/conjecture-K/code/audit-2026-11-15-codex-a7c4/remote_stein_original/stein-nodes.json')
    # sanity: the exponential law satisfies every cut (E G >= 0) -- check by Gauss-Laguerre
    from numpy.polynomial.laguerre import laggauss
    tt,ww=laggauss(120)
    vals=[(ww*G_eval(tt,**n)).sum() for n in nodes]
    print('E_Exp G over the 45 cubic nodes: min %.3e max %.3e'%(min(vals),max(vals)))
    for n in nodes: lp.add_cut_values(G_eval(lp.X,**n))
    g2,u2,m2,p2=lp.scan(us,ms); print('with the 45 cubic Stein cuts: gap %+.4e at u=%.5f m=%.3f'%(g2,u2,m2))
    at=[(float(lp.X[i]),float(p2[i])) for i in np.nonzero(p2>1e-10)[0]]
    print('law atoms:',[(round(x,4),round(q,7)) for x,q in at])
    json.dump(dict(gap_moments=g,gap_45=g2,u=u2,m=m2,atoms=at),open('stein_peak_45.json','w'))
