#!/usr/bin/env python3
"""Exact aggregation of ALL 456 Arb scale receipts, with separate omissions.

External Arb/analytic evidence only, not a Lean theorem. Usage: directory.
"""

if not __debug__:
    raise SystemExit("optimized Python is unsupported: checks must remain enabled")
from fractions import Fraction as Q
from pathlib import Path
import json, hashlib, sys
from check_center_source import read_center

here=Path(__file__).resolve().parent;root=here.parents[1]
files=sorted(Path(sys.argv[1]).glob('q0-m*.json'))
rows=[json.loads(p.read_text()) for p in files]
seen={}
metadata={'flint_version':'0.9.0','eta':'1e-14','h':'3/10','lower_index':-220,'upper_index':235,'normalization':'1+15e-15',
 'omitted_root_rule':'m>=9 on J','q0_omitted_root_m6to8_budget':'3e-21','outer_s_tail_budget':'1e-16','scale_budget':'1e-17'}
data_hash=hashlib.sha256((root/'data/upper-preprocess/certificate.json').read_bytes()).hexdigest()
lean_hash=hashlib.sha256((root/'Grothe/Upper/Data.lean').read_bytes()).hexdigest()
script_hash=hashlib.sha256((here/'softened_q0_cover.py').read_bytes()).hexdigest()
def dyadic(pair):
 m,e=map(int,pair);return Q(m)*(Q(2)**e)
mid=rad=Q(0)
for r in rows:
 assert r['successful'] and r['first']==r['last']==r['expected_last']
 n=r['first'];assert -220<=n<=235 and n not in seen
 for k,v in metadata.items():assert r[k]==v,(n,k,r[k],v)
 assert r['input_sha256']==data_hash and r['lean_data_sha256']==lean_hash and r['script_sha256']==script_hash
 assert r['leaves']>0 and r['failures']==[]
 assert r['suppressed']+r['taylored']+r['adaptive']==r['leaves']
 seen[n]=True
 m=dyadic(r['mid_mantissa_exp']);d=dyadic(r['rad_mantissa_exp']);assert d>=0
 mid+=m;rad+=d
assert set(seen)==set(range(-220,236)), f'incomplete coverage: {len(seen)}/456'
assert rad<Q(5,10**15), 'aggregate numeric interval exceeds expected budget'
# q0 omitted retained m=6..8 on J and phase-weighted outer radial tail.
modified_error=rad+Q(3,10**21)+Q(1,10**16)
# Additional difference from original response: independent full mixture and
# root cutoff estimates, each charged once.
softened_error=modified_error+Q(4782,10**19)
actual_error=softened_error+Q(29,10**14)
center,center_hash=read_center(root)
print('modified-mixture midpoint:',mid,'modified-mixture radius:',modified_error)
print('full softened-mixture radius:',softened_error)
print('actual phase radius including approximations:',actual_error)
print('distance between midpoint and stored center:',abs(mid-center))
print('stored center lies in softened enclosure:', abs(mid-center)<=softened_error)
print('actual coefficient proven within 4.9e-13 of center under the written analytic inputs:',
      abs(mid-center)+actual_error<Q(49,10**14))
print('center source SHA256:',center_hash)
print('ALL omitted-tail/phase bounds remain separate analytic inputs, not Lean theorems.')
