#!/usr/bin/env python3
"""Generate the 64-mode full follow-up while reusing the guarded pilot."""
import argparse
import hashlib
from pathlib import Path
import gen_origin_unweighted64_full as full
import gen_origin_unweighted64_pilot as pilot

ROOT=Path(__file__).resolve().parents[1]
PILOT_HASH='5545fd5cb3d0c3f3e65435880041ce165f912490073216de0fd7c0a11032883d'

def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()

def main():
 ap=argparse.ArgumentParser()
 ap.add_argument('--check',action='store_true')
 ap.add_argument('--list-native',action='store_true')
 args=ap.parse_args()
 if sha(Path(pilot.__file__))!=PILOT_HASH or sha(Path(full.__file__))!=pilot.FULL_HASH or sha(Path(full.g.__file__))!=pilot.HELPER_HASH:
  raise SystemExit('pinned full generator or helper changed')
 outputs=full.render(full.g.load())
 lean={name:body for name,body in outputs.items() if name.startswith('Grothe/') and name.endswith('.lean')}
 existing=set(pilot.FILES)
 if len(lean)!=37 or len(existing)!=5 or not existing<=lean.keys():
  raise SystemExit('unexpected complete or pilot module set')
 for name in sorted(existing):
  path=ROOT/name
  if not path.is_file() or path.read_bytes()!=lean[name].encode('utf-8'):
   raise SystemExit('existing pilot differs from full source: '+name)
 all_axioms=outputs['data/axioms/native-proposed.txt'].splitlines()
 if len(all_axioms)!=32 or len(set(all_axioms))!=32 or not set(pilot.AXIOMS)<=set(all_axioms):
  raise SystemExit('unexpected full or pilot native inventory')
 follow_axioms=sorted(set(all_axioms)-set(pilot.AXIOMS))
 if len(follow_axioms)!=30:raise SystemExit('expected 30 additional native proposals')
 new={k:v for k,v in lean.items() if k not in existing}
 if len(new)!=32:raise SystemExit('expected 32 new Lean modules')
 new['data/hjm/origin/unweighted64-aggregate-exact.json']=outputs['data/hjm/origin/unweighted64-aggregate-exact.json']
 for name,body in new.items():
  path=ROOT/name;data=body.encode('utf-8')
  if args.check:
   if not path.is_file() or path.read_bytes()!=data:raise SystemExit('follow-up output mismatch: '+name)
  else:
   path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(data)
 print(('checked' if args.check else 'generated'),len(new)-1,'new Lean modules and 1 exact aggregate; reused 5 pilot files; 30 proposed additional native facts')
 if args.list_native:
  for ax in follow_axioms:print(ax)
if __name__=='__main__':main()
