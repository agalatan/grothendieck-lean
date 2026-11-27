"""Exact peak-trial bounds shared by the six-sector witness replays. Agent-ID: codex-a7c4."""
import hashlib
import importlib.util
import json
from fractions import Fraction as Q
from pathlib import Path
from typing import NamedTuple


def check(ok, reason):
    if not ok:
        raise ValueError(reason)


here = Path(__file__).resolve().parent
root = here.parents[3]
code = here.parent


class PeakCell(NamedTuple):
    u_lo: Q
    u_hi: Q
    v_lo: Q
    v_hi: Q
    excess: Q


def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def load_peak_cells():
    """Check the pinned inputs and enclose the fixed trial throughout the two energy caps."""
    for line in (here / 'public.sha256').read_text().splitlines():
        digest, relpath = line.split(maxsplit=1)
        check(hashlib.sha256((root / relpath).read_bytes()).hexdigest() == digest, relpath)
    source = code / 'all-sector-transfer-gemini-c1de'
    kast = load_module('kast', source / 'verify.py')
    cover = json.loads((source / 'all_sector_transfer_cert.json').read_bytes())['covers']['peak_signed']
    u_edges = list(map(Q, cover['u_edges']))
    v_edges = list(map(Q, cover['v_edges']))
    check(u_edges[0] == v_edges[0] == 0, 'origin')
    check(u_edges[-1] == kast.E0 and v_edges[-1] == kast.U_TOT0, 'outer caps')
    for edges in (u_edges, v_edges):
        check(all(a < b for a, b in zip(edges, edges[1:])), 'grid ordering')
    check(len(cover['strips']) + 1 == len(u_edges), 'strip count')

    D = kast.D_RHO
    ETA, GAMMA = Q(6, 10**6), Q(7, 25)
    check(D == 1 + kast.RHO0**2 and Q(9,25)*D < Q('.452'), 'trial price')
    cells = []
    for ul, uh, strip in zip(u_edges, u_edges[1:], cover['strips']):
        sig = kast.sigma_lo_iv(ul, uh)
        # Positive-root upper approximations for C and the signed-score error.
        content = min(Q(1,50), kast.rat_sqrt_hi(Q('.139')**2 * uh, 10**8),
                      kast.rat_sqrt_hi(42*Q(2,25)*uh**2, 10**8))
        error = kast.rat_sqrt_hi(Q('.0035')**2 * uh, 10**10)
        a, b = kast.RHO0 * error / D, error / D
        v_cells = [(vl, min(vh, kast.U_TOT0 - ul)) for vl, vh in zip(v_edges, v_edges[1:])
                   if vl <= kast.U_TOT0 - ul]
        check(len(v_cells) == len(strip['cells']), 'row length')
        for (vl,vh), datum in zip(v_cells,strip['cells']):
            slope = 2*(min(uh+vh, kast.U_TOT0)-kast.E0)/D
            if datum[0] == 1:
                check(len(datum) == 3, 'signed witness')
                candidates = [(Q(datum[1],10), Q(datum[2],10**6))]
            else:
                check(datum[0] == 0 and len(datum) in (2,4), 'split witness')
                candidates = [(Q(0),Q(datum[1],10**6))]
                if len(datum) == 4:
                    candidates.append((Q(datum[2],10), Q(datum[3],10**6)))
            bounds = []
            for k,z in candidates:
                if ul < Q(1,200):
                    k = Q(0)
                check(0 <= k <= 1, 'content mixing coefficient')
                A, B = Q('.31')-slope+z, Q('.08')-slope+z
                if min(A,B) <= 0:
                    continue
                v_extreme = vh if z >= 0 else vl
                # Lambda(q)-S = -sigma(u)-D(q), D(q)>=0. Price kD by content.
                correction = kast.max_quad_on_iv(
                    1/A-k/GAMMA, 2*a/A,
                    a*a/A + b*b/B + z*D*v_extreme, Q(0), content)
                bounds.append(-sig + k*ETA/GAMMA + correction)
            check(bounds,'no positive completion')
            cells.append(PeakCell(ul, uh, vl, vh, min(bounds)))
    return kast, cells
