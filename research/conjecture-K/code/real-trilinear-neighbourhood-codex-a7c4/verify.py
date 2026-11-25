"""[codex-a7c4] Replay the trilinear projection, deficit, and perturbation budgets."""
from fractions import Fraction as Q
import json
from math import factorial, isqrt
from pathlib import Path

BASE = Path(__file__).resolve().parent
KERNELS = BASE.parent/'third-audit-2026-11-15-codex-a7c4/content_kernels_exact_result.json'
U = Q(463, 10000)
PI_LO = Q(223, 71)
COST = Q(6, 25)
PROFILES = {'peak': (Q(699, 1250), Q(179, 1250)),
            'flank': (Q(14, 25), Q(1467, 10000)),
            'upper': (Q(573, 1000), Q(19, 125))}


def require(check, label):
    if not check:
        raise ArithmeticError(label)


def sqrt_floor(x):
    scale = 10**9
    return Q(isqrt((x*scale**2).__floor__()), scale)


def check_tensor_multiplication():
    """Derive M^T M exactly from the normalized creation/contraction factors."""
    inputs = [(2, 0), (0, 2), (2, 2)]
    outputs = [(1, 1), (3, 1), (1, 3), (3, 3)]
    def squared_factor(n, m):
        return n+1 if m==n+1 else n if m==n-1 else 0
    columns = [[squared_factor(p, i)*squared_factor(q, j) for i, j in outputs]
               for p, q in inputs]
    require(columns == [[2, 3, 0, 0], [2, 0, 3, 0], [4, 6, 6, 9]], 'creation/contraction factors')
    def gram(c1, c2):
        # Each product in M^T M is an integer, or an integer multiple of sqrt(2).
        a = b = 0
        for x, y in zip(c1, c2):
            r = isqrt(x*y)
            if r*r == x*y:
                a += r
            else:
                r = isqrt(x*y//2)
                require(2*r*r == x*y, 'unexpected radical in the Gram matrix')
                b += r
        return a, b
    g = [[gram(c1, c2) for c1 in columns] for c2 in columns]
    require(g == [[(5, 0), (2, 0), (0, 5)], [(2, 0), (5, 0), (0, 5)],
                  [(0, 5), (0, 5), (25, 0)]], 'Gram matrix')
    anti, sym, cross, diag = 5-2, 5+2, 2*5, 25
    center = Q(sym+diag, 2)
    radicand = Q(sym-diag, 2)**2+cross**2
    require(anti == 3 and center == 16 and radicand == 181, 'Gram eigenvalues')
    require(30 > center and (30-center)**2 > radicand, 'squared norm below 30')


def check_examples():
    core = Q(2, 8**2)
    residual = Q(4, 200**2)
    require(core == Q(1, 32) and residual < core**2/4 and core+residual < U, 'one-line example')
    # A bath coefficient B=Y*conj(Z)+conj(Y)*Z equals g*j+h*k in standardized real normals.
    second, fourth = 2, 2*3*3+6
    core2 = Q(second*(1+2**2), 16**2)
    variance2 = Q((fourth-second**2)*(1+2**4), 16**4)
    residual2 = Q(4, 160**2)
    require(core2 == Q(5, 128) and variance2 == Q(85, 16384), 'two-carrier moments')
    require(residual2 < Q(3, 40)*variance2 and residual2+core2 < U, 'two-carrier example')
    # Sharpness obstruction to replacing the uniform multiplication factor 30 by 25:
    # b=YZ and F=V-u with V=b², E b²=1, E b⁴=9, E b⁶=225.
    require(Q(225-2*9+1, 9-1) == 26, 'multiplication negative control')


def replay():
    check_tensor_multiplication()
    check_examples()
    require(15+40+Q(20, 3) == Q(185, 3), 'unpaired sixth coefficient')
    require(15+20 == 35 and 3*35-15 == 90, 'paired sixth coefficient')
    r = Q(447, 1000)
    require(r*sum(Q(3, 2)**i/factorial(i) for i in range(8)) > 2, '2 exp(-3/2) bound')
    saved = json.loads(KERNELS.read_text())['derivative_bounds']
    out = {}
    for row, (a, b) in PROFILES.items():
        m = a*a+4*a*b+6*b*b
        a1, b1 = 2*m+Q(182, 3)*U, Q(328, 3)*U
        general_sq = PI_LO*b1**2/((m+U)*a1**4)
        require(general_sq > Q(49, 100)**2, 'unpaired single-carrier deficit')
        require(2*m > 22*U, 'paired quadratic monotonicity')
        paired_sq = PI_LO/(16*(m+U)*(m+3*U)**2)
        require(paired_sq > Q(1, 2)**2, 'paired single-carrier deficit')
        block_sq = PI_LO/(16*(m+U)*(2*m+31*U)**2)
        require(block_sq > Q(3, 20)**2, 'arbitrary-block deficit')
        # The strictest row discriminates 1/2 from 0.501 in the stated majorant.
        if row == 'upper':
            pi_hi = Q(22, 7)
            require(pi_hi/(16*(m+U)*(m+3*U)**2) < Q(501, 1000)**2, 'upper-row negative control')
        mass = Q(saved[row]['M_j_A'][0][1])
        lip = mass*(1+r)/2
        beta = sqrt_floor(PI_LO/(4*(m+U)))
        charge = lip**2+COST*(Q(1432, 1000)-beta)
        require(charge < 2*COST, 'energy charge below 12/25')
        out[row] = {'visible_mean_variance': str(m), 'unpaired_deficit_lower': str(sqrt_floor(general_sq)),
                    'paired_deficit_lower': str(sqrt_floor(paired_sq)), 'block_deficit_lower': str(sqrt_floor(block_sq)),
                    'perturbation_charge_upper': str(charge)}
    return out


if __name__ == '__main__':
    actual = replay()
    require(actual == json.loads((BASE/'result.json').read_text()), 'saved replay result')
    print(json.dumps(actual, indent=2))
