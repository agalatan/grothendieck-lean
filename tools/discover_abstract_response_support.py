#!/usr/bin/env python3
"""Numerical discovery for the fixed-law five-moment response body.

The `step` mode optimizes actual cell-constant responses, with analytically
integrated feature vectors. The `laguerre` mode approximates the full support
function. Neither numerical mode is a certificate; use the separate Arb
verifiers for the saved 5661 separator and 7234 explicit response.
Requires NumPy and SciPy; no optimizer is needed for certificate replay.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys
import time

import numpy as np
from scipy.optimize import minimize
from scipy.special import gamma, gammainc, gammaincc, roots_laguerre

sys.path.insert(0, str(Path(__file__).resolve().parent))
from response_lift_model import targets


def moment_cells(edges, k):
    a, b, p = edges[:-1], edges[1:], k+1
    return gamma(p)*np.where(a < p, gammainc(p, b)-gammainc(p, a),
                             gammaincc(p, a)-gammaincc(p, b))


def features(v, w, nr, nt, mode, stop):
    theta = 2*np.pi*(np.arange(nt)+.5)/nt
    ph = np.exp(1j*theta)
    if mode == 'step':
        edges = np.linspace(0, stop, nr+1)**2
        mass = moment_cells(edges, 0)
        radial = [moment_cells(edges, .5)/mass,
                  (moment_cells(edges, 1.5)-2*moment_cells(edges, .5))/mass,
                  (moment_cells(edges, 1)-mass)/mass,
                  moment_cells(edges, 1)/(np.sqrt(2)*mass)]
        ph = ph*np.sinc(1/nt)
    else:
        r, mass = roots_laguerre(nr)
        if np.any(mass < 0) or not np.all(np.isfinite(mass)):
            raise ValueError('Invalid Laguerre weights; reduce radial order')
        # Zero weights at extreme nodes may underflow in this floating
        # discovery rule. No tail or quadrature accuracy is certified here.
        radial = [np.sqrt(r), np.sqrt(r)*(r-2), r-1, r/np.sqrt(2)]
    shape = (len(v), nr, nt)
    p = np.empty((5,)+shape, dtype=complex)
    p[0], p[1] = radial[0][None, :, None], radial[1][None, :, None]
    p[2] = v[:, None, None]*ph[None, None, :]
    p[3] = v[:, None, None]*radial[2][None, :, None]*ph[None, None, :]
    p[4] = v[:, None, None]*radial[3][None, :, None]*ph.conj()[None, None, :]
    weights = np.broadcast_to(w[:, None, None]*mass[None, :, None]/nt, shape).ravel()
    return p.reshape(5, -1), weights


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--audit', type=Path, required=True)
    p.add_argument('--law', type=Path, required=True)
    p.add_argument('--output', type=Path, required=True)
    p.add_argument('--mode', choices=['step', 'laguerre'], default='step')
    p.add_argument('--radial-cells', type=int, default=64)
    p.add_argument('--phase-cells', type=int, default=128)
    p.add_argument('--sqrt-radial-stop', type=float, default=6)
    args = p.parse_args()
    law = json.loads(args.law.read_text())
    target = targets(next(r for r in json.loads(args.audit.read_text())['selected']
                          if r['index'] == law['index']))
    tau, t, beta, eps = [float(Q(target[a])) for a in ['tau', 't', 'beta', 'epsilon']]
    alpha = [float(Q(a)) for a in target['gate_alpha']]
    c = np.array([t, -2*beta/eps, tau, alpha[0]*tau, alpha[1]*tau])
    v = np.array([float(Q(a['v'])) for a in law['support']])
    w = np.array([float(Q(a['weight'])) for a in law['support']])
    f, weights = features(v, w, args.radial_cells, args.phase_cells, args.mode,
                          args.sqrt_radial_stop)
    base, psi = f[0]/c[0], f[1:]-c[1:, None]*f[0:1]/c[0]
    def objective(x):
        z = base+x@psi
        mag = np.abs(z)
        return float(weights@mag), np.real((psi*(weights*np.conj(z)/np.maximum(
            mag, 1e-100))[None, :]).sum(axis=1))
    start = time.monotonic()
    result = minimize(objective, np.zeros(4), jac=True, method='BFGS',
                      options={'gtol': 1e-10, 'maxiter': 300})
    y = np.r_[(1-c[1:]@result.x)/c[0], result.x]
    out = {'index': law['index'], 'mode': args.mode,
           'scope': 'Floating discovery only; fixed abstract law, not Gaussian cubic.',
           'radial_cells': args.radial_cells, 'phase_cells': args.phase_cells,
           'sqrt_radial_stop': args.sqrt_radial_stop, 'target': target,
           'audit_sha256': hashlib.sha256(args.audit.read_bytes()).hexdigest(),
           'law_sha256': hashlib.sha256(args.law.read_bytes()).hexdigest(),
           'support_ratio': float(result.fun), 'phase_coefficients': y.tolist(),
           'gradient': result.jac.tolist(), 'optimizer_success': bool(result.success),
           'seconds': time.monotonic()-start}
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(out, indent=2)+'\n')
    print(json.dumps(out, indent=2))


if __name__ == '__main__':
    main()
