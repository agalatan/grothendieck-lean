#!/usr/bin/env python3
"""Cut a right seven-cell pilot, byte-for-byte, from the pinned full generator."""
import argparse
import hashlib
from pathlib import Path
import gen_origin_unweighted64_full as full

ROOT=Path(__file__).resolve().parents[1]
FULL_HASH='d40ea1ec3835f57bd3e7671142585d966551cad9e1bdfe9a4eeaf9443ff4c01b'
HELPER_HASH='d995a31e9c285d01feac210fa977ec51ab0b9aad65bf144ae1f083ac9da2fea7'
FILES=[
 'Grothe/HJM/OriginUnweightedMeanPolynomial.lean',
 'Grothe/HJM/OriginUnweightedRightWitness.lean',
 'Grothe/HJM/OriginUnweightedRightCells.lean',
 'Grothe/HJM/OriginUnweightedRightCheckData.lean',
 'Grothe/HJM/OriginUnweightedRightCombined00.lean',
]
AXIOMS=[
 'Grothe.HJM.OriginUnweightedRightChecks.combinedBlock00._native.native_decide.ax_1_1',
 'Grothe.HJM.OriginUnweightedRightWitness.polynomial_eq._native.native_decide.ax_1_1',
]

def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser()
 ap.add_argument('--check',action='store_true')
 ap.add_argument('--full-root',type=Path,help='also compare pilot files against this generated full tree')
 args=ap.parse_args()
 if sha(Path(full.__file__))!=FULL_HASH or sha(Path(full.g.__file__))!=HELPER_HASH:
  raise SystemExit('pinned generator or helper changed')
 rendered=full.render(full.g.load())
 inv=rendered['data/axioms/native-proposed.txt'].splitlines()
 if any(x not in inv for x in AXIOMS):raise SystemExit('full proposed inventory mismatch')
 output={k:rendered[k] for k in FILES}
 for name,body in output.items():
  path=ROOT/name; data=body.encode('utf-8')
  if args.check:
   if not path.is_file() or path.read_bytes()!=data:raise SystemExit('pilot output mismatch: '+name)
  else:
   path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(data)
  if args.full_root and name in FILES:
   if (args.full_root/name).read_bytes()!=data:raise SystemExit('full source mismatch: '+name)
 print(('checked' if args.check else 'generated'),len(FILES),'Lean files; 7 cells')
 for ax in sorted(AXIOMS):print('proposed native:',ax)
if __name__=='__main__':main()
