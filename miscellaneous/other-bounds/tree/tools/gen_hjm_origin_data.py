#!/usr/bin/env python3
"""Agent-ID: codex-aa04. Import pinned HJM origin data without executing it.

The manifest and every upstream artifact are SHA256 pinned. Exact decimal
parameters and serialized binary64 endpoints become exact rational data.
These checks establish source identity and arithmetic consistency, never the
truth of an upstream integral enclosure. Only algebraic response definitions
are emitted to Lean; unproved coefficient boxes stay in the JSON certificate.

Usage: python3 tools/gen_hjm_origin_data.py [--check] [--self-test]
No NumPy, FLINT, network, native checker, or integral replay is used.
"""
from __future__ import annotations

import argparse
import ast
from fractions import Fraction as Q
import hashlib
import io
import json
import math
from pathlib import Path
import struct
import sys
import zipfile

ROOT = Path(__file__).resolve().parent.parent
DATA = ROOT / 'data/hjm/origin'
LEAN = ROOT / 'Grothe/HJM/OriginData.lean'
NONVANISHING_LEAN = ROOT / 'Grothe/HJM/OriginNonvanishingData.lean'
COMMIT = '7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f'
MANIFEST_SHA256 = 'd5279d8e2ddb6887f06f6d681e033894e389e64382184f35417fcbbd80042c97'
PREFIX = 'upstream/support_compression_certificate/'
BOX_KEYS = tuple(f'{side}_{part}_{edge}' for side in ('left', 'right')
                 for part in ('real', 'imag') for edge in ('lower', 'upper'))


def require(condition, message):
    if not condition:
        raise ValueError(message)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def read_sources():
    raw = (DATA / 'manifest.json').read_bytes()
    require(digest(raw) == MANIFEST_SHA256, 'pinned manifest hash mismatch')
    manifest = json.loads(raw)
    require(manifest['schema_version'] == 1 and manifest['commit'] == COMMIT,
            'unexpected source revision or manifest schema')
    files = {}
    for item in manifest['files']:
        name = item['path']
        require(name.startswith('upstream/') and '..' not in Path(name).parts,
                'invalid manifest path')
        require(name not in files, 'duplicate manifest path')
        data = (DATA / name).read_bytes()
        require(len(data) == item['bytes'] and digest(data) == item['sha256'],
                f'pinned source mismatch: {name}')
        files[name] = data
    require(len(files) == 13, 'unexpected source artifact count')
    return files


def assignments(raw):
    tree = ast.parse(raw.decode('utf-8'))
    return {n.targets[0].id: n.value for n in tree.body
            if isinstance(n, ast.Assign) and len(n.targets) == 1
            and isinstance(n.targets[0], ast.Name)}


def exact_expr(node, names=None):
    names = {} if names is None else names
    if isinstance(node, ast.Constant) and type(node.value) in (int, str):
        return Q(node.value)
    if isinstance(node, ast.UnaryOp) and isinstance(node.op, ast.USub):
        return -exact_expr(node.operand, names)
    if isinstance(node, ast.Name) and node.id in names:
        return names[node.id]
    if isinstance(node, ast.Call) and isinstance(node.func, ast.Name):
        require(node.func.id in ('Q', 'F') and not node.keywords
                and len(node.args) in (1, 2), 'unexpected rational constructor')
        values = [exact_expr(x, names) for x in node.args]
        return values[0] if len(values) == 1 else values[0] / values[1]
    if isinstance(node, ast.BinOp):
        a, b = exact_expr(node.left, names), exact_expr(node.right, names)
        if isinstance(node.op, ast.Add):
            return a + b
        if isinstance(node.op, ast.Sub):
            return a - b
        if isinstance(node.op, ast.Mult):
            return a * b
        if isinstance(node.op, ast.Div):
            return a / b
        if isinstance(node.op, ast.Pow):
            require(b.denominator == 1 and 0 <= b <= 100,
                    'unsupported exponent in exact source literal')
            return a ** int(b)
    raise ValueError('unexpected syntax in exact source literal')


def rational_strings(node):
    require(isinstance(node, (ast.Tuple, ast.List)), 'expected literal sequence')
    require(all(isinstance(v, ast.Constant) and isinstance(v.value, str)
                for v in node.elts), 'expected decimal strings, not floats')
    return [Q(v.value) for v in node.elts]


def cmul(a, b):
    return (a[0]*b[0]-a[1]*b[1], a[0]*b[1]+a[1]*b[0])


def conj(a):
    return a[0], -a[1]


def cayley(t):
    return (1-t*t)/(1+t*t), 2*t/(1+t*t)


def linear_product(p, z):
    out = [(Q(0), Q(0)) for _ in range(len(p)+1)]
    for i, v in enumerate(p):
        c = cmul(v, z)
        out[i] = out[i][0]+c[0], out[i][1]+c[1]
        out[i+1] = out[i+1][0]+v[0], out[i+1][1]+v[1]
    return out


def definitions(files):
    values = assignments(files[PREFIX+'complex_upper_origin_layer_definitions.py'])
    delta = exact_expr(values['DELTA'])
    a_parameter = exact_expr(values['CAYLEY'])
    c_parameter = exact_expr(values['C_PARAMETER'])
    require((delta, a_parameter, c_parameter)
            == (Q(11,500), Q(-71,400), Q(356080252073,10**12)),
            'origin constants changed')
    radial = assignments(files[PREFIX+'complex_upper_convex_2e6_radial_coefficients.py'])
    real, imag = rational_strings(radial['PRE_STR']), rational_strings(radial['PIM_STR'])
    require(len(real) == len(imag) == 10, 'origin P must have ten coefficients')
    p = list(zip(real, imag))
    a, c = cayley(a_parameter), cayley(c_parameter)
    square = cmul(p[0],p[0])
    norm_square = p[0][0]**2+p[0][1]**2
    require(norm_square > 0, 'P(0) must be nonzero')
    u0_square = square[0]/norm_square, square[1]/norm_square
    z = cmul(conj(c),u0_square)
    d = z[1], -z[0]
    b = cmul(d,a)
    left = linear_product(p, (delta*a[0],delta*a[1]))
    right = linear_product([cmul(c,conj(v)) for v in p], (delta*b[0],delta*b[1]))
    for unit in (a,b,c,d):
        require(unit[0]**2+unit[1]**2 == 1, 'derived factor is not on unit circle')
    require(a[1] != 0 and b[1] != 0, 'a linear layer factor could vanish on real axis')
    product = cmul(left[0],conj(right[0]))
    require(product == (Q(0), delta**2*norm_square), 'endpoint product identity changed')
    return dict(delta=delta,cayleyParameter=a_parameter,cParameter=c_parameter,
                pReal=real,pImag=imag,aReal=a[0],aImag=a[1],cReal=c[0],cImag=c[1],
                dReal=d[0],dImag=d[1],bReal=b[0],bImag=b[1],
                p0NormSquare=norm_square,p0SquareReal=square[0],p0SquareImag=square[1],
                u0SquareReal=u0_square[0],u0SquareImag=u0_square[1],
                leftReal=[v[0] for v in left],leftImag=[v[1] for v in left],
                rightReal=[v[0] for v in right],rightImag=[v[1] for v in right])


def parse_npy(raw):
    require(raw[:8] == b'\x93NUMPY\x01\x00', 'only pinned NPY v1 supported')
    require(len(raw) >= 10, 'truncated NPY header')
    length = struct.unpack('<H',raw[8:10])[0]
    require(10+length <= len(raw), 'truncated NPY header payload')
    header = ast.literal_eval(raw[10:10+length].decode('ascii'))
    require(set(header) == {'descr','fortran_order','shape'}, 'unexpected NPY header')
    require(header['fortran_order'] is False, 'Fortran arrays are not supported')
    require(header['shape'] in ((), (120,)), 'unexpected NPY dimensions')
    dtype = header['descr']
    require(dtype in ('<f8','<i8'), 'only finite binary64 or int64 data supported')
    count = 1 if header['shape'] == () else 120
    payload = raw[10+length:]
    require(len(payload) == count*8, 'unexpected NPY payload size')
    unpacked = struct.unpack('<'+('d' if dtype=='<f8' else 'q')*count,payload)
    if dtype == '<f8':
        require(all(math.isfinite(v) for v in unpacked), 'nonfinite source endpoint')
        values = [Q(*v.as_integer_ratio()) for v in unpacked]
    else:
        values = list(unpacked)
    return dtype, header['shape'], values


def table(files, source, start, cutoff):
    metadata = {'count','cutoff','joint_l2_tail_bound'} | ({'start'} if start else set())
    keys = set(BOX_KEYS) | metadata
    with zipfile.ZipFile(io.BytesIO(files[source])) as archive:
        members = archive.namelist()
        require(len(members) == len(set(members)), 'duplicate NPZ members')
        require(set(members) == {k+'.npy' for k in keys}, 'unexpected NPZ key set')
        arrays = {k:parse_npy(archive.read(k+'.npy')) for k in sorted(keys)}
    for k in BOX_KEYS:
        require(arrays[k][:2] == ('<f8',(120,)), f'invalid box array {k}')
    for k,v in dict(count=120,cutoff=cutoff,**({'start':start} if start else {})).items():
        require(arrays[k] == ('<i8',(),[v]), f'incorrect metadata {k}')
    require(arrays['joint_l2_tail_bound'][:2] == ('<f8',()), 'invalid tail scalar')
    require(arrays['joint_l2_tail_bound'][2][0] > 0, 'nonpositive tail scalar')
    rows = []
    for i in range(120):
        row = {'index':i}
        for side in ('left','right'):
            row[side] = {}
            for part in ('real','imag'):
                lo=arrays[f'{side}_{part}_lower'][2][i]
                hi=arrays[f'{side}_{part}_upper'][2][i]
                require(lo <= hi, f'reversed source box at {side}/{part}/{i}')
                row[side][part]=[str(lo),str(hi)]
        rows.append(row)
    return {'source':source,'radial_interval':[start,cutoff],'count':120,
            'encoding':'Exact rationals of serialized IEEE754 binary64 endpoints',
            'analytic_status':'UPSTREAM_ASSERTED_NOT_LEAN_VERIFIED',
            'serialized_joint_l2_tail_bound':str(arrays['joint_l2_tail_bound'][2][0]),
            'intended_joint_l2_tail_bound':f'exp(-{cutoff}/2)',
            'tail_bound_applies_to':'The full response omitted after the cutoff, not the complement of this table radial interval; the [25,36] table must first be added to the [0,25] table.',
            'tail_scalar_status':'An upstream math.exp/nextafter output; not itself a certified exponential enclosure',
            'rows':rows}


def json_rationals(values):
    return {k:[str(x) for x in v] if isinstance(v,list) else str(v) for k,v in values.items()}


def positivity_certificate(values):
    """Exact Bernstein certificate for |P(s)|^2 >= 37/100 on s >= 0.

    This is a finite rational identity/positivity check, independent of the
    upstream Sturm and Rouche routines. Its interpretation as a real-function
    inequality still requires the generic Bernstein positivity lemma in Lean.
    """
    def square(p):
        return [sum((p[i]*p[k-i] for i in range(len(p))
                     if 0 <= k-i < len(p)), Q(0))
                for k in range(2*len(p)-1)]
    polynomial = [a+b for a,b in zip(square(values['pReal']),square(values['pImag']))]
    polynomial[0] -= Q(37,100)
    denominator = math.lcm(*(c.denominator for c in polynomial))
    q = [int(c*denominator) for c in polynomial]
    degree = len(q)-1
    require(degree == 18, 'unexpected modulus-square polynomial degree')
    factorial = math.factorial(degree)

    def shifted(a):
        return [sum(q[j]*math.comb(j,k)*a**(j-k)
                    for j in range(k,degree+1)) for k in range(degree+1)]

    # Integer endpoints make every transformed power coefficient integral.
    edges = [0,1,2,4,8,16,24,28,30,32]
    panels=[]
    for a,b in zip(edges,edges[1:]):
        power=[c*(b-a)**k for k,c in enumerate(shifted(a))]
        bernstein=[sum(power[k]*math.comb(i,k)*math.factorial(k)*math.factorial(degree-k)
                       for k in range(i+1)) for i in range(degree+1)]
        require(all(c > 0 for c in bernstein), f'nonpositive Bernstein coefficient on [{a},{b}]')
        # Independently expand sum b_i*binom(n,i)*t^i*(1-t)^(n-i).
        for k in range(degree+1):
            recovered=sum(bernstein[i]*math.comb(degree,i)*math.comb(degree-i,k-i)
                          *(-1)**(k-i) for i in range(k+1))
            require(recovered == factorial*power[k], 'Bernstein/power identity failed')
        panels.append({'left':a,'right':b,'bernstein_numerators':[str(c) for c in bernstein],
                       'bernstein_denominator':str(denominator*factorial),
                       'strict_lower_bound':str(Q(min(bernstein),denominator*factorial))})
    tail=shifted(edges[-1])
    require(all(c > 0 for c in tail), 'tail shift has a nonpositive coefficient')
    # Reverse the tail shift to check its exact identity, including signs.
    restored=[sum(tail[j]*math.comb(j,k)*(-edges[-1])**(j-k)
                  for j in range(k,degree+1)) for k in range(degree+1)]
    require(restored == q, 'tail polynomial shift identity failed')
    return {'schema_version':1,'agent_id':'codex-aa04','upstream_commit':COMMIT,
            'manifest_sha256':MANIFEST_SHA256,
            'status':'EXACT_RATIONAL_CERTIFICATE_NOT_YET_LEAN_VERIFIED',
            'claim':'For every real s >= 0, Re(P(s))^2 + Im(P(s))^2 >= 37/100 > 9/25, hence |P(s)| > 3/5.',
            'polynomial':'Q(s)=Re(P(s))^2+Im(P(s))^2-37/100',
            'subtracted_square_lower':'37/100',
            'polynomial_numerators':[str(c) for c in q],
            'polynomial_denominator':str(denominator),'degree':degree,
            'bernstein_convention':'On [a,b], Q(a+(b-a)t)=sum_i b_i*binom(18,i)*t^i*(1-t)^(18-i).',
            'panels':panels,
            'tail':{'shift':edges[-1],'power_numerators':[str(c) for c in tail],
                    'power_denominator':str(denominator),
                    'identity':'Q(32+x)=sum_i tail_i*x^i; all tail_i>0, so Q(32+x)>0 for x>=0.'},
            'generic_proof':'The Bernstein basis is nonnegative and sums to one on [0,1]. Adjacent panels cover [0,32]; positive shifted power coefficients cover [32,infinity).'}


def phase_derivative_certificate(values):
    """Exact polynomial inputs replacing the upstream complex-root bounds.

    No angle is numerically evaluated. The certificate concerns four real
    polynomial inequalities; a separate analytic proof identifies their
    rational quotients with the first two phase derivatives.
    """
    scale=math.lcm(*(x.denominator for x in values['pReal']+values['pImag']))
    real=[int(x*scale) for x in values['pReal']]
    imag=[int(x*scale) for x in values['pImag']]
    def multiply(a,b):
        return [sum(a[j]*b[k-j] for j in range(len(a)) if 0 <= k-j < len(b))
                for k in range(len(a)+len(b)-1)]
    def add(a,b,sign=1):
        return [(a[k] if k<len(a) else 0)+sign*(b[k] if k<len(b) else 0)
                for k in range(max(len(a),len(b)))]
    def derivative(a):
        return [k*a[k] for k in range(1,len(a))]
    q=add(multiply(real,real),multiply(imag,imag))
    c=add(multiply(real,derivative(imag)),multiply(imag,derivative(real)),-1)
    q_squared=multiply(q,q)
    numerator=add(multiply(derivative(c),q),multiply(c,derivative(q)),-1)
    families=[('12q-c',add([12*v for v in q],c,-1),scale**2),
              ('12q+c',add([12*v for v in q],c),scale**2),
              ('30q2-n',add([30*v for v in q_squared],numerator,-1),scale**4),
              ('30q2+n',add([30*v for v in q_squared],numerator),scale**4)]
    edges=[0,4,8,16,24,28,30,32]
    certificates=[]
    for name,coeffs,denominator in families:
        degree=len(coeffs)-1
        factorial=math.factorial(degree)
        def shifted(a):
            return [sum(coeffs[j]*math.comb(j,k)*a**(j-k)
                        for j in range(k,degree+1)) for k in range(degree+1)]
        panels=[]
        for a,b in zip(edges,edges[1:]):
            power=[v*(b-a)**k for k,v in enumerate(shifted(a))]
            bernstein=[sum(power[k]*math.comb(i,k)*math.factorial(k)*math.factorial(degree-k)
                           for k in range(i+1)) for i in range(degree+1)]
            require(all(v > 0 for v in bernstein), f'phase bound failed: {name} on [{a},{b}]')
            for k in range(degree+1):
                recovered=sum(bernstein[i]*math.comb(degree,i)*math.comb(degree-i,k-i)
                              *(-1)**(k-i) for i in range(k+1))
                require(recovered==factorial*power[k], 'phase Bernstein identity failed')
            panels.append({'left':a,'right':b,'bernstein_numerators':[str(v) for v in bernstein],
                           'bernstein_denominator':str(denominator*factorial)})
        tail=shifted(32)
        require(all(v > 0 for v in tail), f'phase tail bound failed: {name}')
        restored=[sum(tail[j]*math.comb(j,k)*(-32)**(j-k)
                      for j in range(k,degree+1)) for k in range(degree+1)]
        require(restored==coeffs,'phase tail shift identity failed')
        certificates.append({'name':name,'degree':degree,
                             'power_numerators':[str(v) for v in coeffs],
                             'power_denominator':str(denominator),'panels':panels,
                             'tail':{'shift':32,'power_numerators':[str(v) for v in tail],
                                     'power_denominator':str(denominator)}})
    return {'schema_version':1,'agent_id':'codex-aa04','upstream_commit':COMMIT,
            'manifest_sha256':MANIFEST_SHA256,
            'status':'EXACT_POLYNOMIAL_CERTIFICATE_NOT_YET_LEAN_VERIFIED',
            'domain':'Real s >= 0',
            'definitions':{'q':'Re(P)^2+Im(P)^2','c':'Re(P)*Im(P)\'-Im(P)*Re(P)\'',
                           'n':'c\'*q-c*q\''},
            'conditional_analytic_implication':'If theta\'=c/q and theta\'\'=n/q^2 and q>0, then |theta\'|<12 and |theta\'\'|<30.',
            'certificates':certificates}


def build_schema(files, values):
    tables = [table(files,PREFIX+'complex_upper_origin_layer_coefficients_n120_analytic.npz',0,25),
              table(files,'upstream/origin_tail_25_36.npz',25,36)]
    combined=[]
    for a,b in zip(tables[0]['rows'],tables[1]['rows']):
        row={'index':a['index']}
        for side in ('left','right'):
            row[side]={part:[str(Q(x)+Q(y)) for x,y in zip(a[side][part],b[side][part])]
                       for part in ('real','imag')}
        combined.append(row)
    energy_ast=assignments(files[PREFIX+'complex_upper_saha_visible_energy_refinement.py'])
    energy={k:exact_expr(energy_ast[k]) for k in ('LEFT_TOTAL','RIGHT_TOTAL','LEFT_VISIBLE','RIGHT_VISIBLE','ORIGIN_TAIL')}
    expected={'LEFT_TOTAL':Q(12671,1000),'RIGHT_TOTAL':Q(12674,1000),
              'LEFT_VISIBLE':Q(11497,1000),'RIGHT_VISIBLE':Q(11498,1000),'ORIGIN_TAIL':Q(523,2000000)}
    require(energy==expected,'energy target literals changed')
    return {'schema_version':1,'agent_id':'codex-aa04','upstream_commit':COMMIT,
            'manifest_sha256':MANIFEST_SHA256,
            'trust_boundary':'Hashes prove byte identity only. Exact decoding and interval addition do not prove any analytic integral enclosure, derivative bound, Gaussian identity, or endpoint.',
            'coefficient_convention':'Ascending powers of the real radial variable s; real and imaginary coefficient lists are separate.',
            'definitions':json_rationals(values),
            'coefficient_integral':{'formula':'(-1)^n/sqrt(n+1) * integral exp(-s)*sqrt(s)*L_n^1(s)*phase(Q(s)) ds',
                                    'left_polynomial':'P(s)*(s+delta*A)',
                                    'right_polynomial':'C*conj(P(s))*(s+delta*B)',
                                    'integrator_variable':'s=t^2; integrand 2*t^2*exp(-t^2)*L_n^1(t^2)*phase(Q(t^2))*(-1)^n/sqrt(n+1)'},
            'source_tables':tables,
            'combined_table':{'radial_interval':[0,36],'count':120,
                              'construction':'Exact Minkowski addition of the two serialized source boxes',
                              'analytic_status':'VALID_ONLY_IF_BOTH_SOURCE_INTEGRAL_ENCLOSURES_ARE_PROVED',
                              'rows':combined},
            'energy_targets':{'source':PREFIX+'complex_upper_saha_visible_energy_refinement.py',
                              'values':{k:str(v) for k,v in energy.items()},
                              'status':'UPSTREAM_TARGETS_NOT_LEAN_VERIFIED'}}


def lean_q(q):
    return f'({q.numerator} : ℚ)' if q.denominator == 1 else f'({q.numerator} : ℚ) / {q.denominator}'


def lean_text(values):
    lines=['import Mathlib.Data.Rat.Defs','',
           '/-! Generated by tools/gen_hjm_origin_data.py; do not edit.',
           'Agent-ID: codex-aa04. Exact rational definitions of the HJM origin response.',
           f'Pinned upstream commit: {COMMIT}.',
           'Source identity is not a proof of an integral enclosure. No interval table',
           'or analytic certificate is asserted in this module. -/','',
           'namespace Grothe.HJM.OriginData','']
    for name,value in values.items():
        if isinstance(value,list):
            lines.append(f'/-- Ascending rational coefficients of `{name}`. -/')
            lines.append(f'def {name} : List ℚ := [')
            lines.append('  '+',\n  '.join(lean_q(x) for x in value)+']')
        else:
            lines.append(f'def {name} : ℚ := {lean_q(value)}')
        lines.append('')
    lines.extend(['end Grothe.HJM.OriginData',''])
    return '\n'.join(lines)


def nonvanishing_lean_text(certificate):
    denominator=int(certificate['polynomial_denominator'])
    coeffs=[Q(int(c),denominator) for c in certificate['polynomial_numerators']]
    lines=['import Mathlib.Data.Rat.Defs','',
           '/-! Generated by tools/gen_hjm_origin_data.py; do not edit.',
           'Agent-ID: codex-aa04. Rational coefficients for the exact origin',
           'nonvanishing certificate. Its soundness is proved in OriginNonvanishing. -/','',
           'namespace Grothe.HJM.OriginNonvanishingData','',
           '/-- Coefficients of `Re(P)^2 + Im(P)^2 - 37/100`, in ascending degree. -/',
           'def gap : List ℚ := [',
           '  '+',\n  '.join(lean_q(x) for x in coeffs)+']','',
           'end Grothe.HJM.OriginNonvanishingData','']
    return '\n'.join(lines)


def self_test(files, values):
    checks=0
    def rejects(function):
        nonlocal checks
        try:
            function()
        except (ValueError,KeyError,SyntaxError,ZeroDivisionError,zipfile.BadZipFile):
            checks+=1
        else:
            raise ValueError('negative test unexpectedly accepted malformed input')
    rejects(lambda:exact_expr(ast.parse('0.125',mode='eval').body))
    rejects(lambda:exact_expr(ast.parse('__import__("os")',mode='eval').body))
    rejects(lambda:parse_npy(b'not-npy'))
    src=PREFIX+'complex_upper_origin_layer_coefficients_n120_analytic.npz'
    rejects(lambda:table(files,src,0,36))
    require(values['p0NormSquare']>0 and len(values['leftReal'])==11,'definition shape failed')
    # Test binary64 decoding independently against a known nondecimal endpoint.
    header=repr({'descr':'<f8','fortran_order':False,'shape':()}).encode()+b'\n'
    raw=b'\x93NUMPY\x01\x00'+struct.pack('<H',len(header))+header+struct.pack('<d',0.1)
    require(parse_npy(raw)[2]==[Q(3602879701896397,36028797018963968)],'binary64 decoding changed')
    rejects(lambda:parse_npy(raw[:-8]+struct.pack('<d',math.nan)))
    # Exercise table-shape and interval validation through complete in-memory NPZs.
    with zipfile.ZipFile(io.BytesIO(files[src])) as archive:
        members={name:archive.read(name) for name in archive.namelist()}
    def changed_table(changes):
        altered=dict(members)
        altered.update(changes)
        buffer=io.BytesIO()
        with zipfile.ZipFile(buffer,'w') as archive:
            for name,value in altered.items():
                archive.writestr(name,value)
        changed=dict(files)
        changed[src]=buffer.getvalue()
        return lambda:table(changed,src,0,25)
    rejects(changed_table({'unexpected.npy':raw}))
    # Set a lower endpoint to 2; the paired original upper endpoint is negative.
    endpoint=members['left_real_lower.npy']
    header_end=10+struct.unpack('<H',endpoint[8:10])[0]
    rejects(changed_table({'left_real_lower.npy':endpoint[:header_end]+struct.pack('<d',2.0)+endpoint[header_end+8:]}))
    positivity=positivity_certificate(values)
    require(len(positivity['panels']) == 9 and positivity['tail']['shift'] == 32,
            'unexpected positivity cover')
    print(f'PASS: exact definitions, binary64 decoding, {checks} fail-closed negative tests')


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check',action='store_true')
    parser.add_argument('--self-test',action='store_true')
    args=parser.parse_args()
    files=read_sources()
    values=definitions(files)
    schema=build_schema(files,values)
    positivity=positivity_certificate(values)
    derivative_bounds=phase_derivative_certificate(values)
    outputs={LEAN:lean_text(values),NONVANISHING_LEAN:nonvanishing_lean_text(positivity),
             DATA/'certificate.json':json.dumps(schema,indent=2)+'\n',
             DATA/'nonvanishing-certificate.json':json.dumps(positivity,indent=2)+'\n',
             DATA/'phase-derivative-certificate.json':json.dumps(derivative_bounds,indent=2)+'\n'}
    if args.self_test:
        self_test(files,values)
    for path,text in outputs.items():
        if args.check:
            require(path.exists() and path.read_text()==text,f'stale generated output: {path.relative_to(ROOT)}')
        else:
            path.parent.mkdir(parents=True,exist_ok=True)
            path.write_text(text)
            print(f'wrote {path.relative_to(ROOT)}')
    if args.check:
        print('PASS: pinned sources and generated HJM origin data are current')


if __name__=='__main__':
    try:
        main()
    except (ValueError,KeyError,OSError,zipfile.BadZipFile) as error:
        sys.exit(f'HJM origin import failed: {error}')
