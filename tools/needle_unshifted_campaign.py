#!/usr/bin/env python3
"""Complete unshifted law-node campaign with exact old-recipe fallbacks.

Discovery may use floating minimization. Acceptance replays every changed
box with Fractions, verifies its complete Cartesian subdivision, and retains
the old box on every unmodified region. New ``u`` references denote certified
pure-row law nodes against the original source only. No Gaussian integration,
shifted source, or rank-one response hypothesis enters this campaign.
"""
import argparse
import copy
from fractions import Fraction as Q
import hashlib
import itertools
import json
from pathlib import Path
import shutil
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
from needle_cover_refine import Campaign, encode, verify as verify_free, capvalue, mix, value, weights
from needle_rankone_nodes import verify_unshifted

ROOT = Path(__file__).resolve().parents[1]
DEFAULT = ROOT / 'data/lower-unshifted'
BASE = ROOT / 'handoff/lower-stein/cert-jointmoment-lifted-codex'
OLD_LEDGER = ROOT / 'handoff/research-third-decimal/needle-20261023/minimal-cover-ledger.json'

def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()

def write(p, d):
    p = Path(p); p.parent.mkdir(parents=True, exist_ok=True)
    temporary=p.with_name('.'+p.name+'.tmp')
    temporary.write_text(json.dumps(encode(d), indent=2) + '\n')
    temporary.replace(p)

def relative(p):
    return str(Path(p).resolve().relative_to(ROOT))

def prepare(directory):
    """Materialize the already checked 9,057-box cover without changing refs."""
    inputs_dir=directory/'inputs';inputs_dir.mkdir(parents=True,exist_ok=True)
    for src,name in [(BASE/'inherited.json','inherited.json'),(BASE/'cover.json','cover.json'),(OLD_LEDGER,'minimal-cover-ledger.json')]:
        shutil.copyfile(src,inputs_dir/name)
    c = Campaign(inputs_dir)
    ledger = json.loads(OLD_LEDGER.read_text())
    verify_free(c, ledger)
    byid = {r['box']: r for r in ledger['records']}
    cover = copy.deepcopy(c.cover); boxes = []
    for i, b in enumerate(cover['boxes']):
        if i not in byid:
            boxes.append(b)
        else:
            for ch in byid[i]['children']:
                assert 'choice' in ch
                boxes.append(dict(bounds=ch['bounds'], choice=ch['choice'], upper=ch['upper']))
    cover['boxes'] = boxes
    assert len(boxes) == 9057
    cover['target'] = '5707374123/8000000000'
    cover['lower'] = '175211923811/125000000000'
    cover['box_max_rounded_up'] = cover['target']
    write(directory / 'inputs/current-cover.json', cover)
    inputs = {relative(p): sha(p) for p in [BASE/'inherited.json', BASE/'cover.json', OLD_LEDGER]}
    write(directory / 'inputs/source-manifest.json', dict(format='needle-unshifted-inputs/v1',
          immutable_inputs=inputs, current_cover_sha256=sha(directory/'inputs/current-cover.json'),
          durable_copies={relative(inputs_dir/name):sha(inputs_dir/name)for name in ['inherited.json','cover.json','minimal-cover-ledger.json']},
          source_commit='1de841d0306716aac9ae84cb0a31620e6cc329f2', boxes=9057))
    mapping = {}
    for side in ['lo', 'hi']:
        src = ROOT / f'handoff/research-third-decimal/needle-20261023/unshifted4302-{side}.json'
        verify_unshifted(src)
        dest = directory / f'nodes/seed4302-{side}.json'; dest.parent.mkdir(parents=True, exist_ok=True)
        doc=json.loads(src.read_text());doc['inherited']=relative(inputs_dir/'inherited.json');write(dest,doc)
        verify_unshifted(dest)
        mapping[f'seed4302-{side}'] = dict(path=relative(dest), sha256=sha(dest))
    write(directory / 'nodes.json', mapping)
    print('PREPARED', len(boxes), 'boxes,', len(mapping), 'certified pure-row nodes', flush=True)

class UnshiftedCampaign(Campaign):
    def __init__(self, directory, checked=True):
        super().__init__(directory/'inputs')
        self.directory = directory
        manifest = json.loads((directory/'inputs/source-manifest.json').read_text())
        for p, h in manifest['immutable_inputs'].items():
            # Archived names are provenance labels. Replay opens only the
            # durable copy, never the old archive or another checkout.
            name=Path(p).name
            assert name in ['inherited.json','cover.json','minimal-cover-ledger.json']
            assert sha(directory/'inputs'/name) == h, ('source copy hash mismatch', p)
        for p,h in manifest['durable_copies'].items():
            assert sha(ROOT/p)==h,('durable source copy hash mismatch',p)
        assert sha(directory/'inputs/current-cover.json') == manifest['current_cover_sha256']
        self.cover = json.loads((directory/'inputs/current-cover.json').read_text())
        self.nodes = self.cover['nodes']; self.original_node_count = len(self.nodes)
        self.mapping = json.loads((directory/'nodes.json').read_text()); self.udocs = {}
        for name, inp in self.mapping.items():
            path = ROOT/inp['path']; assert sha(path) == inp['sha256']
            if checked: verify_unshifted(path)
            d = json.loads(path.read_text()); self.udocs[name] = d
            ref = ['u', name]
            if ref not in self.nodes: self.nodes.append(ref)

    def node(self, index, group, xu):
        ref = self.nodes[index]
        if ref[0] != 'u': return super().node(index, group, xu)
        d = self.udocs[ref[1]]
        expected = tuple((int(i), Q(a)) for i, a in self.cover['groups'][group]['weights'])
        assert expected == ((d['row_index'], Q(1)),), ('wrong pure-row potential', ref, group)
        p = tuple(map(Q, d['P'])); assert p[1] >= 0 and p[4] >= 0
        return Q(d['tau']), p

    def pool(self, g, xu):
        wanted = tuple((int(i), Q(a)) for i, a in self.cover['groups'][g]['weights'])
        result = []
        for index, ref in enumerate(self.nodes):
            kind = ref[0]
            if kind == 'u': w = ((self.udocs[ref[1]]['row_index'], Q(1)),)
            elif kind in ['s', 'z']: w = ((ref[1], Q(1)),)
            else:
                r = self.inh['batches'][ref[1]] if kind == 'b' else self.cover['newnodes'][ref[1]]
                w = weights(r['i'], r['j'], Q(r['theta']))
            if w != wanted: continue
            try: self.node(index, g, xu)
            except AssertionError: continue
            result.append(index)
        return result

def evaluate_child(c, child):
    cb = tuple(map(Q, child['bounds']))
    if 'cap_choice' in child:
        i,j,t = child['cap_choice']; t=Q(t); assert 0<=t<=1
        return capvalue(c.env[i],c.env[j],t,*cb[:2])
    ch=child['choice']; gs=ch['groups']; t=Q(ch['theta']); assert 0<=t<=1 and len(gs) in [1,2]
    domain=tuple(map(Q,ch.get('scale_domain',cb[2:4])))
    assert 0<=domain[0]<=cb[2]<cb[3]<=domain[1]
    parts=[c.component(rr,g,cb,domain) for rr,g in zip(ch['refs'],gs)]
    assert len(parts)==len(gs)
    if len(gs)==1: v=c.gv[gs[0]]; p,q=parts[0]
    else: v=mix(t,*[c.gv[g]for g in gs]);p=mix(t,parts[0][0],parts[1][0]);q=mix(t,parts[0][1],parts[1][1])
    return value(cb,v,p,q)

def replay(c, records, target):
    ids=[r['box']for r in records]; assert len(ids)==len(set(ids))
    byid={r['box']:r for r in records}; out=[]
    for i,parent in enumerate(c.cover['boxes']):
        if i not in byid: out.append(copy.deepcopy(parent)); continue
        r=byid[i]; bb=list(map(Q,parent['bounds'])); old=Q(parent['upper'])
        # Independently reconstruct the old arithmetic before accepting a change.
        if 'original'in parent and c.inh['boxes'][parent['original']].startswith('c|'):
            _,_,s=c.inh['boxes'][parent['original']].split('|');a,b,t=s.split(',')
            assert capvalue(c.env[int(a)],c.env[int(b)],Q(t),*bb[:2])==old
        else: assert c.exact_old(i)==old
        assert Q(r['old_upper'])==old
        split=r['split']; expected=set()
        for ix in itertools.product(*[range(n)for n in split]):
            dom=[]
            for axis,n,k in zip(range(3),split,ix):
                a,b=bb[2*axis:2*axis+2];dom.extend([a+(b-a)*k/n,a+(b-a)*(k+1)/n])
            expected.add(tuple(dom))
        children=r['children']; actual=[tuple(map(Q,x['bounds']))for x in children]
        assert len(actual)==len(set(actual)) and set(actual)==expected
        for child in children:
            bound=evaluate_child(c,child)
            assert bound==Q(child['upper']) and bound<=old
            if 'choice'in child:out.append(dict(bounds=child['bounds'],choice=child['choice'],upper=child['upper']))
            else:out.append(dict(bounds=child['bounds'],cap_choice=child['cap_choice'],upper=child['upper']))
        assert max(Q(x['upper'])for x in children)==Q(r['new_upper'])
    upper=max(Q(x['upper'])for x in out)
    bad=[i for i,b in enumerate(out)if Q(b['upper'])>target]
    return out,upper,bad

def complete_cover(c,boxes,target,bad):
    cover=copy.deepcopy(c.cover);cover['boxes']=boxes;cover['u_nodes']=c.mapping
    cover['target']=str(target);cover['box_max_rounded_up']=str(target);cover['fails']=bad
    den=10**12; reciprocal=1/target; lower=Q(reciprocal.numerator*den//reciprocal.denominator,den)
    if lower*target==1:lower-=Q(1,den)
    cover['lower']=str(lower) if not bad else None
    return cover

def verify_saved(directory,ledger):
    c=UnshiftedCampaign(directory);result=json.loads(ledger.read_text());target=Q(result['target'])
    assert result['current_cover_sha256']==sha(directory/'inputs/current-cover.json')
    assert result['nodes']==c.mapping
    boxes,upper,bad=replay(c,result['records'],target)
    assert upper==Q(result['global_upper'])
    assert not bad,'The requested global cap still has uncovered blockers'
    expected=encode(complete_cover(c,boxes,target,bad))
    assert json.loads((directory/'cover.json').read_text())==expected,'Full cover differs from replayed ledger'
    assert target*Q(expected['lower'])<1,'Displayed endpoint lacks a strict reciprocal comparison'
    print('REPLAY_PASS','boxes',len(boxes),'actual_upper',float(upper),'remaining',len(bad),flush=True)
    return bad

def finalize(directory,ledger):
    """Round only the replayed exact global cap; perform no new search."""
    c=UnshiftedCampaign(directory);result=json.loads(ledger.read_text());requested=Q(result['target'])
    assert result['current_cover_sha256']==sha(directory/'inputs/current-cover.json')
    assert result['nodes']==c.mapping
    boxes,upper,bad=replay(c,result['records'],requested);assert not bad
    den=10**12;B=Q(-((-upper.numerator*den)//upper.denominator),den)
    assert 0<upper<=B<=requested
    result['requested_target']=str(requested);result['target']=str(B)
    result['global_upper']=str(upper);result['global_upper_decimal']=float(upper)
    result['remaining_parent_blockers']=[]
    result['status']='COMPLETE_EXACT_ORIGINAL_SOURCE_ONLY'
    write(ledger,result);write(directory/'cover.json',complete_cover(c,boxes,B,[]))
    print('FINALIZED','B',str(B),'L',complete_cover(c,boxes,B,[])['lower'],'boxes',len(boxes),flush=True)

def run(a):
    c=UnshiftedCampaign(a.directory)
    byid={}
    if a.prior:
        prior=json.loads(a.prior.read_text()); byid={r['box']:r for r in prior['records']}
        replay(c,list(byid.values()),Q(prior['target']))
    ids=a.boxes or [i for i,b in enumerate(c.cover['boxes'])if Q(byid[i]['new_upper']if i in byid else b['upper'])>a.target]
    for count,i in enumerate(ids):
        r=c.refine(i,tuple(a.split),pool=True,all_groups=True)
        if i not in byid or r['new_upper']<=Q(byid[i]['new_upper']): byid[i]=r
        records=[byid[k]for k in sorted(byid)]
        current=max(Q(byid[k]['new_upper'])if k in byid else Q(b['upper'])for k,b in enumerate(c.cover['boxes']))
        write(a.out,dict(format='needle-unshifted-campaign/v1',target=a.target,
             current_cover_sha256=sha(a.directory/'inputs/current-cover.json'),nodes=c.mapping,
             records=records,global_upper=current,global_upper_decimal=float(current),
             remaining_parent_blockers=[k for k,b in enumerate(c.cover['boxes'])if Q(byid[k]['new_upper']if k in byid else b['upper'])>a.target],
             processed=count+1,requested=len(ids)))
        print('BOX',i,'old',float(Q(r['old_upper'])),'new',float(Q(r['new_upper'])),
              'global',float(current),'processed',count+1,'/',len(ids),flush=True)
    result=json.loads(a.out.read_text()); boxes,upper,bad=replay(c,result['records'],a.target)
    cover=complete_cover(c,boxes,a.target,bad)
    write(a.directory/'cover.json',cover)
    print('REPLAY_PASS','boxes',len(boxes),'actual_upper',float(upper),'remaining',len(bad),flush=True)

def main():
    if not __debug__:raise SystemExit('Reject -O/-OO: exact assertions required')
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--directory',type=Path,default=DEFAULT)
    p.add_argument('--prepare',action='store_true');p.add_argument('--target',type=Q,default=Q('0.71342165'))
    p.add_argument('--verify',type=Path,help='Replay a saved ledger and compare the entire emitted cover')
    p.add_argument('--finalize',type=Path,help='Replay then round the exact accepted global cap to 12 decimals')
    p.add_argument('--split',type=int,nargs=3,default=[2,2,2]);p.add_argument('--boxes',type=int,nargs='+')
    p.add_argument('--prior',type=Path);p.add_argument('--out',type=Path,default=DEFAULT/'cover-ledger.json')
    a=p.parse_args();assert all(x>0 for x in a.split)
    if a.prepare:prepare(a.directory)
    elif a.verify:verify_saved(a.directory,a.verify)
    elif a.finalize:finalize(a.directory,a.finalize)
    else:run(a)

if __name__=='__main__':main()
