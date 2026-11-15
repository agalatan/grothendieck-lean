#!/usr/bin/env python3
"""codex-a713: local guillotine-boundary improvements, exact acceptance."""
import sys
sys.dont_write_bytecode=True
from pathlib import Path
# -I deliberately omits the script directory; allow only this audited directory.
sys.path.insert(0, str(Path(__file__).resolve().parent))
from fractions import Fraction as Q
import json,copy,time,argparse
from improvement_cover import read_current,partition,reprice,save,encode,OUT
from needle_cover_lean import serialize

def dom(b):return tuple(map(Q,b['bounds']))

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--input',default='v2');ap.add_argument('--label',default='v3')
    ap.add_argument('--seconds',type=int,default=150);ap.add_argument('--steps',type=int,default=12)
    a=ap.parse_args();began=time.monotonic()
    c,original,_,_,maps,_=read_current()
    cover=json.loads((OUT/f'improvement_cover_{a.input}.json').read_text())
    tokens=json.loads((OUT/f'improvement_certificate_{a.input}.json').read_text())['partition_tokens']
    partition(tokens,cover['boxes']);boxes={dom(b):b for b in cover['boxes']};pos=0;leaves={}
    sys.setrecursionlimit(50000)
    def parse(d,parent=None):
        nonlocal pos
        tok=tokens[pos];pos+=1;n={'dom':d,'parent':parent}
        if tok=='.':n['box']=boxes[d];leaves[d]=n;return n
        ks,ms=tok.split(',');k=int(ks);m=Q(ms);lo=list(d);hi=list(d);lo[2*k+1]=m;hi[2*k]=m
        n.update(axis=k,mid=m,left=parse(tuple(lo),n),right=parse(tuple(hi),n));return n
    root=parse((Q(0),Q(9,10),Q(0),Q(973612157,10**9),Q(0),Q(31,4)))
    def descendants(n):
        if 'box'in n:return [n]
        return descendants(n['left'])+descendants(n['right'])
    def flat(n,ts,bs):
        if 'box'in n:ts.append('.');bs.append(n['box']);return
        ts.append(f"{n['axis']},{n['mid']}");flat(n['left'],ts,bs);flat(n['right'],ts,bs)
    ledger=[]
    for step in range(a.steps):
        if time.monotonic()-began>a.seconds:break
        all_leaves=descendants(root);worst=max(all_leaves,key=lambda n:Q(n['box']['upper']))
        oldmax=Q(worst['box']['upper']);anc=[];n=worst['parent']
        while n is not None:anc.append(n);n=n['parent']
        best=None
        for node in anc:
            if time.monotonic()-began>a.seconds:break
            k=node['axis'];m=node['mid'];sub=descendants(node)
            affected=[n for n in sub if m in dom(n['box'])[2*k:2*k+2]]
            if len(affected)>300:continue
            affected_ids={id(n) for n in affected}
            outside=max((Q(n['box']['upper']) for n in all_leaves if id(n) not in affected_ids),default=Q(0))
            if outside>=oldmax:continue
            low=max(dom(n['box'])[2*k] for n in affected if dom(n['box'])[2*k+1]==m)
            high=min(dom(n['box'])[2*k+1] for n in affected if dom(n['box'])[2*k]==m)
            points=[m+(edge-m)*f for edge in (low,high) for f in (Q(1,16),Q(1,8),Q(1,4),Q(1,2),Q(3,4),Q(7,8))]
            for newm in points:
                changed=[];upper=outside;valid=True
                for leaf in affected:
                    b=copy.deepcopy(leaf['box'])
                    for j in (2*k,2*k+1):
                        if Q(b['bounds'][j])==m:b['bounds'][j]=str(newm)
                    if k==1 and 'choice'in b:
                        ch=b['choice'];s0,s1=map(Q,ch.get('scale_domain',leaf['box']['bounds'][2:4]))
                        ch['scale_domain']=[str(min(s0,Q(b['bounds'][2]))),str(max(s1,Q(b['bounds'][3])))]
                    try:v=c.box_upper(b)
                    except AssertionError:valid=False;break
                    b['upper']=str(v);upper=max(upper,v);changed.append((leaf,b))
                    if upper>=oldmax:valid=False;break
                if valid and (best is None or upper<best[0]):best=(upper,node,newm,changed)
        if best is None:break
        upper,node,newm,changed=best
        record=dict(axis=node['axis'],old_mid=str(node['mid']),new_mid=str(newm),
            old_upper=str(oldmax),new_upper=str(upper),changed_boxes=len(changed),
            changes=[dict(before=leaf['box'],after=b) for leaf,b in changed])
        node['mid']=newm
        for leaf,b in changed:leaf['box']=b
        ts=[];bs=[];flat(root,ts,bs);partition(ts,bs)
        ledger.append(record)
        print(json.dumps(dict(event='boundary_accepted',step=step,axis=node['axis'],changed=len(changed),
            B=float(upper),reciprocal=float(1/upper),seconds=time.monotonic()-began)),flush=True)
    newtokens=[];newboxes=[];flat(root,newtokens,newboxes);cover['boxes']=newboxes
    partition(newtokens,newboxes);upper,binding=reprice(c,cover,True)
    inherited,im,nm,em=maps;strings=serialize(cover,inherited,im,nm,em)
    (OUT/f'improvement_ledger_{a.label}.json').write_text(json.dumps(encode(dict(agent='codex-a713',moves=ledger)),indent=2)+'\n')
    record=dict(original_B=original['target'],original_L=original['lower'],input_cover=f'improvement_cover_{a.input}.json',
        actual_upper=str(upper),binding_boxes=binding,boxes=len(newboxes),accepted_moves=len(ledger),
        seconds=time.monotonic()-began,operation='local partition-boundary changes with exact rational node/chord checks')
    save(cover,strings,newtokens,record,a.label)

if __name__=='__main__':main()
