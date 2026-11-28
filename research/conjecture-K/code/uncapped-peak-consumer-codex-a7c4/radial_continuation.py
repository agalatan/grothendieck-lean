"""Outgoing radial prices at a fixed normalized law. Agent-ID: codex-a7c4."""
import importlib.util
from fractions import Fraction as Q
from functools import cache
from math import ceil, factorial
from pathlib import Path

HERE = Path(__file__).resolve().parent


def load_shoulder():
    spec = importlib.util.spec_from_file_location('lower_shoulder', HERE/'lower_shoulder.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def checked_continuation(repo, base):
    """Verify the peak derivatives, then return outgoing and interpolation bounds on closed cells."""
    base.require(__debug__, 'enable assertions for the upstream radial proof')
    window = base.load('radial_window', HERE.parent/'peak-window-codex-a7c4/verify.py')
    raw, _, _ = window.read_public_inputs(repo)
    a, b = Q(699, 1250), Q(179, 1250)
    derivatives, _ = raw.compute_deficit_moments_and_rice_poly(
        a, b, raw.single_pole_integrals(a, b, n=26), raw.single_pole_integrals(a, 3*b, n=26))
    scale = 10**12
    # Every Taylor monomial used in a lower anchor has a nonnegative argument.
    lo = [Q(value.lo*scale // 1, scale) for value in derivatives]
    curvature_lo = -derivatives[2].hi
    curvature_hi = -lo[2]
    base.require(len(lo) == 9 and lo[1] > base.PRICE and curvature_lo > Q('1.6725')
                 and Q(7, 6)*derivatives[3].hi < 5*curvature_lo, 'peak derivative enclosure')
    f0 = lo[0]
    d = lo[1] - base.PRICE

    @cache
    def lower_anchor(s, k):
        # Sharp two-moment lower value is h(0)+(h(k*s)-h(0))/k-p*s.
        bound = f0 - base.PRICE*s
        partial = bound
        power = s
        for order in range(1, 9):
            partial += lo[order]*power/factorial(order)
            if order % 2 == 0:
                bound = max(bound, partial)
            power *= k*s
        return bound

    @cache
    def curvature_floor(high, k):
        z = 1 + 5*high*k
        return Q('1.6725') / (1+(z*base.sqrt_hi(z)-1)/k)

    base.require(16*Q(7,12)**3 > Q(22,7), 'beta-gamma density ratio at zero')
    base.require(curvature_floor(Q('.07'), Q(44)) > Q('.6725'), 'full-shape curvature')
    base.require(curvature_floor(Q('.07'), Q(5)) > Q('.9768'), 'low-excess curvature')

    third_lo = lo[3]
    fourth_abs_hi = -lo[4]
    base.require(third_lo > 0 and third_lo**2 <= curvature_hi*fourth_abs_hi,
                 'curvature moment order')

    @cache
    def curvature_ceiling(first_node, k):
        base.require(first_node >= 0 and k >= 1, 'invalid interpolation domain')
        return curvature_hi*k - third_lo*first_node*k*k/(1+fourth_abs_hi*first_node*k/third_lo)

    def outgoing(node, node_upper, low, high, chi_high):
        base.require(0 < node <= low <= high and chi_high >= 0, 'not an outgoing radial cell')
        k = 2 + chi_high
        curvature = curvature_floor(high, k)

        # T2(u)+(u/v)^3*(A_v-T2(v)), using directed derivative endpoints.
        c2 = -curvature_hi*k/2
        c3 = (node_upper - f0 - d*node - c2*node**2)/node**3

        def cubic(u):
            return f0 + u*(d + u*(c2 + u*c3))

        def derivative(u):
            return d + u*(2*c2 + 3*u*c3)

        width = high - low
        left, right = cubic(low), cubic(high)
        bound = max(left, left+width*derivative(low)/3, right-width*derivative(high)/3, right)
        for anchor in (Q(0), node/4, node/2, 3*node/4, Q('.01'), Q('.02'), Q('.025')):
            if anchor >= node:
                continue
            slope = (node_upper - lower_anchor(anchor, k))/(node-anchor)
            # The corrected secant is concave; its maximum may be inside the cell.
            vertex = (node+anchor)/2 + slope/curvature
            u = min(high, max(low, vertex))
            bound = min(bound, node_upper+(u-node)*(slope-curvature*(u-anchor)/2))
        return bound

    return outgoing, curvature_ceiling


def check_physical_cells(base, original, outgoing_only, continued):
    """Fixed p0 trial on two closed cells, with unrestricted odd energy."""
    amplitudes = (Q('.824'), Q('.8255'))
    base.require(0 < base.MU <= 1, 'unsupported physical trial scale')
    visible = max(map(base.constant, amplitudes))
    scale = 10**12
    # Entries specify normalized u, fourth excess, and normalized even energy V.
    cells = (
        ('stopped cell', (Q(3316841,65536000), Q(6633687,131072000),
                          Q(2803,512), Q(179393,32768),
                          Q(16707,4096000), Q(6683,1638400)), 625, 1983671),
        ('surrounding box', tuple(map(Q, ('.05060', '.05062', '5.473', '5.476',
                                         '.004077', '.004081'))), -1450327, 578533),
    )
    for label, (l,h,x,y,v,w), old_upper, new_lower in cells:
        base.require(base.U0 <= l <= h <= Q('.051') and 0 <= x <= y <= 42 and 0 <= v <= w,
                     'physical cell outside the score interval')
        score, error = base.score_bounds(l,h,y)
        k = min(4*h, h*(1+base.sqrt_hi(3*y/4)))/2-Q('.0926')
        gain = base.shell_gain(score,error,k,v,w)

        def margin(radial):
            return base.TARGET-visible-base.MU*(radial(l,h,x,y)+gain)

        before, after = margin(original), margin(continued)
        base.require(before < Q(old_upper,scale) and after > Q(new_lower,scale),
                     'physical margin bounds for '+label)
        # Keep the outgoing continuation and remove only the sharper interior chord.
        base.require(margin(outgoing_only) <= Q(1,10**9) < after,
                     'interpolation control for '+label)
        print(f'{label}, t=[.824,.8255]: physical margin before < {ceil(before*scale)}/10^12, '
              f'after > {ceil(after*scale)-1}/10^12')
    print('Both physical cells passed the interpolation-removal control.')


def main():
    repo = HERE.parents[3]
    shoulder = load_shoulder()
    base = shoulder.base
    polys, nodes = base.read_inputs(repo)
    nodes = shoulder.add_stein_rows(repo, nodes)
    outgoing, ceiling = checked_continuation(repo, base)
    original = base.make_radial_bound(polys, nodes)
    continued = base.make_radial_bound(polys, nodes, continuation=outgoing, chord_curvature=ceiling)
    cells = [
        ('.0603', '.0605', '.099', '.101', 150000000),
        ('.062', '.065', '0', '.1', 54000000),
        ('.06', '.0604', '4', '4.1', 1100000000),
        ('.06', '.06001', '0', '42', 4030000000),
    ]
    for low, high, x, y, minimum in cells:
        cell = tuple(map(Q, (low, high, x, y)))
        price = continued(*cell)
        gain = original(*cell) - price
        base.require(gain > Q(minimum, 10**12), 'outgoing improvement on '+str(cell))
        print(f'u=[{low},{high}], chi=[{x},{y}]: price <= {ceil(price*10**12)}/10^12, '
              f'reduction > {minimum}/10^12')
    outgoing_only = base.make_radial_bound(polys, nodes, continuation=outgoing)
    check_physical_cells(base, original, outgoing_only, continued)
    try:
        outgoing(Q('.06'), Q(1), Q('.059'), Q('.061'), Q(4))
    except ValueError as error:
        base.require(str(error) == 'not an outgoing radial cell', 'wrong reversal rejection')
    else:
        raise ValueError('accepted reversed extrapolation')
    print('Verified peak derivatives, whole-ray node bounds, and the reversed-node control.')


if __name__ == '__main__':
    main()
