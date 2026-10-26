#!/usr/bin/env python3
"""Export only the refined box/partition data, reusing checked mixed batches.

Reconstructs the canonical node-reference map used by gen_lower_mixed.py and
compares EVERY original box string against committed MixedData.lean before
emitting any new data. The 43 replacement grids are exactly replayed first.
No canonical data file, Gaussian integration, or law-node proof is changed.
"""
import argparse
import copy
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import re
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from needle_cover_refine import Campaign, verify

def qs(v):return str(Q(v))
def potential(n):
    i,j,t=int(n['i']),int(n['j']),Q(n['theta'])
    if i==j or t==0:return i,i,Q(0)
    if t==1:return j,j,Q(0)
    return (i,j,t) if i<j else (j,i,1-t)

def canonical_maps(cov,inh):
    used=set()
    for r in cov['nodes']:
        if r[0]=='b':used.add(int(r[1]))
    for b in cov['boxes']:
        if 'original'not in b:continue
        kind,_,*rr=inh['boxes'][b['original']].split('|')
        if kind=='j':used.add(int(rr[0]))
        elif kind=='m':used.update(map(int,rr[0].split(',')[:2]))
    inhmap={old:new for new,old in enumerate(sorted(used))}
    groups={}
    for name,node in cov['newnodes'].items():
        groups.setdefault(potential(node)+(tuple(map(Q,node['rv'])),),[]).append(name)
    newmap={}
    for bi,(key,names) in enumerate(sorted(groups.items(),key=lambda kv:(kv[0][:3],len(kv[0][3]),kv[0][3]))):
        names.sort(key=lambda name:(Q(cov['newnodes'][name]['tau']),name))
        for k,name in enumerate(names):newmap[name]=(len(inhmap)+bi,k)
    return inhmap,newmap

def node_string(ref,inhmap,newmap,extra_map=None):
    if ref[0]in['s','z']:return ','.join(map(str,ref))
    if ref[0]=='b':return f'b,{inhmap[int(ref[1])]},{int(ref[2])}'
    if ref[0]=='u':
        assert extra_map is not None and ref[1] in extra_map
        b,k=extra_map[ref[1]];return f'b,{b},{k}'
    assert ref[0]=='n';b,k=newmap[ref[1]];return f'b,{b},{k}'

def component(i,j,t,s0,s1,refs):
    assert len(refs)==4
    return f'{i},{j},{qs(t)},{qs(s0)},{qs(s1)};'+';'.join(refs)

def serialize(cov,inh,inhmap,newmap,extra_map=None):
    nodes=[node_string(r,inhmap,newmap,extra_map) for r in cov['nodes']];out=[]
    def src(r,s):
        ns=list(map(int,s.split(',')));assert len(ns)==8
        return [f'z,{r}' if c<0 else f's,{r},{c},{n}' for c,n in zip(ns[::2],ns[1::2])]
    def bat(b,s):return [f'b,{inhmap[b]},{int(n)}' for n in s.split(',')]
    def group(g):
        w=[(int(i),Q(a)) for i,a in cov['groups'][g]['weights']]
        return (w[0][0],w[0][0],Q(0)) if len(w)==1 else (w[0][0],w[1][0],w[1][1])
    for b in cov['boxes']:
        bounds=','.join(map(qs,b['bounds']));sl,su=map(Q,b['bounds'][2:4])
        if 'cap_choice'in b:
            i,j,t=b['cap_choice'];assert int(i)==i and int(j)==j and 0<=Q(t)<=1
            out.append(f'c|{bounds}|{int(i)},{int(j)},{qs(t)}');continue
        if 'choice'in b:
            ch=b['choice'];s0,s1=map(Q,ch.get('scale_domain',(sl,su)))
            cs=[component(*group(g),s0,s1,[nodes[k] for k in rr]) for g,rr in zip(ch['groups'],ch['refs'])]
            assert len(cs)in[1,2]
            out.append(f'b|{bounds}|{cs[0]}' if len(cs)==1 else f'm|{bounds}|{qs(ch["theta"])}|{cs[0]}|{cs[1]}')
        else:
            kind,dom,*rr=inh['boxes'][b['original']].split('|');s0,s1=map(Q,dom.split(',')[2:4])
            if kind=='c':
                i,j,t=rr[0].split(',');out.append(f'c|{bounds}|{int(i)},{int(j)},{qs(t)}');continue
            if kind=='s':
                i,j,t=rr[0].split(',');i,j=int(i),int(j)
                a=component(i,i,0,s0,s1,src(i,rr[1]));d=component(j,j,0,s0,s1,src(j,rr[2]))
                out.append(f'm|{bounds}|{qs(t)}|{a}|{d}')
            elif kind=='j':
                bk=int(rr[0]);r=inh['batches'][bk]
                a=component(r['i'],r['j'],r['theta'],s0,s1,bat(bk,rr[1]));out.append(f'b|{bounds}|{a}')
            else:
                assert kind=='m';b0,b1,t=rr[0].split(',');b0,b1=int(b0),int(b1)
                r,s=inh['batches'][b0],inh['batches'][b1]
                a=component(r['i'],r['j'],r['theta'],s0,s1,bat(b0,rr[1]));d=component(s['i'],s['j'],s['theta'],s0,s1,bat(b1,rr[2]))
                out.append(f'm|{bounds}|{qs(t)}|{a}|{d}')
    return out

def refined_tokens(oldtokens,newbounds):
    wanted=set(newbounds);seen=set();result=[];pos=0
    def splitdom(dom,k,mid):
        a,b=list(dom),list(dom);a[2*k+1]=mid;b[2*k]=mid;return tuple(a),tuple(b)
    def grid(dom,children):
        if len(children)==1:
            assert children[0]==dom and dom not in seen;seen.add(dom);result.append('.');return
        for k in range(3):
            cuts=sorted({b[2*k+1] for b in children if dom[2*k]<b[2*k+1]<dom[2*k+1]})
            for mid in cuts:
                if any(b[2*k]<mid<b[2*k+1] for b in children):continue
                left=[b for b in children if b[2*k+1]<=mid];right=[b for b in children if mid<=b[2*k]]
                if not left or not right:continue
                result.append(f'{k},{qs(mid)}');a,b=splitdom(dom,k,mid);grid(a,left);grid(b,right);return
        raise AssertionError('Replacement is not a guillotine grid')
    def walk(dom):
        nonlocal pos
        tok=oldtokens[pos];pos+=1
        if tok=='.':
            if dom in wanted:
                assert dom not in seen;seen.add(dom);result.append('.');return
            children=[b for b in wanted if all(dom[2*k]<=b[2*k]<b[2*k+1]<=dom[2*k+1] for k in range(3))]
            assert children;grid(dom,children);return
        k,mid=tok.split(',');k=int(k);mid=Q(mid)
        assert 0<=k<3 and dom[2*k]<mid<dom[2*k+1]
        result.append(tok);a,b=splitdom(dom,k,mid);walk(a);walk(b)
    walk((Q(0),Q(9,10),Q(0),Q(973612157,10**9),Q(0),Q(31,4)))
    assert pos==len(oldtokens) and seen==wanted
    assert result.count('.')==len(newbounds)
    return result

def main():
    if not __debug__:raise SystemExit('Reject -O/-OO: assertions required')
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
    p.add_argument('--base',type=Path,default=Path('handoff/lower-stein/cert-jointmoment-lifted-codex'))
    p.add_argument('--ledger',type=Path,default=Path('handoff/research-third-decimal/needle-20261023/minimal-cover-ledger.json'))
    p.add_argument('--out',type=Path,default=Path('Grothe/Research/RefinedCoverData.lean'))
    p.add_argument('--check',action='store_true')
    a=p.parse_args();repo=a.repo.resolve();base=repo/a.base;ledger=repo/a.ledger
    c=Campaign(base);record=json.loads(ledger.read_text());global_upper=verify(c,record)
    B=Q(record['target']);L=Q(1401695390488,10**12);assert global_upper<=B and B*L<1
    oldcov=json.loads((base/'cover.json').read_text());inh=json.loads((base/'inherited.json').read_text())
    im,nm=canonical_maps(oldcov,inh)
    text=(repo/'Grothe/Lower/MixedData.lean').read_text()
    chunks=re.findall(r'def coverBoxes\d+ : List String :=\s*\[([\s\S]*?)\]\s*\n',text)
    oldstrings=[s for chunk in chunks for s in re.findall(r'"([^"]*)"',chunk)]
    assert len(oldstrings)==len(oldcov['boxes'])
    assert serialize(oldcov,inh,im,nm)==oldstrings,'Canonical reference map differs from compiled old data'
    cuts=[s for s in re.findall(r'def coverCuts\d+ : String :=\s*"([^"]*)"',text)]
    oldtokens=[t for s in cuts for t in s.split('|')]
    cov=copy.deepcopy(c.cover);byid={r['box']:r for r in record['records']};boxes=[]
    for i,b in enumerate(cov['boxes']):
        if i not in byid:boxes.append(b);continue
        for ch in byid[i]['children']:
            assert 'choice'in ch,'Final minimal ledger must retain old cap boxes'
            boxes.append(dict(bounds=ch['bounds'],choice=ch['choice'],upper=ch['upper']))
    cov['boxes']=boxes
    strings=serialize(cov,inh,im,nm);domains=[tuple(map(Q,b['bounds'])) for b in boxes]
    assert len(set(domains))==len(domains)
    tokens=refined_tokens(oldtokens,domains)
    out='import Grothe.Lower.MixedData\n\n/-! Generated by `tools/needle_cover_lean.py`: existing node proofs, refined rational box cover. -/\n\nnamespace Grothe.Research.RefinedCoverData\n\n'
    out+=f'def refinedB : ℚ := {B.numerator} / {B.denominator}\ndef refinedL : ℚ := {L.numerator} / {L.denominator}\n\n'
    names=[]
    for k,start in enumerate(range(0,len(strings),500)):
        name=f'refinedBoxes{k}';names.append(name)
        out+=f'def {name} : List String :=\n['+',\n '.join(json.dumps(s) for s in strings[start:start+500])+']\n\n'
    out+='def refinedBoxes : List String :=\n  '+' ++ '.join(names)+'\n\n'
    names=[]
    for k,start in enumerate(range(0,len(tokens),1000)):
        name=f'refinedCuts{k}';names.append(name)
        out+=f'def {name} : String :=\n  '+json.dumps('|'.join(tokens[start:start+1000]))+'\n\n'
    out+='def refinedCuts : List String :=\n  ['+', '.join(names)+'].flatMap fun s => Grothe.Lower.splitL s "|"\n\nend Grothe.Research.RefinedCoverData\n'
    target=repo/a.out
    if a.check:assert target.read_text()==out,'Saved Lean data differs from deterministic export'
    else:target.parent.mkdir(parents=True,exist_ok=True);target.write_text(out)
    print(json.dumps(dict(status='PASS_CANONICAL_OLD_MAP_AND_NEW_PARTITION',original_boxes=len(oldstrings),replaced_parents=len(record['records']),new_boxes=len(strings),inherited_batches=len(im),all_batches=len(im)+len({v[0] for v in nm.values()}),partition_tokens=len(tokens),B=str(B),L=str(L),lean_sha256=hashlib.sha256(out.encode()).hexdigest()),indent=2))

if __name__=='__main__':main()
