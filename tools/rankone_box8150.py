#!/usr/bin/env python3
"""Exact local assembly of cover box 8150 with one repriced active-row test.

Standard-library Fractions only. Reconstructs the archived box exactly before
changing its row-15 law nodes. Reuses row 12, all mixture/gate prices, and one
external PAD. The new row-15 tau chords pay their repriced semiconvex allowance.
This certifies ONE existing box conditional on the recorded source/law proofs;
it does not alter or certify the complete cover or a Grothendieck endpoint.
"""
import argparse
from fractions import Fraction as F
import hashlib
import json
from pathlib import Path

EPS=F(149,200)
RHO=F(973612157,10**9)
C6=F(4045313,100000)
PAD=F(1,10**11)


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def mix(a,b,theta):
    assert len(a)==len(b)
    return [(1-theta)*x+theta*y for x,y in zip(a,b)]


def expectation(P,x):
    a0,a1,a2,a4,a6=P
    assert a1>=0 and a6>=0
    return a0+a1*RHO+a2+a4*(2+x*x)+a6*(6+9*x*x+C6*x**3)


def qval(q,x):
    return q[0]+q[1]*x+q[2]*x*x


def qmax(q,lo,hi):
    candidates=[(qval(q,lo),lo),(qval(q,hi),hi)]
    if q[2]<0:
        vertex=-q[1]/(2*q[2])
        if lo<=vertex<=hi:candidates.append((qval(q,vertex),vertex))
    value,where=max(candidates,key=lambda p:p[0])
    return value,where,candidates


def interpolate(n0,n1,tau):
    a,P0=n0;b,P1=n1
    assert a<b and a<=tau<=b
    return mix(P0,P1,(tau-a)/(b-a))


def rowvector(raw):
    ell,beta,delta=map(F,(raw['ell'],raw['beta'],raw['delta']))
    e,n1,n2,c1,c2,c3=map(F,raw['E'])
    b0,b1,b2=map(F,raw['b'])
    return [ell,beta,e-EPS+2*delta*(1+b0),n1+delta*b1,n2+delta*b2,c1,c2,c3]


def price(v):
    ell,beta,k,h1,h2,c1,c2,c3=v
    det=c1*c3-c2*c2
    assert c1>0 and det>0
    return k-(c3*h1*h1-2*c2*h1*h2+c1*h2*h2)/det


def chord_polynomial(a,b,Wa,Wb,D,A=F(0)):
    assert a<b and A>=0
    slope=(Wb-Wa)/(b-a)
    return [Wa-slope*a-A*a*b,slope+A*(a+b),-D-A]


def uniform_node_saving(oldP,newP,xl,xu):
    """Exact minimum of the two moment-bound polynomials' difference in x."""
    p=[x-y for x,y in zip(oldP,newP)]
    a0,a1,a2,a4,a6=p
    c0=a0+a1*RHO+a2+2*a4+6*a6
    c2,c3=a4+9*a6,C6*a6
    values=[(c0+c2*x*x+c3*x*x*x,x) for x in (xl,xu)]
    if c3:
        critical=-2*c2/(3*c3)
        if xl<=critical<=xu:
            values.append((c0+c2*critical**2+c3*critical**3,critical))
    minimum,where=min(values,key=lambda p:p[0])
    return minimum,[c0,F(0),c2,c3],where


def encode(obj):
    if isinstance(obj,F):return str(obj)
    if isinstance(obj,list):return [encode(x) for x in obj]
    if isinstance(obj,tuple):return [encode(x) for x in obj]
    if isinstance(obj,dict):return {str(k):encode(v) for k,v in obj.items()}
    return obj


def main():
    if not __debug__:
        raise SystemExit('Reject -O/-OO: exact acceptance requires assertions')
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
    ap.add_argument('--law-prefix',default='m15-box8150')
    ap.add_argument('--out',type=Path,required=True)
    ap.add_argument('--check',action='store_true',help='reconstruct and exactly compare a saved result')
    args=ap.parse_args()
    repo=args.repo
    base=repo/'handoff/lower-stein/cert-jointmoment-lifted-codex'
    root=repo/'handoff/research-third-decimal/rank-one-certification-20261023'
    paths={'inherited':base/'inherited.json','cover':base/'cover.json',
           'repriced_bank':root/'anchor-bank-m15-box8150.json',
           'repriced_nodes':root/'source-nodes-m15-box8150.json'}
    inherited=json.loads(paths['inherited'].read_text())
    cover=json.loads(paths['cover'].read_text())
    bank=json.loads(paths['repriced_bank'].read_text())
    assert F(inherited['eps'])==EPS and F(inherited['rho'])==RHO
    assert F(inherited['C6'])==C6 and F(inherited['pad'])==PAD
    box=cover['boxes'][8150]
    bounds=list(map(F,box['bounds']))
    tl,tu,sl,su,xl,xu=bounds
    assert box['choice']['groups']==[3,6]
    assert cover['groups'][3]['weights']==[[12,'1']]
    assert cover['groups'][6]['weights']==[[15,'1']]
    assert box['choice']['refs']==[[122,161,122,161],[555,560,560,556]]
    theta=F(box['choice']['theta'])
    assert 0<theta<1
    assert bank['mixture_repricing']['weights']=={'12':str(1-theta),'15':str(theta)}
    assert bank['mixture_repricing']['active_row']==15
    assert sha(paths['inherited'])==bank['mixture_repricing']['inherited_sha256']
    A=F(bank['semiconvex_coefficient'])
    assert A==F(bank['c'])**2/F(bank['d'])
    assert F(json.loads(paths['repriced_nodes'].read_text())['semiconvex_coefficient'])==A
    weighted_A=theta*A
    assert weighted_A==F(bank['mixture_repricing']['shared_semiconvex_coefficient'])
    refs={}
    for ref in [122,161,555,560,556]:
        kind,ri,ci,ni=cover['nodes'][ref]
        assert kind=='s'
        row=inherited['rows'][ri]
        rawnode=row['cells'][ci]['nodes'][ni]
        refs[ref]=(F(rawnode['tau'])/F(row['delta']),list(map(F,rawnode['P'])))
    n12a,n12b=refs[122],refs[161]
    old15=[refs[r] for r in (555,560,556)]
    a,b,c=[n[0] for n in old15]
    assert n12a[0]<=a<sl<b<su<c<=n12b[0]
    v=mix(rowvector(inherited['rows'][12]),rowvector(inherited['rows'][15]),theta)
    D=price(v)
    assert D>0
    ell,beta=v[:2]
    t_candidates=[(tl*tl-2*ell*tl,tl),(tu*tu-2*ell*tu,tu)]
    tmax,twhere=max(t_candidates,key=lambda p:p[0])
    outside=tmax+2*beta*beta/EPS+PAD
    # The unchanged archived evaluation first chords each source to sl/su,
    # then uses the single chord across this box's whole tau interval.
    oldPm=mix(interpolate(n12a,n12b,sl),interpolate(old15[0],old15[1],sl),theta)
    oldPp=mix(interpolate(n12a,n12b,su),interpolate(old15[1],old15[2],su),theta)
    old_x=[]
    for x in (xl,xu):
        q=chord_polynomial(sl,su,expectation(oldPm,x),expectation(oldPp,x),D)
        upper,where,candidates=qmax(q,sl,su)
        old_x.append(dict(x=x,quadratic=q,maximum=upper,tau_at_maximum=where,candidates=candidates))
    old_upper=outside+max(item['maximum'] for item in old_x)
    assert old_upper==F(box['upper']),'Original box upper does not reconstruct exactly'
    # New law polynomials correspond to precisely the three inherited row-15
    # physical tau nodes, with the shared-completion coefficient repriced.
    new15=[]
    law_inputs=[]
    selection_path=None
    for label,expected,node in zip(['c0n5','c1n5','c0n6'],[[15,0,5],[15,1,5],[15,0,6]],old15):
        path=root/'law'/f'{args.law_prefix}-{label}.json'
        ledgerpath=root/'law'/f'{args.law_prefix}-{label}-ledger.json'
        cert=json.loads(path.read_text());ledger=json.loads(ledgerpath.read_text())
        assert cert['format']=='rankone-reused-stein/v1' and cert['node_ref']==expected
        P=list(map(F,cert['new_P']))
        assert P==list(map(F,ledger['new_P'])) and ledger['node_ref']==expected
        assert ledger['status']=='PASS_REAL_REUSED_STEIN_NODE_CONDITIONAL_ON_SOURCE_CAPS'
        assert ledger['input_sha256']==sha(path),'Law-node ledger is not bound to this certificate'
        assert F(ledger['tau'])==node[0]
        assert P[1]>=0 and P[4]>=0
        xa,xb=map(F,cert['x_interval'])
        assert xa<=xl<xu<=xb
        selection=repo/cert['source_selection']
        assert sha(selection)==cert['source_selection_sha256']
        if selection_path is None:selection_path=selection
        assert selection==selection_path
        selection_data=json.loads(selection.read_text())
        assert selection_data['row_index']==15
        construction=selection_data['construction']
        for construction_key,input_key in [('bank','repriced_bank'),('node_table','repriced_nodes'),('inherited','inherited')]:
            assert (repo/construction[construction_key]).resolve()==paths[input_key].resolve()
            assert construction[construction_key+'_sha256']==sha(paths[input_key]),'Source selection is not bound to the current repriced inputs'
        new15.append((node[0],P))
        law_inputs.append(dict(certificate=str(path.relative_to(repo)),certificate_sha256=sha(path),
            ledger=str(ledgerpath.relative_to(repo)),ledger_sha256=sha(ledgerpath),
            node_ref=expected,tau=node[0],new_P=P,
            uniform_node_saving=ledger['uniform_moment_bound_saving']))
    # The same endpoint profiles supply the corrected chords on [a,b],[b,c].
    # Their corrections use these ORIGINAL bridge endpoints, including when
    # the actual box clips the bridge to [sl,b] or [b,su].
    subboxes=[]
    old_split_subboxes=[]
    gain_floors=[]
    for segment,(low,high,n0,n1) in enumerate([(sl,b,new15[0],new15[1]),(b,su,new15[1],new15[2])]):
        bridge_a,bridge_b=n0[0],n1[0]
        p0=mix(interpolate(n12a,n12b,bridge_a),n0[1],theta)
        p1=mix(interpolate(n12a,n12b,bridge_b),n1[1],theta)
        xx=[]
        for x in (xl,xu):
            q=chord_polynomial(bridge_a,bridge_b,expectation(p0,x),expectation(p1,x),D,weighted_A)
            maximum,where,candidates=qmax(q,low,high)
            # The x^3 coefficient is nonnegative for every interpolated P;
            # therefore any positive-x stationary point is a minimum and x
            # maxima occur at the two endpoints, despite unrestricted a4.
            xx.append(dict(x=x,quadratic=q,maximum=maximum,tau_at_maximum=where,candidates=candidates))
        upper=outside+max(item['maximum'] for item in xx)
        subboxes.append(dict(tau_bounds=[low,high],bridge_endpoints=[bridge_a,bridge_b],
            unchanged_common_price=D,weighted_semiconvex_coefficient=weighted_A,
            x_evaluations=xx,upper=upper))
        # Free refinement control: exactly the same two subboxes and old law
        # nodes, with the original convex-Psi chord (zero semiconvex cost).
        oldn0,oldn1=old15[segment],old15[segment+1]
        oldp0=mix(interpolate(n12a,n12b,bridge_a),oldn0[1],theta)
        oldp1=mix(interpolate(n12a,n12b,bridge_b),oldn1[1],theta)
        old_xx=[]
        for x in (xl,xu):
            q=chord_polynomial(bridge_a,bridge_b,expectation(oldp0,x),expectation(oldp1,x),D)
            maximum,where,candidates=qmax(q,low,high)
            old_xx.append(dict(x=x,quadratic=q,maximum=maximum,tau_at_maximum=where,candidates=candidates))
        old_split_subboxes.append(dict(tau_bounds=[low,high],bridge_endpoints=[bridge_a,bridge_b],
            x_evaluations=old_xx,upper=outside+max(item['maximum'] for item in old_xx)))
        # Independent pointwise gain floor. Both endpoints use the new test;
        # the chord saves at least the smaller exact endpoint moment saving.
        # Paying the full bridge's A*(width)^2/4 is conservative on the clipped
        # box interval and keeps attribution independent of maximum locations.
        endpoint_savings=[uniform_node_saving(oldnode[1],newnode[1],xl,xu)
                          for oldnode,newnode in zip([oldn0,oldn1],[n0,n1])]
        source_gain=min(item[0] for item in endpoint_savings)
        source_cost=A*(bridge_b-bridge_a)**2/4
        gain_floors.append(dict(tau_bounds=[low,high],endpoint_moment_savings=endpoint_savings,
            minimum_endpoint_saving=source_gain,maximum_unweighted_semiconvex_cost=source_cost,
            uniform_weighted_rankone_gain=theta*(source_gain-source_cost)))
    new_upper=max(s['upper'] for s in subboxes)
    old_split_upper=max(s['upper'] for s in old_split_subboxes)
    saving=old_upper-new_upper
    free_refinement_saving=old_upper-old_split_upper
    net_rankone_saving=old_split_upper-new_upper
    uniform_rankone_floor=min(g['uniform_weighted_rankone_gain'] for g in gain_floors)
    assert saving==free_refinement_saving+net_rankone_saving
    assert free_refinement_saving>=0 and net_rankone_saving>0
    assert uniform_rankone_floor>0 and net_rankone_saving>=uniform_rankone_floor
    result=dict(version='rankone-box8150-v1',status='PASS_EXACT_LOCAL_BOX_RECONSTRUCTION',scope=__doc__,
        box_index=8150,bounds=bounds,weights={12:1-theta,15:theta},
        source_node_refs={12:[122,161],15:[555,560,556]},physical_tau_nodes={12:[n12a[0],n12b[0]],15:[a,b,c]},
        shared_v=v,unchanged_common_price=D,active_row_semiconvex_coefficient=A,
        weighted_semiconvex_coefficient=weighted_A,
        pad_ledger='Every law P uses the raw source F-PAD; each row bound therefore has +PAD. Row weights sum to one, so exactly one final external PAD is included. No additional source or bridge pad is added.',
        external_PAD=PAD,constant_outside_tau_maximum=outside,
        t_maximum=tmax,t_at_maximum=twhere,t_candidates=t_candidates,
        old_x_evaluations=old_x,old_upper=old_upper,new_subboxes=subboxes,
        old_split_subboxes=old_split_subboxes,old_split_upper=old_split_upper,
        attribution=dict(old_whole_to_old_split_gain=free_refinement_saving,
            old_split_to_new_rankone_gain_after_semiconvex_cost=net_rankone_saving,
            independent_uniform_rankone_gain_floor=uniform_rankone_floor,
            old_whole_to_old_split_gain_decimal=float(free_refinement_saving),
            old_split_to_new_rankone_gain_decimal=float(net_rankone_saving),
            independent_uniform_rankone_gain_floor_decimal=float(uniform_rankone_floor),
            bridge_gain_floor_ledger=gain_floors),
        new_upper=new_upper,saving=saving,saving_positive=saving>0,
        old_upper_decimal=float(old_upper),new_upper_decimal=float(new_upper),saving_decimal=float(saving),
        source_selection=str(selection_path.relative_to(repo)),source_selection_sha256=sha(selection_path),
        inputs={name:dict(path=str(path.relative_to(repo)),sha256=sha(path)) for name,path in paths.items()},
        new_law_node_inputs=law_inputs,
        remaining_hypotheses=['The generalized one-active-row Young reduction and shared-completion repricing lemma.',
            'The recorded Gaussian source-cap, semiconvex interpolation and moment/Stein law-node proofs.',
            'No statement about the other cover boxes or any improved global lower endpoint.'])
    encoded=encode(result)
    if args.check:
        assert encoded==json.loads(args.out.read_text()),'Saved local-box result mismatch'
    else:
        args.out.parent.mkdir(parents=True,exist_ok=True)
        args.out.write_text(json.dumps(encoded,indent=2)+'\n')
    print(json.dumps({k:encoded[k] for k in ['status','old_upper_decimal','new_upper_decimal','saving_decimal','saving_positive']},indent=2),flush=True)
    print('Oldsplit upper:',float(old_split_upper),'free refinement:',float(free_refinement_saving),
          'net rank-one:',float(net_rankone_saving),'independent uniform floor:',float(uniform_rankone_floor),flush=True)


if __name__=='__main__':
    main()
