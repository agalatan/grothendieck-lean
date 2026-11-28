"""Exact arithmetic for the near-exposed six-sector response. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from math import factorial, isqrt
from pathlib import Path
from runpy import run_path

EPS, ELL, BETA = Q('.752'), Q('.8456'), Q('.1432')
P0, S_HI = Q(2500, 1891), Q('1.3739535256616')
E0, K0, TARGET = Q('.0463'), Q('.080051'), Q('.713245')
PI_LO, PI_HI = Q('3.141592653589793'), Q('3.141592653589794')
CHI_CAP, S_LO, S_HI_BUFFER = Q('.01'), Q('.120'), Q('.123')


def check(condition, reason):
    if not condition:
        raise ValueError(reason)


def sqrt_lo(x):
    check(x >= 0, 'negative radicand')
    scale = 10**22
    return Q(isqrt(x.numerator * scale**2 // x.denominator), scale)


def sqrt_hi(x):
    return sqrt_lo(x) + Q(1, 10**22)


R_LO, R_HI = sqrt_lo(PI_LO)/2, sqrt_hi(PI_HI)/2


def beta_and_density():
    def atan_sum(n, terms):
        return sum(Q((-1)**k, (2*k+1)*n**(2*k+1)) for k in range(terms))

    check(PI_LO < 16*atan_sum(5, 16)-4*atan_sum(239, 5)
          and 16*atan_sum(5, 17)-4*atan_sum(239, 4) < PI_HI, 'Machin enclosure')
    # Nonzero critical points of x(x-2)^2 exp(-x), between the following endpoints.
    for l, r in [(Q('.43'), Q('.45')), (Q('4.55'), Q('4.57'))]:
        check((l*l-5*l+2)*(r*r-5*r+2) < 0, 'critical points')
        exp_lo = sum(l**j/factorial(j) for j in range(6))
        check(r*max(abs(l-2),abs(r-2))**2 < 3*exp_lo/4, 'Gaussian density bound')
    check(Q('.36')*(1+Q('.5053')**2) < Q('.452') and Q('.0784') < Q('.452'), 'trial norm')
    # Moments one and two of the arcsine law Beta(1/2,1/2).
    mean = Q(1,2)
    check(mean*Q(3,4) == Q(3,8) and Q(5,4)*Q(3,8) == Q(15,32), 'score coefficient')


def shape_gap(rice):
    # Equations (4) and (5) of the buffered Rice proof, with their denominators restored.
    gaps = []
    for lo, hi, small in [(Q('.1'), Q(1), True), (Q(1), Q(7), False)]:
        for j in range(1024):
            a, b = (lo+(hi-lo)*i/1024 for i in (j, j+1))
            if small:
                bound = rice['intermediate_lower'](S_LO, S_HI_BUFFER, a, b)
            else:
                third = 3+7*b*b+rice['C_SIX']*b**3
                denominator = 1+b*b+S_HI_BUFFER*third/4
                bound = rice['large_lower'](S_LO, S_HI_BUFFER, a, b)/(16*denominator)
            gaps.append(R_LO*S_LO**2*bound)
    check(min(gaps) > Q(3,10**6) and Q(7)**2 >= 42, 'high-shape exclusion')
    return min(gaps)


def trial_bound(lo, hi, scale, energy_lo, even_lo, near, credit):
    u = energy_lo/scale**2
    check(u > 0 and (not near or u >= Q('.0456')), 'near peak subinterval')
    price = scale/EPS-P0
    shell_price = price-Q('.452')*max(0,scale-1)
    check(price >= shell_price >= 0 and even_lo >= 0, 'shell price')
    trial = S_HI+(0 if near else Q(27,10**6))-price*u-shell_price*even_lo/scale**2
    visible = max(t*t-2*scale*ELL*t for t in (lo,hi))+2*(scale*BETA)**2/EPS
    return visible+scale*trial-credit


def certify(lo, hi, slabs, width, shape_clearance, spend_square=True):
    check(0 <= width and slabs > 0 and lo < hi and lo*lo >= 3*PI_HI/14, 'tube domain')
    gaps, slacks = [], []
    for j in range(slabs):
        l, r = (lo+(hi-lo)*i/slabs for i in (j,j+1))
        mid = (l+r)/2
        h = sqrt_lo(PI_LO/4-mid*mid)/mid
        s = h*h
        check(S_LO <= s <= S_HI_BUFFER and s <= Q(1,6), 'buffer direction')
        # The lower expression minimized over t is concave: check its two endpoints.
        sigma = R_HI*sqrt_hi(1+s)-min(t+h*sqrt_lo(PI_LO/4-t*t-width/EPS**2) for t in (l,r))
        check(0 <= sigma < shape_clearance, 'available support slack')
        slacks.append(sigma)
        c = -Q(1,2)+3*s/4-Q(15,32)*(2+CHI_CAP)*s*s
        check(c < 0, 'outward signed coefficient')
        score = R_HI*c/sqrt_lo(Q(2))

        upper_e = EPS**2*(PI_HI/4-l*l)
        lower_e = EPS**2*(PI_LO/4-r*r)-width
        upper_v = 3*upper_e/2-3*lower_e/4
        first = sqrt_hi(upper_e/E0)
        last = max(first, sqrt_hi((upper_e+upper_v)/K0))
        check(upper_e <= first**2*E0 and upper_e+upper_v <= last**2*K0, 'outer energy caps')
        for i,m in enumerate((first,last)):
            min_v = 0 if i == 0 else max(0, first**2*K0-upper_e)
            d = score-sqrt_hi(Q(7,2)*sigma)+sqrt_lo(Q(2))*m*BETA/EPS
            credit = EPS*max(0,d)**2 if spend_square else 0
            gaps.append(TARGET-trial_bound(l,r,m,lower_e,min_v,i == 0,credit))
    check(min(gaps) > 0, 'row clearance')
    return min(gaps),max(slacks)


def reject(fn, reason):
    try:
        fn()
    except ValueError as err:
        check(str(err) == reason, 'unexpected failure in negative control')
    else:
        raise ValueError('negative control accepted')


def main():
    code = Path(__file__).resolve().parent.parent
    rice = run_path(str(code/'buffered-rice-codex-a7c4/verify.py'))
    beta_and_density()
    shape = shape_gap(rice)
    print('Shape exclusion gap, rounded down in trillionths:', shape*10**12//1)
    rows = [(Q('.8366'), Q('.8372'), 60, Q(3,10**7)),
            (Q('.8368'), Q('.8372'), 40, Q(1,10**6))]
    for l,r,n,w in rows:
        gap, slack = certify(l,r,n,w,shape)
        print(l,r,w, 'row clearance, rounded down in trillionths:',gap*10**12//1,
              'support slack, rounded up in trillionths:',-(-slack*10**12//1))
    # The documented obstruction's physical energy lies inside the first tube.
    t, e = Q('.8368'), Q('.0481605')
    check(EPS**2*(PI_HI/4-t*t)-rows[0][3] < e < EPS**2*(PI_LO/4-t*t), 'example in tube')
    reject(lambda: certify(*rows[0],shape,False), 'row clearance')
    reject(lambda: certify(*rows[0],Q(0)), 'available support slack')
    reject(lambda: trial_bound(t,t,Q(1),Q('.04'),0,True,0), 'near peak subinterval')
    print('Three controls rejected. Replayed both closed tubes and exposed example.')


if __name__ == '__main__':
    main()
