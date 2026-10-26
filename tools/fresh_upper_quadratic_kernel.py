#!/usr/bin/env python3
"""General asymmetric two-coordinate quadratic-phase kernels.

F(X)=phase(u X)exp(i X*H X), G(Y)=phase(v Y)exp(i Y*K Y).
H,K are independently Hermitian, u,v independently complex rows.
Physical cross-covariance is diag(scales_j*t**grades_j), for real |t|<=1.
Complex t denotes the analytic odd continuation, not a physical covariance.

Floating diagnostics only. A finite-head D score is NOT a Grothendieck bound.
Run: uv run --with numpy --with scipy python this_file.py --output DIRECTORY
"""
import argparse
from dataclasses import dataclass, replace
import json
from pathlib import Path
import numpy as np
from scipy.special import hyp2f1


def phase(z):
    return np.divide(z, abs(z), out=np.ones_like(z), where=abs(z)>0)


def phase_kernel(t):
    t=np.asarray(t,dtype=complex)
    return (np.pi/4)*t*hyp2f1(.5,.5,2,t*t)


def row(a,b):
    z=np.asarray([a,b],dtype=complex)
    return z/np.linalg.norm(z)


@dataclass
class Candidate:
    name: str
    u: np.ndarray
    v: np.ndarray
    H: np.ndarray
    K: np.ndarray
    grades: tuple=(1,3)
    scales: tuple=(1.,1.)

    def validate(self):
        for z in [self.H,self.K]:
            if z.shape!=(2,2) or np.max(abs(z-z.conj().T))>=1e-14:
                raise ValueError('H and K must be Hermitian 2x2 matrices')
        if len(self.u)!=2 or len(self.v)!=2 or min(np.linalg.norm(self.u),np.linalg.norm(self.v))<=0:
            raise ValueError('u and v must be nonzero two-component rows')
        if len(self.grades)!=2 or len(self.scales)!=2:
            raise ValueError('Exactly two channel grades and scales are required')
        if not all(type(w) is int and w>=1 and w%2==1 for w in self.grades):
            raise ValueError('Channel grades must be positive odd integers')
        if not all(np.isreal(s) and abs(s)<=1 for s in self.scales):
            raise ValueError('Channel scales must be real contractions')

    def swapped(self):
        return replace(self,u=self.v,v=self.u,H=self.K,K=self.H)

    def reflected(self):
        return replace(self,u=self.u.conj(),v=self.v.conj(),
                       H=-self.H.conj(),K=-self.K.conj())

    def to_json(self):
        def enc(a):
            return {"real":a.real.tolist(),"imag":a.imag.tolist()}
        return {"name":self.name,"u":enc(self.u),"v":enc(self.v),
                "H":enc(self.H),"K":enc(self.K),
                "grades":self.grades,"scales":self.scales}

    @classmethod
    def from_json(cls,data):
        def dec(z):
            return np.asarray(z['real'])+1j*np.asarray(z['imag'])
        x=cls(data['name'],dec(data['u']),dec(data['v']),dec(data['H']),dec(data['K']),
              tuple(data['grades']),tuple(data['scales']))
        x.validate()
        return x


def kernel(candidate,t,diagnostics=False):
    """Determinant/tilt identity; enforce a safe principal-branch domain.

    The safeguards suffice for the small chirps used here. A candidate failing
    them needs explicit analytic continuation, not suppression of the checks.
    """
    candidate.validate()
    t=np.asarray(t,dtype=complex)
    Sigma=np.broadcast_to(np.eye(4,dtype=complex),t.shape+(4,4)).copy()
    for j,(w,s) in enumerate(zip(candidate.grades,candidate.scales)):
        rho=s*t**w
        # Same analytic t in both blocks. Conjugating t here would destroy
        # holomorphic continuation and invalidate Cauchy coefficients.
        Sigma[...,j,2+j]=rho
        Sigma[...,2+j,j]=rho
    Q=np.zeros((4,4),dtype=complex)
    Q[:2,:2]=1j*candidate.H
    Q[2:,2:]=-1j*candidate.K
    M=np.eye(4)-Sigma@Q
    determinant=np.linalg.det(M)
    C=np.linalg.solve(M,Sigma)
    u,v=candidate.u,candidate.v
    a=np.einsum('i,...ij,j->...',u,C[...,:2,:2],u.conj())
    d=np.einsum('i,...ij,j->...',v,C[...,2:,2:],v.conj())
    b=np.einsum('i,...ij,j->...',u,C[...,:2,2:],v.conj())
    c=np.einsum('i,...ij,j->...',v,C[...,2:,:2],u.conj())
    if min(np.min(a.real),np.min(d.real))<=0:
        raise ValueError('sqrt branch needs continuation')
    if np.min(abs(determinant))<=1e-9:
        raise ValueError('near a determinant pole')
    q=b*c/(a*d)
    # Principal 2F1 branch is unambiguous inside |q|<1.
    if np.max(abs(q))>=.999999:
        raise ValueError('2F1 branch needs continuation')
    value=(np.pi/4)*b/(np.sqrt(a)*np.sqrt(d))*hyp2f1(.5,.5,2,q)/determinant
    if diagnostics:
        return value,{"min_real_a":float(np.min(a.real)),
                      "min_real_d":float(np.min(d.real)),
                      "min_abs_det":float(np.min(abs(determinant))),
                      "max_abs_hypergeometric_argument":float(np.max(abs(q)))}
    return value


def cauchy_coefficients(candidate,degree=51,radius=.85,points=2048):
    if points<=2*degree or not 0<radius<1 or degree<1:
        raise ValueError('Need positive degree, 0<radius<1, and points>2*degree')
    t=radius*np.exp(2j*np.pi*np.arange(points)/points)
    values,branch=kernel(candidate,t,True)
    coefficients=np.fft.fft(values)/points
    coefficients=coefficients[:degree+1]/radius**np.arange(degree+1)
    branch.update({"fft_points":points,"radius":radius,"degree":degree,
                   "max_even_coefficient":float(np.max(abs(coefficients[::2])))})
    return coefficients,branch


def monte_carlo(candidate,t,samples=300000,seed=20261023):
    assert np.isreal(t) and abs(t)<1
    rng=np.random.default_rng(seed)
    rho=np.asarray(candidate.scales)*t**np.asarray(candidate.grades)
    total=0j; total_abs2=0.; count=0
    while count<samples:
        n=min(50000,samples-count)
        X=(rng.normal(size=(n,2))+1j*rng.normal(size=(n,2)))/np.sqrt(2)
        Z=(rng.normal(size=(n,2))+1j*rng.normal(size=(n,2)))/np.sqrt(2)
        Y=X*rho+Z*np.sqrt(1-rho*rho)
        hx=np.einsum('ni,ij,nj->n',X.conj(),candidate.H,X).real
        ky=np.einsum('ni,ij,nj->n',Y.conj(),candidate.K,Y).real
        F=phase(X@candidate.u)*np.exp(1j*hx)
        G=phase(Y@candidate.v)*np.exp(1j*ky)
        value=F*G.conj()
        total+=value.sum(); total_abs2+=np.sum(abs(value)**2);count+=n
    mean=total/count
    # sqrt(E|Z-EZ|²/N), a conservative complex-error scale.
    se=np.sqrt(max(0,total_abs2/count-abs(mean)**2)/count)
    exact=complex(kernel(candidate,t))
    return {"samples":samples,"t":t,"kernel":[exact.real,exact.imag],
            "MC_mean":[mean.real,mean.imag],"complex_RMS_standard_error":se,
            "absolute_error":abs(mean-exact),"error_over_RMS_SE":abs(mean-exact)/se}


def diagnostic_candidates():
    Z=np.zeros((2,2),complex); I=np.eye(2); S=np.array([[0,1],[1,0]],complex)
    J=np.array([[0,-1j],[1j,0]],complex); T=np.diag([1,-1])
    def make(name,a,H=Z,K=Z,b=None,angle=0):
        return Candidate(name,row(1,a),row(1,-(a if b is None else b)*np.exp(1j*angle)),H,K)
    return [make('phase-pure',0),make('phase-opposed-a027',.27),
            make('phase-opposed-a030',.30),make('phase-opposed-a032',.32),
            make('phase-opposed-a034',.34),
            make('symmetric-cross-chirp-008',.32,.08*J,.08*J),
            make('symmetric-cross-chirp-016',.32,.16*J,.16*J),
            make('asym-diagonal',.32,np.diag([.08,-.04]),np.diag([-.03,.07])),
            make('asym-imaginary-offdiag',.32,.12*J,-.04*J),
            make('asym-real-offdiag',.32,.12*S,-.04*S),
            make('asym-general-1',.32,.08*J+.03*T,-.06*S+.02*I,b=.30,angle=.2),
            make('asym-general-2',.32,-.08*J+.03*T,.06*S+.02*I,b=.34,angle=-.2)]


def validations(candidates,mc_samples):
    ts=np.linspace(-.87,.87,31)
    zero=np.zeros((2,2),complex)
    base=Candidate('calibration',row(1,.31j),row(1,-.24+.13j),zero,zero)
    rho=np.stack([ts,ts**3],axis=-1)
    correlation=np.sum(base.u*rho*base.v.conj(),axis=-1)
    # For complex correlations the physical phase kernel has |rho|².
    expected=(np.pi/4)*correlation*hyp2f1(.5,.5,2,abs(correlation)**2)
    phase_error=float(np.max(abs(kernel(base,ts)-expected)))
    assert phase_error<3e-13
    # Same-grade calibration: any linear projections yield a scalar rho.
    same=replace(base,grades=(1,1))
    rr=ts*np.dot(same.u,same.v.conj())
    expected_same=(np.pi/4)*rr*hyp2f1(.5,.5,2,abs(rr)**2)
    same_error=float(np.max(abs(kernel(same,ts)-expected_same)))
    assert same_error<3e-13
    # Independent closed form: the one-coordinate same chirp, H=K=h.
    h=.23; H=np.diag([h,0])
    chirp=Candidate('same-chirp',row(1,0),row(1,0),H,H)
    determinant=1+h*h*(1-ts*ts)
    reduced=ts/np.sqrt(1+h*h*(1-ts*ts)**2)
    chirp_expected=phase_kernel(reduced)/determinant
    chirp_error=float(np.max(abs(kernel(chirp,ts)-chirp_expected)))
    assert chirp_error<3e-13
    parity=swap=reflection=0.
    min_psd=1.
    for x in candidates:
        values=kernel(x,ts)
        parity=max(parity,float(np.max(abs(values+kernel(x,-ts)))))
        swap=max(swap,float(np.max(abs(values-kernel(x.swapped(),ts).conj()))))
        reflection=max(reflection,float(np.max(abs(values-kernel(x.reflected(),ts).conj()))))
        for t in ts:
            r=np.asarray(x.scales)*t**np.asarray(x.grades)
            min_psd=min(min_psd,float(np.min(1-abs(r))))
    assert max(parity,swap,reflection)<3e-13
    mc=[]
    for k,idx in enumerate([3,7,10]):
        result=monte_carlo(candidates[idx],.68,mc_samples,20261023+k)
        assert result['error_over_RMS_SE']<7
        mc.append({"candidate":candidates[idx].name,**result})
    return {"phase_kernel_max_error":phase_error,"same_grade_phase_max_error":same_error,
            "same_chirp_closed_form_max_error":chirp_error,"odd_parity_max_error":parity,
            "swap_conjugacy_max_error":swap,"reflection_conjugacy_max_error":reflection,
            "min_physical_Sigma_eigenvalue_on_test_grid":min_psd,"MC_checks":mc}


def run(output,mc_samples=300000,degree=51):
    candidates=diagnostic_candidates()
    valid=validations(candidates,mc_samples)
    report=[]; arrays={}
    for x in candidates:
        c1,b1=cauchy_coefficients(x,degree,.82,2048)
        c2,b2=cauchy_coefficients(x,degree,.90,4096)
        orient=np.exp(-1j*np.angle(c2[1]))
        oriented=c2*orient
        # Actual probability mixture with its conjugate-reflection partner.
        sym=oriented.real
        score=float(sym[1]-np.sum(abs(sym[3::2])))
        complex_score=float(abs(c2[1])-np.sum(abs(c2[3::2])))
        drift=float(np.max(abs(c1-c2)))
        arrays[x.name]=sym
        report.append({"candidate":x.to_json(),"D_head_conjugate_mixture":score,
                       "D_head_oriented_complex":complex_score,
                       "coefficient_cross_radius_max_drift":drift,
                       "orientation_phase":float(-np.angle(c2[1])),
                       "first_odd_real_coefficients":sym[1:14:2].tolist(),
                       "branch_checks":[b1,b2]})
        assert drift<3e-9, (x.name,drift)
    best=max(report,key=lambda r:r['D_head_conjugate_mixture'])
    result={"status":"FLOATING DISCOVERY ONLY; finite coefficient head excludes infinite tail",
            "response_formula":"F(X)=phase(u X)exp(i X*H X), G(Y)=phase(v Y)exp(i Y*K Y)",
            "physical_covariance":"Sigma=[[I,R],[R*,I]], R=diag(scales_j*t**grades_j), real |t|<=1",
            "analytic_continuation":"Use identical analytic t in both off-diagonal blocks",
            "validation":valid,"degree":degree,"diagnostics":report,
            "best_head_candidate":best['candidate']['name'],
            "no_endpoint_claim":"No tail enclosure, interval coefficient calculation, or global optimizer is supplied."}
    output.mkdir(parents=True,exist_ok=True)
    (output/'diagnostics.json').write_text(json.dumps(result,indent=2)+'\n')
    np.savez(output/'real-mixture-coefficients.npz',**arrays)
    print(json.dumps({"validation":valid,"diagnostic_scores":[
        {"name":r['candidate']['name'],"D_head":r['D_head_conjugate_mixture'],
         "radius_drift":r['coefficient_cross_radius_max_drift']} for r in report],
        "best_head_candidate":best['candidate']['name'],
        "warning":result['no_endpoint_claim']},indent=2))
    return result


if __name__=='__main__':
    p=argparse.ArgumentParser()
    p.add_argument('--output',type=Path,required=True)
    p.add_argument('--mc-samples',type=int,default=300000)
    p.add_argument('--degree',type=int,default=51)
    a=p.parse_args()
    run(a.output,a.mc_samples,a.degree)
