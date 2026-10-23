"""Exact rational polynomial model for the shared-response penalty lift.

All numerical optimization is elsewhere. This module constructs the three
charge-sector multiplication compressions and checks finite rational completions.
See docs/RESPONSE_LIFT_EXPERIMENT_2026-10-23.md for extraction and scope.
"""
from fractions import Fraction as Q
from math import comb, factorial

RHO = Q(973612157, 1000000000)


def poly(n, alpha=0):
    return [Q((-1)**(n+k)*comb(n+alpha, n-k), factorial(k)) for k in range(n+1)]


def mul(a, b):
    c = [Q(0)]*(len(a)+len(b)-1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i+j] += x*y
    return c


def add(a, b):
    return [(a[i] if i < len(a) else Q(0))+(b[i] if i < len(b) else Q(0))
            for i in range(max(len(a), len(b)))]


def expand(p, alpha=0):
    """Triangular coefficient extraction in (-1)^k L_k^alpha."""
    p = list(map(Q, p))
    c = [Q(0)]*len(p)
    for k in reversed(range(len(p))):
        c[k] = p[k]*factorial(k)
        basis = poly(k, alpha)
        for j in range(k+1):
            p[j] -= c[k]*basis[j]
    if any(p):
        raise ArithmeticError('Polynomial expansion failed')
    return c


def dot(coefficients, values):
    if len(coefficients) > len(values):
        raise ValueError('An omitted coefficient was not supplied')
    return sum((c*values[j] for j, c in enumerate(coefficients)), 0)


def lengths(order):
    # Charge-2 output against Z reaches m_(order+1); its remote column
    # reaches b_(2*order+2). Every coefficient through these indices stays free.
    return {'m': max(2*order, order+1)+1, 'b': 2*order+3, 'n': 2*order+1}


def banks(v, order):
    """Returns (name, output Gram diagonal, input Gram diagonal, cross matrix).

    Sector 0: U_i ; [barZ V_j^1, barq U_j, q barZ² V_j²/sqrt2].
    Sector 1: Z V_i^1 ; [U_j, sqrt2 q barZ V_j^1, barq Z V_j^1].
    Sector 2: Z² V_i² ; [Z, sqrt2 q U_j, Z² barq V_j²].
    Here U_j=V_j^0 and V_j^a=(-1)^j L_j^a.
    Raw feature Gram diagonals avoid irrational coefficients in the checker.
    """
    d = order+1
    c2 = [Q(comb(i+2, 2)) for i in range(d)]
    blocks = []
    for charge in range(3):
        rows = []
        for i in range(d):
            if charge == 0:
                row = [dot(expand(mul(poly(i), poly(j, 1)), 1), v['m']) for j in range(d)]
                row += [dot(expand(mul(poly(i), poly(j))), v['b']) for j in range(d)]
                row += [dot(expand(mul(poly(i), poly(j, 2)), 2), v['n']) for j in range(d)]
            elif charge == 1:
                row = [dot(expand(mul(poly(i, 1), poly(j)), 1), v['m']) for j in range(d)]
                row += [2*dot(expand(mul(poly(i, 1), poly(j, 1)), 2), v['n']) for j in range(d)]
                row += [dot(expand(mul([0, 1], mul(poly(i, 1), poly(j, 1)))), v['b']) for j in range(d)]
            else:
                row = [(i+2)*v['m'][i]+(i+1)*v['m'][i+1]]
                row += [2*dot(expand(mul(poly(i, 2), poly(j)), 2), v['n']) for j in range(d)]
                row += [dot(expand(mul([0, 0, 1], mul(poly(i, 2), poly(j, 2)))), v['b']) for j in range(d)]
            rows.append(row)
        if charge == 0:
            gout = [Q(1)]*d
            gin = [Q(j+1) for j in range(d)]+[Q(1)]*d+c2
        elif charge == 1:
            gout = [Q(i+1) for i in range(d)]
            gin = [Q(1)]*d+[Q(2*(j+1)) for j in range(d)]+[Q(j+1) for j in range(d)]
        else:
            gout = [2*x for x in c2]
            gin = [Q(1)]+[Q(2)]*d+[2*x for x in c2]
        blocks.append((str(charge), gout, gin, rows))
    return blocks


def energy(v):
    return (sum((x*x/Q(j+1) for j, x in enumerate(v['m'])), 0)
            +sum((x*x for x in v['b']), 0)
            +sum((x*x/Q(comb(j+2, 2)) for j, x in enumerate(v['n'])), 0))


def response(h, k, sign):
    return {name: [a+sign*b for a, b in zip(h[name], k[name])] for name in ['m', 'b', 'n']}


def psd_pivots(a):
    """Exact rational Schur pivots. A zero pivot requires a zero remaining row."""
    a = [list(map(Q, row)) for row in a]
    size = len(a)
    if any(len(row) != size for row in a) or any(a[i][j] != a[j][i]
            for i in range(size) for j in range(size)):
        raise ValueError('A symmetric square matrix is required')
    pivots = []
    for k in range(size):
        p = a[k][k]
        if p < 0 or (p == 0 and any(a[k][j] for j in range(k+1, size))):
            raise ValueError(f'PSD check failed at pivot {k}')
        pivots.append(p)
        if p:
            for i in range(k+1, size):
                for j in range(i, size):
                    a[i][j] = a[j][i] = a[i][j]-a[i][k]*a[k][j]/p
    return pivots


def verify_banks(v, order):
    summaries = []
    for name, gout, gin, cross in banks(v, order):
        # Schur complement of the positive input Gram diagonal, with only
        # order+1 rows: exact arithmetic remains inexpensive.
        schur = [[(gout[i] if i == j else Q(0))-sum(
                    (cross[i][l]*cross[j][l]/gin[l] for l in range(len(gin))), Q(0))
                  for j in range(len(gout))] for i in range(len(gout))]
        pivots = psd_pivots(schur)
        summaries.append({'charge': name, 'rows': len(gout), 'columns': len(gin),
                          'min_schur_pivot': str(min(pivots))})
        # Conditional projection onto span(q,barq) has pointwise Euclidean
        # norm <= E|q| <= RHO (circularity). Remove the purely visible
        # input bank and enforce its stronger two-channel multiplication cap.
        start = order+1 if name in ['0', '1'] else 1
        remote = [[RHO*RHO*(gout[i] if i == j else Q(0))-sum(
                    (cross[i][l]*cross[j][l]/gin[l] for l in range(start, len(gin))), Q(0))
                   for j in range(len(gout))] for i in range(len(gout))]
        rp = psd_pivots(remote)
        summaries.append({'charge': name+'-conditional', 'rows': len(gout),
                          'columns': len(gin)-start, 'radius': str(RHO),
                          'min_schur_pivot': str(min(rp))})
    return summaries


def targets(record):
    return {'index': record['index'], 't': record['envelope_argmax']['t'],
            'tau': record['envelope_argmax']['tau'], 'epsilon': '149/200',
            'beta': record['row_parameters']['beta'],
            'gate_alpha': record['retained_squares']['gate_minimizer_Y_over_p'],
            'gate_C': record['retained_squares']['C']}


def penalty(h, k, target):
    eps = Q(target['epsilon'])
    z = h['m'][1]+2*Q(target['beta'])/eps
    tau = Q(target['tau'])
    r = k['b'][1]-Q(target['gate_alpha'][0])*tau
    s = k['n'][0]-Q(target['gate_alpha'][1])*tau
    a, b, c = map(Q, target['gate_C'])
    return eps*z*z/2+eps*h['b'][0]**2+a*r*r+2*b*r*s+c*s*s


def check_completion(record):
    order = record['order']
    sizes = lengths(order)
    h = {a: list(map(Q, record['h'][a])) for a in sizes}
    k = {a: list(map(Q, record['k'][a])) for a in sizes}
    if any(len(h[a]) != sizes[a] or len(k[a]) != sizes[a] for a in sizes):
        raise ValueError('Missing free completion coefficients')
    target = record['target']
    if h['m'][0] != Q(target['t']) or k['b'][0] != Q(target['tau']):
        raise ValueError('Projection matching failed')
    a, b, c = map(Q, target['gate_C'])
    if not (a > 0 and c > 0 and a*c-b*b > 0 and Q(target['epsilon']) > 0):
        raise ValueError('Penalty matrix is not positive definite')
    cost = penalty(h, k, target)
    if cost != 0:
        raise ValueError('The claimed zero-penalty completion has nonzero cost')
    results = []
    for sign in [1, -1]:
        v = response(h, k, sign)
        e = energy(v)
        if e > 1:
            raise ValueError('The total displayed coefficient energy exceeds one')
        results.append({'response': 'f' if sign == 1 else 'g', 'energy': str(e),
                        'energy_float': float(e), 'banks': verify_banks(v, order)})
    return {'index': target['index'], 'order': order, 'penalty': '0',
            'conclusion': 'The finite convex penalty lift has exact minimum zero.',
            'responses': results}


def controls():
    """Exact actual-response controls, including the z² conjugate-q sector."""
    checked = 0
    for order in [0, 1, 2]:
        sz = lengths(order)
        cases = []
        # q(W)=W(|W|²-2)/sqrt2. All amplitudes below are <=1 pointwise.
        for name in ['visible', 'remote', 'conjugate', 'mixed']:
            v = {a: [Q(0)]*n for a, n in sz.items()}
            if name in ['visible', 'mixed']:
                v['m'] = [Q((-1)**j*(j+1), 2**(j+2)) for j in range(sz['m'])]
            if name in ['remote', 'mixed']:
                v['b'] = [Q((-1)**(j+1), 2**(j+3)) for j in range(sz['b'])]
            if name in ['conjugate', 'mixed']:
                v['n'] = [Q((-1)**(j+1)*comb(j+2, 2), 2**(j+5)) for j in range(sz['n'])]
            if name == 'mixed':
                v = {a: [x/3 for x in xs] for a, xs in v.items()}
            if energy(v) > 1:
                raise AssertionError('Actual-response energy control failed')
            verify_banks(v, order)
            cases.append(name)
            checked += 3
        # Polynomial expansion check, independent exact reconstruction.
        for alpha in range(3):
            for i in range(order+2):
                for j in range(order+2):
                    p = mul(poly(i, alpha), poly(j))
                    r = [Q(0)]
                    for k, c in enumerate(expand(p, alpha)):
                        r = add(r, [c*x for x in poly(k, alpha)])
                    if p != r:
                        raise AssertionError('Polynomial product control failed')
                    checked += 1
    return {'status': 'PASS', 'exact_checks': checked,
            'actual_response_controls': ['Z exp(-R)', 'sqrt2 W exp(-R-S)',
                                         'Z² barW exp(-R-S)', 'one-third of their sum'],
            'orders': [0, 1, 2]}
