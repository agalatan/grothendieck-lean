#!/usr/bin/env python3
"""Exact normalization controls for the joint selected-projection dual.

Reads original saved inputs, never mutates them. No optimizer is used.
"""
import argparse
import hashlib
import json
from fractions import Fraction as Q
from math import factorial
from pathlib import Path


def require(condition, message):
    if not condition:
        raise ArithmeticError(message)


def cadd(x, y):
    return (x[0]+y[0], x[1]+y[1])


def cscale(x, a):
    return (a*x[0], a*x[1])


def cdot(x, y):
    return x[0]*y[0]+x[1]*y[1]


def cform(matrix, vector):
    return sum(matrix[i][j]*cdot(vector[i], vector[j])
               for i in range(len(vector)) for j in range(len(vector)))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--inputs', type=Path, required=True)
    parser.add_argument('--indices', type=int, nargs='+', default=[7234, 5661, 1247, 8701])
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    selected = {r['index']: r for r in json.loads(
        (args.inputs / 'binding-audit.json').read_text())['selected']}
    eps = Q(149, 200)
    count = 0
    paths = [args.inputs / 'binding-audit.json']
    paths += [args.inputs / f'radial-complete-{idx}-exact.json' for idx in args.indices]
    metadata = {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}
    for idx in args.indices:
        model = json.loads((args.inputs / f'radial-complete-{idx}-exact.json').read_text())
        row = selected[idx]
        e = [sum(Q(r['weight'])*Q(r['row']['E'][j]) for r in model['rows'])
             for j in range(6)]
        forcing = [sum(Q(r['weight'])*Q(r['row']['delta'])*(
            Q(r['row']['b'][j])+(j == 0)) for r in model['rows']) for j in range(3)]
        cmat = list(map(Q, row['retained_squares']['C']))
        alpha = list(map(Q, row['retained_squares']['gate_minimizer_Y_over_p']))
        require(cmat == [e[3], e[4], e[5]], f'{idx}: gate C mismatch')
        det = cmat[0]*cmat[2]-cmat[1]*cmat[1]
        require(cmat[0] > 0 and det > 0, f'{idx}: gate C not positive definite')
        inv = [[cmat[2]/det, -cmat[1]/det], [-cmat[1]/det, cmat[0]/det]]

        def quadratic(v):
            return sum(v[i]*inv[i][j]*v[j] for i in range(2) for j in range(2))

        h = [e[1]+forcing[1], e[2]+forcing[2]]
        require(alpha == [-sum(inv[i][j]*h[j] for j in range(2)) for i in range(2)],
                f'{idx}: gate alpha mismatch')
        price = e[0]-eps+2*forcing[0]-quadratic(h)
        require(price == Q(row['row_parameters']['price']), f'{idx}: gate price mismatch')
        t, tau = map(Q, [model['point']['t'], model['point']['tau']])
        ell, beta = map(Q, [row['row_parameters']['ell'], row['row_parameters']['beta']])
        count += 4
        for k in range(8):
            u, v, a, c, d = [Q(k*j-9, 17+j) for j in range(1, 6)]
            shifted = [tau*forcing[0]-v/2, tau*forcing[1]-c/2, tau*forcing[2]-d/2]
            ellp, betap = ell-u/2, beta-a/2
            original = (t*t-2*ell*t+2*beta*beta/eps-price*tau*tau
                        +u*t+v*tau-2*beta*a/eps+tau*(alpha[0]*c+alpha[1]*d)
                        +a*a/(2*eps)+quadratic([c, d])/4)
            simplified = (t*t-2*ellp*t+2*betap*betap/eps+(eps-e[0])*tau*tau
                          -2*tau*shifted[0]
                          +quadratic([shifted[1]+tau*e[1], shifted[2]+tau*e[2]]))
            require(original == simplified, f'{idx}: dual reparameterization {k} failed')
            count += 1
        # Full-complex primal cancellation, in a two-point abstract remote
        # Hilbert model with q=(1,-1), each atom of weight one half. Every
        # operation uses rational real/imaginary pairs. The gate's third
        # coordinate is <q,conj(c2)>=conj(n0), not n0 itself.
        emat = [[e[0], e[1], e[2]], [e[1], e[3], e[4]], [e[2], e[4], e[5]]]
        cfull = [[cmat[0], cmat[1]], [cmat[1], cmat[2]]]
        base = t*t-2*ell*t+2*beta*beta/eps-price*tau*tau
        for trial in range(8):
            r0 = (Q(trial-3, 7), Q(trial+1, 13))
            xi = [[cadd((tau, Q(0)), r0), cadd((-tau, Q(0)), r0)]]
            for j in [1, 2]:
                xi.append([(Q((trial+1)*(j+2), 19+j), Q(trial-2*j, 23+j)),
                           (Q(trial-j, 11+j), Q((trial+3)*(j+1), 29+j))])
            moments = [cscale(cadd(v[0], cscale(v[1], -1)), Q(1, 2)) for v in xi]
            residual = [[cadd(xi[j][0], cscale(moments[j], -1)),
                         cadd(xi[j][1], moments[j])] for j in range(3)]
            m1 = (Q(trial-2, 17), Q(trial+1, 31))
            bh = (Q(trial+3, 41), Q(trial-4, 37))
            odd = Q(trial+1, 43)  # Identical retained odd-block contribution.
            fibre = sum(cform(emat, [xi[j][a] for j in range(3)])
                        for a in range(2))/2
            fibre += 2*ell*t+2*beta*m1[0]
            fibre += 2*tau*sum(forcing[j]*moments[j][0] for j in range(3))+odd
            shifted_m1 = cadd(m1, (2*beta/eps, Q(0)))
            gate_residual = [cadd(moments[j+1], (-alpha[j]*tau, Q(0))) for j in range(2)]
            defect = (eps*cdot(shifted_m1, shifted_m1)/2+eps*cdot(bh, bh)
                      +cform(cfull, gate_residual))
            cancelled = t*t-eps*cdot(m1, m1)/2-eps*cdot(bh, bh)+eps*tau*tau+odd
            cancelled += sum(cform(emat, [residual[j][a] for j in range(3)])
                             for a in range(2))/2
            require(moments[0] == (tau, 0), 'fixed remote scale mismatch')
            require(base+fibre-defect == cancelled,
                    f'{idx}: complex primal cancellation {trial} failed')
            count += 2
        print(f'{idx}: exact gate and dual reparameterization identities PASS')

    # Actual bounded Gaussian control against replacing a projected gate
    # field by its full raw conditional expectation. For S~Exp(1), this is
    # E[S^j exp(-decay S)].
    moment = lambda j, decay: Q(factorial(j), (1+decay)**(j+1))
    cubic_pairing = (moment(2, 1)-2*moment(1, 1)
                     -2*moment(3, 1)+4*moment(2, 1))/3
    g0_norm_squared = (moment(1, 2)-4*moment(2, 2)+4*moment(3, 2))/9
    a_mean = moment(1, 1)-moment(0, 1)
    c1_factor = moment(2, 1)-2*moment(1, 1)+moment(0, 1)
    require(cubic_pairing == 0, 'g0 must be orthogonal to the remote cubic')
    require(g0_norm_squared == Q(1, 81), 'g0 squared norm mismatch')
    require(a_mean == -Q(1, 4), 'a mean mismatch')
    require(c1_factor == Q(1, 4), 'c1 factor mismatch')
    require(c1_factor*c1_factor*g0_norm_squared == Q(1, 1296),
            'zero-tau raw-field gap mismatch')
    count += 5
    print('Actual bounded Gaussian conditional-field control PASS')
    # Positive-tau version: r(W)=W exp(-S), k=(r+a*g0)/2. The coefficient
    # <q,r> is this rational numerator divided by sqrt(2). Thus Pi c0 has
    # squared norm numerator^2/(2*4), with sign absorbed into normalized q.
    r_pairing_numerator = moment(2, 1)-2*moment(1, 1)
    require(r_pairing_numerator == -Q(1, 4), 'r cubic pairing mismatch')
    require(r_pairing_numerator**2/8 == Q(1, 128), 'positive tau squared mismatch')
    require((c1_factor/2)**2*g0_norm_squared == Q(1, 5184),
            'positive-tau raw-field excess mismatch')
    require((Q(1, 2)+Q(5, 6))/2 == Q(2, 3), 'response norm budget mismatch')
    count += 4
    print('Positive-tau Gaussian control PASS: tau^2=1/128, raw excess=C11/5184')
    print(f'PASS: {count} exact rational controls; no numerical optimization')
    if args.output:
        args.output.write_text(json.dumps({'status': 'PASS', 'exact_checks': count,
            'indices': args.indices, 'source_sha256': metadata,
            'positive_tau_squared': '1/128', 'raw_excess_over_C11': '1/5184'},
            indent=2)+'\n')


if __name__ == '__main__':
    main()
