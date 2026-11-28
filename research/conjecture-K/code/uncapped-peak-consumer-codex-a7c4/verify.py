"""Unrestricted six-sector peak-ray witness on the lower shoulder. Agent-ID: codex-a7c4."""
import importlib.util
import json
import sys
from bisect import bisect_left, bisect_right
from fractions import Fraction as Q
from functools import cache
from math import isqrt
from pathlib import Path

HERE = Path(__file__).resolve().parent
EPS, GUIDE, BETA = Q('.752'), Q('.8456'), Q('.1432')
PRICE, LOW, HIGH = Q(2500, 1891), Q('.8297'), Q('.8393')
MU, TARGET = EPS*PRICE, Q('.713245')
U0, TOTAL, S = Q('.0463'), Q('.080051'), Q('1.3739535256616')
RHO, C6 = Q('.5053'), Q('40.45313')
DEN, PI_HI = 1+RHO**2, Q('3.141592653589794')
RADIUS = (PI_HI/4-LOW**2)/PRICE**2
SCALE = 10**13
V_CUTS = tuple(map(Q, (
    '.0001 .0005 .001 .002 .003 .004 .005 .006 .008 .01 .014 .02 '
    '.026 .032 .038 .043 .048 .055 .065 .075').split()))
MULTIPLIERS = tuple(map(Q, ('0', '-.02', '.04', '.125', '-.05')))
CONTENT = tuple((Q(l), Q(g)) for l, g in [
    ('.012','.0484'), ('.02','.0415'), ('.025','.0393'), ('.03','.0375'),
    ('.035','.0355'), ('.04','.034'), ('.044','.0325')])

def require(ok, reason):
    if not ok:
        raise ValueError(reason)

def load(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module

@cache
def sqrt_lo(x):
    return Q(isqrt(x.numerator*SCALE**2//x.denominator), SCALE)

@cache
def sqrt_hi(x):
    lo = sqrt_lo(x)
    return lo if lo*lo == x else lo+Q(1,SCALE)

def constant(t):
    return t*t-2*MU*GUIDE*t+2*(MU*BETA)**2/EPS

@cache
def m6(x):
    return 6+9*x+C6*x*sqrt_hi(x)

def read_inputs(repo):
    require(__debug__, "enable Python assertions for the upstream Rice certificates")
    code = repo/'research/conjecture-K/code'
    window = load('window', code/'peak-window-codex-a7c4/verify.py')
    raw, caps, _ = window.read_public_inputs(repo)
    peak = load('peak', code/'peak-remote-deficit-codex-a7c4/verify_peak.py')
    caps1, tail, rice = peak.read_inputs(repo)
    cert = json.loads((code/'peak-remote-deficit-codex-a7c4/peak_cover.json').read_bytes())
    peak.verify_certificate(cert, caps1, tail, rice)
    barriers = load('uncapped_barriers', code/'uncapped-stein-score-codex-a7c4/verify.py')
    rows = json.loads((barriers.HERE/'barriers.json').read_bytes())
    expected = [(U0,Q('.051'),Q('.032')), (Q('.051'),Q('.06'),Q('.0307'))]
    require(RADIUS <= expected[-1][1], 'witness exceeds verified score regime')
    def check_score_rows(data):
        for i,(l,h,gamma) in enumerate(expected):
            row = data[i]
            require((Q(row['lo']),Q(row['hi']),Q(row['gamma']))==(l,h,gamma),
                    'wrong consumer score regime')
            barriers.check_row(row,i,sources)
    sources = barriers.load_source()
    check_score_rows(rows)
    altered = [dict(rows[0],hi='.052'),*rows[1:]]
    try:
        check_score_rows(altered)
    except ValueError as error:
        require(str(error)=='wrong consumer score regime','wrong score boundary control')
    else:
        raise ValueError('accepted a displaced score breakpoint')
    polys = [tuple(map(Q, p)) for p in cert['cubics']]
    pack = json.loads((HERE/'duals.json').read_bytes())
    knots = list(map(Q, pack['knots']))
    nodes = {}
    for row in pack['models']:
        u = Q(row['v'])
        require(u > 0 and raw.check_stein_node(row, knots, caps), 'invalid whole-ray dual')
        nodes.setdefault(u, []).append(tuple(map(Q,row['coefficients'])))
    damaged = dict(pack['models'][0], coefficients=['0']+pack['models'][0]['coefficients'][1:])
    require(not raw.check_stein_node(damaged, knots, caps), 'accepted negative whole-ray control')
    return polys, nodes

def score_bounds(l, h, y, content=CONTENT):
    gamma = min([Q('.08')]+[g for low,g in content if l >= low])
    slope = sqrt_hi(gamma)
    if h > U0:
        slope += Q('1.04')*max(0,sqrt_hi(h)-sqrt_lo(U0))
    if l >= U0:
        require(h<=Q('.06'),'score cap energy')
        slope = min(slope,sqrt_hi(Q('.032') if l<Q('.051') else Q('.0307')))
    delta = h*h*y
    common = min(Q('.139')*sqrt_hi(h), sqrt_hi(Q('2.8')*delta*sqrt_hi(delta)),
                 slope*sqrt_hi(delta), Q('.02')+Q('.26')*max(0,h-U0))
    error = min(Q('.0035')*sqrt_hi(h),sqrt_hi(Q('.03')*delta*sqrt_hi(delta)))
    return common+RHO*error/DEN, error/DEN

def shell_gain(a, b, k0, left, right):
    k = k0+2*right
    radius = sqrt_hi(DEN*right)
    charge = k-Q('.08')*DEN
    gain = min(2*sqrt_hi(a*a+b*b)*radius, a*a/Q('.23')+2*b*radius)
    gain += charge*(right if charge >= 0 else left)
    for m in MULTIPLIERS:
        ar, au = Q('.31')-k/DEN+m, Q('.08')-k/DEN+m
        if min(ar, au)>0:
            gain = min(gain, a*a/ar+b*b/au+m*DEN*(right if m>=0 else left))
    return gain

def make_radial_bound(polys, nodes, *, continuation=None, chord_curvature=None):
    """Return a verified upper price on a closed energy and fourth-excess cell."""
    node_energies = sorted(nodes)
    @cache
    def node_price(u, x, y):
        def endpoint_price(p):
            a,b,c,e = p
            return max(a+b+c*(2+z)+e*m6(z)-PRICE*u for z in (x,y))
        return min(map(endpoint_price,nodes[u]))

    @cache
    def radial(l,h,x,y):
        mid, shape = (l+h)/2, (x+y)/2
        def midpoint(p):
            a,b,c,e = p
            return a+b*mid+c*mid**2*(2+shape)+e*mid**3*m6(shape)
        a,b,c,e = min(polys, key=midpoint)
        b -= PRICE
        def hermite(z):
            c2,c3 = c*(2+z),e*m6(z)
            d0 = a+b*l+c2*l*l+c3*l**3
            d1 = (h-l)*(b+2*c2*l+3*c3*l*l)
            d2 = (h-l)**2*(c2+3*c3*l)
            return max(d0,d0+d1/3,d0+2*d1/3+d2/3,a+b*h+c2*h*h+c3*h**3)
        bound = max(hermite(x),hermite(y))
        if h <= U0:
            bound = min(bound,S)
        j = bisect_left(node_energies,h)
        if 0 < j < len(node_energies) and node_energies[j-1] <= l:
            a,b = node_energies[j-1:j+1]
            left,right = node_price(a,x,y),node_price(b,x,y)
            chord = max(((b-z)*left+(z-a)*right)/(b-a) for z in (l,h))
            z = min(h,max(l,(a+b)/2))
            curvature = Q('1.673')*(2+y) if chord_curvature is None else chord_curvature(a, 2+y)
            bound = min(bound,chord+curvature*(z-a)*(b-z)/2)
        if continuation is not None:
            stop = bisect_right(node_energies, l)
            for v in node_energies[max(0, stop-2):stop]:
                if v > 0:
                    bound = min(bound, continuation(v, node_price(v,x,y), l,h,y))
        return bound

    return radial


def prove(polys, nodes, target=TARGET):
    node_energies = sorted(nodes)
    radial = make_radial_bound(polys, nodes)
    reserve = (target-max(constant(LOW),constant(HIGH)))/MU
    require(MU<1 and LOW**2>=3*PI_HI/14 and S<reserve, 'old capped row misses target')
    def margin(l,h,x,y):
        vlo = max(0,TOTAL-h) if h <= U0 else Q(0)
        vhi = 3*RADIUS/2-3*l/4
        if h<=U0 and vhi<=vlo:
            return reserve-S
        normalize = radial(l,h,x,y)
        a,b = score_bounds(l,h,y)
        k0 = min(4*h,h*(1+sqrt_hi(3*y/4)))/2-Q('.0926')
        vlayers = [vlo,*[v for v in V_CUTS if vlo<v<vhi],vhi]
        gain = max(shell_gain(a,b,k0,v,w) for v,w in zip(vlayers,vlayers[1:]))
        return reserve-normalize-gain

    energy_cuts = sorted({Q(0),RADIUS,*[e for e in
        node_energies+[U0]+[Q(s) for s in '.016 .02 .025 .03 .035 .04 .044'.split()]
        if 0<e<RADIUS]})
    shape_cuts = list(map(Q, '0 .1 .25 .5 1 2 3 4 5 6 8 12 20 30 42'.split()))
    todo = [(l,h,x,y,0) for l,h in zip(energy_cuts,energy_cuts[1:])
            for x,y in zip(shape_cuts,shape_cuts[1:])]
    count, smallest = 0, reserve-S
    while todo:
        l,h,x,y,depth = todo.pop()
        spare = margin(l,h,x,y)
        if spare > Q(1,10**6):
            count += 1
            smallest = min(smallest,spare)
            continue
        require(depth<19, 'unproved energy/shape cell')
        if (h-l)*(Q('.4')+y/10) > Q('.001')*(y-x):
            m = (l+h)/2
            children = [(l,m,x,y),(m,h,x,y)]
        else:
            m = (x+y)/2
            children = [(l,h,x,m),(l,h,m,y)]
        todo.extend((*box,depth+1) for box in children)
    return count, MU*smallest

def main():
    repo = Path(sys.argv[1]).resolve() if len(sys.argv)>1 else HERE.parents[3]
    polys,nodes = read_inputs(repo)
    count,spare = prove(polys,nodes)
    require(spare>Q('1.9')/10**6,'claimed physical margin')
    try:
        prove(polys,nodes,Q('.712'))
    except ValueError as error:
        require(str(error)=='old capped row misses target','wrong target control')
    else:
        raise ValueError('accepted a false target')
    print(f'{sum(map(len,nodes.values()))} whole-ray duals; {count} closed energy/shape cells.')
    print(f'Unrestricted [.8297,.8393] physical clearance > {spare*10**12//1}/10^12.')
    try:
        prove(polys,{})
    except ValueError as error:
        require(str(error)=='unproved energy/shape cell','wrong missing-duals control')
    else:
        raise ValueError('accepted missing new radial bounds')
    print('Corrupted dual, displaced score breakpoint, lowered target and missing duals rejected.')

if __name__=='__main__':
    main()
