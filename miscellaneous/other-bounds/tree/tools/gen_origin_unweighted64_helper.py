#!/usr/bin/env python3
"""Pinned input loading and exact rational utilities for the guarded 64-mode generator."""
from __future__ import annotations
import argparse, hashlib, json
from fractions import Fraction as Q
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
INPUTS={
 'origin':('data/hjm/origin/certificate.json','7bbfe51ea6e74bac111d6d9e974de6badd0300a6046d89ef08acf6c07786af59'),
 'panels':('data/hjm/origin/phase-panels-r8.json','76b2d5f3df4dd7c39d3202d12269650f8b9712158026232f6a1dcd80390ff35d'),
 'witness':('data/hjm/origin/visible-witnesses.json','d7119d6ef8506506ddb62c0acc31a9045e185fac8778880fb34368783b1500a7'),
 'receipt':('data/hjm/origin/unweighted64-replay.json','f848c959f28899145b032d8c5906615fea21a2f8da0a4e25fee3176e5d9ca526')}
PILOT=[0,1,2,30,48,70,97]
MEAN_TEMPLATE=('data/hjm/origin/OriginUnweightedMeanPolynomial.lean.template',
 '85914e72dd28873db5be02c9887df6784344682e2ad0bc610dc80a68c4f0eeba')

def load():
 d={}
 for name,(path,digest) in INPUTS.items():
  raw=(ROOT/path).read_bytes()
  if hashlib.sha256(raw).hexdigest()!=digest:raise ValueError('hash mismatch: '+path)
  d[name]=json.loads(raw)
 raw=(ROOT/MEAN_TEMPLATE[0]).read_bytes()
 if hashlib.sha256(raw).hexdigest()!=MEAN_TEMPLATE[1]:raise ValueError('mean template hash mismatch')
 d['mean_template']=raw.decode('utf-8')
 o,p,w,r=(d[k] for k in ('origin','panels','witness','receipt'))
 if not (r['complete'] and r['witness_modes']==64 and r['scale']==10**18 and len(r['records'])==196):
  raise ValueError('incomplete or incompatible receipt')
 if (r['source_sha256'],r['panels_sha256'],r['witness_sha256']) != tuple(INPUTS[x][1] for x in ('origin','panels','witness')):
  raise ValueError('receipt input linkage mismatch')
 if not (o['upstream_commit']==p['pinned_upstream_commit']==w['upstream_commit']):raise ValueError('upstream mismatch')
 for part in ('Real','Imag'):
  if o['definitions']['right'+part]!=p['exact_phase_polynomial_inputs']['right'+part]:raise ValueError('source mismatch')
 return d

def split(a,b):
 if not a<b:raise ValueError('invalid panel')
 c,h=(a+b)/2,(b-a)/2
 if 2*c*h+h*h<=Q(1,2):return [(a,b)]
 return split(a,c)+split(c,b)

def rows(d):
 runs=[x for x in d['panels']['runs'] if x['side']=='right' and x['degree_W']==16]
 if len(runs)!=1:raise ValueError('right panel run mismatch')
 records=[x for x in d['receipt']['records'] if x['side']=='right']
 cells=[];cursor=Q(0)
 for i,panel in enumerate(runs[0]['certificate']):
  a,b=Q(panel['a']),Q(panel['b'])
  if a!=cursor:raise ValueError('phase panel gap')
  for lo,hi in split(a,b):
   if lo!=cursor or not a<=lo<hi<=b:raise ValueError('invalid subpanel')
   cells.append((lo,hi,i));cursor=hi
 if cursor!=8 or len(cells)!=98 or len(records)!=98:raise ValueError('bad cover')
 for (lo,hi,parent),rec in zip(cells,records):
  if (lo,hi,parent)!=(Q(rec['a']),Q(rec['b']),rec['panel']):raise ValueError('receipt cell mismatch')
  for key in ('correlation','Jre','Jim'):
   a,b=rec[key]
   if not (type(a) is int and type(b) is int and a<=b):raise ValueError('invalid interval')
 return cells,records

def witness_polynomial(alpha):
 if len(alpha)!=120:raise ValueError('witness length mismatch')
 prev,lag=[],[Q(1)];out=[[Q(0)]*64 for _ in range(2)]
 for n,pair in enumerate(alpha[:64]):
  a,b=map(Q,pair);factor=Q(2*n+1)
  for j,x in enumerate(lag):out[0][j]+=a*x/factor;out[1][j]+=b*x/factor
  nxt=[Q(0)]*(len(lag)+1)
  for j,x in enumerate(lag):nxt[j]-=2*x;nxt[j+1]+=x/Q(n+1)
  for j,x in enumerate(prev):nxt[j]-=x
  prev,lag=lag,nxt
 return out

def leanq(x):
 x=Q(x)
 return f'({x.numerator} : ℚ)' if x.denominator==1 else f'(({x.numerator} : ℚ) / {x.denominator})'
def qlist(xs):return '([\n    '+',\n    '.join(leanq(x) for x in xs)+'\n  ] : List ℚ)'
def ints(xs):return '[\n  '+',\n  '.join(str(x) for x in xs)+']'

