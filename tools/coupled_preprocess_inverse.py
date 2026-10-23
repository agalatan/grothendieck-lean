#!/usr/bin/env python3
"""Exact inverse-prefix obstruction including nonlinear scalar preprocessing.

H_b(t)=(pi/4)(1-b)t 2F1(1/2,1/2;2;t^2)/(1-bt^2), 0<=b<1.
More generally independent nonlinear scalar channel preprocessors cannot
improve the phase-only optimum for separable Hermitian quadratic modulation.
The proof uses exactification followed by removal of reciprocal affine
factors. Neutral Gaussian phase factors follow by Wiener-norm approximation.

See PREPROCESSING_INVERSE_OBSTRUCTION.md for the residual-to-inverse lemma.
No arbitrary coupled response, independently preprocessed mixture, or global
Grothendieck endpoint is claimed. Requires python-flint; no numerical search.
"""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path
import sys


def require(condition, message):
    if not condition:
        raise ArithmeticError(message)


def trim(p):
    p = list(p)
    while len(p) > 1 and not p[-1]:
        p.pop()
    return p


def add(a, b):
    c = [Q(0)] * max(len(a), len(b))
    for i, v in enumerate(a):
        c[i] += v
    for i, v in enumerate(b):
        c[i] += v
    return trim(c)


def mul(a, b):
    c = [Q(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i+j] += x*y
    return trim(c)


def scale(a, q):
    return trim([x*q for x in a])


def series_mul(a, b, degree=7):
    out = {}
    for i, x in a.items():
        for j, y in b.items():
            if i+j <= degree:
                out[i+j] = add(out.get(i+j, [Q(0)]), mul(x, y))
    return out


def series_pow(a, n):
    p = {0: [Q(1)]}
    for _ in range(n):
        p = series_mul(p, a)
    return p


def exact_identities():
    # Coefficients of t, t^3, t^5, t^7 in the normalized H_b.
    outer = [[Q(1)], [Q(1,8), Q(1)],
             [Q(3,64), Q(1,8), Q(1)],
             [Q(25,1024), Q(3,64), Q(1,8), Q(1)]]
    inv = [[Q(1)], [Q(-1,8), Q(-1)],
           [Q(0), Q(5,8), Q(2)],
           [Q(-1,1024), Q(-7,64), Q(-21,8), Q(-5)]]
    g = {2*k+1: p for k, p in enumerate(inv)}
    composed = {}
    for k, p in enumerate(outer):
        for degree, q in series_pow(g, 2*k+1).items():
            composed[degree] = add(composed.get(degree, [Q(0)]), mul(p,q))
    require(composed.get(1) == [Q(1)], 'Inverse linear identity failed')
    for degree in range(2,8):
        require(composed.get(degree, [Q(0)]) == [Q(0)],
                'Inverse coefficient identity failed at degree '+str(degree))
    # The retained absolute coefficients d1, -d3, -d7 have nonnegative
    # b-polynomial coefficients, so their scaled sum is >= its b=0 value.
    require(all(x >= 0 for p in [inv[0], scale(inv[1],-1), scale(inv[3],-1)] for x in p),
            'Uniform-in-b monotonicity failed')
    # Independent multivariate check of the broader normalized phi*K formula.
    def m_add(a,b):
        c=dict(a)
        for degree,v in b.items():
            c[degree]=c.get(degree,Q(0))+v
        return {degree:v for degree,v in c.items() if v}
    def m_mul(a,b):
        c={}
        for i,x in a.items():
            for j,y in b.items():
                ij=tuple(v+w for v,w in zip(i,j))
                c[ij]=c.get(ij,Q(0))+x*y
        return {degree:v for degree,v in c.items() if v}
    def m_scale(a,q):
        return {degree:v*q for degree,v in a.items() if v*q}
    A={(0,0,0):Q(1,8),(1,0,0):Q(1)}
    B={(0,0,0):Q(3,64),(1,0,0):Q(1,8),(0,1,0):Q(1)}
    C={(0,0,0):Q(25,1024),(1,0,0):Q(3,64),(0,1,0):Q(1,8),(0,0,1):Q(1)}
    computed=m_add(m_add(m_scale(m_mul(m_mul(A,A),A),Q(-12)),
                         m_scale(m_mul(A,B),Q(8))),m_scale(C,Q(-1)))
    expected={(0,0,0):Q(-1,1024),(1,0,0):Q(-7,64),
              (2,0,0):Q(-7,2),(0,1,0):Q(7,8),
              (3,0,0):Q(-12),(1,1,0):Q(8),(0,0,1):Q(-1)}
    require(computed==expected,'General phi*K inverse degree-seven identity failed')
    remainder={(1,0,0):Q(7,64),(2,0,0):Q(21,8),
               (3,0,0):Q(4),(0,0,1):Q(1)}
    difference={(2,0,0):Q(1),(0,1,0):Q(-1)}
    positive_factor={(0,0,0):Q(7,8),(1,0,0):Q(8)}
    decomposition=m_add(remainder,m_mul(positive_factor,difference))
    negative_without_constant=m_add(m_scale(expected,Q(-1)),{(0,0,0):Q(-1,1024)})
    require(decomposition==negative_without_constant,
            'Positive polynomial decomposition failed')
    return {'normalized_inverse_coefficients_in_ascending_b_powers':
            [[str(x) for x in p] for p in inv],
            'symbolic_composition_identity_through_degree':7,
            'retained_absolute_inverse_degrees':[1,3,7],
            'uniform_b_inequality':'For x=4c/pi and y=x/(1-b), inverse Wiener cost >= y+(b+1/8)y^3+(5b^3+21b^2/8+7b/64+1/1024)y^7 >= x+x^3/8+x^7/1024.',
            'general_normalized_K_coefficients':'K/kappa=1+r1*t^2+r2*t^4+r3*t^6+...; r1,r2,r3>=0 and r2<=r1^2 suffice.',
            'general_inverse_degree_seven':'d7=-1/1024-7*r1/64-7*r1^2/2+7*r2/8-12*r1^3+8*r1*r2-r3 <= -1/1024.',
            'exact_positive_decomposition':'-d7-1/1024=7*r1/64+21*r1^2/8+4*r1^3+r3+(7/8+8*r1)*(r1^2-r2).',
            'general_degree_seven_negative_polynomial':
                [[list(degree),str(value)] for degree,value in sorted(expected.items())]}


def certificate(bits=160):
    if type(bits) is not int or bits < 96:
        raise ValueError('bits must be an integer >=96')
    import flint
    from flint import arb, ctx
    ctx.prec = bits
    def A(q):
        q=Q(q)
        return arb(q.numerator)/q.denominator
    def prefix(c):
        x=4*A(c)/arb.pi()
        return x+x**3/8+x**7/1024
    lower='711900642945/1000000000000'
    upper='711900642946/1000000000000'
    require(prefix(lower)<1, 'Root lower bracket failed')
    require(prefix(upper)>1, 'Root upper bracket failed')
    incumbent_lower='711947/1000000'
    value=prefix(incumbent_lower)
    require(value>1, 'Incumbent obstruction failed')
    # A separate two-sided neutral chirp family has a strict local minimum
    # of this inverse-prefix cost at pure phase. See the proof note.
    x=4*A(incumbent_lower)/arb.pi()
    L=x+3*x**3/8+7*x**7/1024
    M=x**3+7*x**7/64
    N=5*x**5/8
    require(M>N and L-M+N>0, 'Local two-sided chirp quadratic gap failed')
    result=exact_identities()
    result.update({'status':'RIGOROUS_RESTRICTED_CLASS_OBSTRUCTION_NOT_A_GLOBAL_ENDPOINT',
        'python_flint_version':flint.__version__, 'precision_bits':bits,
        'score_ceiling_root_lower_rational':lower,
        'score_ceiling_root_upper_rational':upper,
        'prefix_at_lower_root_bracket':str(prefix(lower)),
        'prefix_at_upper_root_bracket':str(prefix(upper)),
        'incumbent_lower_score_rational':incumbent_lower,
        'inverse_prefix_at_incumbent_lower':str(value),
        'inverse_prefix_excess_at_incumbent_lower':str(value-1),
        'local_asymmetric_chirp_prefix_expansion':{
            'x':str(x),'L':str(L),'M':str(M),'N':str(N),
            'uniform_quadratic_lower_coefficient_on_a_squared_plus_d_squared':str((L-M+N)/2),
            'quadratic_coefficient_on_delta_squared':str(L/2),
            'meaning':'P7(a,d,delta)=P7(0)+L*(a^2+d^2+delta^2)/2+M*a*d+N*abs(a*d)+o(a^2+d^2+delta^2). This is a local obstruction only.'},
        'scope':'C=phi(p)*product_j[1+A_j*(1-q_j^2)]^(-1)*product_l exp[-s_l*(1-R_l)], A_j,s_l>=0, p and q_j arbitrary real odd scalar Wiener contractions, R_l any physically supplied even neutral correlation with R_l(0)=0 and Wiener norm <=1. Independent nonlinear scalar channel preprocessors are included. Each Hermitian quadratic auxiliary block is diagonalized before applying its scalar preprocessor.',
        'stronger_structural_theorem':'The optimal full residual score for this separable modulation class equals the phase-only scalar preprocessing optimum: exactify the residual kernel with a common real odd Wiener contraction, remove one reciprocal affine factor without decreasing the score, and repeat. Neutral Gaussian exponential factors are Wiener limits of such products.',
        'secondary_common_preprocessor_scope':'H=phi*K where 0<K(0)<=1 and K/K(0)=1+r1*t^2+r2*t^4+r3*t^6+..., r1,r2,r3>=0, r2<=r1^2. This secondary inverse-prefix proof does not require the resolvent factorization.',
        'excluded':'Arbitrary coupled responses; Hermitian forms whose off-diagonal couplings join coordinates preprocessed differently and cannot be diagonalized within one covariance block; arbitrary convex mixtures unless their averaged kernel independently satisfies a stated factorization or secondary inverse-prefix condition; global complex Grothendieck endpoints.',
        'physical_realization':'Independent proper complex z,w; F=G=phase(z)*exp(i*a*|w|^2), b=a^2/(1+a^2). Kernel phi(z)/(1+a^2*(1-|z|^2)).'})
    return result


if __name__=='__main__':
    if sys.flags.optimize:
        raise SystemExit('Refusing -O/-OO: run with normal Python semantics')
    p=argparse.ArgumentParser()
    p.add_argument('--output',type=Path,required=True)
    p.add_argument('--bits',type=int,default=160)
    args=p.parse_args()
    report=certificate(args.bits)
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:report[k] for k in ['status','score_ceiling_root_upper_rational',
        'inverse_prefix_at_incumbent_lower','local_asymmetric_chirp_prefix_expansion']},indent=2))
