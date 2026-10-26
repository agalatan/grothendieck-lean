#!/usr/bin/env python3
"""Independently convert a fresh raw localized replay to bivariate cap data.

Rechecks interval-to-Loewner enlargement, every S-lemma Schur formula, coverage,
and both original and shifted values against the independent replay. Gaussian
integration is inherited from the hash-pinned raw replay and is not repeated.
"""
import argparse
from fractions import Fraction as F
import json
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from rankone_source_paths import resolve_archived_handoff_path
from rankone_analytic_transport import mat,old_cap,qeval,row_geometry,sha,ceil_grid
from rankone_analytic_localized import finite_transport,propose_scalar,stringify


def main():
    if not __debug__:
        raise SystemExit('Reject -O/-OO: exact acceptance requires assertions')
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('raw',type=Path)
    ap.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
    ap.add_argument('--out',type=Path,required=True)
    args=ap.parse_args()
    repo=args.repo.resolve(strict=True)
    if repo != Path(__file__).resolve().parents[1]:
        raise ValueError('--repo must identify the executing script\'s checkout')
    raw=json.loads(args.raw.read_text())
    assert raw['status']=='PASS' and raw['coverage_checked']
    toolsdir=repo/'handoff/lower-stein/cert-0745e/tools'
    sys.path.insert(0,str(toolsdir))
    import exactint as X
    import replay_midcaps_exact as R
    recipepath=resolve_archived_handoff_path(raw['source_recipe'],repo)
    assert sha(recipepath)==raw['source_sha256']
    recipes=json.loads(recipepath.read_text())
    rowname=recipes['t']
    node=recipes['nodes'][raw['node_index']]
    assert R.coverage(node)
    oldrowpath=resolve_archived_handoff_path(raw['row'],repo)
    assert sha(oldrowpath)==raw['row_sha256']
    oldrow=json.loads(oldrowpath.read_text())
    rowpath=resolve_archived_handoff_path(
        f'handoff/lower-stein/cert-0745e/row_{rowname}.json',repo)
    row=json.loads(rowpath.read_text())
    assert list(map(F,row['theta']))==list(map(F,oldrow['theta']))
    th=list(map(F,row['theta']))
    eps=F(row['eps'])
    discpath=resolve_archived_handoff_path(
        f"handoff/research-third-decimal/attack-20261022/step22_mix_{raw['choice']}.json",repo)
    assert sha(discpath)==raw['choice_sha256']
    disc=json.loads(discpath.read_text())
    w=[F(str(x)) for x in disc['res']['cone']['w']]
    A,v,d,c,minimum=row_geometry(th,eps,w)
    assert v==list(map(F,raw['v'])) and d==F(raw['d']) and c==F(raw['c'])
    assert minimum==F(raw['cone_minimum_principal_minor'])
    A+= [F(0)]*9
    v+= [F(0)]*9
    momentpaths=[(resolve_archived_handoff_path(path,repo),digest)
                 for path,digest in raw['moment_sha256'].items()]
    momfile=momentpaths[0][0]
    for path,digest in momentpaths:
        assert sha(path)==digest
    S=X.ExactSetup(row,json.loads(momfile.read_text()))
    assert len(node['pieces'])==len(raw['pieces'])
    pieces=[]
    for pi,(recipe,entry) in enumerate(zip(node['pieces'],raw['pieces'])):
        C=tuple(map(F,entry['C_interval']))
        h=[tuple(map(F,p)) for p in entry['h_interval']]
        H=[[tuple(map(F,p)) for p in line] for line in entry['H_interval']]
        Cu,hu,Hu,rho=X.upper(C,h,H)
        assert Cu==F(entry['C_upper']) and hu==list(map(F,entry['h_rational']))
        assert Hu==mat(entry['H_upper']) and rho==F(entry['loewner_rho'])
        cons=R.cons_of(node,recipe)
        oldq=X.piece_quadratic_multi(S.Q,S.a,Cu,hu,Hu,cons)
        assert oldq is not None
        assert list(oldq[:3])==list(map(F,entry['old_quadratic']))
        p=finite_transport(X,S.Q,Cu,hu,Hu,cons,A,v,d,c)
        assert p['q']==[oldq[0],th[9]*oldq[1],th[9]**2*oldq[2]]
        r,f=F(raw['physical_r']),F(raw['common_f'])
        value=qeval(p['q'],r)-2*(p['b0']+p['b1']*r)*f+p['alpha']*f*f
        assert value==F(entry['shifted_cap'])
        assert p['minimum_LDL_pivot']==F(entry['minimum_LDL_pivot'])
        pieces.append(p)
        print('PASS independent bivariate conversion',rowname,'piece',pi,flush=True)
    r=F(raw['physical_r'])
    f=propose_scalar(pieces,r)
    values=[qeval(p['q'],r)-2*(p['b0']+p['b1']*r)*f+p['alpha']*f*f for p in pieces]
    cap=ceil_grid(max(values))
    old=old_cap(row,r)
    momentfiles={str(json.loads(path.read_text())['NQ']):dict(path=str(path.relative_to(repo)),sha256=digest)
                 for path,digest in momentpaths}
    for name,digest in raw['dependencies'].items():
        if Path(name).name != name or name in ('', '.', '..'):
            raise ValueError('Archived dependency must be a single file name')
        dependency=resolve_archived_handoff_path(oldrowpath.parent/'tools'/name,repo)
        assert sha(dependency)==digest
    conversion_dependencies={name:sha(resolve_archived_handoff_path(toolsdir/name,repo))
                             for name in raw['dependencies']}
    report=dict(version='rankone-localized-transport-v1',scope=__doc__,row=rowname,
        physical_r=str(r),source_s_at_target=str(th[9]*r),recipe_source_s=str(node['s']),
        scalar_f=str(f),cap=str(cap),old_effective_cap=str(old),saving=str(old-cap),
        saving_float=float(old-cap),cap_float=float(cap),worst_piece=max(range(len(values)),key=values.__getitem__),
        original_recipe_cap_rechecked=True,piece_coverage_rechecked=True,
        source_row=str(rowpath.relative_to(repo)),source_row_sha256=sha(rowpath),
        recipe=str(recipepath.relative_to(repo)),recipe_sha256=sha(recipepath),recipe_node_index=raw['node_index'],
        raw_replay=str(args.raw.resolve().relative_to(repo.resolve())),raw_replay_sha256=sha(args.raw),
        moments=momentfiles,dependencies=conversion_dependencies,
        raw_dependencies=raw['dependencies'],w=list(map(str,w)),d=str(d),c=str(c),
        semiconvex_coefficient=str(c*c/d),minimum_L10_principal_minor=str(minimum),
        interpretation='Each piece bound is q(r)-2(b0+b1*r)*f+alpha*f^2. ONE scalar f is used before max over pieces.',
        pieces=[dict(piece=i,**stringify(p)) for i,p in enumerate(pieces)],
        piece_values_at_target=list(map(str,values)),
        remaining_hypotheses=['The Gaussian integrations are inherited from the hash-pinned fresh raw replay.',
            'Scalar/polar/S-lemma/symmetry analytic proofs remain paper mathematics.',
            'No moment-law cover or endpoint bound is asserted.'])
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(report,indent=2)+'\n')
    print('PASS converted localized cap',rowname,'f',float(f),'saving',float(old-cap),flush=True)


if __name__=='__main__':
    main()
