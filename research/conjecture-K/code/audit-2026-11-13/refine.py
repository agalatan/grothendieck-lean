#!/usr/bin/env python3
"""Intrinsic sphere L-BFGS polishing of saved full-tensor candidates.

Agent-ID: codex-a713. Unit real sphere in complex coefficient coordinates.
Normalized retraction, projection vector transport, Armijo line search, and
intrinsic gradient stopping. Original tensors are read only. Nonconverged
refinements resume from their own latest checkpoint and retain honest status.
"""
import os
import sys
sys.dont_write_bytecode = True
for _key in ('VECLIB_MAXIMUM_THREADS', 'OPENBLAS_NUM_THREADS', 'OMP_NUM_THREADS'):
    os.environ[_key] = '1'
from pathlib import Path
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT))
import argparse
import hashlib
import json
import time
import numpy as np
from batch_optimise import BatchObjective, lbfgs_direction
from optimise import Objective, Kernels, indices, gaussian_points, features, threadpool_limits


def tangent(x, v):
    """Orthogonal projection for either vectors or column batches."""
    return v - x * np.sum(x * v, axis=0)


def retract(x, v):
    y = x + v
    return y / np.linalg.norm(y, axis=0)


def evaluate(obj, x):
    # BatchObjective differentiates c=sqrt(u)*x/||x||. At ||x||=1 its
    # returned real gradient is exactly the intrinsic unit-sphere gradient.
    if obj.fast is not None:
        f, g = obj(x)
    else:
        fg = [Objective.__call__(obj, x[:, j]) for j in range(x.shape[1])]
        f = np.array([a[0] for a in fg])
        g = np.column_stack([a[1] for a in fg])
    return f, tangent(x, g)


def transport_history(history, xnew):
    result = []
    for s, y, _rho in history:
        snew = tangent(xnew, s)
        ynew = tangent(xnew, y)
        sy = float(np.dot(snew, ynew))
        if sy > 1e-12 * np.linalg.norm(snew) * np.linalg.norm(ynew):
            result.append((snew, ynew, 1.0 / sy))
    return result


def optimize_batch(obj, X, args, deadline):
    X = X / np.linalg.norm(X, axis=0)
    f, g = evaluate(obj, X)
    size = X.shape[1]
    history = [[] for _ in range(size)]
    iterations = np.zeros(size, int)
    evaluations = np.ones(size, int)
    active = np.linalg.norm(g, axis=0) > args.gtol
    messages = ['iteration_limit' if active[j] else 'intrinsic_gradient_tolerance'
                for j in range(size)]
    began = time.monotonic()
    for iteration in range(args.maxiter):
        if time.monotonic() >= deadline:
            for j in np.flatnonzero(active):
                messages[j] = 'run_time_limit'
            break
        ids = np.flatnonzero(active)
        if not len(ids):
            break
        P = np.column_stack([tangent(X[:, j], lbfgs_direction(g[:, j], history[j]))
                             for j in ids])
        gd = np.sum(g[:, ids] * P, axis=0)
        for loc in np.flatnonzero(gd >= 0):
            j = ids[loc]
            P[:, loc] = -g[:, j]
            gd[loc] = -np.dot(g[:, j], g[:, j])
            history[j] = []
        alpha = np.ones(len(ids))
        remaining = np.arange(len(ids))
        for _line in range(args.maxls):
            if not len(remaining):
                break
            jj = ids[remaining]
            step = P[:, remaining] * alpha[remaining]
            proposed = retract(X[:, jj], step)
            fn, gn = evaluate(obj, proposed)
            evaluations[jj] += 1
            accepted = np.isfinite(fn) & (fn <= f[jj] + 1e-4 * alpha[remaining] * gd[remaining])
            for local in np.flatnonzero(accepted):
                j = int(jj[local])
                xnew = proposed[:, local]
                gnew = gn[:, local]
                # Every history pair now lives in T_(xnew) S. The newest
                # secant uses projection transport of the accepted tangent
                # step and old gradient, not an unconstrained Euclidean step.
                history[j] = transport_history(history[j], xnew)
                s = tangent(xnew, step[:, local])
                y = gnew - tangent(xnew, g[:, j])
                sy = float(np.dot(s, y))
                if sy > 1e-12 * np.linalg.norm(s) * np.linalg.norm(y):
                    history[j].append((s.copy(), y.copy(), 1.0 / sy))
                    history[j] = history[j][-args.memory:]
                X[:, j] = xnew
                f[j] = fn[local]
                g[:, j] = gnew
                iterations[j] += 1
                if np.linalg.norm(gnew) <= args.gtol:
                    active[j] = False
                    messages[j] = 'intrinsic_gradient_tolerance'
            remaining = remaining[~accepted]
            alpha[remaining] *= 0.5
        for loc in remaining:
            j = int(ids[loc])
            active[j] = False
            messages[j] = 'line_search_failed'
        if (iteration + 1) % 25 == 0:
            print(json.dumps(dict(event='refine_iteration', iteration=iteration+1,
                active=int(active.sum()), best_train=float(-min(f)),
                max_intrinsic_gradient=float(np.max(np.linalg.norm(g, axis=0))),
                seconds=time.monotonic()-began)), flush=True)
    return X, f, g, iterations, evaluations, messages


def run(args):
    threadpool_limits(limits=1)
    started = time.monotonic()
    deadline = started + args.seconds
    tag = f'{args.row}_n{args.n}_u{args.u:g}'
    log = ROOT / f'optim_refined_{tag}.jsonl'
    previous = {}
    if log.exists():
        for line in log.read_text().splitlines():
            record = json.loads(line)
            if record['power'] != args.power or record['seed'] != args.seed + args.n:
                raise ValueError('Refinement resume configuration differs')
            previous[record['restart']] = record
    ids = indices(args.n)
    pending = []
    for r in range(args.restarts):
        original = ROOT / f'tensor_{tag}_r{r:02d}.npz'
        if not original.exists():
            raise FileNotFoundError(f'Missing original restart {r}: {original}')
        with np.load(original) as source:
            c = np.asarray(source['coefficients'], dtype=np.complex128)
            if int(source['n']) != args.n or float(source['u']) != args.u or str(source['row']) != args.row:
                raise ValueError('Original tensor metadata differs from requested cell')
        if c.shape != (len(ids),):
            raise ValueError('Unexpected coefficient dimension')
        digest = hashlib.sha256(c.tobytes()).hexdigest()
        old = previous.get(r)
        if old is not None:
            if old['source_digest'] != digest:
                raise ValueError('Original coefficients changed since refinement')
            if old['converged'] and old['intrinsic_gradient_norm'] <= args.gtol:
                continue
            with np.load(old['tensor']) as checkpoint:
                c = np.asarray(checkpoint['coefficients'], dtype=np.complex128)
        c = c / np.linalg.norm(c)
        pending.append((r, c, original, digest, old))
    print(json.dumps(dict(event='refine_start', tag=tag, pending=len(pending),
        method='Riemannian_LBFGS_projection_transport', gtol=args.gtol,
        maxiter=args.maxiter, maxls=args.maxls, memory=args.memory,
        power=args.power, seed=args.seed+args.n, batch=args.batch,
        seconds=args.seconds)), flush=True)
    if not pending:
        return
    kernel = Kernels(args.row)
    z = gaussian_points(args.n, args.power, args.seed + args.n)
    basis = features(z)
    obj = BatchObjective(z, basis, args.u, kernel)
    for offset in range(0, len(pending), args.batch):
        if time.monotonic() >= deadline:
            break
        group = pending[offset:offset + args.batch]
        X = np.column_stack([np.r_[c.real, c.imag] for _, c, _, _, _ in group])
        X, f, g, its, evaluations, messages = optimize_batch(obj, X, args, deadline)
        for j, (r, _c, original, digest, old) in enumerate(group):
            m = len(ids)
            c = np.sqrt(args.u) * (X[:m, j] + 1j * X[m:, j])
            R, D, C, _q = obj.physical(c, grad=False)
            # Recompute independently through the physical coefficient gradient
            # so reported stationarity cannot depend on a radial parameter scale.
            _value, gc = obj.physical(c, grad=True)
            intrinsic = np.sqrt(args.u) * (gc - c * np.vdot(c, gc).real / args.u)
            norm = float(np.linalg.norm(intrinsic))
            converged = norm <= args.gtol
            message = 'intrinsic_gradient_tolerance' if converged else messages[j]
            if not converged and message == 'intrinsic_gradient_tolerance':
                message = 'gradient_recheck_above_tolerance'
            path = ROOT / f'tensor_{tag}_r{r:02d}_refined.npz'
            np.savez(path, coefficients=c, indices=np.array(ids), content=C,
                n=args.n, u=args.u, row=args.row, power=args.power, seed=args.seed+args.n,
                source=str(original), source_digest=digest)
            record = dict(restart=r, n=args.n, u=args.u, row=args.row,
                R_train=R, D_train=D, C2_train=float(np.vdot(C, C).real),
                iterations=int(its[j]), cumulative_iterations=int(its[j])+(old or {}).get('cumulative_iterations', 0),
                evaluations=int(evaluations[j]), attempt=1+(old or {}).get('attempt', 0),
                converged=converged, message=message, intrinsic_gradient_norm=norm,
                unit_sphere_tangent_gradient_norm=norm, unit_parameter_norm=float(np.linalg.norm(X[:, j])),
                batch_gradient_norm=float(np.linalg.norm(g[:, j])),
                exact_energy_float=float(np.vdot(c, c).real), power=args.power, seed=args.seed+args.n,
                tensor=str(path), source=str(original), source_digest=digest,
                content_shares_train=(abs(C)**2/np.vdot(C, C).real).tolist(),
                method='Riemannian_LBFGS_projection_transport',
                gtol=args.gtol, maxiter=args.maxiter, maxls=args.maxls, memory=args.memory,
                elapsed_seconds=time.monotonic()-started)
            with log.open('a') as file:
                file.write(json.dumps(record)+'\n')
            print(json.dumps(record), flush=True)
    print(json.dumps(dict(event='refine_end', seconds=time.monotonic()-started)), flush=True)


def check():
    """Small algebra/gradient/sphere checks; no production search."""
    threadpool_limits(limits=1)
    began = time.monotonic()
    rng = np.random.default_rng(2713)
    x = rng.normal(size=12); x /= np.linalg.norm(x)
    v = tangent(x, rng.normal(size=12))
    y = retract(x, 0.3*v)
    assert abs(np.dot(x, v)) < 1e-12 and abs(np.linalg.norm(y)-1) < 1e-12
    transported = tangent(y, v)
    assert abs(np.dot(y, transported)) < 1e-12
    z = gaussian_points(2, 10, 713015)
    obj = BatchObjective(z, features(z), .0463, Kernels('peak'))
    x = np.zeros(12); x[0] = 1.0
    v = tangent(x, rng.normal(size=12)); v /= np.linalg.norm(v)
    f, g = evaluate(obj, x[:, None])
    h = 1e-5
    fp, _ = evaluate(obj, retract(x, h*v)[:, None])
    fm, _ = evaluate(obj, retract(x, -h*v)[:, None])
    fd = float((fp[0]-fm[0])/(2*h)); analytic = float(np.dot(g[:, 0], v))
    assert abs(fd-analytic) < 2e-7, (fd, analytic)
    args = argparse.Namespace(gtol=1e-5, maxiter=2, maxls=20, memory=10)
    X, ff, gg, *_ = optimize_batch(obj, x[:, None], args, time.monotonic()+5)
    assert abs(np.linalg.norm(X[:, 0])-1) < 1e-12
    assert ff[0] <= f[0] + 1e-14
    assert abs(np.dot(X[:, 0], gg[:, 0])) < 1e-10
    print(json.dumps(dict(status='PASS', finite_difference=fd, analytic=analytic,
        sphere_norm=float(np.linalg.norm(X[:, 0])), two_step_decrease=float(f[0]-ff[0]),
        seconds=time.monotonic()-began)), flush=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--n', type=int)
    parser.add_argument('--u', type=float)
    parser.add_argument('--row', default='peak')
    parser.add_argument('--power', type=int, default=20)
    parser.add_argument('--restarts', type=int, default=50)
    parser.add_argument('--batch', type=int, default=10)
    parser.add_argument('--maxiter', type=int, default=200)
    parser.add_argument('--maxls', type=int, default=25)
    parser.add_argument('--memory', type=int, default=10)
    parser.add_argument('--gtol', type=float, default=1e-5)
    parser.add_argument('--seconds', type=int, default=1350)
    parser.add_argument('--seed', type=int, default=713013)
    parser.add_argument('--check', action='store_true')
    arguments = parser.parse_args()
    if arguments.check:
        check()
    elif arguments.n is None or arguments.u is None:
        parser.error('--n and --u are required unless --check is used')
    else:
        run(arguments)
