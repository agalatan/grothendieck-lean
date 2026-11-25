"""[codex-a7c4] Replay exact scalar obstruction and a joint-law mixed-moment check."""
from collections import defaultdict
from math import comb, factorial


def require(condition):
    if not condition:
        raise ArithmeticError('identity failed')


def multiply(a, b):
    c = defaultdict(int)
    for u, v in a.items():
        for w, z in b.items():
            c[tuple(t + s for t, s in zip(u, w))] += v * z
    return {key: value for key, value in c.items() if value}


def add(*summands):
    c = defaultdict(int)
    for factor, a in summands:
        for u, v in a.items():
            c[u] += factor * v
    return {key: value for key, value in c.items() if value}


def scalar(k):
    d = {}
    for j in range(k + 1):
        n = 2 * (k - j)
        integral = sum((-1) ** (n-l) * comb(n, l) * factorial(l + 2*j)
                       for l in range(n + 1))
        d[k-j, j] = comb(k, j) ** 2 * integral
    return d


m1, m2, m3 = map(scalar, (1, 2, 3))
require(m1 == {(1, 0): 1, (0, 1): 2})
require(m2 == {(2, 0): 9, (1, 1): 56, (0, 2): 24})
require(m3 == {(3, 0): 265, (2, 1): 3258, (1, 2): 4536, (0, 3): 720})
square = multiply(m1, m1)
require(add((1, m2), (-2, square)) == {(2, 0): 7, (1, 1): 48, (0, 2): 16})
diff = add((37, multiply(m1, m2)), (-68, multiply(m1, square)), (-1, m3))
require(diff == {(2, 1): -928, (1, 2): -320, (0, 3): 512})
require(sum(m3.values()) == 8779 and sum(diff.values()) == 8043-8779)
print('Exact moment coefficients and (x,y)=(1,1) obstruction verified.')

# Isserlis cross-check with q=X(|Y|²−1)+conj(X) YZ, folded r.
# Powers are (X,Y,Z,conj(X),conj(Y),conj(Z)).
p = {(1,1,0,0,1,0): 1, (1,0,0,0,0,0): -1}
minus = {(0,1,1,1,0,0): 1}
def conj(poly):
    return {v[3:]+v[:3]: x for v,x in poly.items()}
q = add((1,p),(1,minus))
r = add((1,p),(1,conj(minus)))

def powers(poly, count):
    out = [{(0,0,0,0,0,0): 1}]
    for _ in range(count):
        out.append(multiply(out[-1], poly))
    return out

def joint_moment(poly, c, d):
    total = 0
    for (x,y,z,xx,yy,zz), weight in poly.items():
        if x+c == xx+d and y == yy and z == zz:
            total += weight*factorial(x+c)*factorial(y)*factorial(z)
    return total

q_p, r_p = powers(q, 5), powers(r, 5)
count = 0
for a in range(6):
    for b in range(6):
        lhs = multiply(q_p[a], conj(q_p[b]))
        rhs = multiply(r_p[a], conj(r_p[b]))
        for c in range(6):
            for d in range(6):
                require(joint_moment(lhs,c,d) == joint_moment(rhs,c,d))
                count += 1
print(f'Checked {count} joint complex moments against the folded polynomial.')

# Derive the real cumulant bounds, the averaged inequality, and the budget.
from fractions import Fraction as Q

def cumulant_multiplier(k):
    return 2**(k-1)*factorial(k-1)

k2, k3, k4, k6 = map(cumulant_multiplier, (2,3,4,6))
c3 = Q(k3**2, k2*k4)
c6 = Q(k6, k2*k4)
c4budget = 15 + 10*c3 + c6
require((c3,c6,c4budget) == (Q(2,3),40,Q(185,3)))
# Mean (sqrt(2)*cos(theta))^(2k) = binomial(2k,k)/2^k.
angle4 = Q(comb(4,2),2**2)
angle6 = Q(comb(6,3),2**3)
excess_coefficient = 2*c4budget*angle4/angle6
pseudo_coefficient = (Q(45,2) - 2*c4budget*angle4)/angle6
require((15/angle6,excess_coefficient,pseudo_coefficient) == (6,74,-65))
require(74-37 == 37 and 6-2*37+68 == 0)
for b4 in (Q(37,1000),Q(7,200)):
    require(b4-37*Q(21,200000) > 0)
require(Q(11,50) < Q(47,200) < Q(6,25) and Q(239,1000) < Q(6,25))
print('Exact cumulant, angular-average and three-row budget coefficients verified.')
