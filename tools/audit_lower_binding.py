#!/usr/bin/env python3
"""Read-only reconstruction of master's lower certificate and its binding rules.

Runs the trusted data generator only up to its emission marker, then compares
every reconstructed batch and box with the committed Lean data. No certificate
is changed. All envelope arithmetic uses Fraction; no optimization is trusted.
The pointwise direct-chord comparison is a diagnostic, not a replacement cover.
"""
import argparse
from collections import Counter, defaultdict
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import re
import sys
import time


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def outq(q):
    q = Q(q)
    return {"exact": str(q), "float": float(q)}


def qargmax(c0, c1, c2, lo, hi):
    candidates = [lo, hi]
    if c2 < 0 and lo <= -c1 / (2*c2) <= hi:
        candidates.append(-c1 / (2*c2))
    point = max(candidates, key=lambda z: c0+c1*z+c2*z*z)
    return point, c0+c1*point+c2*point*point


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[1])
    ap.add_argument("--certificate", default="cert-jointmoment-lifted-codex")
    ap.add_argument("--output", type=Path, required=True)
    args = ap.parse_args()
    root = args.repo.resolve()
    cert = root / "handoff/lower-stein" / args.certificate
    dest = args.output.resolve()
    dest.mkdir(parents=True, exist_ok=True)
    started = time.time()
    gen = root / "tools/gen_lower_mixed.py"
    mixed = root / "Grothe/Lower/MixedData.lean"
    before = sha(mixed)
    text = gen.read_text()
    assert text.count("# ----- emit") == 1
    prefix = text.split("# ----- emit")[0]
    assert "write_text" not in prefix and "write_bytes" not in prefix
    namespace = {"__file__": str(gen), "__name__": "binding_audit_generator"}
    oldargv = sys.argv
    sys.argv = [str(gen), str(cert)]
    try:
        exec(compile(prefix, str(gen), "exec"), namespace)
    finally:
        sys.argv = oldargv
    n = namespace
    assert sha(mixed) == before
    lean = mixed.read_text()
    actual_boxes = re.findall(r'^\s*\[?"([cbm]\|[^"\n]*)"', lean, re.M)
    assert actual_boxes == n["boxes"], "archive/generator differs from committed boxes"
    batchtext = ",\n".join(
        f"  ⟨{b['i']}, {b['j']}, {n['q'](b['th'])}, {n['q'](b['smax'])},\n"
        f"   {n['lean_str'](b['nodes'])},\n   {n['lean_str'](b['vs'])},\n"
        f"   {'true' if b['spec'] else 'false'},\n   [" +
        ",\n    ".join(n['lean_str'](w) for w in b['wits']) + "]⟩"
        for b in n["batches"])
    actual_batchtext = lean.split("def mixedBatches : List JBatch :=\n[", 1)[1].split("\n\n/-- Boxes", 1)[0]
    assert actual_batchtext == batchtext + "]", "archive/generator differs from committed batches"
    print("PASS read-only generator; exact committed batches and boxes", flush=True)

    def node(ref):
        z = ref.split(',')
        if z[0] == 'z':
            return n['rowTNode'](n['rows'][int(z[1])], None)
        if z[0] == 's':
            return n['rowTNode'](n['rows'][int(z[1])], (int(z[2]), int(z[3])))
        return n['batches'][int(z[1])]['tnodes'][int(z[2])][:2]

    def component(s, bb):
        head, *refs = s.split(';')
        si, sj, st, ss0, ss1 = head.split(',')
        i, j, th, s0, s1 = int(si), int(sj), Q(st), Q(ss0), Q(ss1)
        nodes = [node(v) for v in refs]
        p0 = n['tchord'](*nodes[:2], s0)
        p1 = n['tchord'](*nodes[2:], s1)
        pm = n['tchord']((s0,p0), (s1,p1), bb[2])
        pp = n['tchord']((s0,p0), (s1,p1), bb[3])
        return {'i':i, 'j':j, 'theta':th, 'scale_domain':(s0,s1),
                'refs':refs, 'nodes':nodes, 'v':n['vmix'](th,n['VR'][i],n['VR'][j]),
                'pm':pm, 'pp':pp}

    data = []
    for index, s in enumerate(actual_boxes):
        kind, bounds, *tail = s.split('|')
        bb = tuple(map(Q,bounds.split(',')))
        if kind == 'c':
            i,j,th=tail[0].split(','); i,j,th=int(i),int(j),Q(th)
            a,b=n['envs'][i],n['envs'][j]
            val=n['quadMax']((1-th)*a[2]+th*b[2]-2*(1-th)*th*(a[1]-b[1])**2/n['EPS'],
                             -2*((1-th)*a[0]+th*b[0]),Q(1),*bb[:2])
            data.append({'index':index,'kind':kind,'bounds':bb,'value':val})
            continue
        if kind == 'b':
            comps=[component(tail[0],bb)]; weights=[Q(1)]
            v,pm,pp=comps[0]['v'],comps[0]['pm'],comps[0]['pp']
        else:
            th=Q(tail[0]); weights=[1-th,th]
            comps=[component(z,bb) for z in tail[1:]]
            v=n['vmix'](th,comps[0]['v'],comps[1]['v'])
            pm=n['lin'](1-th,th,comps[0]['pm'],comps[1]['pm'])
            pp=n['lin'](1-th,th,comps[0]['pp'],comps[1]['pp'])
        value=n['boxVal'](v,pm,pp,*bb)
        assert value==Q(n['cov']['boxes'][index]['upper'])
        tt,tval=qargmax(Q(0),-2*v[0],Q(1),*bb[:2])
        candidates=[]
        for xx in bb[4:]:
            lo,hi=n['J'](pm,xx),n['J'](pp,xx)
            slope=(hi-lo)/(bb[3]-bb[2])
            tau,vv=qargmax(lo-slope*bb[2],slope,-n['vprice'](v),*bb[2:4])
            candidates.append((vv,tau,xx))
        vv,tau,xx=max(candidates)
        assert tval+2*v[1]**2/n['EPS']+vv+n['PAD']==value
        data.append(dict(index=index,kind=kind,bounds=bb,value=value,point=(tt,tau,xx),
                         v=v,pm=pm,pp=pp,comps=comps,weights=weights))
    assert len(data)==8756
    assert max(d['value'] for d in data)==n['worst']
    ordered=sorted(data,key=lambda d:d['value'],reverse=True)
    maximum=ordered[0]['value']; target=n['B']
    print('PASS all 8756 exact box bounds; maximum',float(maximum),flush=True)

    def rowweights(c):
        w=defaultdict(Q); w[c['i']]+=1-c['theta'];w[c['j']]+=c['theta']
        return tuple((i,q) for i,q in sorted(w.items()) if q)

    # Top six rules plus the worst representatives of different parameter regimes.
    selected=ordered[:6]
    seen={d['index'] for d in selected}
    for d in ordered:
        if 'point' not in d: continue
        bucket=int(float(d['point'][2])*4)
        key=(tuple(rowweights(c) for c in d['comps']),bucket)
        if not any('point' in e and (tuple(rowweights(c) for c in e['comps']),
                   int(float(e['point'][2])*4))==key for e in selected):
            selected.append(d);seen.add(d['index'])
        if len(selected)>=12:break

    def direct_chord(c,tau,xx,xcap):
        points=[]; wanted=(c['i'],c['j'],c['theta'])
        for bi,b in enumerate(n['batches']):
            if n['samePot'](*wanted,b['i'],b['j'],b['th']):
                points.extend((t,n['J'](p,xx),f'b,{bi},{j}') for j,(t,p,xc) in enumerate(b['tnodes']) if xc>=xcap)
        w=rowweights(c)
        if len(w)==1:
            i=w[0][0];r=n['rows'][i]
            z=n['rowTNode'](r,None); points.append((z[0],n['J'](z[1],xx),f'z,{i}'))
            for ci,cell in enumerate(r['cells']):
                for ni in range(len(cell['nodes'])):
                    z=n['rowTNode'](r,(ci,ni));points.append((z[0],n['J'](z[1],xx),f's,{i},{ci},{ni}'))
        best=None
        for a in points:
            if a[0]>tau:continue
            for b in points:
                if b[0]<tau:continue
                v=a[1] if a[0]==b[0] else ((b[0]-tau)*a[1]+(tau-a[0])*b[1])/(b[0]-a[0])
                if best is None or v<best[0]:best=(v,a[2],b[2])
        assert best is not None
        return best

    records=[]
    for d in selected:
        if 'point' not in d:continue
        tt,tau,xx=d['point'];v=d['v'];sl,su=d['bounds'][2:4]
        p=n['tchord']((sl,d['pm']),(su,d['pp']),tau)
        terms=[p[0],p[1]*n['RHO'],p[2],p[3]*(2+xx*xx),p[4]*(6+9*xx*xx+n['C6']*xx**3)]
        profile=[];bestphi=Q(0);rw=defaultdict(Q)
        for wt,c in zip(d['weights'],d['comps']):
            cp=n['tchord']((sl,c['pm']),(su,c['pp']),tau)
            best,a,b=direct_chord(c,tau,xx,d['bounds'][5]);bestphi+=wt*best
            for i,q in rowweights(c):rw[i]+=wt*q
            profile.append({'weight':str(wt),'rows':[[i,str(q)] for i,q in rowweights(c)],
                            'scale_domain':list(map(str,c['scale_domain'])),'node_refs':c['refs'],
                            'node_scales':[str(t) for t,p in c['nodes']],
                            'current_potential_bound':outq(n['J'](cp,xx)),
                            'best_direct_chord':{'value':outq(best),'refs':[a,b]}})
        assert sum(terms)>=bestphi
        # Complete the same pinned gate, without spending its retained square twice.
        m11,m12,m13,c1,c2,c3=v[3];h1,h2=m12+v[5],m13+v[6];det=c1*c3-c2*c2
        z1=-(c3*h1-c2*h2)/det;z2=-(-c2*h1+c1*h2)/det
        beta_variance=sum(w*Q(n['rows'][i]['beta'])**2 for i,w in rw.items())-v[1]**2
        rec={
            'index':d['index'],'kind':d['kind'],'bounds':list(map(str,d['bounds'])),
            'envelope_argmax':dict(zip(['t','tau','x'],map(str,d['point']))),
            'status':'Exact argmax of this certified rule; not an actual response or a maximizing law.',
            'upper':outq(d['value']),'headline_slack':outq(target-d['value']),
            'rows':[[i,str(w)] for i,w in sorted(rw.items()) if w],
            'row_parameters':{'ell':str(v[0]),'beta':str(v[1]),'price':str(n['vprice'](v))},
            'potential_polynomial_at_point':list(map(str,p)),
            'ledger':{'t_part':outq(tt*tt-2*v[0]*tt),'beta_completion':outq(2*v[1]**2/n['EPS']),
                      'moment_majorant':outq(sum(terms)),'pinned_price':outq(-n['vprice'](v)*tau*tau),
                      'pad':outq(n['PAD']),'moment_terms':dict(zip(['constant','sqrt','second','fourth','sixth'],map(outq,terms))),
                      'direct_chord_saving_at_point':outq(sum(terms)-bestphi),
                      'beta_mixture_saving_already_used':outq(2*beta_variance/n['EPS'])},
            'retained_squares':{'gate_minimizer_Y_over_p':[str(z1),str(z2)],
                                'C':[str(c1),str(c2),str(c3)],
                                'h_square_beta_over_epsilon':str(v[1]/n['EPS']),
                                'actual_values':'Not determined by the certificate data.'},
            'components':profile}
        assert sum(Q(rec['ledger'][k]['exact']) for k in ['t_part','beta_completion','moment_majorant','pinned_price','pad'])==d['value']
        records.append(rec)
    near={}
    for eps in [Q(1,10**7),Q(1,10**6),Q(1,10**5)]:
        cells=[d for d in data if d['value']>=maximum-eps]
        near[str(eps)]={'count':len(cells),'bounding_box':[str(f(d['bounds'][k] for d in cells)) for k in range(6) for f in [min if k%2==0 else max]]}
    result={'scope':'Exact replay of generated finite data and envelope decomposition; no source integrals or global response realization are recomputed.',
            'inputs':{'generator_sha256':sha(gen),'committed_mixed_sha256':before,
                      'cover_sha256':sha(cert/'cover.json'),'inherited_sha256':sha(cert/'inherited.json'),
                      'source_directory':str(cert)},
            'boxes':len(data),'batches':len(n['batches']),'nodes':sum(len(b['tnodes']) for b in n['batches']),
            'headline_cap':outq(target),'exact_max':outq(maximum),'headline_rounding':outq(target-maximum),
            'near_maximum':near,'kind_counts':dict(Counter(d['kind'] for d in data)),
            'top30':[{'index':d['index'],'upper':float(d['value']),'bounds':list(map(str,d['bounds']))} for d in ordered[:30]],
            'selected':records,'elapsed_seconds':time.time()-started}
    (dest/'binding-audit.json').write_text(json.dumps(result,indent=2)+'\n')
    # Self-contained data for subsequent numerical diagnostics; retain original witnesses.
    diag={'baseline':result['inputs'],'selected':records,'rows':n['rows'],
          'newnodes':n['cov']['newnodes'],'gates':json.loads((cert/'gates.json').read_text())}
    (dest/'diagnostic-input.json').write_text(json.dumps(diag,separators=(',',':'))+'\n')
    print('MAX',float(maximum),'headline allowance',float(target-maximum),flush=True)
    for r in records:
        print('BINDING',r['index'],*[round(float(Q(r['envelope_argmax'][k])),9) for k in ['t','tau','x']],
              'cap',r['upper']['float'],'chord saving',r['ledger']['direct_chord_saving_at_point']['float'],flush=True)
    print('PASS all ledger sums; wrote',dest,'seconds',time.time()-started,flush=True)


if __name__=='__main__':main()
