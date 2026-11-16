#!/usr/bin/env python3
# Reviewer (N): the SHARP profile-free constant of the limit model Q = rho p(X) + W, p = X(|X|^2 - 2):
#     theta*(rho) = sup over profiles (and energies) of ||c||^2/(delta Omega_hat) = (||E[C_0|Q]||^2 + 1024 rho^2/(1+2rho^2))/252,
# against the certified bound of the cell that contains rho (reviewer's exact replay, data/cert_cells_review.json),
# and the largest rho at which theta* still meets each row threshold.  Also the pure junta rho = infinity.
#   argv: <scripts dir> <cert cells json> <out json>
import sys, json, math
import numpy as np
sys.path.insert(0, sys.argv[1])
import siglib as L
from scipy.interpolate import PchipInterpolator
from scipy.optimize import brentq
cells = json.load(open(sys.argv[2]))
def cert_at(rho):
    for lo, hi, nlo, nhi, corr, upper in cells:
        if lo - 1e-15 <= rho <= hi + 1e-15: return upper
    return float('nan')
RH = [0.02, 0.04, 0.06, 0.08, 0.10, 0.11, 0.115, 0.12, 0.125, 0.13, 0.14, 0.15, 0.16, 0.18, 0.20, 0.21, 0.22, 0.23, 0.25, 0.27, 0.28, 0.29, 0.30,
      1 / 3, 0.36, 0.38, 0.40, 0.42, 0.5, 0.6, 0.7, 0.75, 0.8, 0.85, 0.9, 1.0, 1.25, 1.5]
T = L.t_grid(40.0, 0.1)
res = []
print('%8s %8s %10s %12s %10s %12s %10s' % ('rho', 'chi', '||E[C0|Q]||^2', 'theta*(rho)', 'h=v ratio', 'cert. cell', 'cert/sharp'))
for rho in RH:
    s, ws = L.s_grid(240 * rho + 12)
    Tg = T if rho <= 1.0 else L.t_grid(40.0, 0.05)
    p, w1, zp = L.limit_kernels(rho, s, Tg)
    pos = p > 1e-300; u1 = 1 + 2 * rho * rho
    EZ2 = float(ws[pos] @ (zp[pos] ** 2 / p[pos])); ts = (EZ2 + 1024 * rho * rho / u1) / 252
    chk = max(abs(float(ws @ p) - 1), abs(float(ws @ (s * zp)) - 32 * rho) / (32 * rho), abs(float(ws @ (s ** 4 * p)) / (2 * u1 * u1 + 168 * rho ** 4) - 1))
    assert chk < 1e-7, chk
    ce = cert_at(rho)
    res.append(dict(rho=rho, chi=42 * (2 * rho * rho / u1) ** 2, EC0=EZ2, tstar=ts, lin=1024 * rho * rho / (126 * u1), cert=ce))
    print('%8.4f %8.4f %10.3f %12.5f %10.4f %12s %10s' % (rho, res[-1]['chi'], EZ2, ts, res[-1]['lin'], ('%.5f' % ce) if ce == ce else '-', ('%.3f' % (ce / ts)) if ce == ce else '-'), flush=True)
    if ce == ce: assert ts <= ce * (1 + 1e-6), 'certificate below the sharp constant: impossible'

# pure junta: E[C_0 | p], three branches of r = sqrt(T)|T - 2| on r < r_c = sqrt(32/27), one branch beyond (T > 8/3)
ph, wph = L.panels(np.linspace(0, math.pi / 3, 4001), 8)
r2 = (16 / 27) * (1 + np.cos(3 * ph)); rr = np.sqrt(r2); drdphi = (8 / 9) * np.sin(3 * ph) / rr
num = 0; den = 0
for k in range(3):
    Tk = 4 / 3 + (4 / 3) * np.cos(ph + 2 * math.pi * k / 3)
    jac = 2 * np.sqrt(Tk) / np.abs(3 * Tk - 2) * np.exp(-Tk)
    den = den + jac; num = num + jac * np.sqrt(Tk) * (3 * Tk * Tk - 2 * Tk - 2) * np.sign(Tk - 2)
I3 = float(wph @ (num ** 2 / den * drdphi)); mass3 = float(wph @ (den * drdphi))
t, wt = L.panels(np.linspace(8 / 3, 80, 4001), 8)
I1 = float(wt @ (np.exp(-t) * t * (3 * t * t - 2 * t - 2) ** 2)); mass1 = float(wt @ np.exp(-t))
raw3 = float(wph @ (drdphi * sum((2 * np.sqrt(Tk) / np.abs(3 * Tk - 2) * np.exp(-Tk)) * Tk * (3 * Tk * Tk - 2 * Tk - 2) ** 2 for Tk in [4 / 3 + (4 / 3) * np.cos(ph + 2 * math.pi * k / 3) for k in range(3)])))
print('junta (rho = inf): mass check %.9f (1), ||C_0||^2 check %.5f (764); ||E[C_0|p]||^2 = %.4f; theta*(inf) = %.5f   (h = v: 256/63 = %.5f; no conditioning: %.5f)' % (
    mass3 + mass1, raw3 + I1, I3 + I1, (I3 + I1 + 512) / 252, 256 / 63, (764 + 512) / 252))
junta = dict(EC0=I3 + I1, tstar=(I3 + I1 + 512) / 252)
f = PchipInterpolator([x['rho'] for x in res], [x['tstar'] for x in res])
print('largest rho with theta*(rho) <= threshold (interpolated), against the certified end of the range:')
out_thr = []
for row, need, cap, capr in (('0.80', 0.37, 0.35, 0.11), ('0.82', 0.64, 0.6, 0.13), ('0.84', 1.33, 1.3, 0.2), ('0.845', 1.88, 1.8, 0.25), ('0.85', 2.5, 2.4, 1 / 3), ('0.855', 3.7, 3.6, 0.6)):
    r_need = brentq(lambda x: f(x) - need, 0.02, 1.5); r_cap = brentq(lambda x: f(x) - cap, 0.02, 1.5)
    c2 = lambda x: 2 * x * x / (1 + 2 * x * x)
    out_thr.append(dict(row=row, need=need, rho_need=r_need, cap=cap, rho_cap=r_cap, rho_cert=capr))
    print('  row %-5s: needed %.2f -> rho <= %.4f (c = %.3f, chi = %.3f);  package target %.2f -> rho <= %.4f;  certified rho <= %.4f (c = %.3f, chi = %.3f)' % (
        row, need, r_need, math.sqrt(c2(r_need)), 42 * c2(r_need) ** 2, cap, r_cap, capr, math.sqrt(c2(capr)), 42 * c2(capr) ** 2))
json.dump(dict(scan=res, junta=junta, thresholds=out_thr), open(sys.argv[3], 'w'), indent=1)
