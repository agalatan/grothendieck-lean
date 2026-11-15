"""codex-a713. Independent Abel-based family checks and adapted-coordinate optimum."""
import os
os.environ['OPENBLAS_NUM_THREADS']='1';os.environ['OMP_NUM_THREADS']='1';os.environ['VECLIB_MAXIMUM_THREADS']='1'
import sys,importlib.util,json
from pathlib import Path
root=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('ind',root/'opt_deterministic.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
np=m.np
from scipy.optimize import minimize_scalar,root as solve
k=m.Kernel(.001,192); rule=m.Rule(300,8)
def coeff(z):
    c=np.array([np.sqrt(2),0,0,z,0,0],complex)
    return c*np.sqrt(m.U)/np.linalg.norm(c)
def value(z):
    data=rule.data(coeff(z),k)
    return {'z_re':float(np.real(z)),'z_im':float(np.imag(z)),'ratio':data[0],'D':data[1],'C2':data[2],'C_re':data[3].real.tolist(),'C_im':data[3].imag.tolist(),'fourth_excess':data[4]}
out={}
out['monomial']=value(0)
res=minimize_scalar(lambda tau:-value(1j*tau)['ratio'],bounds=(0,.3),method='bounded',options={'xatol':1e-10})
out['imaginary_tau_max']=value(1j*res.x)
def grad(z):
    c=np.array([np.sqrt(2),0,0,z[0]+1j*z[1],0,0],complex)
    _,g=rule.objective(np.r_[c.real,c.imag],k)
    return np.array([g[3],g[9]])
res=solve(grad,np.array([.052835,.221226]),tol=1e-9)
out['complex_mix_local_max']=value(res.x[0]+1j*res.x[1])
out['complex_mix_gradient']=grad(res.x).tolist()
out['complex_mix_solver_success']=bool(res.success)
c=coeff(res.x[0]+1j*res.x[1]);out['coefficients_re']=c.real.tolist();out['coefficients_im']=c.imag.tolist()
template=np.zeros(6,complex);template[3]=np.sqrt(m.U);data=rule.data(template,k)
out['template']={'ratio':data[0],'D':data[1],'C2':data[2],'fourth_excess':data[4]}
out['tau_scan']=[value(1j*tau) for tau in np.linspace(0,.3,7)]
kap=float(k.values(np.array([m.U]))[2][0])
out['denominator_control_variate']={'kap':kap}
for name,c in [('monomial',coeff(0)),('local_max',c)]:
    qq=rule.E@c;v=np.abs(qq)**2;p=k.values(v)[0];ew=rule.weights
    varv=ew@(v*v)-(ew@v)**2;varp=ew@(p*p)-(ew@p)**2
    cov=ew@(v*p)-(ew@v)*(ew@p)
    varcontrolled=varp+kap*kap*varv-2*kap*cov
    out['denominator_control_variate'][name]={'variance_no_control':float(varp),'variance_with_control':float(varcontrolled),'variance_optimal_coefficient':float(cov/varv),'variance_ratio':float(varcontrolled/varp)}
    gg=k.values(v)[1];ci=rule.W.conj()*(qq*gg)[:,None];C=ew@ci
    D=k.bu-ew@p;R=np.vdot(C,C).real/D
    base=2*np.real(ci@C.conj())+R*p
    base-=ew@base;vv=v-ew@v
    krv=float((ew@(base*vv))/(R*varv))
    for label,kv in [('none',0),('source',kap),('optimal',krv)]:
        infl=(base-R*kv*vv)/D
        out['denominator_control_variate'][name]['ratio_se_at_2pow23_'+label]=float(np.sqrt(ew@(infl*infl)/(2**23)))
    out['denominator_control_variate'][name]['ratio_optimal_coefficient']=krv
(root/'opt_family_summary.json').write_text(json.dumps(out,indent=2))
print(json.dumps(out,indent=2))
