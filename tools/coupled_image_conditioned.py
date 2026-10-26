#!/usr/bin/env python3
"""Discovery: exact W conditioning, then two radii and one angular quadrature.

The Gaussian grade-3 buffer is integrated analytically. Remaining quadrature
has no directed error enclosure. Substantial runs belong on ssh yo.
See coupled-image-20261023/pair/REMOTE_HARD_FIELD.md for exact formulas.
"""
from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import math
import os
from pathlib import Path
import platform
import sys
import time

import numpy as np
import scipy
from scipy.optimize import minimize
from scipy.special import ive, roots_laguerre


def encode(c):
    return np.r_[c.real, c.imag]


def decode(c):
    return c[:4] + 1j*c[4:]


def scaled_bessel01(x):
    """Floating scaled Bessels, including huge positive tail arguments.

    scipy.special.ive can return NaN on finite arguments above ~1e9.
    At x>=1e7 the displayed asymptotic terms have truncation error well
    below double precision. This is a numerical aid, not an interval bound.
    """
    i0=np.empty_like(x);i1=np.empty_like(x)
    small=x<1e7
    i0[small]=ive(0,x[small]);i1[small]=ive(1,x[small])
    large=~small
    y=1/x[large]
    prefactor=np.sqrt(y/(2*np.pi))
    i0[large]=prefactor*(1+y/8+9*y*y/128+225*y*y*y/3072)
    i1[large]=prefactor*(1-3*y/8-15*y*y/128-315*y*y*y/3072)
    return i0,i1


class Conditioned:
    def __init__(self, args, ell, beta, variance):
        self.eps = 149/200
        self.ell, self.beta, self.variance = ell, beta, variance
        self.kappa = args.kappa
        self.s = math.sqrt(variance)
        self.sigma = self.s*math.sqrt(1-args.kappa**2)
        self.t, self.wt = roots_laguerre(args.outer)
        self.x, self.wx = roots_laguerre(args.remote)
        if not all(np.isfinite(v).all() for v in (self.t,self.wt,self.x,self.wx)):
            raise ArithmeticError('nonfinite Gauss-Laguerre rule')
        theta = 2*np.pi*(np.arange(args.angular)+.5)/args.angular
        self.phase = np.exp(1j*theta)
        self.modes = [np.exp(1j*j*theta) for j in (0, -1, 1, -2)]
        self.sqrtx = np.sqrt(self.x)
        self.Hx = self.sqrtx*(self.x-2)/math.sqrt(2)
        self.weights = np.array([self.eps]*3+[1.])
        self.input_q = self.s/self.eps*np.array([
            args.kappa, 0, 0, math.sqrt(1-args.kappa**2)])

    def evaluate(self, x):
        c = decode(x)
        coefficients = np.zeros(9, dtype=complex)
        mean_abs = 0.
        for tj, wj in zip(self.t, self.wt):
            r = math.sqrt(tj)
            AH = r*(tj-2)/math.sqrt(2)
            AC = r*(self.x-1)
            AB = r*self.x[:, None]*self.phase[None, :]**2/math.sqrt(2)
            mid = (self.ell*r-self.eps*(c[0]*AH+c[1]*AC[:, None]+c[2]*AB))
            remote = (self.s*self.kappa*self.Hx[:, None]-c[3]*self.sqrtx[:, None])*self.phase[None, :]
            m = mid+remote
            z = abs(m)**2/self.sigma**2
            i0, i1 = scaled_bessel01(z/2)
            C = (m/self.sigma)*(math.sqrt(np.pi)/2)*(i0+i1)
            f0, fm1, fp1, fm2 = [(C*mode[None, :]).mean(axis=1) for mode in self.modes]
            projections = [r*f0, AH*f0, AC*f0,
                r*self.x*fm2/math.sqrt(2), self.sqrtx*fm1,
                self.Hx*fm1, self.sqrtx*(tj-1)*fm1,
                tj*self.sqrtx*fp1/math.sqrt(2),
                (math.sqrt(np.pi)/2)*i0.mean(axis=1)]
            coefficients += wj*np.array([self.wx@v for v in projections])
            rice = (self.sigma*math.sqrt(np.pi)/2)*((1+z)*i0+z*i1)
            mean_abs += wj*(self.wx@rice.mean(axis=1))
        if not np.isfinite(coefficients).all() or not np.isfinite(mean_abs):
            raise ArithmeticError('nonfinite conditioned quadrature')
        project = coefficients[1:5]
        phi = float(2*mean_abs+self.weights@(abs(c)**2))
        gradient = encode(2*self.weights*(c-project))
        return phi, gradient, coefficients, float(mean_abs)

    def metrics(self, x):
        phi, gradient, coefficient, mean_abs = self.evaluate(x)
        c = decode(x)
        p = coefficient[0]
        negative_actual = coefficient[1:5]
        q = coefficient[5:]
        payoff = float(abs(p)**2+self.eps*np.sum(abs(q)**2)
                       -self.weights@(abs(negative_actual)**2))
        negative = float(self.weights@(abs(c-negative_actual)**2))
        positive = float(abs(self.ell-p)**2+self.eps*np.sum(abs(self.input_q-q)**2))
        outer = phi-self.ell**2-self.eps*(self.input_q@self.input_q)
        error = float(outer-payoff-negative+positive)
        if abs(error)>2e-10:
            raise ArithmeticError('conditioned coefficient/modulus identity failed')
        return {'dual_value': phi, 'fixed_positive_image_outer_trial': float(outer),
            'phase_pair_payoff': payoff, 'negative_image_gap_upper': negative,
            'positive_image_defect': positive, 'gap_identity_error': error,
            'mean_modulus': mean_abs, 'closure_gradient_norm': float(np.linalg.norm(gradient)),
            'negative_coefficients': {'real': c.real.tolist(), 'imag': c.imag.tolist()},
            'coefficient_labels': ['P_u_Z','Q_u_H21Z','Q_u_Z_absX2minus1',
                'Q_u_X2_barZ','P_v_X','Q_v_H21X','Q_v_X_absZ2minus1','Q_v_Z2_barX','Q_v_W'],
            'projected_coefficients': {'real': coefficient.real.tolist(), 'imag': coefficient.imag.tolist()}}

    def optimize(self, start, visible_only, maxiter):
        slots = np.array([0, 4]) if visible_only else np.arange(8)
        def objective(z):
            x = np.zeros(8)
            x[slots] = z
            value, gradient, _, _ = self.evaluate(x)
            return value, gradient[slots]
        result = minimize(objective, start[slots], jac=True, method='L-BFGS-B',
                          options={'maxiter': maxiter, 'gtol': 2e-10, 'ftol': 2e-14})
        x = np.zeros(8)
        x[slots] = result.x
        return x, {'success': bool(result.success), 'message': str(result.message),
                   'iterations': int(result.nit), 'evaluations': int(result.nfev)}

    def diagonal(self, x):
        before, _, coefficients, _ = self.evaluate(x)
        c = decode(x)
        K = math.sqrt(np.pi)/self.sigma
        D = self.weights+K*self.weights**2
        g = self.weights*(c-coefficients[1:5])
        update = encode(c-g/D)
        predicted = float(np.sum(abs(g)**2/D))
        after = self.evaluate(update)[0]
        return update, {'eta': 0, 'allowance': 0, 'sigma': self.sigma,
            'reciprocal_modulus_bound': K, 'diagonal_upper': D.tolist(),
            'predicted_decrement_numerical_gradient': predicted,
            'actual_decrement_quadrature': before-after,
            'scope': 'Analytic Rice constants, ordinary phase gradient; remaining gradient quadrature is not enclosed.'}


def contact():
    fixture = Path(__file__).with_name('fresh_lower_frozen_response_gram.py')
    expected = '15a863df1e06635370165f3fa922ca019bd036a1652869168e10d7c6d4ba7ef0'
    if hashlib.sha256(fixture.read_bytes()).hexdigest()!=expected:
        raise ArithmeticError('frozen contact fixture hash changed')
    spec = importlib.util.spec_from_file_location('conditioned_contact_fixture', fixture)
    old = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(old)
    return old.contact(149/200), expected


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--outer', type=int, default=64)
    ap.add_argument('--remote', type=int, default=64)
    ap.add_argument('--angular', type=int, default=128)
    ap.add_argument('--kappa', type=float, default=.325)
    ap.add_argument('--binding-defect', type=float)
    ap.add_argument('--ell', type=float)
    ap.add_argument('--beta', type=float)
    ap.add_argument('--variance', type=float)
    ap.add_argument('--optimize', choices=['none','visible','full'], default='full')
    ap.add_argument('--maxiter', type=int, default=60)
    ap.add_argument('--out', type=Path, required=True)
    args = ap.parse_args()
    if args.binding_defect is not None:
        if not math.isfinite(args.binding_defect) or args.binding_defect<0:
            ap.error('binding defect must be finite and nonnegative')
        args.kappa = math.sqrt(args.binding_defect/math.sqrt(42))
    if (min(args.outer,args.remote,args.angular)<8 or max(args.outer,args.remote)>512
            or args.angular>4096 or args.angular%2):
        ap.error('radial orders must be 8..512, angular order even in 8..4096')
    if not math.isfinite(args.kappa) or not 0<=args.kappa<1:
        ap.error('require 0<=kappa<1')
    if args.maxiter<1:
        ap.error('maxiter must be positive')
    (ell,beta,variance), fixture_hash = contact()
    ell = ell if args.ell is None else args.ell
    beta = beta if args.beta is None else args.beta
    variance = variance if args.variance is None else args.variance
    if not all(math.isfinite(v) for v in (ell,beta,variance)) or variance<=0:
        ap.error('ell,beta,variance must be finite; variance must be positive')
    started = time.monotonic()
    model = Conditioned(args,float(ell),float(beta),float(variance))
    initial = encode(np.array([-math.sqrt(2)*beta/model.eps,0,0,0],complex))
    report = {'status': 'DISCOVERY_EXACT_W_CONDITIONING_NO_INTEGRATION_CERTIFICATE',
        'parameters': vars(args)|{'out':str(args.out)},
        'contact': {'ell':float(ell),'beta':float(beta),'variance':float(variance),'epsilon':'149/200'},
        'frozen_fixture_sha256':fixture_hash,
        'source_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        'scaled_bessel_evaluation':'scipy ive below 1e7; four-term large-positive-argument expansion above 1e7 (floating discovery)',
        'runtime':{'host':platform.node(),'pid':os.getpid(),
                   'python':platform.python_version(),'python_executable':sys.executable,
                   'numpy':np.__version__,'scipy':scipy.__version__},
        'radial_fourth_defect_x': math.sqrt(42)*args.kappa**2,
        'initial':model.metrics(initial)}
    visible = initial
    if args.optimize!='none':
        visible, status = model.optimize(initial,True,args.maxiter)
        report['visible_optimizer'], report['visible_only'] = status, model.metrics(visible)
    update, diagonal = model.diagonal(visible)
    report['analytic_diagonal_step'], report['diagonal_updated'] = diagonal, model.metrics(update)
    if args.optimize=='full':
        full, status = model.optimize(visible,False,args.maxiter)
        report['full_optimizer'], report['full_negative'] = status, model.metrics(full)
        report['full_negative_correction'] = model.evaluate(visible)[0]-model.evaluate(full)[0]
    report['runtime']['seconds'] = time.monotonic()-started
    report['warning'] = 'W is integrated exactly. Remaining deterministic quadrature has no error enclosure; numerical dual trials need their closure bracket. W is a graded Gaussian model, not a proved finite cubic substitute.'
    args.out.parent.mkdir(parents=True,exist_ok=True)
    serialized=json.dumps(report,indent=2,allow_nan=False)
    args.out.write_text(serialized+'\n')
    print(serialized)


if __name__=='__main__':
    main()
