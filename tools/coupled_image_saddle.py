#!/usr/bin/env python3
"""Discovery: solve the coupled negative-image problem in a closed graded model.

Run substantial sample sizes on ssh yo in your own directory. No Gaussian
integral enclosure, dimension-free cover, or global endpoint is asserted.
Z,X have original grade1 and W original grade3. The basis below retains ALL
grade1/3 modes of this two-visible-coordinate plus diffuse-cubic model.
"""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import platform
import time
import numpy as np
from scipy.optimize import minimize
from scipy.special import ndtri
from scipy.stats import qmc


def sample(power,seed):
    # Midpoints of the 52-bit digital cells keep ndtri away from both
    # endpoints. A scrambled net can otherwise contain an exact zero.
    uniforms=qmc.Sobol(6,scramble=True,seed=seed,bits=52).random_base2(power)
    v=ndtri(uniforms+2.**-53)
    if not np.all(np.isfinite(v)):
        raise ArithmeticError('Nonfinite inverse-normal sample')
    Z=(v[:,0]+1j*v[:,1])/np.sqrt(2)
    X=(v[:,2]+1j*v[:,3])/np.sqrt(2)
    W=(v[:,4]+1j*v[:,5])/np.sqrt(2)
    # u is even, v odd under the simultaneous (X,W) sign reversal.
    A=np.column_stack([Z*(abs(Z)**2-2)/np.sqrt(2),
                       Z*(abs(X)**2-1),X*X*Z.conj()/np.sqrt(2)])
    Q=np.column_stack([X*(abs(X)**2-2)/np.sqrt(2),
                       X*(abs(Z)**2-1),Z*Z*X.conj()/np.sqrt(2),W])
    return {'Z':Z,'X':X,'A':A,'Q':Q}


def decode(x):
    return x[:4]+1j*x[4:]


def encode(z):
    return np.r_[np.asarray(z).real,np.asarray(z).imag]


def prepare(data,p,q,eps):
    n=len(data['Z']);A=data['A'];X=data['X']
    plus=np.column_stack([eps*A,X]);minus=np.column_stack([eps*A,-X])
    return data|{'p':p*data['Z'],'q':data['Q']@q,'q_coefficients':q,'eps':eps,'n':n,
                 'Dplus':np.column_stack([plus,1j*plus]),
                 'Dminus':np.column_stack([minus,1j*minus]),
                 'weights':np.array([eps,eps,eps,1.])}


def exposed(model,x,smoothing=0.):
    c=decode(x);eps=model['eps'];A=model['A'];X=model['X']
    mid=model['p']-eps*(A@c[:3]);remote=eps*model['q']-X*c[3]
    rp,rm=mid+remote,mid-remote
    ap,am=abs(rp),abs(rm)
    if smoothing:
        sp,sm=np.sqrt(ap*ap+smoothing*smoothing),np.sqrt(am*am+smoothing*smoothing)
    else:
        sp,sm=np.maximum(ap,1e-300),np.maximum(am,1e-300)
    f,g=rp/sp,rm/sm;u,v=(f+g)/2,(f-g)/2
    project=np.r_[A.conj().T@u/model['n'],np.vdot(X,v)/model['n']]
    grad=encode(2*model['weights']*(c-project))
    value=float(model['weights']@(abs(c)**2)+np.mean(ap+am))
    return value,grad,{'rp':rp,'rm':rm,'ap':ap,'am':am,'sp':sp,'sm':sm,
                       'f':f,'g':g,'u':u,'v':v,'project':project}


def optimize(model,start,visible_only=False,maxiter=100):
    if visible_only:
        # Conjugation symmetry is not assumed; optimize the complex H21 slot.
        use=np.array([0,4])
        def objective(z):
            x=np.zeros(8);x[use]=z
            value,grad,_=exposed(model,x)
            return value,grad[use]
        result=minimize(objective,start[use],jac=True,method='L-BFGS-B',
                        options={'maxiter':maxiter,'gtol':2e-9,'ftol':1e-13})
        x=np.zeros(8);x[use]=result.x
    else:
        result=minimize(lambda x:exposed(model,x)[:2],start,jac=True,
                        method='L-BFGS-B',options={'maxiter':maxiter,
                                                  'gtol':2e-9,'ftol':1e-13})
        x=result.x
    return x,{'success':bool(result.success),'message':str(result.message),
              'iterations':result.nit,'evaluations':result.nfev}


def metrics(model,x,p,q):
    value,grad,h=exposed(model,x)
    eps=model['eps'];c=decode(x);n=model['n']
    actual_p=np.vdot(model['Z'],h['u'])/n
    actual_q=model['Q'].conj().T@h['v']/n
    a=h['project'][:3];b=h['project'][3]
    J=float(abs(actual_p)**2+eps*np.sum(abs(actual_q)**2)
            -eps*np.sum(abs(a)**2)-abs(b)**2)
    negative=float(eps*np.sum(abs(c[:3]-a)**2)+abs(c[3]-b)**2)
    positive=float(abs(p-actual_p)**2+eps*np.sum(abs(q-actual_q)**2))
    outer=value-p*p-eps*float(np.sum(abs(q)**2))
    identity_error=float(outer-J-negative+positive)
    if not np.isfinite(identity_error) or abs(identity_error)>2e-12:
        raise ArithmeticError('Coupled image gap identity failed')
    return {'dual_value':value,'fixed_positive_image_outer_trial':outer,
            'phase_pair_payoff_estimate':J,'negative_image_gap_upper_estimate':negative,
            'positive_image_defect_estimate':positive,'gap_identity_error':identity_error,
            'closure_gradient_norm':float(np.linalg.norm(grad)),
            'negative_coefficients':{'real':c.real.tolist(),'imag':c.imag.tolist()},
            'projected_negative_images':{'real':h['project'].real.tolist(),
                                         'imag':h['project'].imag.tolist()},
            'projected_positive_p':[float(actual_p.real),float(actual_p.imag)],
            'projected_positive_q':{'real':actual_q.real.tolist(),'imag':actual_q.imag.tolist()}}


def majorizer(model,x,eta):
    before,_,h=exposed(model,x,smoothing=eta)
    n=model['n'];C=np.diag(np.r_[model['weights'],model['weights']])
    for D,s in [(model['Dplus'],h['sp']),(model['Dminus'],h['sm'])]:
        C+=.5*(D.conj().T@(D/s[:,None])).real/n
    g=encode(model['weights']*(decode(x)-h['project']))
    allowance=float(.5*np.mean((h['sp']-h['ap'])**2/h['sp']
                                +(h['sm']-h['am'])**2/h['sm']))
    step=-np.linalg.solve(C,g)
    predicted=float(-allowance-2*g@step-step@C@step)
    after=exposed(model,x+step)[0]
    if before-after<predicted-2e-12:
        raise ArithmeticError('Finite-amplitude quadratic majorizer failed on sampled measure')
    return x+step,{'eta':eta,'predicted_decrement_sampled':predicted,
                   'allowance_sampled':allowance,'actual_decrement_sampled':before-after,
                   'minimum_curvature_eigenvalue':float(np.linalg.eigvalsh(C)[0]),
                   'step_norm':float(np.linalg.norm(step))}


def buffered_diagonal_step(model,x,eta):
    """Analytic curvature/allowance bounds; gradient is still floating QMC."""
    sigma=float(abs(model['eps']*model['q_coefficients'][-1]))
    if sigma==0:
        return None,{'status':'NOT_APPLICABLE_NO_GAUSSIAN_BUFFER'}
    before,_,h=exposed(model,x,smoothing=eta)
    g=encode(model['weights']*(decode(x)-h['project']))
    eps=model['eps'];K=np.sqrt(np.pi)/sigma
    diagonal=np.r_[np.full(3,eps+K*eps*eps),1+K]
    diagonal=np.r_[diagonal,diagonal]
    allowance=2*eta**3/(3*sigma*sigma)
    step=-g/diagonal
    predicted=float(np.sum(g*g/diagonal)-allowance)
    after=exposed(model,x+step)[0]
    return x+step,{'status':'ANALYTIC_BUFFER_CONSTANTS_NUMERICAL_GRADIENT',
                   'eta':eta,'sigma':sigma,'reciprocal_modulus_bound':K,
                   'curvature_diagonal_upper':diagonal.tolist(),
                   'allowance_analytic_upper':allowance,
                   'predicted_decrement_using_sampled_gradient':predicted,
                   'actual_decrement_sampled':before-after,
                   'step_norm':float(np.linalg.norm(step))}


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--fit-power',type=int,default=16)
    ap.add_argument('--eval-power',type=int,default=18)
    ap.add_argument('--seed',type=int,default=1)
    ap.add_argument('--maxiter',type=int,default=100)
    ap.add_argument('--out',type=Path,required=True)
    args=ap.parse_args()
    print(json.dumps({'status':'START','pid':os.getpid(),'host':platform.node()}),flush=True)
    if not 8<=args.fit_power<=22 or not 8<=args.eval_power<=23:
        ap.error('Use sample powers 8..22/23; substantial runs belong on the droplet')
    fixture=Path(__file__).with_name('fresh_lower_frozen_response_gram.py')
    expected='15a863df1e06635370165f3fa922ca019bd036a1652869168e10d7c6d4ba7ef0'
    if hashlib.sha256(fixture.read_bytes()).hexdigest()!=expected:
        raise ArithmeticError('Frozen contact fixture hash changed')
    spec=importlib.util.spec_from_file_location('contact_fixture',fixture)
    old=importlib.util.module_from_spec(spec);spec.loader.exec_module(old)
    eps=149/200;ell,beta,variance=old.contact(eps)
    initial=encode(np.array([-np.sqrt(2)*beta/eps,0,0,0],complex))
    # All rows have the same positive cubic-image norm. Visible-coupled
    # modes share the SAME X and W used by the response functions.
    cases=[('Gaussian',[0,0,0,1]),('remote-H21',[1,0,0,0]),
           ('remote-hard-defect',[.325,0,0,np.sqrt(1-.325**2)]),
           ('remote-binding-defect',[(33/(50*np.sqrt(42)))**.5,0,0,
                                    np.sqrt(1-33/(50*np.sqrt(42)))]),
           ('remote-mixture',[.5,0,0,np.sqrt(.75)]),
           ('visible-A',[0,.35,0,np.sqrt(1-.35**2)]),
           ('visible-AB',[0,.25,.25,np.sqrt(.875)]),
           ('coupled-Wick',[.5,.25,.25,np.sqrt(.625)]),
           ('complex-coupled',[.5,.25j,.25,np.sqrt(.625)])]
    fit=sample(args.fit_power,101+args.seed*100)
    evaluate=sample(args.eval_power,203+args.seed*100)
    rows=[]
    for name,raw in cases:
        started=time.monotonic();direction=np.asarray(raw,dtype=complex)
        direction/=np.linalg.norm(direction);q=direction*np.sqrt(variance)/eps
        fm=prepare(fit,ell,q,eps);em=prepare(evaluate,ell,q,eps)
        partial,partial_status=optimize(fm,initial,True,args.maxiter)
        full,full_status=optimize(fm,partial,False,args.maxiter)
        mm,mm_report=majorizer(fm,partial,.003)
        diagonal,diagonal_report=buffered_diagonal_step(fm,partial,.001)
        partial_eval=metrics(em,partial,ell,q);full_eval=metrics(em,full,ell,q)
        row={'name':name,'q_direction':{'real':direction.real.tolist(),
                                      'imag':direction.imag.tolist()},
             'partial_optimizer':partial_status,'full_optimizer':full_status,
             'partial_fit':metrics(fm,partial,ell,q),'full_fit':metrics(fm,full,ell,q),
             'partial_independent_eval':partial_eval,'full_independent_eval':full_eval,
             'negative_image_correction_independent_eval':partial_eval['dual_value']-full_eval['dual_value'],
             'MM_step_fit':mm_report,'MM_step_independent_eval':metrics(em,mm,ell,q),
             'analytic_buffer_step':diagonal_report,
             'analytic_buffer_independent_eval':None if diagonal is None else metrics(em,diagonal,ell,q),
             'elapsed_seconds':time.monotonic()-started}
        if direction[1]==0 and direction[2]==0:
            row['normalized_remote_fourth_excess_exact_formula']='42*abs(kappa)^4'
            row['normalized_remote_fourth_excess']=float(42*abs(direction[0])**4)
            row['sqrt_fourth_excess']=float(np.sqrt(42)*abs(direction[0])**2)
        rows.append(row)
        print(json.dumps({'name':name,'correction_eval':row['negative_image_correction_independent_eval'],
                          'full_outer_eval':full_eval['fixed_positive_image_outer_trial'],
                          'payoff_eval':full_eval['phase_pair_payoff_estimate'],
                          'MM':mm_report,'seconds':row['elapsed_seconds']}),flush=True)
    report={'status':'DISCOVERY_GRADED_COUPLED_IMAGE_SADDLE_NO_ENDPOINT',
            'scope':__doc__,'parameters':vars(args)|{'out':str(args.out)},
            'runtime':{'host':platform.node(),'pid':os.getpid(),
                       'python':platform.python_version(),'numpy':np.__version__},
            'sobol_uniform_transform':'52-bit scrambled Sobol cell midpoints: u+2^-53',
            'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
            'contact':{'epsilon':'149/200','ell':float(ell),'beta':float(beta),
                       'variance':float(variance)},'frozen_fixture_sha256':expected,
            'negative_basis':['H21(Z)','Z*(|X|²-1)','X²*conj(Z)/sqrt2','first X'],
            'positive_q_basis':['H21(X)','X*(|Z|²-1)','Z²*conj(X)/sqrt2','grade3 W'],
            'rows':rows,
            'warning':'QMC residuals and held-out checks are not integration error bounds. A fixed EXACT inner optimum is a lower bound on the all-response norm, not a global upper cap; a numerical dual trial must retain its negative-image residual bracket. The majorizer and buffer constants are analytic, but gradients/expectations here remain discovery.'}
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(report,indent=2,allow_nan=False)+'\n')


if __name__=='__main__':main()
