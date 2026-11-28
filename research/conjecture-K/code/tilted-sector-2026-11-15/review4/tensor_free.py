# REVIEW_4 (claude-b9ee, 15 November 2026): written by the reviewer agent of the session, copied from its scratch folder; exact Bernstein re-check of the 12 boxes that used the 3 delta^{3/2} branch, with (2/25) delta instead.
# claude reviewer: exact rational Bernstein re-check of the 12 moment boxes that used the tensor branch, with the reviewed
# branch (2/25) delta instead, the box's own certified cap (or any cap of the witness) and the witness benchmark lower ends.
# Own implementation of the bivariate Bernstein test; exact Fractions; boxes bisected if needed (both children kept).
# Updated for fresh-checkout portability (#776, #913): reads the tracked repository witness and exits nonzero on failure.
import hashlib
import json
from fractions import Fraction as Q
from math import comb
from pathlib import Path
import sys

WITNESS = Path(__file__).resolve().parents[3] / 'sources' / 'received-2026-11-15-tilted-sector' / 'deficit_moment_verify_witness.json'
EXPECTED_SHA256 = 'ac6921cac8a2f3ca4cd67ab3d0cdce72c66e7e1e7d5375226117709b973f9780'


def require(cond: bool, msg: str) -> None:
    if not cond:
        sys.stderr.write(f'FAIL: {msg}\n')
        raise SystemExit(1)


raw = WITNESS.read_bytes()
require(hashlib.sha256(raw).hexdigest() == EXPECTED_SHA256, f'unexpected SHA-256 for {WITNESS}')
w = json.loads(raw.decode('utf-8'))
C6, EPS, AL = Q(4045313, 100000), Q(6, 10**6), Q(3, 10)
caps = [list(map(Q, c['coefficients'])) for c in w['caps']]
blo = {Q(k): Q(v) for k, v in w['benchmark_lower'].items()}


def poly(cap, sl, sh):          # p[i][j] u^i x^j : .3(Bchord - Fcap) + EPS - (2/25)u^2x^2
    p = [[Q(0)]*4 for _ in range(4)]; bl, bh = blo[sl], blo[sh]; s = (bh - bl)/(sh - sl)
    p[0][0] = AL*(bl - s*sl) + EPS - AL*cap[0]; p[1][0] = AL*s - AL*cap[1]
    p[2][0] = -2*AL*cap[2]; p[2][2] = -AL*cap[2] - Q(2, 25)
    p[3][0] = -6*AL*cap[3]; p[3][2] = -9*AL*cap[3]; p[3][3] = -C6*AL*cap[3]
    return p


def bern(p, a, b, c, d):
    du, dx = b - a, d - c
    tr = [[sum(p[i][j]*comb(i, k)*comb(j, l)*a**(i - k)*c**(j - l)*du**k*dx**l for i in range(k, 4) for j in range(l, 4))
           for l in range(4)] for k in range(4)]
    return min(sum(tr[k][l]*Q(comb(i, k), comb(3, k))*Q(comb(j, l), comb(3, l)) for k in range(i + 1) for l in range(j + 1))
               for i in range(4) for j in range(4))


def certify(box, sl, sh, depth=0):
    a, b, c, d = box
    for cap in caps:
        if bern(poly(cap, sl, sh), a, b, c, d) >= 0:
            return 1
    if depth >= 6:
        return None
    if (b - a)/b > (d - c)/max(d, Q(1, 10**6)):
        m = (a + b)/2; kids = [(a, m, c, d), (m, b, c, d)]
    else:
        m = (c + d)/2; kids = [(a, b, c, m), (a, b, m, d)]
    tot = 0
    for k in kids:
        r = certify(k, sl, sh, depth + 1)
        if r is None:
            return None
        tot += r
    return tot


exempt_count = 0
tensor_count = 0
for bx in w['accepted']:
    box = tuple(map(Q, bx['box']))
    if bx.get('exempt'):
        if min(Q(2, 25)*box[1]**2*box[3]**2, Q(19321, 10**6)*box[1]) > EPS:
            sl, sh = box[0], box[1]
            pieces = certify(box, sl, sh)
            print('exempt-by-tensor box', bx['box'], '-> pieces certified with 2/25 branch:', pieces)
            require(pieces is not None and pieces >= 1, f"uncertified exempt-by-tensor box {bx['box']}")
            exempt_count += 1
        continue
    if bx['content'] == 1:
        sl, sh = map(Q, bx['slab'])
        pieces = certify(box, sl, sh)
        print('tensor box', bx['box'], '-> pieces certified with 2/25 branch:', pieces)
        require(pieces is not None and pieces >= 1, f"uncertified tensor box {bx['box']}")
        tensor_count += 1

require(exempt_count == 1 and tensor_count == 11, f'expected (1, 11) boxes using 3*delta^(3/2), got ({exempt_count}, {tensor_count})')
