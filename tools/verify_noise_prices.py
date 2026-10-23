#!/usr/bin/env python3
"""Replay rational all-level prices and algebra on frozen midpoint inputs.

This is NOT a verifier for the underlying Gaussian integrals. Its positive
error threshold tells an interval implementation what remains to certify.
"""
import argparse
import copy
from fractions import Fraction as Q
import json
from pathlib import Path


def check(c):
    s=Q(c['cubic_price']);assert abs(s)<=1
    r=[Q(v['rho']) for v in c['tests']];p=[Q(v['price']) for v in c['tests']]
    assert all(0<x<=1 for x in r)
    assert sum(abs(a)*x**5 for a,x in zip(p,r))<=1,'invalid all-level price budget'
    values=[]
    for v in c['midpoint_columns']:
        c0,c1=Q(v['c0']),Q(v['c1']);K=list(map(Q,v['kernels']))
        assert len(K)==len(r)
        values.append(c0-s*c1-sum(a*(k-c0*x-c1*x**3) for a,k,x in zip(p,K,r)))
    bound=Q(c['midpoint_bound']);assert max(values)==bound,'incorrect midpoint screen'
    amp=1+abs(s)+sum(abs(a)*(1+x+x**3) for a,x in zip(p,r))
    assert amp==Q(c['uniform_error_amplification'])
    assert max(Q(0),(Q(c['target_score'])-bound)/amp)==Q(c['sufficient_uniform_enclosure'])
    return len(values),float(bound),float(Q(c['sufficient_uniform_enclosure']))


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('file',type=Path)
    a=p.parse_args();c=json.loads(a.file.read_text())['rational_midpoint_screen']
    n,b,e=check(c)
    for corrupt in ['price','bound']:
        d=copy.deepcopy(c)
        if corrupt=='price':d['tests'][0]['price']='1000'
        else:d['midpoint_bound']=str(Q(d['midpoint_bound'])-Q(1,10**9))
        try:check(d)
        except AssertionError:pass
        else:raise AssertionError('corruption accepted: '+corrupt)
    print('PASS rational all-level price; exact midpoint screen for',n,'columns;',b)
    print('PASS invalid price and understated midpoint bound rejected')
    if e>0:print('Still required: rigorous enclosures of every input integral within',e)
    else:print('The midpoint screen has no positive exclusion margin against the target.')
    print('No pool exclusion or Grothendieck endpoint is certified by this replay.')


if __name__=='__main__':main()
