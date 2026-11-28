"""Exact coefficients for Gaussian cubic Rice support through sixth order.

Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from one_coordinate_multiplier import pi_interval, require

C6 = Q(4045313,100000)
MAX_LAMBDA = Q(69,200)
MU_UP = Q(".88622692545277")
MU_LO = Q(".88622692545275")


def factor(lam):
    u=lam**2
    return 1+u/2-u**2/8+u**3/16


def main():
    lo,hi=pi_interval()
    require(4*MU_LO**2<lo<hi<4*MU_UP**2,"Gaussian mean")
    u=MAX_LAMBDA**2
    require(u*(9+C6)<=6,"small fourth excess")
    # (2+z²)² - (2-u)((2+z²)+u(6+9z²+C6 z³)/4).
    p=[4-(2-u)*(2+6*u/4),0,4-(2-u)*(1+9*u/4),-(2-u)*u*C6/4,1]
    # The subtracted product increases with u: its derivative is
    # (1-u)M3/2 - M2 >= 0 since M3 >= 3 M2.
    require((1-u)*3>=2,"large-excess monotonicity")
    # For z>=1 subtract z²(z-23/20)². Its remaining cubic is nonnegative,
    # the quadratic coefficient exceeds 1/4 and the constant exceeds -1/10.
    center=Q(23,20)
    require(p[3]+2*center>=0 and p[2]-center**2>=Q(1,4)
            and p[0]>=Q(-1,10),"large-excess square certificate")
    for t,lam,limit in [(Q(".83835"),Q(".3425"),Q(".287364")),
                        (Q(".837652587890615"),Q(".345"),Q(".289392")),
                        (Q(".86183138"),Q(".24"),Q(".206509"))]:
        require(0<lam<=MAX_LAMBDA and (MU_UP*factor(lam)-t)/lam<limit,"central cutoff")
        print(f"t >= {t}, lambda = {lam}: remote cubic norm < {limit}.")
    # Lower control from the independent Gaussian cubic limit.
    tmin=Q(".83835"); tau=Q(".287345")
    require(tmin**2+tau**2<MU_LO**2,"finite physical Gaussian-limit control")
    print("At t>=.83835 a finite physical sequence can exceed .287345, while every pair has tau<.287364.")


if __name__=="__main__":
    main()
