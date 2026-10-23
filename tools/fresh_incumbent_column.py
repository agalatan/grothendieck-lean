#!/usr/bin/env python3
"""Export the incumbent combined signed kernel head with its conditional tax.

Only existing exact Lean p/q/energy data are used. No energy integration or
source table regeneration is performed. Frozen JSON inputs make replays
independent of the live repository. All coefficient computations use Arb.
"""
import argparse
from fractions import Fraction
import hashlib
import json
import math
from pathlib import Path
import re
import flint
from flint import arb,arb_poly,ctx


def require(test,message):
    if not test: raise ArithmeticError(message)


def rat_definition(text,name):
    m=re.search(r'def '+re.escape(name)+r'\s*:\s*ℚ\s*:=\s*([^\n]+)',text)
    if not m: raise ValueError('Missing rational '+name)
    ns=re.findall(r'-?\d+',m.group(1))
    if len(ns)==1:return Fraction(int(ns[0]))
    if len(ns)==2:return Fraction(int(ns[0]),int(ns[1]))
    raise ValueError('Unsupported rational definition '+name)


def rat_list(text,name):
    m=re.search(r'def '+re.escape(name)+r'\s*:\s*List ℚ\s*:=\s*\[(.*?)\]',text,re.S)
    if not m:raise ValueError('Missing rational list '+name)
    qs=[]
    for a,b in re.findall(r'\((-?\d+)\s*:\s*ℚ\)(?:\s*/\s*(\d+))?',m.group(1)):
        qs.append(Fraction(int(a),int(b) if b else 1))
    require(qs,'Empty list '+name)
    return qs


def freeze(repo):
    paths=[repo/'Grothe/Upper/Data.lean',repo/'Grothe/Upper/PolynomialBridge.lean']
    texts=[p.read_text() for p in paths]
    data,bridge=texts
    P,Q=rat_list(data,'pList'),rat_list(data,'qList')
    require(sum(abs(x) for x in P)<=1,'Primary Wiener norm exceeds one')
    require(sum(abs(x) for x in Q)<=1 and Q[0]==0,'Auxiliary Wiener/order constraint')
    block=re.search(r'def energyStrs : List String := \[(.*?)\]',data,re.S)
    if not block:raise ValueError('No energy strings')
    energies=[]
    for row in re.findall(r'"([^"]+)"',block.group(1)):
        m,entries=row.split(':');m=int(m)
        for entry in entries.split(';'):
            n,num,exponent=map(int,entry.split(','))
            require(num>0 and exponent>=0 and (n+m)%2==1 and n+3*m<=501,'Bad stored energy')
            energies.append([n,m,num,exponent])
    require(len(energies)==21168,'Unexpected incumbent table size')
    budgets={name:str(rat_definition(data,name)) for name in ['slopeQ','energyErrQ','headCapQ']}
    budgets.update({name:str(rat_definition(bridge,name)) for name in ['compareQ','tailQ']})
    return {'schema':'incumbent-exact-head-v1','status':'CONDITIONAL_INHERITED_TABLES_AND_TAIL',
            'head_degree':501,'P':[str(x) for x in P],'Q':[str(x) for x in Q],
            'energy_entries_n_m_numerator_pow2denominator':energies,'budgets':budgets,
            'sources':[{'path':str(p),'sha256':hashlib.sha256(p.read_bytes()).hexdigest()} for p in paths],
            'concrete_rounder_status':{
                'entrypoint':'Grothe.UpperChaos.fresh_upper_rounder',
                'proved_structural_fields':['valid','summable','summableX','parityX'],
                'remaining_numerical_inputs':['compare','energy_close','hardy'],
                'truncation_inputs':['MemLp X 2 mu2','charge one'],
                'note':'The generic DirectHyps interface below is retained; concrete GT discharges its structural fields. Frozen historical inputs are not rewritten.'},
            'inherited_premises':['DirectHyps.valid: actual rounding is dominated',
                                 'DirectHyps.compare: actual energy vs truncation l1 bound compareQ',
                                 'DirectHyps.energy_close: truncation head energies vs exact stored table l1 bound energyErrQ',
                                 'DirectHyps.hardy: actual rounding weighted square sum <=7/4 at4149/4000; yields tailQ beyond501',
                                 'DirectHyps summability/parity as stated in PolynomialBridge.lean']}


def compute(frozen,retain=129,bits=160):
    if type(retain) is not int or not 1<=retain<=251:raise ValueError('retain must be 1..251')
    if type(bits) is not int or bits<64:raise ValueError('bits must be an integer >=64')
    if frozen['schema']!='incumbent-exact-head-v1':raise ValueError('Unknown frozen schema')
    ctx.prec=bits
    def A(q):
        q=Fraction(q)
        return arb(q.numerator)/q.denominator
    P=[Fraction(x) for x in frozen['P']];Q=[Fraction(x) for x in frozen['Q']]
    require(sum(map(abs,P))<=1 and sum(map(abs,Q))<=1 and Q[0]==0,'Invalid preprocessing')
    p,q=arb_poly([A(x) for x in P]),arb_poly([A(x) for x in Q])
    entries=frozen['energy_entries_n_m_numerator_pow2denominator']
    require(len(entries)==21168,'Incorrect energy count')
    rows={}
    for n,m,num,exponent in entries:
        require(num>0 and exponent>=0 and n>=0 and m>=0 and (n+m)%2==1 and n+3*m<=501,'Invalid energy index')
        rows.setdefault(m,[]).append((n,arb(num)/(arb(2)**exponent)))
    K=251
    powers=[arb_poly([1])]
    for n in range(max(x[0] for x in entries)):
        powers.append((powers[-1]*p).truncate(K))
    result=arb_poly([]);qm=arb_poly([1])
    for m in range(max(rows)+1):
        if m:qm=(qm*q).truncate(K)
        sm=arb_poly([])
        for n,energy in rows.get(m,[]):
            sm+=(powers[n]*energy).left_shift(n//2).truncate(K)
        result+=(sm*qm).left_shift(m//2).truncate(K)
    c=[result[k] for k in range(K)]
    budgets={key:A(value) for key,value in frozen['budgets'].items()}
    residual=abs(c[0]-budgets['slopeQ'])+sum(map(abs,c[1:]),arb(0))
    require(residual<budgets['headCapQ'],'Independent Arb head computation exceeds stored cap')
    centers=[float(x.mid()) for x in c]
    numerical_error=sum((abs(c[k]-arb(centers[k])) for k in range(retain)),arb(0))
    omitted=sum(map(abs,c[retain:]),arb(0))
    # Only retained-coordinate numeric error is added. Omitted coefficients
    # are already bounded directly by their Arb absolute-value enclosures.
    tax=budgets['compareQ']+budgets['energyErrQ']+budgets['tailQ']+omitted+numerical_error
    tax_upper_float=math.nextafter(float(tax.upper()),math.inf)
    while not arb(tax_upper_float)>=tax:
        tax_upper_float=math.nextafter(tax_upper_float,math.inf)
    head_score=arb(centers[0])-sum((abs(arb(x)) for x in centers[1:retain]),arb(0))
    guaranteed=head_score-tax
    headline=(budgets['slopeQ']-budgets['headCapQ']-budgets['energyErrQ']
              -budgets['compareQ']-budgets['tailQ'])
    require(guaranteed>headline-arb('1e-15'),'Extracted incumbent failed baseline consistency')
    return {'status':'CONDITIONAL_INHERITED_TABLES_AND_TAIL','python_flint_version':flint.__version__,
            'precision_bits':bits,'indexing':'entry[k] multiplies t^(2k+1)',
            'retained_coefficients':retain,'retained_through_degree':2*retain-1,
            'full_computed_through_degree':501,'energy_entries':len(entries),
            'coefficient_midpoints':centers[:retain],
            'all_251_coefficient_midpoints':centers,
            'all_251_coefficient_enclosures':[str(x) for x in c],
            'conditional_tax_enclosure':str(tax),
            'conditional_tax_upper_float':tax_upper_float,
            'tax_terms':{'actual_vs_truncation':frozen['budgets']['compareQ'],
                         'stored_energy_error':frozen['budgets']['energyErrQ'],
                         'actual_tail_beyond501':frozen['budgets']['tailQ'],
                         'omitted_stored_head_after_retained_degree':str(omitted),
                         'retained_midpoint_numeric_error':str(numerical_error)},
            'independent_Arb_stored_head_residual':str(residual),
            'stored_head_residual_cap':frozen['budgets']['headCapQ'],
            'retained_head_score':str(head_score),
            'guaranteed_full_score_lower_bound_enclosure':str(guaranteed),
            'existing_Lean_headline_score':str(headline),
            'tax_rule':'For mixture weight w on this approximate column, subtract w*conditional_tax from the signed retained-head LP objective. This bounds all unknown incumbent coefficients and errors once.',
            'inherited_premises':frozen['inherited_premises']}


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--repo',type=Path)
    p.add_argument('--frozen',type=Path);p.add_argument('--output',type=Path,required=True)
    p.add_argument('--retain',type=int,default=129);p.add_argument('--bits',type=int,default=160)
    args=p.parse_args()
    if (args.repo is None)==(args.frozen is None):p.error('Choose exactly one of --repo or --frozen')
    args.output.mkdir(parents=True,exist_ok=True)
    frozen=freeze(args.repo) if args.repo else json.loads(args.frozen.read_text())
    raw=json.dumps(frozen,sort_keys=True,separators=(',',':')).encode()+b'\n'
    (args.output/'frozen-inputs.json').write_bytes(raw)
    report=compute(frozen,args.retain,args.bits)
    report['frozen_inputs_sha256']=hashlib.sha256(raw).hexdigest()
    report['sources']=frozen['sources']
    (args.output/'incumbent-column.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({key:report[key] for key in ['status','retained_through_degree',
         'conditional_tax_enclosure','tax_terms','retained_head_score',
         'guaranteed_full_score_lower_bound_enclosure','existing_Lean_headline_score',
         'independent_Arb_stored_head_residual','frozen_inputs_sha256']},indent=2))
