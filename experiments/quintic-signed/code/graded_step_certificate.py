"""Certify a bounded physical stress pair via exact graded moments. Agent-ID: codex-a7c4.

NumPy proposes integer disk values on cells. All assumptions on the proposal and all moment
estimates are checked. No accuracy property of the proposal or its floating-point routines is used.
"""
from fractions import Fraction as Q
from math import factorial, isqrt
from pathlib import Path
import argparse
import sys

import numpy as np

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gaussian_driver_compensation import PI_LO, PI_HI, atan_bounds, require

RAD = 2**48
ANG = 2**25
DISK = 2**26
PREC = 2**880
DEGREE = 134
NU, E = Q(47,2000), Q(191,250)


def ceil_div(a, b):
    return -((-a)//b)


def radial_primitives(radius):
    """Enclose integrals from 0 to radius of 2*x^(j+1)*exp(-x²), j=0,...,5."""
    y = radius**2
    result = []
    for j in range(6):
        lo = hi = 0
        for k in range(DEGREE,-1,-1):
            den = factorial(k)*(2*k+j+2)
            num = PREC*(-1)**k
            lo = (lo*y.numerator)//y.denominator + num//den
            hi = ceil_div(hi*y.numerator,y.denominator) + ceil_div(num,den)
        prefactor = 2*radius**(j+2)
        err = prefactor*y**(DEGREE+1)/(factorial(DEGREE+1)*(2*(DEGREE+1)+j+2))
        result.append((prefactor*lo/PREC-err,prefactor*hi/PREC+err))
    return result


def interval_sum(terms):
    lo=hi=0
    for coef,(a,b) in terms:
        lo += min(coef*a,coef*b)
        hi += max(coef*a,coef*b)
    return lo,hi


def scaled_center(interval, scale):
    lo,hi=interval
    v=round(scale*(lo+hi)/2)
    require(v-1 <= scale*lo <= scale*hi <= v+1, "one-unit enclosure of true cell integral")
    return v


def radial_grid(n):
    edges=[Q(5*(13*i*n+7*i*i),20*n*n) for i in range(n+1)]
    sqrt_scale=2**100
    divisors={k:(Q(isqrt(k*sqrt_scale**2),sqrt_scale),
                 Q(isqrt(k*sqrt_scale**2)+1,sqrt_scale)) for k in (2,12)}
    raw0=radial_primitives(edges[0])
    fields=[[] for _ in range(6)]
    for right in edges[1:]:
        raw1=radial_primitives(right)
        h=[(a[0]-b[1],a[1]-b[0]) for a,b in zip(raw1,raw0)]
        raw0=raw1
        basis=[(h[0],1),(h[1],1),(interval_sum([(1,h[3]),(-2,h[1])]),2),
               (interval_sum([(1,h[2]),(-1,h[0])]),1),(h[2],2),
               (interval_sum([(1,h[5]),(-6,h[3]),(6,h[1])]),12)]
        for field,(ab,k) in zip(fields,basis):
            if k!=1:
                quot=[x/y for x in ab for y in divisors[k]]
                ab=min(quot),max(quot)
            field.append(scaled_center(ab,RAD))
    return [(float(a+b)/2) for a,b in zip(edges,edges[1:])],fields


def angular_grid(n):
    a,b=atan_bounds(Q(1,5)); c,d=atan_bounds(Q(1,239))
    lo,hi=16*a-4*d,16*b-4*c
    require(PI_LO < lo <= hi < PI_HI, "Machin enclosure of pi")
    mid=(hi+lo)/2
    def trig(i, odd):
        x=mid*Q(i,n)
        value=sum((-1)**k*x**(2*k+odd)/factorial(2*k+odd) for k in range(22))
        # Derivatives of sin and cos have absolute value <=1, both in Taylor and for input error.
        return value, (hi-lo)/2 + x**(43+odd)/factorial(43+odd)
    def difference(positive,negative):
        v=positive[0]-negative[0]
        bounds=[n*(v+sg*(positive[1]+negative[1]))/pi
                for sg in (-1,1) for pi in (lo,hi)]
        return scaled_center((min(bounds),max(bounds)),ANG)
    # Averages of cosine and sine on the true angular cells of width pi/n.
    sine=[trig(i,1) for i in range(n+1)]
    cosine=[trig(i,0) for i in range(n+1)]
    co=[difference(sine[i+1],sine[i]) for i in range(n)]
    si=[difference(cosine[i],cosine[i+1]) for i in range(n)]
    return np.array(co,dtype=np.int64),np.array(si,dtype=np.int64)


def proposed_slice(z,w,steps,seed):
    # Only the returned disk-valued integer array is input to the verification.
    def phase(a):
        return a/np.maximum(np.abs(a),1e-15)
    a0,a1,a2,a3,a4,a5=np.array(seed)/100000
    v=z*(a0+a2*(z*z-2)/np.sqrt(2)+a5*(z**4-6*z*z+6)/np.sqrt(12))
    a=(a1+a3*(z*z-1))*w+a4*z*z/np.sqrt(2)*np.conj(w)
    plus,minus=v+a,v-a
    f,g=phase(plus),phase(minus)
    for _ in range(steps):
        f,g=phase(plus+float(NU)*g),phase(minus+float(NU)*f)
    return (np.trunc((DISK-1)*f.real).astype(np.int64),
            np.trunc((DISK-1)*f.imag).astype(np.int64))


def weight_error(left,right,angular_error):
    # Each signed radial weight differs from its center by at most 1/RAD.
    la=Q(sum(map(abs,left)),RAD); lb=Q(sum(map(abs,right)),RAD)
    ea=Q(len(left),RAD); eb=Q(len(right),RAD)
    # True angular average is bounded by one, for both identity and Hermite projections.
    return ea*(lb+eb)+la*eb+la*lb*angular_error


def moment_bounds(n,nt,steps,seed):
    require(0<n<=1024 and 0<nt<=512, "supported grid")
    require(nt*2*DISK**2 < 2**63 and nt*2*DISK*(ANG+1) < 2**63,
            "signed 64-bit angular contractions are exact")
    radii,h=radial_grid(n)
    co,si=angular_grid(nt)
    require(max(abs(int(x)) for x in list(co)+list(si))<=ANG+1,"angular integer range")
    w=np.array(radii)[:,None]*np.exp(1j*np.pi*(np.arange(nt)+.5)/nt)
    accum=[0]*7
    def dot_integer(weights,values):
        return sum(a*int(b) for a,b in zip(weights,values))
    for i,z in enumerate(radii):
        re,im=proposed_slice(z,w,steps,seed)
        require(re.shape==(n,nt) and im.shape==(n,nt),"complete proposal")
        require(int(re.min())>=-DISK and int(re.max())<=DISK and
                int(im.min())>=-DISK and int(im.max())<=DISK,"coordinate range")
        require(bool(np.all(re*re+im*im<=DISK**2)), "pointwise disk constraint")
        a=dot_integer(h[0],re.sum(axis=1,dtype=np.int64))
        cos_part=re@co
        sin_part=im@si
        b=dot_integer(h[1],cos_part+sin_part)
        c=dot_integer(h[1],cos_part-sin_part)
        # g(r,s,theta) = conjugate f(r,s,pi-theta) on our half circle.
        ident=(re*re[:,::-1]-im*im[:,::-1]).sum(axis=1,dtype=np.int64)
        for j,term in enumerate([h[1][i]*a,h[0][i]*b,h[2][i]*a,h[3][i]*b,
                                 h[4][i]*c,h[5][i]*a,h[0][i]*dot_integer(h[0],ident)]):
            accum[j]+=term
    fields=[(1,0,False),(0,1,True),(2,0,False),(3,1,True),
            (4,1,True),(5,0,False),(0,0,False)]
    bounds=[]
    for j,((left,right,angular),num) in enumerate(zip(fields,accum)):
        denom=RAD**2*nt*DISK*(DISK if j==6 else ANG if angular else 1)
        center=Q(num,denom)
        error=weight_error(h[left],h[right],Q(2,ANG) if angular else 0)
        bounds.append((center-error,center+error))
    square=[]
    for lo,hi in bounds[:-1]:
        square.append((0 if lo<=0<=hi else min(lo*lo,hi*hi),max(lo*lo,hi*hi)))
    return bounds,square


def affine_terms(bounds,square):
    first = square[0]
    cubic = interval_sum([(1,square[2]),(-1,square[1])])
    fifth = interval_sum([(1,square[5]),(-1,square[3]),(-1,square[4])])
    base = interval_sum([(1-NU,first),(-E-NU,cubic),(NU,bounds[6])])
    return first,cubic,fifth,base


def verify(n,nt,steps):
    bounds,square=moment_bounds(n,nt,steps,[81962,22271,20643,-344,-177,-331])
    payoff=interval_sum([(1-NU,square[0]),(E+NU,square[1]),(-E-NU,square[2]),
                         (NU,square[3]),(NU,square[4]),(-NU,square[5]),(NU,bounds[6])])
    guaranteed=Q((payoff[0]*10**10).__floor__(),10**10)
    print(f"cells={n} x {n} x {nt} on the half circle, payoff ≥ {float(guaranteed):.10f}",flush=True)
    require(guaranteed>Q(10000,14023), "graded pair must exceed the 1.4023 payoff cap")
    first,_,fifth,base=affine_terms(bounds,square)
    c,d = first[0]-base[1], -fifth[1]
    require(d>0,"stress pair gets worse with the debit")
    upper_debit=(Q(10000,14023)-base[0])/d
    require(upper_debit<Q(".0235"),"nonempty excluded debit interval at w=0")
    scale=(1-NU)-(E+NU)/8
    visible_base=NU+scale*PI_LO/4
    visible_c=PI_LO/4-(NU+scale*PI_HI/4)
    visible_d=-3*PI_HI/256
    alpha=d/(d-visible_d)
    require(0<alpha<1 and alpha*visible_c+(1-alpha)*c>0, "two-test bound for every w>=0")
    mincap=alpha*visible_base+(1-alpha)*base[0]
    max_reciprocal=Q(ceil_div(10**8*mincap.denominator,mincap.numerator),10**8)
    debit_ceil=Q(ceil_div(10**7*upper_debit.numerator,upper_debit.denominator),10**7)
    require(base[1] < Q(".712955") and base[1]-Q(".02")*fifth[0] < Q(10000,14023),
            "the same pair has enough original payoff slack at the smaller debit")
    require(upper_debit<debit_ceil, "strict exclusion at the decimal endpoint")
    require(Q(".8392")<bounds[0][0]<=bounds[0][1]<Q(".8394") and fifth[1]<Q("-.00718"),
            "strict central amplitude and fifth-energy obstruction")
    print("The pair has .8392<t<.8394 and signed fifth energy < -.00718.")
    print(f"At w=0 every d >= {float(debit_ceil):.7f} fails the 1.4023 test.")
    print(f"All nonnegative mixtures and debits have reciprocal at most {float(max_reciprocal):.8f}.")
    return guaranteed


def verify_small_debit_seed(n,nt,steps):
    bounds,square=moment_bounds(n,nt,steps,[82766,20271,21330,-81,-42,-90])
    first,_,fifth,base=affine_terms(bounds,square)
    c=first[0]-base[1]
    d=-fifth[1]
    require(c>0 and d>0, "physical pair payoff increases in BOTH free parameters")
    visible_base=NU+(1-NU-(E+NU)/8)*PI_LO/4
    visible_d=-3*PI_HI/256
    weight=d/(d-visible_d)
    # Both w slopes are positive: for the visible phase it is pi/4-B_0.
    require(PI_LO/4>NU+(1-NU-(E+NU)/8)*PI_HI/4, "visible payoff grows with w")
    mincap=weight*visible_base+(1-weight)*base[0]
    reciprocal=Q(ceil_div(10**8*mincap.denominator,mincap.numerator),10**8)
    require(reciprocal<Q("1.40245"), "smaller-debit test improves the family ceiling")
    witness_line=[Q((v*10**9).__floor__(),10**9) for v in [base[0],c,d]]
    print(f"Second pair and visible phase give 1/C(w,d) ≤ {float(reciprocal):.8f} for every w,d≥0.")
    print("Certified affine lower coefficients:",*(str(v) for v in witness_line))
    return reciprocal


if __name__=="__main__":
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--radial",type=int,default=432)
    parser.add_argument("--angles",type=int,default=216)
    parser.add_argument("--pair",choices=("central","small-debit","both"),default="both")
    args=parser.parse_args()
    if args.pair in ("central","both"):
        verify(args.radial,args.angles,6)
    if args.pair in ("small-debit","both"):
        verify_small_debit_seed(args.radial,args.angles,6)
