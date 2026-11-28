"""Verify six unrestricted-direction fourth-excess regions and two signed cones.

The checked binary partitions use only Fraction arithmetic. Agent-ID: codex-a7c4.
"""

import argparse
import copy
import hashlib
import importlib.util
import json
from dataclasses import dataclass
from fractions import Fraction as Q
from math import isqrt
from pathlib import Path

HERE = Path(__file__).resolve().parent
P = Q(2500, 1891)
EPS = Q('.752')
MU = EPS * P
S = Q('1.3739535256616')
TARGET = Q('.713245')
PI = Q('3.141592653589794')
U0, TOTAL0 = Q('.0463'), Q('.080051')
RHO = Q('.5053')
D = 1 + RHO**2
AF = Q('1.317')
PRICES = 'peak-remote-deficit-codex-a7c4/verify_peak.py'
ARCH = 'audit-2026-11-15-codex-a7c4/remote_stein_original/moment-boxes.json'
PIN = {PRICES: 'a49044bd9c63300db1b65d783696ce3e23e691ddace694b171f49ce9067ac675',
       ARCH: 'cef37c2a66eacd66296add7ed2efc5a8d6afc336d2ed614102de08429d449695'}
# All six rectangles have right t endpoint .8393. The other endpoints are fixed by the theorem.
REGIONS = [('.8296', '0', '.1'), ('.8296', '31', '42'), ('.833', '0', '.27'),
           ('.833', '26', '42'), ('.836', '0', '.32'), ('.836', '23.5', '42')]


def need(ok, message):
    if not ok:
        raise ValueError(message)


def root_up(x):
    scale = 10**12
    return Q(isqrt(x.numerator * scale**2 // x.denominator) + 1, scale)


def physical_offset(t):
    return t*t - 2*MU*Q('.8456')*t + 2*(MU*Q('.1432'))**2/EPS


def parameters(t_lo):
    need(t_lo**2 >= 3*PI/14, 'sharp radius unavailable')
    H = (PI/4-t_lo**2)/P**2
    offset = max(physical_offset(t_lo), physical_offset(Q('.8393')))
    need(0 < U0 < H and MU <= 1 and offset+MU*S < TARGET, 'capped trial insufficient')
    return H, offset


@dataclass(frozen=True)
class Inputs:
    polys: list
    exterior: Q
    bernstein: object


def inputs(repo):
    need(__debug__, 'upstream inputs use assertions; omit -O')
    code = repo/'research/conjecture-K/code'
    for name, digest in PIN.items():
        need(hashlib.sha256((code/name).read_bytes()).hexdigest() == digest, 'input digest')
    spec = importlib.util.spec_from_file_location('remote_peak', code/PRICES)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    caps, tail, rice = mod.read_inputs(repo)
    v = Q('.0426')
    anchor = sum(a*v**k for k, a in enumerate(rice))-AF*v
    reserve = Q(131649, 10**12)
    mod.verify_exterior(repo, caps, tail, AF, anchor, reserve, reserve)
    polys = [tuple(map(Q, r['coefficients'])) for r in json.loads((code/ARCH).read_bytes())]
    return Inputs(polys, anchor-reserve, mod.bernstein)


def remote_bound(src, idx, u, h, cl, ch):
    need(type(idx) is int, 'remote index')
    if idx == -1:
        return S
    if idx == -2:
        need(u >= U0 and P > AF, 'exterior price domain')
        return src.exterior-(P-AF)*u
    need(0 <= idx < len(src.polys), 'remote index')
    c0, c1, c2, c3 = src.polys[idx]
    need(c3 > 0, 'sixth-moment sign')
    upper = []
    for chi in (cl, ch):
        mom = 6+9*chi+Q('40.45313')*chi*root_up(chi)
        upper.extend(src.bernstein([c0, c1-P, c2*(2+chi), c3*mom], u, h))
    return max(upper)


def shell_bound(h, ch, vl, vh, multiplier):
    k = (1+min(3, root_up(3*ch/4)))*h/2 + 2*vh-2*U0
    a, b = Q('.31')-k/D, Q('.08')-k/D
    delta = ch*h*h
    power = delta*root_up(delta)
    content = min(Q('.139')*root_up(h), root_up(Q('.08')*delta), root_up(Q('2.8')*power))
    error = min(Q('.0035')*root_up(h), root_up(Q('.03')*power))
    x, y = content+RHO*error/D, error/D
    if multiplier == 'norm':
        coeff = min(a,b)
        return 2*root_up((x*x+y*y)*D*vh) - coeff*D*(vl if coeff >= 0 else vh)
    lam = Q(multiplier)
    need(a+lam > 0 and b+lam > 0, 'square denominator')
    return x*x/(a+lam)+y*y/(b+lam)+lam*D*(vh if lam >= 0 else vl)


def walk(src, data, box, H, offset):
    (u,h), (cl,ch), (vl,vh) = box
    if h <= U0:
        vl = max(vl, TOTAL0-h)  # The interior already follows from the capped theorem.
    vh = min(vh, 3*H/2-3*u/4)
    if vl > vh:
        need(data is None, 'nonempty witness on empty box')
        return 0, TARGET
    need(isinstance(data, list) and len(data) in (2,3), 'partition gap')
    clipped = [(u,h), (cl,ch), (vl,vh)]
    if len(data) == 3:
        axis, left, right = data
        need(type(axis) is int and 0 <= axis < 3, 'partition axis')
        lo, hi = clipped[axis]
        need(lo < hi, 'degenerate split')
        mid = (lo+hi)/2
        children = []
        for sub, child in [((lo,mid),left), ((mid,hi),right)]:
            box_child = clipped.copy()
            box_child[axis] = sub
            children.append(walk(src, child, box_child, H, offset))
        return sum(n for n, _ in children), min(g for _, g in children)
    idx, multiplier = data
    upper = remote_bound(src, idx, u, h, cl, ch) + shell_bound(h,ch,vl,vh,multiplier)
    gap = TARGET-offset-MU*upper
    need(gap > 0, 'insufficient row clearance')
    return 1, gap


def region(src, rows, definition):
    lo, cl, ch = map(Q, definition)
    H, offset = parameters(lo)
    need(isinstance(rows, list) and len(rows) == 2, 'remote partition')
    covers = [walk(src, data, [(a,b),(cl,ch),(Q(0),3*H/2)], H, offset)
              for data, (a,b) in zip(rows, [(Q(0),U0),(U0,H)])]
    return sum(n for n, _ in covers), min(TARGET-offset-MU*S, *(g for _, g in covers))


def cones():
    H, cost = parameters(Q('.8301'))
    need(Q('.08')*D+2*U0-7*H/2 > 0 and TARGET-cost-MU*S > Q('11.36')/10**6,
         'two-score cone')
    H, cost = parameters(Q('.8327'))
    k = Q(7,2)*H-2*U0
    a,b = Q('.31')-k/D, Q('.08')-k/D
    need(min(a,b) > 0, 'one-score coercivity')
    cost += MU*(S+Q('.0035')**2*H/D**2*(RHO**2/a+1/b))
    need(TARGET-cost > Q('1.016')/10**6, 'one-score cone')


def controls(src, data):
    def reject(fn, message):
        try:
            fn()
        except ValueError as exc:
            need(str(exc) == message, 'unexpected corruption outcome')
        else:
            raise ValueError('an altered certificate was accepted')
    reject(lambda: region(src, data[0][:1], REGIONS[0]), 'remote partition')
    bad = copy.deepcopy(data[0]); bad[0] = None
    reject(lambda: region(src, bad, REGIONS[0]), 'partition gap')
    reject(lambda: remote_bound(src, -2, U0/2, U0, Q(0), Q(1)), 'exterior price domain')
    reject(lambda: remote_bound(src, -3, U0, U0, Q(0), Q(1)), 'remote index')
    reject(lambda: shell_bound(U0,Q(1),Q(0),Q(1,10),'-1'), 'square denominator')
    reject(lambda: parameters(Q('.828')), 'capped trial insufficient')


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--repo', type=Path, default=next((p for p in HERE.parents if (p/'research/conjecture-K').is_dir()), Path.cwd()))
    opts = parser.parse_args()
    public = inputs(opts.repo)
    certificate = json.loads((HERE/'cover.json').read_bytes())
    need(len(certificate) == len(REGIONS), 'missing region')
    counts = [12, 116, 20, 109, 16, 60]
    for tree, slab, expected in zip(certificate, REGIONS, counts):
        count, gap = region(public, tree, slab)
        need(count == expected and gap > Q(224, 10**9), 'published cover clearance')
        print(f't >= {slab[0]}, chi in [{slab[1]}, {slab[2]}]: {count} leaves; clearance > {gap*10**12//1}/10^12')
    cones()
    controls(public, certificate)
    print('Two signed cones and six failure controls passed.')
