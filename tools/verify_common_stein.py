#!/usr/bin/env python3
"""Isolated, standard-library replay of the common-Stein results and controls."""
import argparse
from copy import deepcopy
from fractions import Fraction as Q
from itertools import combinations
import json
from math import factorial
from pathlib import Path
import sys
sys.path.insert(0,str(Path(__file__).resolve().parent))
import separate_common_stein as sep
import merge_common_stein as merge


def det(M):
    M=[r[:] for r in M];value=Q(1)
    for j in range(len(M)):
        pivot=next((k for k in range(j,len(M)) if M[k][j]),None)
        if pivot is None:return Q(0)
        if pivot!=j:M[pivot],M[j]=M[j],M[pivot];value=-value
        p=M[j][j];value*=p;M[j]=[x/p for x in M[j]]
        for k in range(j+1,len(M)):
            c=M[k][j];M[k]=[a-c*b for a,b in zip(M[k],M[j])]
    return value


def psd(M):
    return all(det([[M[i][j] for j in ids] for i in ids])>=0
               for k in range(1,len(M)+1) for ids in combinations(range(len(M)),k))


def fixtures():
    # Genuine q=X² bar(Y)/sqrt(2): U=S² T/2, S,T independent Exp(1).
    moment=lambda k:Q(factorial(2*k)*factorial(k),2**k)
    assert [moment(k) for k in range(4)]==[Q(1),Q(1),Q(12),Q(540)]
    # Feature tuple (1,U,phi), phi=U. This Gram is deliberately singular.
    H=[[Q(1),Q(1),Q(1),Q(0)], [Q(1),Q(12),Q(12),Q(5)],
       [Q(1),Q(12),Q(12),Q(5)], [Q(0),Q(5),Q(5),Q(10,3)]]
    assert psd(H)
    # Minimal-norm projected kernel is X*=5(U-1)/11, r*=0.
    assert Q(5,11)*(moment(1)-1)==0
    assert Q(5,11)*(moment(2)-moment(1))==5
    assert Q(25,121)*(moment(2)-2*moment(1)+1)==Q(25,11)<Q(10,3)
    corrupt=deepcopy(H);corrupt[2][3]=corrupt[3][2]=Q(6)
    assert not psd(corrupt)  # Different moments assigned to identical probes.
    for m in [14,16,20,128]:
        mk=lambda k:Q(factorial(k)*factorial(m+2*k-1),factorial(m-1)*(m*(m+1))**k)
        chi=mk(2)-2;assert mk(1)==1 and chi==Q(8*m+12,m*(m+1))
        excess=mk(3)-6-9*chi
        assert excess>=0 and excess**2<=Q(4045313,100000)**2*chi**3
        assert Q(22,7)*m/(4*(m+1))<Q(973612157,10**9)**2
    return {'singular_gram':True,'nullspace_corruption_rejected':True,'genuine_cubic_moments':[14,16,20,128]}


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('data',type=Path);p.add_argument('--out',type=Path)
    a=p.parse_args();rr=[]
    for i in [7234,5661,1247,8701]:
        for stem,verifier in [('separator',sep.verify),('merged',merge.verify)]:
            d=json.loads((a.data/f'{stem}-{i}.json').read_text());r=verifier(d)
            bad=deepcopy(d);bad['cut']['phi']=['0']*len(d['cut']['phi'])
            bad['cut'].update({'beta':'0','t':'0','nu':'0'})
            try:verifier(bad)
            except AssertionError:pass
            else:raise AssertionError(('corruption accepted',stem,i))
            rr.append({'kind':stem,'index':i,'exact_expectation':r['expectation'],
                       'expectation_float':r['expectation_float'],'tamper_rejected':True})
            print('PASS',stem,i,r['expectation_float'],'tamper rejected',flush=True)
    result={'scope':__doc__,'certificates':rr,'fixtures':fixtures()}
    if a.out:a.out.write_text(json.dumps(result,indent=2)+'\n')
    print('PASS common-kernel singular Gram, nullspace rejection and genuine cubic moment controls',flush=True)


if __name__=='__main__':main()
