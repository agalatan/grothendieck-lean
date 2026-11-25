"""[codex-a7c4] Check the mixed Gaussian-driver comparison on the full stated band. Requires python-flint."""
import argparse
from bisect import bisect_right
import importlib.util
import json
from math import comb
from pathlib import Path

from flint import arb, ctx, fmpq as Q

BASE = Path(__file__).resolve().parent
U_MIN, U_MAX, SPLIT = Q(551, 100000), Q(463, 10000), Q(83, 100)
CAP = Q(47, 200)
C0 = Q(11448919987, 200000000000)
C1 = -Q(1501543759, 1000000000000)
C3 = Q(3157217, 1000000000000)
GAMMA = Q(213543031787, 1000000000000)
ALPHA = Q(100, 3)  # (25 + 100·(3/4))/3
PROFILES = {'peak': ((699,1250),(179,1250)), 'flank': ((14,25),(1467,10000)), 'upper': ((573,1000),(19,125))}


def require(ok, label):
    if not ok:
        raise ArithmeticError(label)


def covariance_example():
    # Coefficients of 1, G², GH, H² for the four real components.
    components = [(-1,1,0,0), (0,0,-1,0), (0,0,0,0), (-1,Q(1,2),0,Q(1,2))]
    powers = [(0,0),(2,0),(1,1),(0,2)]
    moments = [1,0,1,0,3]
    def entry(left, right):
        return sum(a*b*moments[i+k]*moments[j+l]
                   for a,(i,j) in zip(left,powers) for b,(k,l) in zip(right,powers))
    M = [[entry(left,right) for right in components] for left in components]
    require(M == [[2,0,0,1],[0,1,0,0],[0,0,0,0],[1,0,0,1]], 'real covariance')
    require(sum(M[j][j] for j in range(4)) == 4, 'real covariance normalization')
    # Real largest eigenvalue solves lambda²-3lambda+1=0; (3+sqrt(5))/8 is the ratio.
    require(8*SPLIT-3 > 0 and (8*SPLIT-3)**2 > 5, 'real branch')
    # Complex covariance is [[3,-i],[i,1]], eigenvalues 2±sqrt(2).
    require(4*SPLIT-2 > 0 and (4*SPLIT-2)**2 < 2, 'complex covariance would cross the split')


def check_budget():
    covariance_example()
    real_alpha = Q(37,3)*(1+4*SPLIT)
    low = C0 + C1 + GAMMA*SPLIT + C3*(15*(real_alpha-ALPHA) - Q(34,3))
    require(real_alpha >= ALPHA and low == Q(70167789027883,300000000000000) and low < CAP, 'small-covariance cap')
    eta = Q(7,200) / Q(21,200000)
    coefficient = eta + 37 - Q(185,3)
    margin = coefficient*(1+2*SPLIT**2) + Q(34,3) - 68 - 2*eta
    require(coefficient > 0 and margin == Q(79607,7500), 'large-covariance multiplier')
    require(Q(15)+10*Q(2,3)+40 == Q(185,3), 'real sixth cumulant')
    return low, margin


class PiecewiseLinear:
    """Separate linear functions per interval, with exact primitive and first moment."""
    def __init__(self, nodes, left, right):
        self.nodes = nodes
        self.left = left
        self.slopes = [(b-a)/(r-l) for l,r,a,b in zip(nodes,nodes[1:],left,right)]
        self.mass = [Q(0)]
        self.moment = [Q(0)]
        for i,r in enumerate(nodes[1:]):
            m, n = self.partial(i, r)
            self.mass.append(self.mass[-1] + m)
            self.moment.append(self.moment[-1] + n)

    def partial(self, i, x):
        l, a, s = self.nodes[i], self.left[i], self.slopes[i]
        d = x-l
        m = a*d + s*d*d/2
        return m, l*m + a*d*d/2 + s*d**3/3

    def interval(self, x):
        require(self.nodes[0] <= x <= self.nodes[-1], 'interpolation range')
        return min(bisect_right(self.nodes, x)-1, len(self.slopes)-1)

    def at(self, x):
        i = self.interval(x)
        return self.left[i] + self.slopes[i]*(x-self.nodes[i])

    def integrals(self, x):
        i = self.interval(x)
        m, n = self.partial(i, x)
        return self.mass[i]+m, self.moment[i]+n


def scalar_majorants(table):
    rows = table['rows']
    xs = [Q(row['x'],table['x_denominator']) for row in rows]
    lower = [Q(row['A'][0],table['value_denominator']) for row in rows]
    upper = [Q(row['A'][1],table['value_denominator']) for row in rows]
    h_upper = [Q(row['H'][1],table['value_denominator']) for row in rows]
    require(xs[0] == 0 and xs[-2] >= 70*U_MAX and all(l<r for l,r in zip(xs,xs[1:])), 'table support')
    require(all(l<=h for l,h in zip(lower,upper)), 'kernel intervals')
    left, right = [], []
    for i in range(len(xs)-2):
        l, r = xs[i:i+2]
        if i == 0:
            gap = upper[0]-lower[1]
        else:
            slope = (lower[i+1]-lower[i])/(r-l)
            dl = slope - (lower[i]-upper[i-1])/(l-xs[i-1])
            dr = (upper[i+2]-lower[i+1])/(xs[i+2]-r) - slope
            gap = (r-l)*dl*dr/(dl+dr) if min(dl,dr)>0 else Q(0)
        # Round upwards to keep primitive denominators small.
        scale = 2**40
        t = gap*scale
        gap = Q((t.p+t.q-1)//t.q,scale)
        left.append(lower[i]-gap)
        right.append(lower[i+1]-gap)
    require(min(left+right)>0, 'positive lower curvature')
    return PiecewiseLinear(xs[:-1],left,right), PiecewiseLinear(xs[:-1],h_upper[:-2],h_upper[1:-1])


def average_h(H, u, y):
    v = u*y
    if v == u:
        return H.at(u)
    return (H.integrals(v)[0]-H.integrals(u)[0])/(v-u)


def average_a(A, u, y):
    v = u*y
    if v == u:
        return A.at(u)/2
    mv, nv = A.integrals(v)
    mu, nu = A.integrals(u)
    return (v*(mv-mu) - (nv-nu))/(v-u)**2


def polynomial_floor(linear, left, right):
    """Minimum Bernstein coefficient on a closed interval, an exact lower bound."""
    d = right-left
    c2 = -ALPHA*C3
    power = [C0+linear*left+c2*left**2+C3*left**3,
             d*(linear+2*c2*left+3*C3*left**2),
             d*d*(c2+3*C3*left), d**3*C3]
    return min(sum((a*Q(comb(k,j),comb(3,j)) for j,a in enumerate(power[:k+1])),Q(0)) for k in range(4))


def verify_profile(name, data):
    pars = data['profile']
    a_pair, b_pair = PROFILES[name]
    require(tuple(pars['a']) == a_pair and tuple(pars['b']) == b_pair, 'row parameters')
    A, H = scalar_majorants(data)
    ctx.prec = 128
    a, b = arb(a_pair[0])/a_pair[1], arb(b_pair[0])/b_pair[1]
    integral = arb.pi()/(2*(a*b).sqrt())*(a/b).exp()*(a/b).sqrt().erfc()
    j0 = arb.pi().sqrt()/b - 2*(1+a/b)*integral
    require(-arb(17)/10 < j0 and j0 < 0 and A.at(U_MAX+Q(1,10)) > 1, 'tail kernel constants')
    tail = Q(17,10)**2/(Q(4,10)*(1-(U_MAX+Q(1,10))/(70*U_MIN)))
    for linear in (C1,C1+GAMMA):
        require(linear+C3*70*(3*70-2*ALPHA) > 0 and 6*70>2*ALPHA, 'tail monotonicity')
    require(polynomial_floor(C1,70,70) > 0 and polynomial_floor(C1+GAMMA,70,70) > tail, 'tail envelope')
    todo = [(Q(0),Q(70),0)]
    while todo:
        l,r,depth = todo.pop()
        if polynomial_floor(C1,l,r) >= 0:
            continue
        require(depth < 30, 'nonnegative auxiliary cubic')
        m = (l+r)/2
        todo.extend(((l,m,depth+1), (m,r,depth+1)))
    count = 0
    boxes = [(U_MIN,U_MAX,Q(0),Q(70),0)]
    while boxes:
        ul,ur,yl,yr,depth = boxes.pop()
        count += 1
        outer = ur*yr*average_h(H,ul,yl)**2/(4*average_a(A,ur,yr))
        if outer < polynomial_floor(C1+GAMMA,yl,yr):
            continue
        require(depth < 40, 'compact kernel envelope')
        if (ur-ul)*max(Q(1),yl) > (yr-yl)*ul:
            m = (ul+ur)/2
            boxes.extend(((ul,m,yl,yr,depth+1), (m,ur,yl,yr,depth+1)))
        else:
            m = (yl+yr)/2
            boxes.extend(((ul,ur,yl,m,depth+1), (ul,ur,m,yr,depth+1)))
    return count


def recompute_nodes(name, data, checker_path):
    if not __debug__:
        raise SystemExit('Arb node replay needs Python without -O because the inherited verifier uses assert')
    spec = importlib.util.spec_from_file_location('r26_kernel_audit', checker_path)
    checker = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(checker)
    for node in data['rows']:
        checker.recompute((name, data['profile'], node, data['x_denominator'], data['value_denominator']))


if __name__ == '__main__':
    args = argparse.ArgumentParser()
    args.add_argument('--recompute-kernels', action='store_true')
    args.add_argument('--kernel-checker', type=Path, default=BASE.parent/'audit-2026-11-13/r26_kernel_recheck/check_kernels.py')
    options = args.parse_args()
    print('Low-covariance cap and high-covariance margin:', *(str(t) for t in check_budget()), flush=True)
    for name in PROFILES:
        with (BASE/(name+'_kernels.json')).open() as handle:
            data = json.load(handle)
        if options.recompute_kernels:
            recompute_nodes(name, data, options.kernel_checker)
        print(name, len(data['rows']), 'nodes,', verify_profile(name, data), 'compact boxes', flush=True)
