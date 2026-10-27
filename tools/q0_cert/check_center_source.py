#!/usr/bin/env python3
"""Externally replay the strict packed first-center parser; not a Lean proof."""
if not __debug__:
    raise SystemExit('optimized Python is unsupported: checks must remain enabled')
from pathlib import Path
from fractions import Fraction as Q
import re,hashlib

def read_center(root):
 path=Path(root)/'Grothe/UpperChaos/TaylorFirstData.lean'
 text=path.read_text().split('def firstCenterPackedChunks : Array String := #[',1)[1].split(']',1)[0]
 chunks=re.findall(r'"([^"]*)"',text)
 assert chunks and not re.sub(r'"[^"]*"','',text).strip(' \t\r\n,')
 first=None; count=0
 for chunk in chunks:
  for record in chunk.split(',') if chunk else []:
   match=re.fullmatch(r'(-?\d+):(\d+)',record)
   assert match
   mantissa,exponent=int(match[1]),int(match[2])
   assert abs(mantissa)<2**53 and exponent<=206
   if first is None:first=Q(mantissa,2**exponent)
   count+=1
 assert count==259532 and first==Q(-2082728447489861,2**64)
 return first,hashlib.sha256(path.read_bytes()).hexdigest()

if __name__=='__main__':
 center,digest=read_center(Path(__file__).resolve().parents[2])
 print('PASS: 259532 records decode, first center',center,'source SHA256',digest)
 print('Existing Lean theorem taylor_centers_decode_check uses native_decide; this replay is external.')
