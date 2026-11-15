#!/usr/bin/env python3
"""codex-a713: exact cover improvement; writes only new audit artifacts.

No Lean invocation, source edit, Gaussian integration, or new law-node premise.
Replays all rational box bounds, binds every box to current Lean serialization,
and checks the old and modified guillotine partitions independently.
"""
import sys
sys.dont_write_bytecode = True
from pathlib import Path
from fractions import Fraction as Q
import argparse, copy, hashlib, json, re, time

ROOT = Path('/Users/alingalatan/workspaces/grothe')
OUT = ROOT/'handoff/research-degree5/gpt-audit-2026-11-13'
DATA = ROOT/'data/lower-unshifted'
sys.path.insert(0, str(ROOT/'tools'))
from needle_unshifted_lean import ExportCampaign
from needle_cover_lean import canonical_maps, serialize, source_serialization

def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()

def encode(x):
    if isinstance(x,Q): return str(x)
    if isinstance(x,Path): return str(x)
    if isinstance(x,dict): return {str(k):encode(v) for k,v in x.items()}
    if isinstance(x,(list,tuple)): return [encode(v) for v in x]
    return x

def read_current():
    cover=json.loads((DATA/'cover.json').read_text())
    old=json.loads((DATA/'inputs/cover.json').read_text())
    inherited=json.loads((DATA/'inputs/inherited.json').read_text())
    export=json.loads((DATA/'verification/EXPORT.json').read_text())
    manifest=json.loads((DATA/'verification/SOURCE_MANIFEST.json').read_text())
    # The stored export is from an older cover, so its cover hashes are not
    # reused. Pin its unchanged row/node sources, then bind the CURRENT boxes.
    checked=[]
    for rel,digest in manifest.items():
        if rel in (
            'Grothe/Research/LawNodeData.lean',
            'data/lower-unshifted/inputs/inherited.json',
            'data/lower-unshifted/inputs/cover.json'):
            assert sha(ROOT/rel)==digest, ('Changed pinned row/node source',rel)
            checked.append(rel)
    source_serialization(ROOT)  # Pins the retained mixed-batch declaration.
    checked.append('Grothe/Lower/MixedData.lean: mixedBatches declaration')
    # Imports/comments changed since the historical manifest. Bind the actual
    # current constructors, and every header/table/node quantity used below.
    for k,row in enumerate(inherited['rows'],1):
        cp=ROOT/f'data/lower-rows/row{k:02d}.json'
        current=json.loads(cp.read_text())
        lean=(ROOT/f'Grothe/Lower/RowData{k:02d}.lean').read_text().split(f'def row{k:02d} : Row :=',1)[1]
        nums=[Q(int(n),int(d or '1')) for n,d in re.findall(r'\((-?\d+) : ℚ\)(?: / (\d+))?',lean.split('"',1)[0])]
        assert nums==list(map(Q,current['header']+current['even_matrix']+current['coupling']))
        assert re.findall(r'"([^"\n]*)"',lean)==[current['nodes'],current['mesh']]+current['cells']
        assert list(map(Q,current['header']))==[Q(row[x]) for x in ('ell','beta','delta','kappa','smax','cap')]
        assert list(map(Q,current['even_matrix']))==list(map(Q,row['E']))
        assert list(map(Q,current['coupling']))==list(map(Q,row['b']))
        assert [[Q(y) for y in x.split(':')] for x in current['nodes'].split(';')]==[list(map(Q,x)) for x in row['table']]
        if current['mesh']:
            assert [Q(0)]+list(map(Q,current['mesh'].split(',')))==list(map(Q,row['mesh']))
        else:
            assert list(map(Q,row['mesh'])) in ([],[Q(0)])
        assert len(current['cells'])==len(row['cells'])
        for cell,oldcell in zip(current['cells'],row['cells']):
            fields=cell.split('|')
            assert list(map(Q,fields[:2]))==list(map(Q,oldcell['x']))
            nodes=fields[4].split(';') if fields[4] else []
            assert len(nodes)==len(oldcell['nodes'])
            for node,oldnode in zip(nodes,oldcell['nodes']):
                ss,pp,_=node.split(':')
                assert Q(ss)==Q(oldnode['tau']) and list(map(Q,pp.split(',')))==list(map(Q,oldnode['P']))
        checked.append(f'Grothe/Lower/RowData{k:02d}.lean: exact current constructor and inherited node values')
    docs={}
    for name,ref in cover['u_nodes'].items():
        path=ROOT/ref['path']
        assert sha(path)==ref['sha256'], ('Changed law-node input',name)
        docs[name]=json.loads(path.read_text())
    im,nm=canonical_maps(old,inherited)
    em={k:tuple(v) for k,v in export['extra_node_map'].items()}
    strings=serialize(cover,inherited,im,nm,em)
    text=(ROOT/'Grothe/Research/RefinedCoverData.lean').read_text()
    boxpart=text.split('def refinedBoxes0',1)[1].split('def refinedBoxes :',1)[0]
    current_strings=re.findall(r'"([^"\n]*)"',boxpart)
    assert strings==current_strings, 'Current Lean box serialization mismatch'
    cutpart=text.split('def refinedCuts0',1)[1].split('def refinedCuts :',1)[0]
    tokens=[t for s in re.findall(r'"([^"\n]*)"',cutpart) for t in s.split('|')]
    c=ExportCampaign(DATA/'inputs',cover,docs)
    return c,cover,strings,tokens,(inherited,im,nm,em),checked

def partition(tokens,boxes):
    domains={tuple(map(Q,b['bounds'])) for b in boxes}
    assert len(domains)==len(boxes), 'Duplicate box domain'
    stack=[(Q(0),Q(9,10),Q(0),Q(973612157,10**9),Q(0),Q(31,4))]
    leaves=set()
    for tok in tokens:
        assert stack, 'Extra partition token'
        dom=stack.pop()
        if tok=='.':
            assert dom in domains and dom not in leaves, ('Bad leaf',dom)
            leaves.add(dom)
        else:
            ks,ms=tok.split(',');k=int(ks);m=Q(ms)
            assert 0<=k<3 and dom[2*k]<m<dom[2*k+1], ('Bad split',dom,tok)
            left=list(dom);right=list(dom);left[2*k+1]=m;right[2*k]=m
            stack.extend((tuple(right),tuple(left)))
    assert not stack and leaves==domains, 'Incomplete partition'
    return len(leaves)

def reprice(c,cover,assert_saved=False):
    upper=Q(0);binding=[]
    for i,b in enumerate(cover['boxes']):
        v=c.box_upper(b)
        if assert_saved: assert v==Q(b['upper']), ('Saved bound mismatch',i)
        b['upper']=str(v)
        if v>upper: upper=v;binding=[i]
        elif v==upper: binding.append(i)
    return upper,binding

def endpoint(upper):
    scale=10**15
    B=Q(-(-upper.numerator*scale//upper.denominator),scale)
    L=Q((10**12*B.denominator)//B.numerator,10**12)
    assert 0<B and B*L<1
    return B,L

def save(cover,strings,tokens,record,label):
    B,L=endpoint(Q(record['actual_upper']))
    cover.update(target=str(B),lower=str(L),box_max_rounded_up=str(B),fails=[])
    record.update(B=str(B),L=str(L),reciprocal=str(1/B),lower_decimal=float(L),
        status='EXACT_RATIONAL_COVER_AND_PARTITION_CHECKED_NO_LEAN_BUILD',
        agent='codex-a713',new_analytic_assumptions=[])
    paths={
        'cover':OUT/f'improvement_cover_{label}.json',
        'certificate':OUT/f'improvement_certificate_{label}.json',
        'replay':OUT/f'improvement_replay_{label}.json'}
    paths['cover'].write_text(json.dumps(cover,separators=(',',':'))+'\n')
    paths['certificate'].write_text(json.dumps(dict(agent='codex-a713',B=str(B),L=str(L),
        boxes=strings,partition_tokens=tokens),separators=(',',':'))+'\n')
    record['outputs']={k:str(p) for k,p in paths.items()}
    record['cover_sha256']=sha(paths['cover'])
    record['certificate_sha256']=sha(paths['certificate'])
    paths['replay'].write_text(json.dumps(encode(record),indent=2)+'\n')
    print(json.dumps({k:record[k] for k in ('status','B','L','binding_boxes','seconds','outputs')},indent=2),flush=True)

def main():
    started=time.monotonic()
    c,original,strings,tokens,maps,pins=read_current()
    partition(tokens,original['boxes'])
    old_upper,old_binding=reprice(c,original,True)
    print(json.dumps(dict(event='original_replay_complete',boxes=len(strings),upper=str(old_upper),
        seconds=time.monotonic()-started)),flush=True)
    cover=copy.deepcopy(original)
    oldcut=Q(27,32);newcut=oldcut-Q(1,100000)
    changed=[]
    for i,b in enumerate(cover['boxes']):
        before=list(b['bounds'])
        for k in (0,1):
            if Q(b['bounds'][k])==oldcut:b['bounds'][k]=str(newcut)
        if b['bounds']!=before:changed.append(i)
    newtokens=[f'0,{newcut}' if t==f'0,{oldcut}' else t for t in tokens]
    partition(newtokens,cover['boxes'])
    upper,binding=reprice(c,cover)
    assert upper<old_upper
    inherited,im,nm,em=maps
    newstrings=serialize(cover,inherited,im,nm,em)
    record=dict(original_B=original['target'],original_L=original['lower'],
        original_actual_upper=str(old_upper),original_binding_boxes=old_binding,
        actual_upper=str(upper),binding_boxes=binding,boxes=len(strings),
        changed_box_indices=changed,old_cut=str(oldcut),new_cut=str(newcut),
        changed_partition_tokens=sum(a!=b for a,b in zip(tokens,newtokens)),
        pinned_row_node_sources=pins,
        current_sources={str(p.relative_to(ROOT)):sha(p) for p in (
            DATA/'cover.json',ROOT/'Grothe/Research/RefinedCoverData.lean',
            ROOT/'Grothe/Research/LawNodeData.lean',ROOT/'Grothe/Research/RefinedCoverResult.lean',
            ROOT/'Grothe/MainResult.lean',ROOT/'tools/needle_cover_refine.py',
            ROOT/'tools/needle_unshifted_lean.py',ROOT/'tools/needle_cover_lean.py')},
        seconds=time.monotonic()-started)
    save(cover,newstrings,newtokens,record,'v1')

if __name__=='__main__':main()
