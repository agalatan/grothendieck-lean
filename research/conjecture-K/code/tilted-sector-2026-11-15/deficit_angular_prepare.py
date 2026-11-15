#!/usr/bin/env python3
"""Serialize certified absolute OU barriers outward. Agent-ID: codex-6e2b.

This conversion is exact. Acceptance additionally requires the fresh source
and differential-barrier replay in deficit_structure_content_verify.py.
"""
from fractions import Fraction as Q
from pathlib import Path
import json,sys

def prepare(path):
    path=Path(path);w=json.loads(path.read_text());n=w['n']
    cap=Q(w['cap'])
    assert n==500 and w['absolute'] and Q(9,25)<=cap<=Q(13,20) and Q(w['endcap'])==Q(9,25)
    assert cap.numerator<2**53 and cap.denominator<2**53
    Y=list(map(Q,w['values']));D=list(map(Q,w['derivatives']));h=Q(1,n)
    assert len(Y)==len(D)==n+1 and Y[0]==0 and Y[-1]==Q(9,25)
    scale=10**15
    lines=['# Agent-ID: codex-6e2b','# Exact outward conversion of '+path.name,
           f'{n} {scale} {cap.numerator} {cap.denominator}']
    for i in range(n):
        c=[Y[i],h*D[i],-3*Y[i]-2*h*D[i]+3*Y[i+1]-h*D[i+1],
           2*Y[i]+h*D[i]-2*Y[i+1]+h*D[i+1]]
        row=[str(i)]
        for v in c:
            q=v*scale;lo=q.numerator//q.denominator;hi=-((-q.numerator)//q.denominator)
            assert abs(lo)<2**53 and abs(hi)<2**53 and Q(lo,scale)<=v<=Q(hi,scale)
            row.extend([str(lo),str(hi)])
        lines.append(' '.join(row))
    out=path.with_suffix('.txt');out.write_text('\n'.join(lines)+'\n')
    print('Exact angular-barrier table:',out,flush=True)

if __name__=='__main__':
    for path in sys.argv[1:]:prepare(path)
