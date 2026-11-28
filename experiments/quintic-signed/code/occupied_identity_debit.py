"""The physical identity-tail price on the occupied negative-fifth slice.

Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from pathlib import Path
from math import comb,factorial
import sys
sys.path.insert(0,str(Path(__file__).resolve().parent))
from full_fifth_planes import add, scale, square, coefficient_bounds, derivatives, require
from gaussian_quadrature_rice import MU_LO, MU_UP
from tenth_rice_support import certify
from occupied_fifth_sign import shape_cut

T,R,L=Q(27441,32768),Q('.290007'),Q('.3463')
C=T+L*R
SUP=Q('.937862576')
BETA,ALPHA,NU=Q(63,80),Q(1953,2000),Q(47,2000)
V,B,EPS=Q('-.264'),Q('-.135'),Q('.06')
RATE=Q('136.5')
POLY=list(map(Q,['-7.123598','7.266247','-.107593','0.00179345']))

def interval_exp(x):
    # For x through L^2*8^2<8, use global consecutive Taylor bounds.
    term=Q(1);total=term
    for k in range(1,81):
        term*=(-x/k);total+=term
    return total+term*(-x/81),total

def resolvent(x,n=30):
    # Schur complement of x plus the Laguerre Jacobi matrix on degrees <n.
    a=x+2*n-1
    for j in reversed(range(n-1)):
        a=x+2*j+1-(j+1)**2/a
    return 1/a

def k_lower(y):
    x=(L*y)**2
    if not x:return Q(0)
    e=interval_exp(x)
    s=(1-x)/(2*x)+x*(3*resolvent(x)+resolvent(2*x))/8
    return max(Q(0),1-1/(2*x)+scale(s,e)[0])

def gap(y):
    a=L*y
    ds=derivatives(a*a,(MU_LO,MU_UP),terms=75,precision=10**72)
    def cc(i,j):return coefficient_bounds(i,j,a,ds)
    rice=add(scale(1+a*a,ds[0]),scale(a*a,ds[1]))[1]
    mixed=Q(3,2)*square(add(cc(1,1),(-B*y,-B*y)))[1]
    hh=scale(2*V,cc(2,1))[0]-V**2
    return sum(v*y**(2*i) for i,v in enumerate(POLY))-BETA*((1+EPS)*mixed-hh)-RATE*(rice-C)

def main():
    require(certify(L,SUP), 'tenth-order Rice support')
    require(shape_cut(L,C), 'fourth excess <.002')
    step=1024
    reach=8
    curvature=2*POLY[1]+30*POLY[3]*reach**4+BETA*((1+EPS)*Q(3,2)*(
        2*(4*L+abs(B))**2+2*(1+abs(B)*reach)*16*L**2)+2*abs(V)*16*L**2)
    prior=gap(Q(0))
    for i in range(step*reach):
        y=Q(i,step)
        cur=gap(y+1/Q(step))
        # Only the polynomial-minus-smooth-profile part is interpolated.
        # The phase-norm lower bound is monotone in y, hence the whole
        # interval uses an outward value at its left endpoint.
        near=i//step+1
        curv=curvature - 30*POLY[3]*(reach**4-near**4)
        margin=min(prior,cur)+2*NU*k_lower(y)-curv/(8*step**2)
        require(margin>=0,f'interpolant on cell {y} misses margin {float(margin)}')
        prior=cur
    # Beyond y=8, Bessel gives |c_ij|<=1; m(Ly)<=mu+Ly.
    p=[POLY[0]-BETA*((1+EPS)*Q(3,2)+2*abs(V)+V**2)-RATE*(MU_UP-C),
       -BETA*(1+EPS)*3*abs(B)-RATE*L,POLY[1]-BETA*(1+EPS)*Q(3,2)*B*B,0,POLY[2],0,POLY[3]]
    for j in range(7):
        require(sum(p[i]*comb(i,j)*reach**(i-j) for i in range(j,7))>=0,'tail coefficients')
    # Maxima of x(x-2)^2 exp(-x)/2 occur at (5 +/- sqrt 17)/2.
    for lo,hi in [(Q('.438'),Q('.439')),(Q('4.561'),Q('4.562'))]:
        require((lo**2-5*lo+2)*(hi**2-5*hi+2)<0,'critical point enclosure')
        require(hi*max((lo-2)**2,(hi-2)**2) <= Q('.7')*sum(lo**k/factorial(k) for k in range(20)),
                'density of fixed cubic test')
    require(Q('1.184')**2>=4*Q('.35') and Q('5.657')**2>=32, 'shifted inverse radii')
    require(Q('1.540')**2>=2*Q('1.184') and Q('1.883')**2>=4*MU_UP,'inner errors')
    ar=4*NU*Q('1.883')+BETA*2*abs(V)*Q('1.540')
    cy=750
    gamma=cy+BETA*(1+1/EPS)*Q('5.657')
    require(gamma>RATE and gamma>2*ALPHA and gamma*L>2*BETA,'contact monotonicity')
    m3=6+9*Q('.002')+Q('40.45313')*Q('.002')*Q('.04473')
    require(Q('.04473')**2>=Q('.002'),'moment cutoff')
    bound=ALPHA*T*T+NU+BETA*R*R+sum(a*b for a,b in zip(POLY,[1,1,2,m3]))+ar*ar/(4*cy)+(gamma-RATE)*(SUP-C)
    require(bound < Q('.713232'), 'strict old row reserve')
    w,d=Q('.00003579'),Q(1,10**8)
    require((1-w)*bound + w*MU_UP**2+d < Q('.713235'), 'signed price on the same rectangle')
    # The complete lower fifth plane already checked on this same rectangle.
    from reverse_fifth_planes import floor as fifth_floor
    require(fifth_floor(T,R,Q('.02')) > Q('-.012307'), 'matched reverse fifth price')
    require((1-w)*bound+w*MU_UP**2+Q('.00137')*Q('.012307') < Q(71325109802694,10**14),
            'complete rectangle pays the larger fifth debit')
    require(T*T+R*R < MU_LO**2, 'finite occupation of these two thresholds')
    print('All pairs in the occupied rectangle: original < .713232; signed < .713235.')
    print('At the same w every debit through .00137 stays below 71325109802694/10^14 on this rectangle.')
    print(f'Original upper price is {bound}; positive fifth debit is {d}.')

if __name__=='__main__':main()
