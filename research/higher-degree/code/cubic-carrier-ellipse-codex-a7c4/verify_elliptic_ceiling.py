"""Upper certificate for every Gaussian axis ratio in the elliptic lift.
Agent-ID: codex-a7c4. Standard-library exact arithmetic.
"""
from fractions import Fraction as F
from math import isqrt

M = 10**10
EDGES, CELLS, GRID = 64, 1000, 128
CEILING = F(4313,5000)  # 0.8626

def require(ok,why):
    if not ok:
        raise ArithmeticError(why)

def ceildiv(x,y):
    return (x+y-1)//y

def ceil_scaled(x):
    return ceildiv(M*x.numerator,x.denominator)

def sqrt_upper_scaled(x):
    low=isqrt(x.numerator*M*M//x.denominator)
    return low+1

def table():
    def atan_sum(x,k):
        return sum((-1)**i*x**(2*i+1)/(2*i+1) for i in range(k+1))
    pi_low=16*atan_sum(F(1,5),11)-4*atan_sum(F(1,239),4)
    require(pi_low>F(333,106),"Machin lower")
    pref=F(sqrt_upper_scaled(2/pi_low),M)
    data=[]
    for j in range(2*GRID+1):
        r=F(j,GRID)
        # Even degree Taylor polynomial is an upper bound for exp(-x), x>=0.
        term = F(1)
        exp_up = term
        integral_up = r
        for k in range(1,19):
            term*= -r*r/(2*k)
            exp_up+=term
            integral_up+=term*r/(2*k+1)
        data.append((ceil_scaled(pref*integral_up),ceil_scaled(pref*exp_up)))
    return data

def edges():
    old_x,old_y=F(1),F(0)
    result=[]
    for j in range(1,EDGES+1):
        t=F(j,EDGES)
        x,y=(1-t*t)/(1+t*t),2*t/(1+t*t)
        dx,dy=old_x-x,y-old_y
        # sd^2 = dy² + p(dx²-dy²); maximize it on each p cell exactly.
        base,change=dy*dy,dx*dx-dy*dy
        result.append((ceil_scaled(dy),base,change))
        old_x,old_y=x,y
    return result

def main():
    ab=table(); ed=edges()
    # Bound the Gaussian Taylor remainder by sd/(8*GRID^2).
    corr_den=8*GRID*GRID
    total_den=25*M*M*corr_den
    lowest=None; worst=None
    for i in range(CELLS):
        # lambda is 14/25 up to p=.814, 0 on the remaining cells.
        ln=14 if i<814 else 0
        total=0
        for dy,base,change in ed:
            p=F(i+int(change>0),CELLS)
            sd=sqrt_upper_scaled(base+p*change)
            # Work with the enlarged mean ln*dy/(25M) and sd/M.
            r_num,r_den=ln*dy,25*sd
            k= (2*r_num*GRID+r_den)//(2*r_den)
            require(0<=k<len(ab),"support table")
            require(abs(r_num*GRID-k*r_den)*2<=r_den,"nearest entry")
            Ak,Bk=ab[k]
            # Psi'' <= 1, r within 1/(2*GRID) of k/GRID.
            total+=(ln*dy*Ak+25*sd*Bk)*corr_den+25*sd*M
        # Square the polygon upper bound, including its circumscribing radius.
        lhs=(EDGES*EDGES+1)*total*total*CEILING.denominator**2*25**2
        rhs=EDGES*EDGES*total_den**2*((25*CEILING.numerator)**2+
                                       (ln*CEILING.denominator)**2)
        slack=rhs-lhs
        require(slack>0,"squared upper certificate")
        if lowest is None or slack<lowest:
            lowest,worst=slack,i
    denom=EDGES*EDGES*total_den**2*CEILING.denominator**2*25**2
    print("All 1000 axis-ratio cells passed. Every coefficient is below",CEILING)
    print("Least squared margin =",F(lowest,denom),"on cell",worst)
    require(10**5*lowest>denom,"uniform 1e-5 margin")

if __name__=="__main__":
    main()
