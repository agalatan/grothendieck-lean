#!/usr/bin/env python3
"""Differential test: the reviewer's verifier (Bernstein) against the author's (Sturm) on perturbed rows.

Usage: python3 -I differential.py AUTHOR_VERIFY_CERT_COPY.py CERT_G.json CERT_N.json [n_per_row]
For each chosen row, random perturbations (a knot value of one of the seven piecewise-linear functions, lam0, lam2,
a mu_j, sigma, a slope) of sizes 1e-8 .. 1e-2 are applied; both verifiers must take the same decision, and when both
accept, give the same exact bound.  Near-threshold perturbations (lam0 lowered by 1e-6 .. 4e-6, around the margin
2e-6 of the certificates) are included on purpose."""
import copy, importlib.util, json, os, random, sys, time
from fractions import Fraction as Fr
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import own_verifier as OV

spec = importlib.util.spec_from_file_location('author_verify_cert', sys.argv[1])
AV = importlib.util.module_from_spec(spec)
spec.loader.exec_module(AV)


def fstr(x):
    return '%d/%d' % (x.numerator, x.denominator)


def mine(row):
    try:
        return True, OV.verify_row(row)['bound']
    except (OV.Reject, ValueError) as ex:
        return False, str(ex)


def author(row):
    try:
        res = AV.verify_row(row, quiet=True)
        return bool(res['ok']), res['bound']
    except (AssertionError, ValueError) as ex:
        return False, 'assert ' + str(ex)


def perturb(row, rng, tag):
    r = copy.deepcopy(row)
    K = len(r['knots']) - 1
    kind = rng.choice(['knot', 'knot', 'knot', 'knot', 'lam0', 'lam0', 'lam2', 'mu', 'sigma', 'slope'])
    mag = Fr(rng.choice([1, 2, 5]), 10 ** rng.randint(2, 8)) * rng.choice([1, -1])
    if kind == 'knot':
        names = ['phi1', 'phi2', 'xi2', 'xi1', 'xia', 'th2', 'th4']
        nm = rng.choice(names)
        k = rng.randint(0, K)
        r[nm][k] = fstr(Fr(r[nm][k]) + mag)
        desc = '%s[%d] %+.0e' % (nm, k, float(mag))
        if tag == 'G' and nm == 'phi1' and rng.random() < 0.7:      # mostly keep the Lean structure phi2 = 2 phi1
            r['phi2'][k] = fstr(Fr(r['phi2'][k]) + 2 * mag)
            desc += ' (phi2 too)'
    elif kind == 'lam0':
        d = Fr(rng.randint(5, 45), 10 ** 7)                          # 0.5e-6 .. 4.5e-6
        r['lam'][0] = fstr(Fr(r['lam'][0]) - d)
        desc = 'lam0 -%.1e' % float(d)
    elif kind == 'lam2':
        r['lam'][2] = fstr(Fr(r['lam'][2]) + mag / 100)
        desc = 'lam2 %+.0e' % float(mag / 100)
    elif kind == 'mu':
        j = rng.randint(0, 4)
        f = 1 + mag
        r['mu'][j] = fstr(Fr(r['mu'][j]) * f)
        desc = 'mu_%d times %s' % (j + 1, float(f))
    elif kind == 'sigma':
        r['sigma'] = fstr(Fr(r['sigma']) * (1 + mag * 10))
        desc = 'sigma times %s' % float(1 + mag * 10)
    else:
        i = rng.randint(0, 1)
        r['slope'][i] = fstr(Fr(r['slope'][i]) * (1 + mag))
        desc = 'slope_%d times %s' % (i + 1, float(1 + mag))
        if tag == 'G':
            r['slope'][1 - i] = fstr(Fr(r['slope'][1 - i]) * (1 + mag))
            desc += ' (both)'
    return r, desc


if __name__ == '__main__':
    t0 = time.time()
    rng = random.Random(4242)
    certs = {'G': json.load(open(sys.argv[2])), 'N': json.load(open(sys.argv[3]))}
    nper = int(sys.argv[4]) if len(sys.argv) > 4 else 12
    plan = [('G', 0), ('G', 11), ('G', 21), ('N', 0), ('N', 13), ('N', 20), ('N', 22)]
    stats = dict(total=0, agree=0, both_accept=0, both_reject=0, bound_equal=0)
    for tag, i in plan:
        row = certs[tag]['rows'][i]
        okm, bm = mine(row)
        oka, ba = author(row)
        assert okm and oka and bm == ba, 'unperturbed row'
        for _ in range(nper):
            r, desc = perturb(row, rng, tag)
            okm, bm = mine(r)
            oka, ba = author(r)
            stats['total'] += 1
            same = (okm == oka) and (not okm or bm == ba)
            stats['agree'] += same
            stats['both_accept'] += (okm and oka)
            stats['both_reject'] += ((not okm) and (not oka))
            stats['bound_equal'] += (okm and oka and bm == ba)
            print('%s row %2d  %-34s reviewer: %-8s author: %-8s %s' % (
                tag, i, desc, 'accept' if okm else 'reject', 'accept' if oka else 'reject',
                '' if same else '*** DISAGREE ***  %s | %s' % (str(bm)[:50], str(ba)[:50])), flush=True)
    print(stats)
    print('time %.1f s' % (time.time() - t0))
    sys.exit(0 if stats['agree'] == stats['total'] else 1)
