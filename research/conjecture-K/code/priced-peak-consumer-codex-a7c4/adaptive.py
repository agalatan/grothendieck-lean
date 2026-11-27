"""Adaptive six-sector consumer in row 8.13c. Run with python3 -IB. Agent-ID: codex-a7c4."""
import sys
from fractions import Fraction as Q
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from peak_cells import check, load_peak_cells


EPS = Q(94, 125)
TARGET = Q(713245, 10**6)
LO, HI = Q('.8372'), Q('.8393')
SCALES = tuple(Q(s) for s in ('.9987', '1.0097', '1.0131', '1.0145', '1.0155', '1.016', '1.028'))


def certify(kast, cells, scales):
    check(3 * kast.PI_HI / 14 <= LO**2 < HI**2 < Q('3.14') / 4, 'sharp radius domain')
    physical_cap = EPS**2 * (kast.PI_HI / 4 - LO**2)
    check(scales and max(physical_cap / kast.E0, 7 * physical_cap / (4 * kast.U_TOT0))
          <= scales[-1]**2, 'outer energy coverage')
    check(Q('.0784') < Q('.452') and Q('.36') * kast.D_RHO < Q('.452'), 'trial norm prices')
    previous = Q(0)
    results = []
    for scale in scales:
        check(scale > previous, 'scale order')
        price = scale / EPS - kast.P0
        even_price = price - max(0, scale - 1) * Q('.452')
        check(price >= even_price >= 0, 'shell price signs')
        cap = physical_cap / scale**2
        ratio = (previous / scale)**2
        remaining = []
        for cell in cells:
            u, v = cell.u_lo, cell.v_lo
            if u > cap or 3 * u / 4 + v > 3 * cap / 2:
                continue
            u_max = min(cell.u_hi, cap, 2 * cap - 4 * v / 3)
            total_max = min(u_max + cell.v_hi, 3 * cap / 2 + u_max / 4, kast.U_TOT0)
            # Failing either previous cap puts a response in this layer.
            # Equality is retained here and also covered by the previous scale.
            if u_max < ratio * kast.E0 and total_max < ratio * kast.U_TOT0:
                continue
            remaining.append(cell.excess - price * u - even_price * v)
        check(remaining, 'empty layer')
        visible = max(t*t - 2*scale*kast.ELL0*t for t in (LO, HI))
        upper = visible + 2 * (scale * kast.BETA0)**2 / EPS + scale * (kast.S0_HI + max(remaining))
        clearance = TARGET - upper
        check(clearance > Q(5, 10**6), 'layer clearance')
        results.append((scale, len(remaining), clearance))
        previous = scale
    return results


def rejects(kast, cells, scales, expected):
    try:
        certify(kast, cells, scales)
    except ValueError as exc:
        if str(exc) != expected:
            raise
    else:
        raise ValueError(f'missing rejection: {expected}')


if __name__ == '__main__':
    kast, cells = load_peak_cells()
    print('scale | retained cells | clearance below 0.713245, rounded down in trillionths')
    for scale, count, gap in certify(kast, cells, SCALES):
        print(scale, count, gap * 10**12 // 1, sep=' | ')
    rejects(kast, cells, SCALES[:-1], 'outer energy coverage')
    rejects(kast, cells, (SCALES[-1],), 'layer clearance')
    rejects(kast, cells, (Q('.99'),) + SCALES[1:], 'shell price signs')
    print('All seven layers verified. All three controls rejected at their named guards.')
