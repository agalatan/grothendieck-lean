#!/usr/bin/env python3
"""codex-6e2b: replay the Gaussian-probe dual envelope from fresh secant data.

Default execution replays the profile range/Hessian dependencies and
regenerates secant_profile_table.txt. --skip-dependency-replay is conditional
on both of those steps already being completed in the same verification
chain; it never upgrades an arbitrary saved table into a certificate.
"""
import argparse
from fractions import Fraction as Q
import importlib.util
import json
from pathlib import Path
import subprocess
import sys
import time

ROOT=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('content_next_bound',ROOT/'content_next_bound.py')
source=importlib.util.module_from_spec(spec)
spec.loader.exec_module(source)
arb=source.arb


def read_fresh_table():
    lines=[line.split() for line in (ROOT/'secant_profile_table.txt').read_text().splitlines()
           if line.strip() and not line.lstrip().startswith('#')]
    assert lines and list(map(int,lines[0]))==[602,100000000]
    rows=[list(map(int,line)) for line in lines[1:]]
    assert len(rows)==602 and all(len(row)==4 for row in rows)
    expected=[Q(0)]+[Q(2*j+1,200) for j in range(600)]+[Q(6)]
    for j,(row,R) in enumerate(zip(rows,expected)):
        idx,ri,lo,hi=row
        assert idx==j and Q(ri,100000000)==R and lo<=hi
    assert rows[0]==[0,0,0,0]
    return rows


def reconstruct_dual_table(rows):
    table=[]
    variation=arb(1)/200/arb(3).sqrt()
    for j in range(300):
        lo,hi=Q(j,100),Q(j+1,100)
        R=(lo+hi)/2
        _,ri,rawlo,rawhi=rows[j+1]
        assert Q(ri,100000000)==R
        # Outward arithmetic on both rational endpoints, then an interval
        # hull enclosing the true raw field at this exact midpoint.
        field=source.base.exact_interval(arb(rawlo)/100000000,
                                        arb(rawhi)/100000000)
        point=field/arb(str(R))-source.pr.c0
        enclosure=point+arb(0,variation.upper())
        H=min(abs(enclosure-source.kappa).upper(),source.Hglobal.upper())
        table.append({'lo':str(lo),'hi':str(hi),'h_midpoint':str(point),
                      'h_interval':str(enclosure),'H_upper':str(H)})
    assert Q(table[0]['lo'])==0 and Q(table[-1]['hi'])==3
    assert all(Q(l['hi'])==Q(r['lo']) for l,r in zip(table,table[1:]))
    return table


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--skip-dependency-replay',action='store_true')
    args=parser.parse_args()
    started=time.time()
    if args.skip_dependency_replay:
        print('CONDITIONAL RUN: requires profile range/Hessian replay and fresh secant table regeneration in this verification chain.',flush=True)
    else:
        print(json.dumps({'dependency':source.pr.certify_range(emit=False)}),flush=True)
        subprocess.run([sys.executable,'-I','-B',str(ROOT/'secant_profile_table.py'),
                        '--skip-dependency-replay'],cwd=ROOT,check=True)
    rows=read_fresh_table()
    table=reconstruct_dual_table(rows)
    result=source.verify_envelope(table)
    assert result['passes_1_over_50'],result
    result.update({'table_nodes':len(rows),'reconstructed_profile_cells':len(table),
                   'dependencies_replayed_here':not args.skip_dependency_replay,
                   'seconds':time.time()-started})
    print(json.dumps({'claim':'Gaussian-probe dual certificate from regenerated secant radial table',
                      'result':result}),flush=True)


if __name__=='__main__':
    main()
