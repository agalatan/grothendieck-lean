#!/usr/bin/env python3
"""FLOAT discovery oracle around the actual upper incumbent.

Perturbations are T(x) exp(i theta.psi(x)), before the same matrix smoothing
and tensor-power preprocessing as master. All psi are real and charge zero.
The anchor has a single inherited l1 uncertainty, not independent errors at
the sampled noise values. Gaussian integration here is QMC, NOT a certificate.
"""
import argparse
from fractions import Fraction as Q
import json
import math
from pathlib import Path

import numpy as np
from scipy.optimize import linprog, minimize
from scipy.special import eval_genlaguerre, gammaln, hyp2f1, ndtri
from scipy.stats import qmc


def phase(z):
    return np.divide(z, abs(z), out=np.zeros_like(z), where=abs(z)>0)


def gaussians(logn, seed, coordinates):
    # All integrands used below are invariant under one common phase. Fix the
    # first coordinate positive and integrate that phase exactly (8D -> 7D).
    u = qmc.Sobol(2*coordinates-1, scramble=True, seed=seed).random_base2(logn)
    z = ndtri(np.clip(u[:,1:], 2**-54, 1-2**-54))/math.sqrt(2)
    return np.column_stack([np.sqrt(-np.log1p(-u[:,0])),z[:,::2]+1j*z[:,1::2]])


class Rounder:
    def __init__(self, data):
        self.data = data
        self.profile = np.array([float(Q(x)) for x in data['profileQ']])
        b = float(Q(data['bQ'])); self.u = np.array([1.,b])/math.sqrt(1+b*b)
        pu = np.outer(self.u,self.u)
        self.M = pu+math.sqrt(float(Q(data['etaQ'])))*(np.eye(2)-pu)
        self.P, self.Q = [np.array([float(Q(x)) for x in data[k]]) for k in ['pList','qList']]
        self.poly = {}
        for term in data['phase']:
            i,j,k = term['powers']
            self.poly[i,j,k] = np.longdouble(term['coefficient'].split('/')[0])/np.longdouble(
                term['coefficient'].split('/')[1] if '/' in term['coefficient'] else '1')
        self.degree = max(sum(k) for k in self.poly)

    def raw(self, x):
        z,w = x.T
        U,V = abs(z)**2,abs(w)**2
        C = z.conj()*w; W,D = C.real,C.imag
        # Nested sparse Horner, long double for the cancellation in S.
        uu,vv,ww = [a.astype(np.longdouble) for a in [U,V,W]]
        S = np.zeros_like(uu)
        for i in range(self.degree,-1,-1):
            row = np.zeros_like(uu)
            for j in range(self.degree-i,-1,-1):
                term = np.zeros_like(uu)
                for k in range(self.degree-i-j,-1,-1):
                    term = term*ww+self.poly.get((i,j,k),0)
                row = row*vv+term
            S = S*uu+row
        phi = np.asarray(D*np.exp(-float(Q(self.data['phaseEpsQ']))*(U+V))*S,dtype=float)
        prof = sum(c*eval_genlaguerre(j,-.5,U)/math.exp(.5*(gammaln(j+.5)-gammaln(j+1)))
                   for j,c in enumerate(self.profile))
        f0 = phase(z+math.sqrt(1+float(Q(self.data['aQ']))**2)*prof*w)
        T = f0*(1+1j*phi-phi**2/2-1j*phi**3/6)
        assert np.isfinite(T).all() and np.max(abs(T)) < 1+1e-9, (np.max(abs(T)), np.max(abs(phi)))
        # Conjugation-odd, charge-zero phase directions. No new buffer.
        e = np.exp(-.5*(U+V))
        psi = np.array([D*e,D*e*(U-1),D*e*(V-1),D*e*W,
                        D*e*(U-1)*(V-1),D*np.exp(-1.5*(U+V))]).T
        return T,psi

    def matrix(self,r):
        p = r*np.polynomial.polynomial.polyval(r*r,self.P)
        q = r*np.polynomial.polynomial.polyval(r*r,self.Q)
        A = self.M@np.diag([p,q])@self.M
        ev,U = np.linalg.eigh(np.eye(2)-A@A)
        assert min(ev)>-1e-12
        B = (U*np.sqrt(np.maximum(0,ev)))@U.T
        return A,B

    def low_features(self,x):
        z,w=x.T
        # H21 in the z coordinate after applying the matrix smoothing.
        y=x@self.M[0]
        aux=x@self.M[1]
        variance = self.M[0]@self.M[0]
        cross = self.M[0]@self.M[1]
        return np.array([self.M[0,0]*z+self.M[0,1]*w,
                         self.M[1,0]*z+self.M[1,1]*w,
                         y*(abs(y)**2-2*variance)/math.sqrt(2),
                         (y*y*aux.conj()-2*cross*y)/math.sqrt(2),
                         (abs(y)**2-variance)*aux-cross*y,
                         y*(abs(y)**4-6*variance*abs(y)**2+6*variance**2)/math.sqrt(12)]).T.conj()


def select_prices(rounder, head, rhos, cutoff=128, columns=()):
    """An admissible all-level price, anchored by ONE l1 error ball."""
    c=np.array([float(Q(x)) for x in head['head']]);xi=float(Q(head['total_l1_radius']))
    r=np.array(rhos);R=r[:,None]**(2*np.arange(len(c))[None,:]+1)
    rem=R@c-r*c[0]-r**3*c[1]
    # v,s,a,t. v >= anchor linear payoff + xi. Also include exact
    # linear-phase rounders along several directions in the raw C^2 space.
    q=len(r);N=2+2*q;A=[];b=[]
    row=np.r_[-1,-c[1],-rem,np.zeros(q)]
    A.append(row);b.append(-c[0]-xi)
    for column in columns:
        delta=column['candidate']
        assert column['prices']['rho']==list(map(lambda x:str(Q(str(x))),rhos))
        d0,d1=delta['c0_shift'],delta['c1_shift']
        dR=np.array(delta['kernel_shifts'])-r*d0-r**3*d1
        A.append(np.r_[-1,-(c[1]+d1),-(rem+dR),np.zeros(q)])
        b.append(-c[0]-d0-xi)
    for angle in [0., math.atan(rounder.u[1]/rounder.u[0]), .5, -.2]:
        u=np.array([math.cos(angle),math.sin(angle)])
        m=u@rounder.M
        e0=math.pi/4*rounder.P[0]*m[0]**2
        e1=math.pi/4*(rounder.P[1]*m[0]**2+rounder.Q[1]*m[1]**2)+math.pi/32*(rounder.P[0]*m[0]**2)**3
        a=np.array([u@rounder.matrix(t)[0]@u for t in r])
        kernel=math.pi/4*a*hyp2f1(.5,.5,2,a*a)
        A.append(np.r_[-1,-e1,-(kernel-r*e0-r**3*e1),np.zeros(q)])
        b.append(-e0)
    for k in range(2,cutoff+1):
        row=np.r_[0.,0.,r**(2*k+1),np.zeros(q)]
        A.extend([row,-row]);b.extend([1.,1.])
    for j in range(q):
        for sign in [-1,1]:
            row=np.zeros(N);row[2+j]=sign;row[2+q+j]=-1
            A.append(row);b.append(0.)
    A.append(np.r_[0.,0.,np.zeros(q),r**(2*cutoff+3)]);b.append(1.)
    A.append(np.r_[0.,0.,np.zeros(q),np.ones(q)]);b.append(10.)
    fit=linprog(np.r_[1.,0.,np.zeros(q),np.full(q,1e-12)],A_ub=A,b_ub=b,
                bounds=[(None,None),(-1,1)]+[(None,None)]*q+[(0,None)]*q,
                options={'dual_feasibility_tolerance':1e-9,'primal_feasibility_tolerance':1e-9})
    assert fit.success,fit.message
    qr=list(map(lambda x:Q(str(x)),rhos))
    qa=[Q(float(x)).limit_denominator(10**7) for x in fit.x[2:2+q]]
    scale=max([Q(1),sum(abs(x)*t**(2*cutoff+3) for x,t in zip(qa,qr))]+
              [abs(sum(x*t**(2*k+1) for x,t in zip(qa,qr))) for k in range(2,cutoff+1)])
    qa=[x/scale for x in qa]
    qs=Q(float(fit.x[1])).limit_denominator(10**7)
    assert abs(qs)<=1
    lam=[Q(1),-qs]+[-sum(a*t**(2*k+1) for a,t in zip(qa,qr)) for k in range(2,len(c))]
    anchor=sum(x*Q(y) for x,y in zip(lam,head['head']))+Q(head['total_l1_radius'])
    assert anchor>=Q(head['incumbent_certified_score'])
    return {'rho':list(map(str,qr)),'price':list(map(str,qa)),'s':str(qs),'cutoff':cutoff,
            'anchor_payoff_upper':str(anchor),'all_index_price_scale':str(scale),
            'nominal_pool_screen_upper':float(fit.x[0]),'perturbation_columns':len(columns),
            'warning':'Anchor is conditional on the documented master inputs; reference integrals in this LP are floating.'}


class Oracle:
    def __init__(self,rounder,prices,logn,seed):
        self.r=rounder;self.prices=prices
        self.a=np.array([float(Q(x)) for x in prices['price']])
        self.rho=np.array([float(Q(x)) for x in prices['rho']])
        self.w0=1+self.a@self.rho
        self.w1=-float(Q(prices['s']))+self.a@(self.rho**3)
        self.samples=[]
        xw=gaussians(logn,seed,4);x=xw[:,:2];w=xw[:,2:]
        self.T,self.psi=rounder.raw(x)
        self.low=rounder.low_features(x)
        # Exact reference coefficient for phase(u.x), an analytic control variate.
        ref=phase(x@rounder.u)
        v=rounder.M@rounder.u
        h1=-1/(2*math.sqrt(2));h2=3/(8*math.sqrt(3))
        reference=np.sqrt(np.pi)/2*np.array([v[0],v[1],h1*v[0]**3,
            h1*v[0]**2*v[1],math.sqrt(2)*h1*v[0]**2*v[1],h2*v[0]**5])
        self.C=reference+np.mean(self.low*(self.T-ref)[:,None],axis=0)
        for r in self.rho:
            A,B=rounder.matrix(r);y=x@A+w@B
            t,ps=rounder.raw(y)
            self.samples.append((t,ps))
        self.P=rounder.P;self.Q=rounder.Q
        self.low_weights=np.array([[self.P[0],0,0,0,0,0],
            [self.P[1],self.Q[1],self.P[0]**3,0,0,0],
            [self.P[2],self.Q[2],3*self.P[0]**2*self.P[1],
             self.P[0]**2*self.Q[1],self.P[0]**2*self.Q[1],self.P[0]**5]])
        self.cached_params=None
        print('CACHE',seed,2**logn,'samples; max |T|=',max(abs(self.T)),flush=True)

    def objective(self,params):
        if self.cached_params is not None and np.array_equal(self.cached_params,params):
            return self.cached_result
        # Independent left and right perturbations; signed cross coefficients.
        n=self.psi.shape[1];theta,eta=params[:n],params[n:]
        ef=np.exp(1j*(self.psi@theta));eg=np.exp(1j*(self.psi@eta))
        f=self.T*ef;g=self.T*eg
        dCf=np.mean(self.low*(f-self.T)[:,None],axis=0)
        dCg=np.mean(self.low*(g-self.T)[:,None],axis=0)
        Cf,Cg=self.C+dCf,self.C+dCg
        dprod=(self.C.conj()*dCg+dCf.conj()*self.C+dCf.conj()*dCg).real
        d0,d1,d2=self.low_weights@dprod
        w=self.w0*self.low_weights[0]+self.w1*self.low_weights[1]
        df=np.mean(self.low[:,:,None]*(1j*f[:,None,None]*self.psi[:,None,:]),axis=0)
        dg=np.mean(self.low[:,:,None]*(1j*g[:,None,None]*self.psi[:,None,:]),axis=0)
        self.low_gradient=np.hstack([self.low_weights@(df.conj()*Cg[:,None]).real,
                                    self.low_weights@(Cf.conj()[:,None]*dg).real])
        gradf=(w[:,None]*df.conj()*Cg[:,None]).real.sum(axis=0)
        gradg=(w[:,None]*Cf.conj()[:,None]*dg).real.sum(axis=0)
        value=self.w0*d0+self.w1*d1
        shifts=[]
        for a,(t,ps) in zip(self.a,self.samples):
            fy=t*np.exp(1j*(ps@theta))
            gy=t*np.exp(1j*(ps@eta))
            # Exact Mehler reciprocity: average the pair with its swap.
            # At theta=eta this makes the left/right derivatives identical.
            delta=(.5*(f.conj()*gy+g.conj()*fy)-self.T.conj()*t).real.mean()
            value-=a*delta;shifts.append(float(delta))
            gradf-=.5*a*np.mean((-1j*self.psi*f.conj()[:,None]*gy[:,None]+
                                  1j*ps*g.conj()[:,None]*fy[:,None]).real,axis=0)
            gradg-=.5*a*np.mean((1j*ps*f.conj()[:,None]*gy[:,None]-
                                  1j*self.psi*g.conj()[:,None]*fy[:,None]).real,axis=0)
        self.last={'priced_gain_estimate':float(value),'c0_shift':float(d0),'c1_shift':float(d1),
                   'c2_shift':float(d2),
                   'kernel_shifts':shifts,'parameters':list(map(float,params))}
        self.cached_params=params.copy();self.cached_result=(-value,-np.r_[gradf,gradg])
        return self.cached_result


def validate_rounder(rounder):
    """Pointwise Arb replay of the raw formula, not an integral enclosure."""
    from flint import arb, acb, ctx
    ctx.prec=192
    def b(q):
        q=Q(q);return arb(q.numerator)/q.denominator
    def zball(z):return acb(b(float(z.real)),b(float(z.imag)))
    x=gaussians(4,91007,2)
    t,ps=rounder.raw(x)
    rot=np.exp(.71j)
    tr,pr=rounder.raw(x*rot);tc,pc=rounder.raw(x.conj())
    assert max(abs(tr-rot*t))<1e-10 and max(abs(tc-t.conj()))<1e-10
    assert np.max(abs(pr-ps))<1e-12 and np.max(abs(pc+ps))<1e-12
    largest=0.
    for (zz,ww),approx in zip(x,t):
        z,w=zball(zz),zball(ww)
        U,V=abs(z)**2,abs(w)**2;cross=z.conjugate()*w;W,D=cross.real,cross.imag
        S=arb(0)
        up=[U**i for i in range(rounder.degree+1)]
        vp=[V**i for i in range(rounder.degree+1)]
        wp=[W**i for i in range(rounder.degree+1)]
        for term in rounder.data['phase']:
            i,j,k=term['powers'];S+=b(term['coefficient'])*up[i]*vp[j]*wp[k]
        phi=D*(-b(rounder.data['phaseEpsQ'])*(U+V)).exp()*S
        prof=arb(0)
        for j,c in enumerate(rounder.data['profileQ']):
            lag=arb(0)
            for k in range(j+1):
                coeff=Q((-1)**k,math.factorial(k))
                for h in range(j-k):coeff*=Q(2*j-1-2*h,2*(h+1))
                lag+=b(coeff)*U**k
            norm=(arb.pi().sqrt()*math.comb(2*j,j)/4**j).sqrt()
            prof+=b(c)*lag/norm
        ell=z+(1+b(rounder.data['aQ'])**2).sqrt()*prof*w
        exact=ell/abs(ell)*(1+acb(0,phi)-phi**2/2-acb(0,phi**3/6))
        err=abs(exact-zball(approx))
        assert err < b('1/10000000000'), str(err)
        largest=max(largest,float(err.upper()))
    return {'scope':'Directed pointwise replay, not integration or uniform error proof.',
            'points':len(x),'precision_bits':ctx.prec,'max_pointwise_error_upper':largest,
            'charge_one_control':True,'conjugation_control':True}


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('input',type=Path);p.add_argument('head',type=Path)
    p.add_argument('--out',type=Path,required=True);p.add_argument('--logn',type=int,default=15)
    p.add_argument('--seed',type=int,default=7291);p.add_argument('--iterations',type=int,default=30)
    p.add_argument('--box',type=float,default=.12)
    p.add_argument('--parameters',type=Path)
    p.add_argument('--pool',type=Path,nargs='*',default=[])
    p.add_argument('--validate',action='store_true')
    p.add_argument('--preserve-head',action='store_true',
                   help='Tie branches and preserve cubic/quintic coefficients; do not lower the slope.')
    p.add_argument('--slope-objective',action='store_true',
                   help='With --preserve-head maximize the actual linear coefficient, not a dual price.')
    p.add_argument('--screen-only',action='store_true')
    a=p.parse_args();data=json.loads(a.input.read_text());head=json.loads(a.head.read_text())
    r=Rounder(data)
    if a.validate:
        result=validate_rounder(r)
        a.out.write_text(json.dumps(result,indent=2)+'\n')
        print('PASS raw rounder controls',json.dumps(result),flush=True)
        return
    prices=(json.loads(a.parameters.read_text())['prices'] if a.parameters else
            select_prices(r,head,[.2,.4,.6,.8,.9,.97,.99],
                          columns=[json.loads(x.read_text()) for x in a.pool]))
    print('PRICE', {k:prices.get(k) for k in ['rho','price','s','nominal_pool_screen_upper']},flush=True)
    if a.screen_only:
        a.out.write_text(json.dumps({'prices':prices,'scope':'Necessary floating pool screen, not an achieved score.'},indent=2)+'\n')
        return
    oracle=Oracle(r,prices,a.logn,a.seed);x=np.zeros(12)
    baseline=oracle.low_weights@(abs(oracle.C)**2)
    print('BASELINE low-mode QMC estimates',baseline.tolist(),
          'stored-head midpoints',[float(Q(x)) for x in head['head'][:3]],flush=True)
    z,g=oracle.objective(x)
    assert z==0
    assert np.max(abs(g[:6]-g[6:]))<1e-14
    # Check an analytic gradient away from the identity; catches phase signs.
    probe=np.linspace(-.003,.003,12);val,grad=oracle.objective(probe)
    low_grad=oracle.low_gradient.copy()
    for j in [0,6,9]:
        xp=probe.copy();xm=probe.copy();xp[j]+=1e-5;xm[j]-=1e-5
        vp=oracle.objective(xp)[0]
        lp=np.array([oracle.last[k] for k in ['c0_shift','c1_shift','c2_shift']])
        vm=oracle.objective(xm)[0]
        lm=np.array([oracle.last[k] for k in ['c0_shift','c1_shift','c2_shift']])
        fd=(vp-vm)/2e-5
        assert abs(fd-grad[j])<2e-8,(j,fd,grad[j])
        assert np.max(abs((lp-lm)/2e-5-low_grad[:,j]))<2e-8
    print('PASS zero perturbation and analytic gradient controls; initial gradient',(-g).tolist(),flush=True)
    if a.parameters:
        x=np.array(json.loads(a.parameters.read_text())['candidate']['parameters'])
        oracle.objective(x);candidate=oracle.last.copy();fitinfo=None
    elif a.preserve_head:
        def obj(t):
            val,grad=oracle.objective(np.r_[t,t])
            if a.slope_objective:
                return -oracle.last['c0_shift'],-(oracle.low_gradient[0,:6]+oracle.low_gradient[0,6:])
            return val,grad[:6]+grad[6:]
        def eq(t):
            obj(t);return np.array([oracle.last['c1_shift'],oracle.last['c2_shift']])
        def eqjac(t):
            obj(t);return oracle.low_gradient[1:,:6]+oracle.low_gradient[1:,6:]
        def slope(t):
            obj(t);return oracle.last['c0_shift']
        def slopejac(t):
            obj(t);return oracle.low_gradient[0,:6]+oracle.low_gradient[0,6:]
        fit=minimize(obj,np.zeros(6),jac=True,method='SLSQP',bounds=[(-a.box,a.box)]*6,
                     constraints=[{'type':'eq','fun':eq,'jac':eqjac},
                                  {'type':'ineq','fun':slope,'jac':slopejac}],
                     options={'maxiter':a.iterations,'ftol':1e-12})
        oracle.objective(np.r_[fit.x,fit.x]);candidate=oracle.last.copy()
        fitinfo={'success':bool(fit.success),'message':str(fit.message),'iterations':int(fit.nit),
                 'objective':'linear slope' if a.slope_objective else 'frozen full-tail price',
                 'constraints':'cubic/quintic shifts zero; slope shift nonnegative, on the discovery quadrature only.'}
    else:
        fit=minimize(oracle.objective,x,jac=True,method='L-BFGS-B',bounds=[(-a.box,a.box)]*12,
                     options={'maxiter':a.iterations,'ftol':1e-14,'gtol':1e-9,'maxls':30})
        oracle.objective(fit.x);candidate=oracle.last.copy()
        fitinfo={'success':bool(fit.success),'message':str(fit.message),'iterations':int(fit.nit)}
    out={'scope':'Floating QMC discovery only; not an achieved score or new endpoint.',
         'seed':a.seed,'logn':a.logn,'prices':prices,'candidate':candidate,'fit':fitinfo,
         'integrator':'Global phase integrated exactly; Mehler pair averaged with its swap.',
         'baseline_low_estimates':baseline.tolist(),
         'anchor_low_midpoints':[float(Q(x)) for x in head['head'][:3]],
         'incumbent_score':head['incumbent_certified_score'],
         'price_payoff_upper_anchor':prices['anchor_payoff_upper'],
         'test':'An oracle improves the frozen linear price. This is a necessary exchange step, not a full-score gain.'}
    a.out.parent.mkdir(parents=True,exist_ok=True);a.out.write_text(json.dumps(out,indent=2)+'\n')
    print('RESULT',json.dumps(candidate),flush=True)


if __name__=='__main__':main()
