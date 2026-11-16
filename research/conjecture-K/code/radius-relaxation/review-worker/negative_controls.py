#!/usr/bin/env python3
"""Negative controls for the reviewer's verifier (own_verifier.py): unit tests of the Bernstein decision and
perturbed certificates that must be rejected.
Usage: python3 -I negative_controls.py CERT_G.json CERT_N.json AUTHOR_VERIFY_CERT_COPY.py
Perturbations of a test function where no outcome can be predicted (the perturbed data may be another valid
certificate) are run through both verifiers, which must agree ("differential").  More of these: differential.py."""
import copy
import json
import os
import sys
from fractions import Fraction as Fr
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import importlib.util
import own_verifier as OV

results = []
AV = None


def author_accepts(row):
    try:
        res = AV.verify_row(row, quiet=True)
        return bool(res['ok']), res['bound']
    except (AssertionError, ValueError):
        return False, None


def differential(name, row):
    rej, res = row_rejected(row)
    a_ok, a_bound = author_accepts(row)
    same = ((not rej) == a_ok) and (rej or res['bound'] == a_bound)
    results.append(same)
    print('%-88s reviewer %s, author %s  %s' % (name, 'rejects' if rej else 'accepts', 'accepts' if a_ok else 'rejects',
                                             'agree (differential)' if same else '*** DISAGREE ***'), flush=True)


def record(name, got_reject, expect_reject=True, note=''):
    ok = (got_reject == expect_reject)
    results.append(ok)
    print('%-88s %s  %s%s' % (name, 'rejected' if got_reject else 'accepted',
                             'as expected' if ok else '*** UNEXPECTED ***', ('   ' + note) if note else ''), flush=True)


# ---------------------------------------------------------------- unit tests of the positivity decision
def seg(coeffs, a, b):
    st = dict(leaves=0, depth=0)
    return OV.positive_on_segment(OV.Poly(coeffs), Fr(a), Fr(b), st), st


def ray(coeffs, a):
    st = dict(leaves=0, depth=0)
    return OV.positive_on_ray(OV.Poly(coeffs), Fr(a), st), st


eps = Fr(1, 10 ** 9)
third = Fr(1, 3)
ok, st = seg([third ** 2 + eps, -2 * third, 1], 0, 1)
record('unit: (t-1/3)^2 + 1e-9 on [0,1]   (leaves %d, depth %d)' % (st['leaves'], st['depth']), not ok, False)
ok, st = seg([third ** 2 - eps, -2 * third, 1], 0, 1)
record('unit: (t-1/3)^2 - 1e-9 on [0,1]', not ok)
ok, st = seg([third ** 2, -2 * third, 1], 0, 1)
record('unit: (t-1/3)^2 on [0,1] (a double zero inside; not strictly positive)', not ok)
ok, st = seg([Fr(-2), 0, 1], 2, 3)
record('unit: r^2 - 2 on [2,3]', not ok, False)
ok, st = seg([Fr(-2), 0, 1], 1, 3)
record('unit: r^2 - 2 on [1,3]', not ok)
ok, st = seg([Fr(0), 1], 0, 1)
record('unit: r on [0,1] (zero at the end point)', not ok)
ok, st = ray([25 + Fr(1, 10 ** 6), -10, 1], 0)
record('unit: (x-5)^2 + 1e-6 on [0,oo)   (leaves %d, depth %d)' % (st['leaves'], st['depth']), not ok, False)
ok, st = ray([25 - Fr(1, 10 ** 6), -10, 1], 0)
record('unit: (x-5)^2 - 1e-6 on [0,oo)', not ok)
ok, st = ray([25 - Fr(1, 10 ** 6), -10, 1], 6)
record('unit: (x-5)^2 - 1e-6 on [6,oo)', not ok, False)
ok, st = ray([Fr(1), 1, 0, -Fr(1, 10 ** 12)], 0)
record('unit: 1 + x - 1e-12 x^3 on [0,oo) (negative far out)', not ok)
# degree 10 with a shallow negative dip:  (r^2 - 2)^2 (r^6 + 1) - 1e-12 on [1, 2]
p = OV.Poly([-2, 0, 1]) * OV.Poly([-2, 0, 1]) * OV.Poly([1, 0, 0, 0, 0, 0, 1])
ok, st = seg((p - Fr(1, 10 ** 12)).c, 1, 2)
record('unit: (r^2-2)^2 (r^6+1) - 1e-12 on [1,2]', not ok)
ok, st = seg((p + Fr(1, 10 ** 12)).c, 1, 2)
record('unit: (r^2-2)^2 (r^6+1) + 1e-12 on [1,2]   (leaves %d, depth %d)' % (st['leaves'], st['depth']), not ok, False)


# ---------------------------------------------------------------- perturbed certificates
def row_rejected(row):
    try:
        res = OV.verify_row(row)
        return False, res
    except OV.Reject as ex:
        return True, str(ex)


def cert_rejected(cert):
    lines = []
    ok, worst = OV.verify_cert(cert, quiet=True, out=lines.append)
    return (not ok), (lines[-1] if lines else '')


def fstr(x):
    return '%d/%d' % (x.numerator, x.denominator)


def shifted(val, delta):
    return fstr(Fr(val) + Fr(delta))


def controls(tag, cert, irow):
    claim = Fr(cert['claim'])
    base = cert['rows'][irow]
    rej, res = row_rejected(base)
    record('%s row %d unperturbed  (bound %.9f)' % (tag, irow, float(res['bound']) if not rej else float('nan')), rej, False)

    for d, expect in ((Fr(1, 10 ** 5), True), (Fr(1, 10 ** 6), None)):
        r = copy.deepcopy(base)
        r['lam'][0] = shifted(r['lam'][0], -d)
        rej, res = row_rejected(r)
        if expect is None:
            print('%-88s %s  (informational: the margin of the pointwise inequality)' % (
                '%s row %d: lam0 lowered by %g' % (tag, irow, float(d)), 'rejected' if rej else 'accepted'))
        else:
            record('%s row %d: lam0 lowered by %g  -> (C2)' % (tag, irow, float(d)), rej, note=str(res)[:60] if rej else '')

    K = len(base['knots']) - 1
    for nm, kk, d in (('phi1', K // 3, Fr(1, 100)), ('phi1', K // 3, Fr(-1, 100))):
        r = copy.deepcopy(base)
        r[nm][kk] = shifted(r[nm][kk], d)
        if tag == 'G':                                       # keep phi2 = 2 phi1 so that th1 stays 0
            r['phi2'][kk] = shifted(r['phi2'][kk], 2 * d)
        rej, res = row_rejected(r)
        record('%s row %d: %s at knot %d changed by %s' % (tag, irow, nm, kk, d), rej, note=str(res)[:60] if rej else '')
    for nm, kk, d in (('phi2', 2 * K // 3, Fr(1, 100)), ('phi1', K, Fr(1, 100)), ('phi1', K - 1, Fr(-1, 1000)),
                      ('th4', K // 2, Fr(1, 10 ** 4)), ('xi2', K // 4, Fr(1, 10 ** 5))):
        if tag == 'G' and nm in ('th4', 'xi2', 'phi2'):
            continue
        r = copy.deepcopy(base)
        r[nm][kk] = shifted(r[nm][kk], d)
        if tag == 'G' and nm == 'phi1':
            r['phi2'][kk] = shifted(r['phi2'][kk], 2 * d)
        differential('%s row %d: %s at knot %d changed by %s' % (tag, irow, nm, kk, d), r)

    r = copy.deepcopy(base)
    r['mu'][4] = fstr(Fr(r['mu'][4]) / 2)
    rej, res = row_rejected(r)
    record('%s row %d: mu_5 halved' % (tag, irow), rej, note=str(res)[:60] if rej else '')

    r = copy.deepcopy(base)
    r['mu'][2] = fstr(Fr(r['mu'][2]) * Fr(9, 10))
    rej, res = row_rejected(r)
    record('%s row %d: mu_3 times 9/10' % (tag, irow), rej, note=str(res)[:60] if rej else '')

    r = copy.deepcopy(base)
    r['sigma'] = fstr(-Fr(r['sigma']))
    rej, res = row_rejected(r)
    if not rej:
        rej = res['bound'] >= claim
        res = 'bound %.6f >= claim' % float(res['bound'])
    record('%s row %d: sign of sigma flipped  -> (C2) or bound' % (tag, irow), rej, note=str(res)[:60])

    # the cone
    r = copy.deepcopy(base)
    kk = K // 2
    x1, x2 = Fr(r['xi1'][kk]), Fr(r['xi2'][kk])
    r['xia'][kk] = fstr(Fr(r['xia'][kk]) + 2 * (x1 + x2) + Fr(1, 10 ** 6))      # |xia| > 2 sqrt(xi1 xi2)
    rej, res = row_rejected(r)
    record('%s row %d: xia at knot %d pushed out of the cone  -> (C1)' % (tag, irow, kk), rej, note=str(res)[:60] if rej else '')
    r = copy.deepcopy(base)
    r['xi1'][kk] = fstr(-Fr(1, 10 ** 9))
    rej, res = row_rejected(r)
    record('%s row %d: xi1 at knot %d negative  -> (C1)' % (tag, irow, kk), rej, note=str(res)[:60] if rej else '')
    if tag == 'N':
        # inside the cone at the knots but with a larger cone multiplier (must fail (C2) since th changes)
        r = copy.deepcopy(base)
        r['xi1'] = [shifted(x, Fr(1, 100)) for x in r['xi1']]
        rej, res = row_rejected(r)
        record('%s row %d: xi1 raised by 1/100 everywhere (still in the cone)  -> (C2)' % (tag, irow), rej,
               note=str(res)[:60] if rej else '')

    # a multiplier th_j with mu_j = 0
    if tag == 'G':
        r = copy.deepcopy(base)
        r['th2'][kk] = '1/1000'
        rej, res = row_rejected(r)
        record('%s row %d: th2 nonzero with mu_2 = 0  -> (C1)' % (tag, irow), rej, note=str(res)[:60] if rej else '')
        r = copy.deepcopy(base)
        r['phi2'][kk] = shifted(r['phi2'][kk], Fr(1, 1000))
        rej, res = row_rejected(r)
        record('%s row %d: phi2 != 2 phi1 with mu_1 = 0 (th1 != 0)  -> (C1)' % (tag, irow), rej, note=str(res)[:60] if rej else '')

    # signs
    r = copy.deepcopy(base)
    r['l3'][0] = fstr(-Fr(r['l3'][0]))
    rej, res = row_rejected(r)
    record('%s row %d: l3s negative' % (tag, irow), rej, note=str(res)[:60] if rej else '')
    r = copy.deepcopy(base)
    r['mu'][2] = fstr(-Fr(r['mu'][2]))
    rej, res = row_rejected(r)
    record('%s row %d: mu_3 negative' % (tag, irow), rej, note=str(res)[:60] if rej else '')

    # (C3)
    end = 'hi'
    r = copy.deepcopy(base)
    r['par'][end]['cuts'][0][2] = fstr(-Fr(r['par'][end]['cuts'][0][2]))
    rej, res = row_rejected(r)
    record('%s row %d: first cut multiplier negative  -> (C3)' % (tag, irow), rej, note=str(res)[:60] if rej else '')
    r = copy.deepcopy(base)
    r['par'][end]['alpha'][1] = '-1/2'
    rej, res = row_rejected(r)
    record('%s row %d: alpha_b negative  -> (C3)' % (tag, irow), rej, note=str(res)[:60] if rej else '')
    r = copy.deepcopy(base)
    r['par'][end]['sqrt_ub'] = fstr(Fr(r['par'][end]['sqrt_ub']) * Fr(999, 1000))
    rej, res = row_rejected(r)
    record('%s row %d: sqrt_ub lowered by 0.1%%  -> (C3)' % (tag, irow), rej, note=str(res)[:60] if rej else '')
    base_bound = OV.verify_row(base)['bound']
    r = copy.deepcopy(base)                                             # drop the cut b <= n: valid, weaker
    r['par'][end]['cuts'] = [c for c in r['par'][end]['cuts'] if c[0] != 'bn']
    assert len(r['par'][end]['cuts']) < len(base['par'][end]['cuts'])
    rej, res = row_rejected(r)
    record('%s row %d: cut b <= n dropped: a valid row with a larger bound (%.6f)' % (
        tag, irow, float(res['bound']) if not rej else float('nan')), rej or not res['bound'] > base_bound, False)
    r = copy.deepcopy(base)                                             # drop coordinate cuts: valid, not weaker
    r['par'][end]['cuts'] = [c for c in r['par'][end]['cuts'] if c[0] not in ('n', 'h', 'b', 'y', 'z')]
    rej, res = row_rejected(r)
    record('%s row %d: coordinate cuts dropped: a valid row, bound not larger (difference %.1e)' % (
        tag, irow, float(base_bound - res['bound']) if not rej else float('nan')), rej or not res['bound'] <= base_bound, False)
    r = copy.deepcopy(base)
    r['par'][end]['cuts'].append(['c1', '-1/2', '1/100'])
    try:
        rej, res = row_rejected(r)
    except ValueError as ex:
        rej, res = True, 'ValueError %s' % ex
    record('%s row %d: tangent cut with theta < 0' % (tag, irow), rej, note=str(res)[:60] if rej else '')
    r = copy.deepcopy(base)
    r['par'][end]['cuts'].append(['zz', None, '1/100'])
    try:
        rej, res = row_rejected(r)
    except ValueError as ex:
        rej, res = True, 'ValueError %s' % ex
    record('%s row %d: unknown cut type' % (tag, irow), rej, note=str(res)[:60] if rej else '')

    # the cover of s and the claim
    c = copy.deepcopy(cert)
    del c['rows'][irow]
    rej, msg = cert_rejected(c)
    record('%s: row %d removed  -> cover' % (tag, irow), rej, note=msg[:60])
    c = copy.deepcopy(cert)
    c['rows'][-1]['s_hi'] = '41'
    rej, msg = cert_rejected(c)
    record('%s: last row ends at s = 41  -> cover' % tag, rej, note=msg[:70])
    c = copy.deepcopy(cert)
    c['rows'][0]['s_lo'] = '1/10'
    rej, msg = cert_rejected(c)
    record('%s: first row starts at s = 1/10  -> cover' % tag, rej, note=msg[:70])
    c = copy.deepcopy(cert)
    worst = max(OV.verify_row(rw)['bound'] for rw in c['rows'][irow:irow + 1])
    c['claim'] = fstr(worst)                                    # the claim equal to the bound of this row: not <
    rej, msg = cert_rejected(c)
    record('%s: claim lowered to the bound of row %d' % (tag, irow), rej, note=msg[-40:])
    # an s-interval enlarged with a valid sqrt bound: the row stays valid, its bound must grow past the claim
    r = copy.deepcopy(base)
    s_new = Fr(r['s_hi']) + 3
    r['s_hi'] = fstr(s_new)
    sb = Fr(r['par']['hi']['sqrt_ub'])
    while sb * sb < s_new:
        sb += Fr(1, 100)
    r['par']['hi']['sqrt_ub'] = fstr(sb)
    rej, res = row_rejected(r)
    over = rej or res['bound'] >= claim
    record('%s row %d: s_hi raised by 3 (valid sqrt bound): bound %s' % (
        tag, irow, ('%.6f' % float(res['bound'])) if not rej else 'n/a'), over, note='bound >= claim' if not rej else str(res)[:50])


if __name__ == '__main__':
    certG = json.load(open(sys.argv[1]))
    certN = json.load(open(sys.argv[2]))
    spec = importlib.util.spec_from_file_location('author_verify_cert', sys.argv[3])
    AV = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(AV)
    controls('G', certG, 11)       # the worst row of G
    controls('N', certN, 13)       # the worst row of N
    controls('N', certN, 0)
    print('%d controls, %d unexpected' % (len(results), results.count(False)))
    sys.exit(0 if all(results) else 1)
