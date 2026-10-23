#!/usr/bin/env python3
"""Stdlib-only verification of fixed-response coefficient-completion SDPs.

Usage: python3 verify_response_completion_controls.py [response_completion_controls.json]
Requires the sibling response_compression.py exact polynomial module.
"""
from fractions import Fraction as Q
from pathlib import Path
import sys,json
HERE=Path(__file__).parent
sys.path.insert(0,str(HERE))
import response_compression as rc

def dot(a,b):return sum((x*y for x,y in zip(a,b)),Q(0))
def trdot(a,b):return sum((dot(x,y) for x,y in zip(a,b)),Q(0))
def add(a,b):return [[x+y for x,y in zip(aa,bb)] for aa,bb in zip(a,b)]
def scale(a,q):return [[q*x for x in row] for row in a]
def assoc(i,j):
    p=rc.mul(rc.laguerre(i),rc.laguerre(j,1))
    return [rc.exp_moment([Q(0)]+rc.mul(p,rc.laguerre(k,1)))/Q(k+1)
            for k in range(i+j+1)]
def B(m,n):
    s=n+1
    D=[[dot(assoc(i,j),m[:i+j+1]) for j in range(s)] for i in range(s)]
    return [[Q(int(i==j)) if i<s and j<s else
             Q((i-s+1)*int(i==j)) if i>=s and j>=s else
             D[i][j-s] if i<s else D[j][i-s]
             for j in range(2*s)] for i in range(2*s)]
def readq(a):
    if isinstance(a,str):
        try:return Q(a)
        except ValueError:return a
    if isinstance(a,list):return [readq(x) for x in a]
    if isinstance(a,dict):return {k:readq(v) for k,v in a.items()}
    return a
def main():
    cert=readq(json.loads(Path(sys.argv[1] if len(sys.argv)>1 else HERE/'response_completion_controls.json').read_text()))
    count=0
    for row in cert['visible']:
        n,t,m,Z=row['order'],row['t'],row['primal'],row['dual']
        kind=row['cost_kind']
        assert m[0]==t
        assert rc.psd_exact(B(m,n)) and rc.psd_exact(Z)
        energy=sum(x*x/Q(k+1) for k,x in enumerate(m))
        assert energy==row['energy'] and energy<=1
        upper=m[1]**2/2+(m[2]**2/3 if kind=='cubic_quintic' else 0)
        assert upper==row['cost_upper']
        Bc=B([Q(0)]*(2*n+1),n)
        bases=[add(B([Q(int(i==j)) for i in range(2*n+1)],n),scale(Bc,-1)) for j in range(2*n+1)]
        ss=[trdot(Z,b) for b in bases]
        assert all(ss[j]==0 for j in range(2 if kind=='cubic' else 3,2*n+1))
        lower=-trdot(Z,Bc)-ss[0]*t-ss[1]**2/2-(3*ss[2]**2/4 if kind=='cubic_quintic' else 0)
        assert lower==row['cost_lower'] and upper-lower==row['gap']>0
        # q(m)-lower = <Z,B(m)>+(m1-s1)^2/2+(m2-3s2/2)^2/3.
        sos=trdot(Z,B(m,n))+(m[1]-ss[1])**2/2+((m[2]-3*ss[2]/2)**2/3 if kind=='cubic_quintic' else 0)
        assert upper-lower==sos
        count+=1
        print(f'PASS visible {kind} t={float(t):.4f}, n={n}: [{float(lower):.12f}, {float(upper):.12f}]')
    row=cert['remote'];b,Z=row['b'],row['dual'];n=2
    C=rc.compression(b,n)
    assert rc.psd_exact(Z) and rc.contraction(C)
    A=[rc.compression([Q(int(i==j)) for i in range(5)],n) for j in range(5)]
    s=[trdot(Z,a) for a in A]
    assert all(s[j]==-2*b[j] for j in range(2,5))
    trace=sum(Z[j][j] for j in range(3))
    lower=b[0]**2+b[1]**2+s[0]*b[0]+s[1]*b[1]-trace-sum(s[j]**2/4 for j in range(2,5))
    energy=sum(x*x for x in b)
    assert lower==energy==row['exact_min_energy']==Q(6763201,3686400)>1
    I=[[Q(int(i==j)) for j in range(3)] for i in range(3)]
    assert trdot(Z,add(I,scale(C,-1)))==0
    # E(b)-E* = <Z,I-C(b)> + sum_{j=2}^4(bj+s_j/2)^2.
    print(f'PASS remote n=2: exact minimum {energy} > 1')
    print(f'PASS {count} visible pairs and one exact remote optimum; no response realization or endpoint claim.')

if __name__=='__main__':main()
