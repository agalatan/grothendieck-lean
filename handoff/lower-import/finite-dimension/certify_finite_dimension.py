#!/usr/bin/env python3
"""Exact finite-order consequences of a supplied Gaussian operator norm cap.

ASSUMPTION (not verified here): for T_n=P_(1,0)-(37/50)P_(2,1),
||T_n||_(infinity->1) <= --norm-cap for each requested dimension n.
The projection/witness theorem is in theorem.md. This script proves its
terminal rational inequalities using a Machin-series enclosure of pi.
No numerical-library or upstream-source dependency; no floating-point work.
"""
import argparse,json
from fractions import Fraction as Q
from math import comb
from pathlib import Path

EPS=Q(37,50)

def atan_reciprocal_bounds(k,terms):
    """Strict bounds for atan(1/k), k>1, by its alternating series."""
    assert isinstance(k,int) and k>1 and terms>=1
    s=sum((Q((-1)**j,(2*j+1)*k**(2*j+1)) for j in range(terms)),Q(0))
    next_term=Q((-1)**terms,(2*terms+1)*k**(2*terms+1))
    lo,hi=sorted((s,s+next_term));assert 0<lo<hi
    return lo,hi

def pi_bounds(terms):
    a,b=atan_reciprocal_bounds(5,terms)
    c,d=atan_reciprocal_bounds(239,terms)
    lo,hi=16*a-4*d,16*b-4*c
    assert 3<lo<hi<4
    # Exact algebra underlying Machin's identity:
    # (5+i)^4*(239-i)=114244*(1+i). The branch argument is in theorem.md.
    z=(1,0)
    for _ in range(4):z=(5*z[0]-z[1],z[0]+5*z[1])
    z=(239*z[0]+z[1],239*z[1]-z[0])
    assert z==(114244,114244)
    return lo,hi

def decimal_floor(x,places):
    scale=10**places;integer=x.numerator*scale//x.denominator
    return Q(integer,scale),str(integer//scale)+'.'+str(integer%scale).zfill(places)

def main():
    if not __debug__:raise RuntimeError('Assertions are proof gates; do not use -O or -OO.')
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--norm-cap',required=True,help='Exact positive rational or terminating decimal; analytic input, not verified here.')
    ap.add_argument('--dimensions',nargs='+',type=int,default=[10,100,1000,2000,10000])
    ap.add_argument('--places',type=int,default=12)
    ap.add_argument('--pi-terms',type=int,default=60)
    ap.add_argument('--output',type=Path)
    args=ap.parse_args();norm=Q(args.norm_cap)
    assert norm>0 and args.places>=1 and args.pi_terms>=1
    assert args.dimensions and all(n>=1 for n in args.dimensions)
    lo,hi=pi_bounds(args.pi_terms)
    rows=[]
    print('CONDITIONAL ON INPUT NORM CAP:',norm)
    print('Epsilon:',EPS,'; pi enclosure: exact Machin alternating series')
    print('This is rational arithmetic verification, not Lean verification.')
    for n in args.dimensions:
        rational_factor=Q(n*comb(2*n,n)**2,16**n)*(1-EPS/Q(4*(n+1)))
        assert rational_factor>0
        exact_lower=lo*rational_factor/norm
        rounded,display=decimal_floor(exact_lower,args.places)
        assert 0<=rounded<=exact_lower
        # Since lo < pi and rational_factor/norm > 0, rounded is STRICTLY
        # below the actual analytic ratio, even if this rational <= is equality.
        print('K_G^C(%d) > %s'%(n,display))
        rows.append(dict(dimension=n,strict_lower=str(rounded),decimal=display,
                         proof='rounded <= pi_lower*positive_factor/norm_cap < pi*positive_factor/norm_cap'))
    result=dict(status='PASS_CONDITIONAL',norm_cap=str(norm),epsilon=str(EPS),
                analytic_assumption='For each requested n, ||P_(1,0)-(37/50)P_(2,1)||_(infinity->1) <= norm_cap.',
                pi_method='Machin identity, rational alternating arctangent series',pi_terms=args.pi_terms,
                pi_lower=str(lo),pi_upper=str(hi),places=args.places,results=rows,
                scope='Finite-order Grothendieck bounds assuming theorem.md and the input norm cap. No explicit finite witness matrix; no formal proof-assistant check.')
    if args.output:args.output.write_text(json.dumps(result,indent=2)+'\n')
    print('PASS: exact terminal inequalities; supplied operator-norm hypothesis remains explicit.')

if __name__=='__main__':main()
