#!/usr/bin/env python3
"""Independent exact physical-t prefix and exported-tax audit.

Standard library only. This deliberately does not import or reproduce the
folded-polynomial incumbent exporter. Saved Arb text is treated as rational
intervals; no new Gaussian input or infinite-tail theorem is established.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
import math
from pathlib import Path
import sys

if sys.flags.optimize:
    raise SystemExit("Exact incumbent audit refuses Python -O/-OO.")


def require(test,message):
    if not test:
        raise ArithmeticError(message)


def interval(text):
    """Read finite Arb decimal midpoint/radius text as an exact rational interval."""
    body=str(text).strip()
    if body.startswith('[') and body.endswith(']'):
        body=body[1:-1].strip()
    if '+/-' in body:
        mid,rad=body.split('+/-')
        m=Q(mid.strip()) if mid.strip() else Q(0)
        r=Q(rad.strip())
        require(r>=0,'Negative interval radius')
        return m-r,m+r
    x=Q(body)
    return x,x


def abs_interval(bounds):
    lo,hi=bounds
    require(lo<=hi,'Reversed interval')
    lower=Q(0) if lo<=0<=hi else min(abs(lo),abs(hi))
    return lower,max(abs(lo),abs(hi))


def multiply(a,b,degree):
    return [sum(a[i]*b[k-i] for i in range(k+1)) for k in range(degree+1)]


def powers(a,n,degree):
    result=[[Q(1)]+[Q(0)]*degree]
    for _ in range(n):
        result.append(multiply(result[-1],a,degree))
    return result


def physical_prefix(frozen,degree,reverse_auxiliary_sign=False):
    # Build the ordinary t-polynomials p(t), and the already-negative -tau(t).
    # No radial index, n//2 shift, or folded X-polynomial is used anywhere.
    p=[Q(0)]*(degree+1)
    q=[Q(0)]*(degree+1)
    for j,value in enumerate(frozen['P']):
        if 2*j+1<=degree:
            p[2*j+1]=Q(value)
    for j,value in enumerate(frozen['Q']):
        if 2*j+1<=degree:
            q[2*j+1]=Q(value)*(-1 if reverse_auxiliary_sign else 1)
    order_p=next((i for i,x in enumerate(p) if x),None)
    order_q=next((i for i,x in enumerate(q) if x),None)
    require(order_p==1,'Unexpected physical order of p(t)')
    # For a prefix below degree three the second channel does not contribute.
    if degree>=3:
        require(order_q==3,'Unexpected physical order of negative auxiliary channel')
    entries=[]
    for n,m,num,exponent in frozen['energy_entries_n_m_numerator_pow2denominator']:
        require(all(type(x) is int for x in (n,m,num,exponent)),'Noninteger energy record')
        require(n>=0 and m>=0 and num>0 and exponent>=0,'Invalid energy record')
        require((n+m)%2==1 and n+3*m<=501,'Invalid frozen support/parity')
        if n+3*m<=degree:
            entries.append((n,m,Q(num,2**exponent)))
    require(entries,'No prefix energy records')
    pp=powers(p,max(n for n,m,e in entries),degree)
    qq=powers(q,max(m for n,m,e in entries),degree)
    result=[Q(0)]*(degree+1)
    for n,m,energy in entries:
        term=multiply(pp[n],qq[m],degree)
        result=[a+energy*b for a,b in zip(result,term)]
    return result,len(entries)


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--input',type=Path,default=Path(__file__).resolve().parents[1]/
        'handoff/research-third-decimal/fresh-eyes-20261023/upper/incumbent')
    ap.add_argument('--degree',type=int,default=17)
    ap.add_argument('--out',type=Path,required=True)
    args=ap.parse_args()
    if args.degree<1 or args.degree>31 or args.degree%2!=1:
        ap.error('--degree must be odd and between 1 and 31')
    frozen_path=args.input/'frozen-inputs.json'
    report_path=args.input/'incumbent-column.json'
    raw=frozen_path.read_bytes()
    frozen=json.loads(raw)
    report=json.loads(report_path.read_text())
    require(frozen['schema']=='incumbent-exact-head-v1','Unknown frozen schema')
    digest=hashlib.sha256(raw).hexdigest()
    require(digest==report['frozen_inputs_sha256'],'Frozen-input hash mismatch')
    require(frozen['sources']==report['sources'],'Source provenance mismatch')
    require(len(frozen['energy_entries_n_m_numerator_pow2denominator'])==21168,'Unexpected energy count')
    coeff,terms=physical_prefix(frozen,args.degree)
    require(all(coeff[i]==0 for i in range(0,args.degree+1,2)),'Nonzero even physical coefficient')
    saved=report['all_251_coefficient_enclosures']
    require(len(saved)==251,'Expected 251 stored-head coefficient intervals')
    checked=[]
    for j in range(1,args.degree+1,2):
        lo,hi=interval(saved[(j-1)//2])
        require(lo<=coeff[j]<=hi,f'Exact physical coefficient at degree {j} misses saved interval')
        checked.append({'degree':j,'exact_coefficient':str(coeff[j]),
                        'coefficient_float':float(coeff[j]),'in_saved_interval':True})
    retain=report['retained_coefficients']
    require(type(retain) is int and 1<=retain<=251,'Invalid retained coefficient count')
    centers=report['coefficient_midpoints']
    require(len(centers)==retain and all(math.isfinite(x) for x in centers),'Invalid midpoint list')
    centerq=[Q(x) for x in centers]  # exact binary64 values, not decimal approximations
    midpoint_upper=Q(0)
    for i in range(retain):
        lo,hi=interval(saved[i])
        midpoint_upper+=max(abs(lo-centerq[i]),abs(hi-centerq[i]))
    omitted_upper=sum(abs_interval(interval(x))[1] for x in saved[retain:])
    keymap={'compareQ':'actual_vs_truncation','energyErrQ':'stored_energy_error',
            'tailQ':'actual_tail_beyond501'}
    inherited=Q(0)
    for source,key in keymap.items():
        value=Q(frozen['budgets'][source])
        require(value>=0,'Negative inherited tax budget')
        require(value==Q(report['tax_terms'][key]),'Tax term disagrees with frozen input')
        inherited+=value
    reassembled_upper=inherited+omitted_upper+midpoint_upper
    exported=report['conditional_tax_upper_float']
    require(math.isfinite(exported) and exported>=0,'Invalid exported tax float')
    exported_q=Q(exported)
    _,saved_tax_upper=interval(report['conditional_tax_enclosure'])
    require(exported_q>=saved_tax_upper,'Exported tax float does not cover saved Arb enclosure')
    require(exported_q>=reassembled_upper,'Exported tax float does not cover independently reconstructed tax')
    head=centerq[0]-sum(map(abs,centerq[1:]))
    safe=head-exported_q
    headline=Q(frozen['budgets']['slopeQ'])-Q(frozen['budgets']['headCapQ'])-inherited
    require(safe>headline-Q(1,10**15),'Extracted column does not recover conditional baseline')
    # Explicit negative controls catch the two audited sign/allowance mistakes.
    wrong_sign_rejected=None
    if args.degree>=3:
        wrong,_=physical_prefix(frozen,args.degree,True)
        lo,hi=interval(saved[1])
        wrong_sign_rejected=not (lo<=wrong[3]<=hi)
        require(wrong_sign_rejected,'Auxiliary sign negative control was not detected')
    require(inherited<reassembled_upper,'Missing omitted/midpoint-tax negative control is vacuous')
    result={'format':'incumbent-independent-physical-prefix-audit/v1','status':'PASS',
        'scope':__doc__,'degree':args.degree,'exact_prefix_energy_terms':terms,
        'frozen_inputs_sha256':digest,'report_sha256':hashlib.sha256(report_path.read_bytes()).hexdigest(),
        'physical_prefix':checked,'all_even_prefix_coefficients_exactly_zero':True,
        'omitted_head_l1_upper_from_saved_intervals':str(omitted_upper),
        'retained_midpoint_error_upper_from_saved_intervals':str(midpoint_upper),
        'reassembled_tax_upper':str(reassembled_upper),'exported_tax_exact_binary64':str(exported_q),
        'exported_tax_covers_saved_enclosure':True,'exported_tax_covers_independent_reassembly':True,
        'exported_tax_margin':str(exported_q-reassembled_upper),
        'conditional_score_lower_bound_exact_binary64_tax':str(safe),
        'conditional_score_lower_bound_float':float(safe),
        'negative_controls':{'double_negated_auxiliary_sign_rejected':wrong_sign_rejected,
            'tax_without_omitted_head_and_midpoint_errors_rejected':True},
        'global_endpoint_changed':False}
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(result,indent=2)+'\n')
    print('PASS exact physical prefix through degree',args.degree,
          '; independently reassembled tax covered by exported binary64; negative controls rejected')


if __name__=='__main__':
    main()
