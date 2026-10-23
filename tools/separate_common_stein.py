#!/usr/bin/env python3
"""Discover one common-kernel Stein separator for an EXACT saved radial law.

The proposed test is accepted only by rational arithmetic on that law.  It is
a universal radial Stein cut under the already documented spectral budgets,
not a Gaussian response, a continuous-law optimum, or a new norm endpoint.
Run the conic discovery on the droplet.  --verify uses the standard library.
"""
import argparse
from bisect import bisect_right
from fractions import Fraction as Q
import json
from pathlib import Path


def exact_profile(node, u):
    mesh = [Q(s)**2 for s in node['rv']]
    ph = list(map(Q, node['phi'])) + [Q(0)]
    j = bisect_right(mesh, u)-1
    assert j >= 0
    primitive = sum((ph[k]+ph[k+1])*(mesh[k+1]-mesh[k])/2 for k in range(j))
    slope = (ph[j+1]-ph[j])/(mesh[j+1]-mesh[j]) if j+1 < len(mesh) else Q(0)
    du = u-mesh[j]
    phi = ph[j]+slope*du
    Phi = primitive+ph[j]*du+slope*du**2/2
    d = phi-Phi/u if u else Q(0)
    return phi, Phi, d


def exact_cut(node, u):
    phi, Phi, d = exact_profile(node, u)
    lam, mu, t, beta, nu = (Q(node[k]) for k in ['lam','mu','t','beta','nu'])
    assert lam > 0 and mu > 0 and nu >= 0
    f = -(phi+beta)/2+(2*t+lam/3)*u
    g = -d/2+(t+mu/3-nu/2)*u
    return f*f/lam+g*g/mu+Phi-phi+(nu/3-2*t)*(u*u-2)


def verify(certificate):
    law = certificate['law']
    atoms = [(Q(a['v'])**2, Q(a['weight'])) for a in law['support']]
    x = Q(law['point']['x'])
    assert all(u >= 0 and w > 0 for u, w in atoms)
    assert sum(w for u,w in atoms) == 1
    assert sum(w*u for u,w in atoms) == 1
    assert sum(w*u*u for u,w in atoms) == 2+x*x
    rv = list(map(Q,certificate['cut']['rv']))
    assert rv[0] == 0 and all(a < b for a,b in zip(rv,rv[1:]))
    assert len(certificate['cut']['phi']) == len(rv)-1
    value = sum(w*exact_cut(certificate['cut'],u) for u,w in atoms)
    assert value < 0, ('not a separator', float(value))
    return {'index':law['index'], 'expectation':str(value), 'expectation_float':float(value),
            'strict_margin':str(-value), 'scope':'Rejects this saved atomic law under the universal Stein identity and spectral budgets; no endpoint.'}


def propose(law, refined=False):
    import numpy as np
    import cvxpy as cp
    rv = list(map(Q,['0','1/8','1/4','3/8','1/2','3/4','1','5/4','3/2','2','3','4','6','8','12','16']))
    if refined:
        rv = sorted(set(rv + [(a+b)/2 for a,b in zip(rv,rv[1:])]))
    m = len(rv)-1
    atoms=[(Q(z['v'])**2,Q(z['weight'])) for z in law['support']]
    u=np.array([float(a) for a,w in atoms]);weights=np.array([float(w) for a,w in atoms])
    Phi=np.empty((len(atoms),m)); phi=Phi.copy(); d=Phi.copy()
    for j in range(m):
        no={'rv':list(map(str,rv)), 'phi':[str(int(j==k)) for k in range(m)]}
        for i,(a,w) in enumerate(atoms):
            phi[i,j],Phi[i,j],d[i,j]=map(float,exact_profile(no,a))
    coeff=cp.Variable(m)
    lam,mu,nu=cp.Variable(),cp.Variable(),cp.Variable()
    t,beta=cp.Variable(),cp.Variable()
    ff=-(phi@coeff+beta)/2+(2*t+lam/3)*u
    gg=-(d@coeff)/2+(t+mu/3-nu/2)*u
    obj=cp.quad_over_lin(cp.multiply(np.sqrt(weights),ff),lam)+cp.quad_over_lin(cp.multiply(np.sqrt(weights),gg),mu)
    obj+=(weights@(Phi-phi))@coeff+(nu/3-2*t)*(weights@(u*u-2))
    constraints=[lam>=1e-7,mu>=1e-7,nu>=0,lam+mu+nu==1,coeff<=20,coeff>=-20]
    prob=cp.Problem(cp.Minimize(obj),constraints)
    prob.solve(solver='CLARABEL',tol_gap_abs=1e-10,tol_feas=1e-10,tol_gap_rel=1e-10,max_iter=200)
    assert prob.status in ['optimal','optimal_inaccurate'],prob.status
    rational=lambda a:str(Q(float(a)).limit_denominator(10**10))
    node={'rv':list(map(str,rv)),'phi':[rational(v) for v in coeff.value],
          **{name:rational(var.value) for name,var in [('lam',lam),('mu',mu),('nu',nu),('t',t),('beta',beta)]}}
    result={'scope':__doc__, 'law':{'index':law['index'],'point':law['point'],'support':law['support']},
            'cut':node,'discovery':{'status':prob.status,'objective':prob.value,'refined':refined}}
    result['exact_replay']=verify(result)
    return result


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('input',type=Path)
    p.add_argument('--out',type=Path)
    p.add_argument('--refined',action='store_true')
    p.add_argument('--verify',action='store_true')
    a=p.parse_args(); data=json.loads(a.input.read_text())
    if a.verify:
        r=verify(data)
        print('PASS exact common-Stein separator',r['index'],r['expectation_float'],flush=True)
    else:
        assert a.out is not None
        cert=propose(data,a.refined)
        a.out.write_text(json.dumps(cert,indent=2)+'\n')
        r=cert['exact_replay']
        print('PASS rational separator',r['index'],r['expectation_float'],flush=True)


if __name__=='__main__':main()
