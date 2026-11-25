"""Exact rational certificate for the elliptic Gaussian translation inequality. Agent-ID: codex-a7c4.

For independent N(0,1) variables U,V, a=179/200 and b²=1-a², certify
 E sqrt((aU)²+(bV+λ)²) >= sqrt((431/500)²+λ²)  for all real λ.
Standard library, no inputs. See accompanying proof for the polygon and folded
normal support inequalities. Every acceptance decision is exact integer arithmetic.
"""
from fractions import Fraction as F
from math import isqrt

M = 10**10
N_EDGES, SHIFT_DEN, Z_DEN = 96, 200, 128
A = F(179, 200)
C = F(431, 500)

def require(check, message):
    if not check:
        raise ArithmeticError(message)

def floor_scaled(x):
    return x.numerator*M // x.denominator

def sqrt_lower_scaled(x):
    return isqrt(x.numerator*M*M // x.denominator)

def upper_pi():
    # Machin: pi = 16 atan(1/5) - 4 atan(1/239); odd/even truncations.
    def atan_sum(x, k):
        return sum((-1)**j*x**(2*j+1)/(2*j+1) for j in range(k+1))
    return 16*atan_sum(F(1,5),10)-4*atan_sum(F(1,239),3)

def normal_support():
    """Lower bounds for E sgn(G+r) and E[G sgn(G+r)], on r=j/Z_DEN."""
    pi_up = upper_pi()
    require(pi_up < F(355,113), "Machin upper bound")
    normal_prefactor = F(sqrt_lower_scaled(2/pi_up), M)
    table = []
    for j in range(4*Z_DEN+1):
        r = F(j, Z_DEN)
        x = r*r/2
        # An odd Taylor truncation of exp(-x) is a global lower bound x>=0.
        term = F(1)
        exp_lower = term
        integral_lower = term*r
        for k in range(1, 52):
            term *= -x/k
            exp_lower += term
            integral_lower += term*r/(2*k+1)
        require(exp_lower>0 and integral_lower>=0, "normal lower bounds")
        slope = floor_scaled(normal_prefactor*integral_lower)
        intercept = floor_scaled(normal_prefactor*exp_lower)
        table.append((slope,intercept))
    return table

def polygon_edges():
    edges = []
    old_x, old_y = F(1), F(0)
    for j in range(1, N_EDGES+1):
        t = F(j, N_EDGES)
        x, y = (1-t*t)/(1+t*t), 2*t/(1+t*t)
        dx, dy = old_x-x, y-old_y
        sd_sq = A*A*dx*dx+(1-A*A)*dy*dy
        di, si = floor_scaled(dy), sqrt_lower_scaled(sd_sq)
        require(di>=0 and si>0, "edge signs")
        edges.append((di,si))
        old_x, old_y = x,y
    require((old_x,old_y)==(0,1), "complete quadrant")
    return edges

def main():
    table, edges = normal_support(), polygon_edges()
    denominator = (C.denominator*SHIFT_DEN*M*M)**2
    least = None
    worst = None
    for j in range(3*SHIFT_DEN):
        slope, intercept = 0,0
        for dy, sd in edges:
            # Any table entry is a valid lower support, irrespective of how selected.
            num = (2*j+1)*dy*Z_DEN
            den = 2*SHIFT_DEN*sd
            k = min(4*Z_DEN,(2*num+den)//(2*den))
            sk, ik = table[k]
            slope += dy*sk
            intercept += sd*ik
        for l in (j,j+1):
            lower = C.denominator*(l*slope+SHIFT_DEN*intercept)
            target_sq = ((C.denominator*l)**2 + (C.numerator*SHIFT_DEN)**2)*M**4
            gain = lower*lower-target_sq
            require(lower>=0 and 10**5*gain>denominator,"compact certificate")
            if least is None or gain<least:
                least, worst = gain,(j,l)
    squared_margin = F(least, denominator)
    # The same polygon support misses the larger target at its weakest endpoint.
    higher_target = F(8621, 10000)
    require(squared_margin < higher_target**2 - C**2, "higher-target negative control")
    require(4*9*(A*A-C*C)>3*A**4,"tail from lambda=3")
    print("600 shift cells, 96 rational edges and 1200 endpoint comparisons passed.")
    print("Smallest squared endpoint surplus exceeds 1/100000.")
    print("Minimizing (cell,endpoint) indices:",worst)
    print("Exact squared surplus:",F(least,denominator))
    print("The analytic tail covers every lambda >= 3. The Gaussian is even in lambda.")

if __name__ == "__main__":
    main()
