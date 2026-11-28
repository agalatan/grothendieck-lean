"""All-dimensional high-amplitude comparison for -Q + beta*F. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from math import comb, factorial
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gaussian_driver_compensation import atan_bounds, PI_LO, PI_HI, COEFF, psi_upper


def require(condition, message):
    if not condition:
        raise ArithmeticError(message)


def half_moment(n):
    return Q(factorial(2*n), 4**n*factorial(n))


def ratio(a,b):
    # Normalized complex Hermite; the powers left after angular integration are a+b-i-j.
    terms=[(-1)**i*factorial(i)*comb(a,i)*comb(b,i) for i in range(min(a,b)+1)]
    return sum(ci*cj*half_moment(a+b-i-j) for i,ci in enumerate(terms)
               for j,cj in enumerate(terms))/(factorial(a)*factorial(b))


def laplace_check():
    for a in range(9):
        for b in range(9):
            terms=[(-1)**j*factorial(j)*comb(a,j)*comb(b,j) for j in range(min(a,b)+1)]
            for lam in [Q(1,4),Q(1,2),Q(7,8),Q(1)]:
                raw=sum(ci*cj*factorial(a+b-i-j)*lam**(a+b-i-j)
                        for i,ci in enumerate(terms) for j,cj in enumerate(terms))
                direct=raw/(factorial(a)*factorial(b))
                collision=sum(comb(a,k)*comb(b,k)*(1-lam)**(2*k)*lam**(a+b-2*k)
                              for k in range(min(a,b)+1))
                require(0<=direct==collision<=1,"pure-chaos Laplace coefficients")
    print("324 exact Laplace checks against the binomial collision formula")


def driver_upper(a,lo,hi):
    nu=Q(".0235")
    k=Q(".764")+nu+a
    # After collecting the two upper Hermite moments all coefficients have fixed signs.
    t=2*a
    values=[k,1-nu-k+t/4,-7*t/8,(5*t-k)/8,0,3*t/64]
    poly=sum(c*(hi if c>=0 else lo)**j for j,c in enumerate(values))
    return max(PI_LO*poly/4,PI_HI*poly/4)+nu*psi_upper(2*hi-1)


def matched_fifth_test():
    # Fixed, stronger cubic coefficient. Compare a positive fifth change against the same cubic.
    a=Q(".04")
    nu=Q(".0235")
    k=Q(".764")+nu+a
    require(9*(2*a)/8<k, "compensation at the matched cubic test")
    def cover(lo,hi):
        if driver_upper(a,lo,hi)<1/Q("1.4035"):
            return 1
        require(hi-lo>Q(1,2**25),"matched template target cover failed")
        mid=(lo+hi)/2
        return cover(lo,mid)+cover(mid,hi)
    cells=cover(Q(0),Q(1))
    x=Q(".81")
    z=2*x-1
    lower=(1-nu)*x-k*(x**3/8-(1-x))+nu*sum(c*z**(2*j+1) for j,c in enumerate(COEFF[:16]))
    p=1-x
    finite_error=k*(PI_HI/4)*(3*p+x*p**2/4)/7000
    require(PI_LO*lower/4-finite_error>1/Q("1.4014"),
            "7000 normalized triples obstruct the matched pure witness")
    require(nu+k*PI_HI/32+2*a<Q(".2"), "negative-arm budget at the larger fifth coefficient")
    print(f"{cells} intervals: positive fifth gives >1.4035 on the driver family; matched pure cap forces <1.4014")


def template_replay():
    a=Q(".02")
    nu=Q(".0235");k=Q(".764")+nu+a;t=2*a
    require(9*t/8<k, "unfavorable remote coefficients are paid by the cubic term")
    endpoint=Q(".99")
    cap=nu+PI_LO/4*(1-nu-k/8+3*t/64)
    def cover(lo,hi):
        if driver_upper(a,lo,hi)<cap:
            return 1
        require(hi-lo>Q(1,2**24),"template cover failed")
        mid=(lo+hi)/2
        return cover(lo,mid)+cover(mid,hi)
    boxes=cover(Q(0),endpoint)
    require(5*t<k, "quadratic derivative lower endpoint")
    slope=(1-nu-k+t/4-7*t/4+3*(5*t-k)/8+15*t*endpoint**4/64+
           2*nu*sum((2*j+1)*c*(2*endpoint-1)**(2*j) for j,c in enumerate(COEFF)))
    require(slope>0,"template envelope increases to the visible phase")
    cap_hi=nu+PI_HI/4*(1-nu-k/8+3*t/64)
    require(1/cap_hi>Q("1.40323737"),"attained template reciprocal")
    require(nu+k*PI_HI/32+t<Q(".2")<cap,"negative real payoff is harmless")
    print(f"{boxes} conditional Gaussian template cells and a terminal slope: reciprocal > 1.40323737")


def main():
    laplace_check()
    for a in range(4):
        row=[ratio(a,b) for b in range(3)]
        require(all(0<v<=1 for v in row), "pure-chaos inverse-radius diagonal")
        print(f"visible holomorphic degree {a}:", *(str(v) for v in row))
    require(ratio(0,0)==1 and ratio(2,1)==Q(7,16), "normalization controls")
    # For beta=1,2 the two combined polynomial suprema are 3/8 and 1/2.
    for beta,peak,zero in [(1,Q(3,8),Q(55,56)),(2,Q(1,2),Q(271,272))]:
        vertex=3-Q(2,beta)
        eval_poly=lambda x:(2-x)/2-beta*(3-3*x+x*x/2)/4
        require(eval_poly(vertex)==peak, "exact global maximum of a concave quadratic")
        gain=Q(8-3*beta,64)       # diagonal decrease as a multiple of mu^2
        slope=peak+4*max(1,beta)  # price multiplying mu*(mu-t)
        require(gain==slope*(1-zero), "sharp cutoff of this linear bound")
        print(f"beta={beta}: uniformly favorable for t > {zero}*mu")
    template_replay()
    matched_fifth_test()
    # Outward real-payoff decreases at two concrete rational t thresholds.
    mlo,mhi=Q(".886226925"),Q(".886226926")
    a,b=atan_bounds(Q(1,5))
    c,d=atan_bounds(Q(1,239))
    require(4*mlo*mlo < PI_LO < 16*a-4*d <= 16*b-4*c < PI_HI < 4*mhi*mhi,
            "Gaussian-mean endpoints agree with the Machin enclosure")
    for beta,peak,t,save in [(1,Q(3,8),Q(".88"),Q(".036")),
                              (2,Q(1,2),Q(".8858"),Q(".0213"))]:
        require(Q(8-3*beta,64)*mlo**2-(peak+4*max(1,beta))*mhi*(mhi-t)>save,
                "strict saving per unit of cubic change")
        print(f"t >= {float(t):g}: beta={beta} saves more than {float(save):g} per unit")


if __name__=="__main__":
    main()
