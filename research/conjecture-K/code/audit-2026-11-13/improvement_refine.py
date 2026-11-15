#!/usr/bin/env python3
"""codex-a713: adaptive cover splitting/repricing from existing certified nodes.
Floating mixture search proposes weights; every acceptance is exact rational.
"""
import sys
sys.dont_write_bytecode=True
from pathlib import Path
# -I deliberately omits the script directory; allow only this audited directory.
sys.path.insert(0, str(Path(__file__).resolve().parent))
from fractions import Fraction as Q
import copy,json,time,argparse,heapq
from improvement_cover import read_current,partition,reprice,save,encode,OUT
from needle_cover_refine import mix,value,value_float,capvalue,minimize_weight
from needle_cover_lean import serialize

def dom(b):return tuple(map(Q,b['bounds']))

def optimize(c,b):
    bb=dom(b)
    if 'cap_choice' in b:
        i,j,t=b['cap_choice'];aa,ab=c.env[i],c.env[j]
        def ev(th,fl=False):
            return capvalue(tuple(map(float,aa)) if fl else aa,
                tuple(map(float,ab)) if fl else ab,th,
                float(bb[0]) if fl else bb[0],float(bb[1]) if fl else bb[1])
        th=minimize_weight(ev,Q(t));b['cap_choice'][2]=str(th);b['upper']=str(ev(th));return b
    if 'choice' not in b:return None
    ch=b['choice'];gs=ch['groups']
    if len(gs)!=2:return None
    domain=tuple(map(Q,ch.get('scale_domain',bb[2:4])))
    parts=[c.component(rr,g,bb,domain) for rr,g in zip(ch['refs'],gs)]
    v0,v1=[c.gv[g] for g in gs];(p0,q0),(p1,q1)=parts
    ff=[tuple(map(float,x)) for x in (bb,v0,v1,p0,q0,p1,q1)]
    def ev(th,fl=False):
        if fl:
            fb,fv0,fv1,fp0,fq0,fp1,fq1=ff
            return value_float(fb,mix(th,fv0,fv1),mix(th,fp0,fp1),mix(th,fq0,fq1))
        return value(bb,mix(th,v0,v1),mix(th,p0,p1),mix(th,q0,q1))
    th=minimize_weight(ev,Q(ch['theta']));ch['theta']=str(th);b['upper']=str(ev(th))
    assert c.box_upper(b)==Q(b['upper'])
    return b

def trial(c,b,axis):
    bb=dom(b);mid=(bb[2*axis]+bb[2*axis+1])/2;children=[]
    for side in (0,1):
        child=copy.deepcopy(b)
        if 'choice' in child:
            child['choice'].setdefault('scale_domain',list(map(str,bb[2:4])))
        child['bounds'][2*axis+(1-side)]=str(mid)
        child=optimize(c,child)
        if child is None:return None
        children.append(child)
    return max(Q(ch['upper']) for ch in children),axis,mid,children

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--steps',type=int,default=250)
    parser.add_argument('--seconds',type=int,default=300);parser.add_argument('--label',default='v2')
    parser.add_argument('--input',default='v1')
    a=parser.parse_args();started=time.monotonic()
    c,original,_,_,maps,_=read_current()
    cover=json.loads((OUT/f'improvement_cover_{a.input}.json').read_text())
    cert=json.loads((OUT/f'improvement_certificate_{a.input}.json').read_text())
    tokens=cert['partition_tokens'];partition(tokens,cover['boxes'])
    boxes={dom(b):b for b in cover['boxes']};leaves={};pos=0
    sys.setrecursionlimit(50000)
    def tree(domain):
        nonlocal pos
        tok=tokens[pos];pos+=1
        node={'dom':domain}
        if tok=='.':leaves[domain]=node;return node
        k,m=tok.split(',');k=int(k);m=Q(m)
        left=list(domain);right=list(domain);left[2*k+1]=m;right[2*k]=m
        node.update(axis=k,mid=m,left=tree(tuple(left)),right=tree(tuple(right)))
        return node
    root=tree((Q(0),Q(9,10),Q(0),Q(973612157,10**9),Q(0),Q(31,4)))
    assert pos==len(tokens) and set(leaves)==set(boxes)
    heap=[];counter=0;ledger=[];frozen=[]
    def push(b):
        nonlocal counter
        heapq.heappush(heap,(-float(Q(b['upper'])),counter,dom(b)));counter+=1
    for b in boxes.values():push(b)
    for step in range(a.steps):
        if time.monotonic()-started>a.seconds:break
        _,_,key=heapq.heappop(heap);b=boxes[key];old=Q(b['upper'])
        opts=[x for k in (0,1,2) if (x:=trial(c,b,k)) is not None]
        if not opts or min(x[0] for x in opts)>=old-Q(1,10**15):
            frozen.append(dict(bounds=list(map(str,key)),upper=str(old)))
            continue
        new,axis,mid,children=min(opts,key=lambda x:x[0])
        parent=leaves.pop(key);del boxes[key]
        parent.update(axis=axis,mid=mid)
        for side,child in zip(('left','right'),children):
            d=dom(child);assert d not in boxes
            boxes[d]=child;parent[side]={'dom':d};leaves[d]=parent[side];push(child)
        ledger.append(dict(parent=b,axis=axis,mid=str(mid),old_upper=str(old),new_upper=str(new),children=children))
        if len(ledger)%10==0:
            top=max(Q(x['upper']) for x in boxes.values())
            print(json.dumps(dict(event='progress',step=step,accepted=len(ledger),frozen=len(frozen),
                boxes=len(boxes),B=float(top),reciprocal=float(1/top),seconds=time.monotonic()-started)),flush=True)
    newtokens=[];newboxes=[]
    def flatten(node):
        if 'axis' not in node:newtokens.append('.');newboxes.append(boxes[node['dom']]);return
        newtokens.append(f"{node['axis']},{node['mid']}");flatten(node['left']);flatten(node['right'])
    flatten(root);cover['boxes']=newboxes
    partition(newtokens,newboxes)
    upper,binding=reprice(c,cover,True)
    inherited,im,nm,em=maps
    strings=serialize(cover,inherited,im,nm,em)
    record=dict(original_B=original['target'],original_L=original['lower'],
        input_cover=f'improvement_cover_{a.input}.json',actual_upper=str(upper),binding_boxes=binding,
        boxes=len(newboxes),accepted_splits=len(ledger),frozen=len(frozen),
        seconds=time.monotonic()-started,
        operation='bisection of an existing box and exact repricing of its existing two-component mixture')
    (OUT/f'improvement_ledger_{a.label}.json').write_text(json.dumps(encode(dict(agent='codex-a713',splits=ledger,frozen=frozen)),indent=2)+'\n')
    save(cover,strings,newtokens,record,a.label)

if __name__=='__main__':main()
