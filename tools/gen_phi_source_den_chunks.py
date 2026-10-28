#!/usr/bin/env python3
"""Generate untrusted candidates from Data.lean; all results need Lean checks."""
import argparse
import hashlib
import tempfile
import json
import math
import re
from fractions import Fraction
from pathlib import Path

root = Path(__file__).resolve().parents[1]
source_path = root / 'Grothe/Upper/Data.lean'
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--check', action='store_true', help='compare generated files without writing to the repository')
args = parser.parse_args()
tmp = tempfile.TemporaryDirectory(prefix='grothe-phi-source-den-')
out = Path(tmp.name)
modules = out / 'Grothe/UpperChaos'
modules.mkdir(parents=True, exist_ok=True)
raw = source_path.read_bytes()
source_hash = hashlib.sha256(raw).hexdigest()
match = re.search(r'def phaseStrs\s*:\s*List String\s*:=\s*\[(.*?)\]', raw.decode(), re.S)
if not match:
    raise RuntimeError('phaseStrs definition not found')
body = match.group(1)
strings = re.findall(r'"([^"\\]*)"', body)
if re.sub(r'"[^"\\]*"|[\s,]', '', body):
    raise RuntimeError('unexpected source syntax in phaseStrs')
parsed = []
for item in strings:
    powers, coeff = item.split(':')
    if len(powers.split(',')) != 3 or any(not x.isdigit() for x in powers.split(',')):
        raise ValueError(f'unexpected monomial: {item}')
    parsed.append(Fraction(coeff))
chunks = []
for offset in range(0, len(parsed), 8):
    group = parsed[offset:offset + 8]
    count = len(group)
    den = math.lcm(*(f.denominator for f in group))
    name = f'PhiSourceDenChunk_o{offset}_n{count}'
    (modules / f'{name}.lean').write_text(f'''import GrotheKernel.PhiCheck
import Grothe.Upper.Data
import Mathlib.Tactic

/-! Untrusted candidate; this equality must be checked by Lean. Source SHA256:
{source_hash}
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.{name}

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem source_chunk_commonDen :
    GrotheKernel.commonDen
      (((Grothe.Upper.phaseStrs.drop {offset}).take {count}).map GrotheKernel.parseTerm) =
      {den} := by
  cbv

end Grothe.UpperChaos.{name}
''')
    chunks.append({'offset': offset, 'count': count,
                   'denominator_candidate': str(den),
                   'module': f'Grothe.UpperChaos.{name}'})
full_den = math.lcm(*(int(c['denominator_candidate']) for c in chunks))
sizes = ', '.join(str(c['count']) for c in chunks)
dens = ', '.join(c['denominator_candidate'] for c in chunks)
(modules / 'PhiSourceDenLiteralAssembly.lean').write_text(f'''import Grothe.UpperChaos.PhiSourceDenChunks
import Mathlib.Tactic

/-! Untrusted assembly proof attempt. The coverage and LCM are checked from
literal candidates, while the equality binding all actual parsed chunks to
these candidates is an explicit premise. Source SHA256:
{source_hash}
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.PhiSourceDenLiteralAssembly

open GrotheKernel Grothe.UpperChaos.PhiSourceDenChunks

def candidateSizes : List Nat := [{sizes}]
def candidateDenominators : List Nat := [{dens}]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem source_covered : Grothe.Upper.phaseStrs.length ≤ candidateSizes.sum := by
  cbv

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem literal_lcm : candidateDenominators.foldl Nat.lcm 1 = {full_den} := by
  cbv

/-- Every source chunk must still be independently linked to the literal
candidate list. This theorem does not assume such a link implicitly. -/
theorem source_commonDen_if_chunks_checked
    (hchunks : ((candidateSizes.splitLengths
      (Grothe.Upper.phaseStrs.map parseTerm)).map commonDen) = candidateDenominators) :
    commonDen (Grothe.Upper.phaseStrs.map parseTerm) = {full_den} := by
  exact phase_source_commonDen_of_checked_chunks candidateSizes candidateDenominators
    {full_den} source_covered hchunks literal_lcm

end Grothe.UpperChaos.PhiSourceDenLiteralAssembly
''')
manifest = {'status': 'untrusted candidates; no Lean proof checked in this generation',
            'source': 'Grothe/Upper/Data.lean', 'source_sha256': source_hash,
            'source_count': len(strings), 'chunk_count': len(chunks),
            'full_common_denominator_candidate': str(full_den), 'chunks': chunks,
            'assembly_module': 'Grothe.UpperChaos.PhiSourceDenLiteralAssembly',
            'assembly_note': 'hchunks source-binding equality remains an explicit hypothesis; no denseA0 or cover-leaf claims'}

chunks = manifest['chunks']
if len(chunks) != 143 or sum(c['count'] for c in chunks) != 1140:
    raise SystemExit('unexpected chunk partition')
for i, c in enumerate(chunks):
    if c['offset'] != 8 * i:
        raise SystemExit(f'unexpected offset in chunk {i}')
imports = ''.join(f"import {c['module']}\n" for c in chunks)
lemmas = ',\n    '.join(c['module'].removeprefix('Grothe.UpperChaos.') + '.source_chunk_commonDen'
                        for c in chunks)
source = f'''import Grothe.UpperChaos.PhiSourceDenLiteralAssembly
import Grothe.UpperChaos.PhiDegreeChunksDraft
{imports}
/-! Source-bound phase denominator assembly. All imported chunk equalities,
coverage, and candidate LCM must be checked before this theorem is evidence.
Source SHA256: {manifest['source_sha256']}
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.PhiSourceDenBinding
open GrotheKernel Grothe.UpperChaos.PhiSourceDenLiteralAssembly
open Grothe.UpperChaos.PhiDegreeChunksDraft

set_option maxRecDepth 65536 in
set_option maxHeartbeats 12000000 in
/-- The literal chunk denominators are exactly those of the parsed source. -/
theorem source_chunk_denominators :
    ((candidateSizes.splitLengths (Grothe.Upper.phaseStrs.map parseTerm)).map commonDen) =
      candidateDenominators := by
  rw [splitLengths_eq_offsetChunks]
  simp only [candidateSizes, candidateDenominators, offsetChunks, List.map_cons,
    List.map_nil, Nat.zero_add, Nat.reduceAdd, ← List.map_drop, ← List.map_take,
    {lemmas}]

/-- Full source common denominator, contingent on the imported checks passing. -/
theorem source_common_den :
    commonDen (Grothe.Upper.phaseStrs.map parseTerm) =
      {manifest['full_common_denominator_candidate']} :=
  source_commonDen_if_chunks_checked source_chunk_denominators

#print axioms source_chunk_denominators
#print axioms source_common_den
end Grothe.UpperChaos.PhiSourceDenBinding
'''
(modules / 'PhiSourceDenBinding.lean').write_text(source)


expected = sorted(modules.glob('*.lean'))
if len(expected) != len(chunks) + 2:
    raise SystemExit('unexpected generated file count')
target = root / 'Grothe/UpperChaos'
if args.check:
    different = [f.name for f in expected if not (target / f.name).is_file()
                 or (target / f.name).read_bytes() != f.read_bytes()]
    if different:
        raise SystemExit('generated files missing or different: ' + ', '.join(different))
    print(f'Checked {len(expected)} generated Lean files against {source_path.relative_to(root)}')
else:
    for f in expected:
        (target / f.name).write_bytes(f.read_bytes())
    print(f'Generated {len(expected)} Lean files from {source_path.relative_to(root)}')
tmp.cleanup()
