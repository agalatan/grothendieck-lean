#!/usr/bin/env python3
"""Generate/check the q0 assembly from the same partition as the chunks.

Inputs and generated certificates are untrusted until Lean checks them.
The --check mode computes expected bytes in memory without filesystem writes.
"""
import argparse
from pathlib import Path
import re
import sys

sys.dont_write_bytecode = True
from gen_q0_source_chunks import read_inputs, partition
from q0_source_chunks import emit_chunk

DEFAULT_ROOT = Path(__file__).resolve().parents[1]


def render_assembly(chunks, source_hash, assembly_name):
    imports = []
    pairs = []
    denominators = []
    sizes = []
    table_proofs = []
    denominator_proofs = []
    for c in chunks:
        offset, count = c["offset"], c["count"]
        table_module = Path(c["table_file"]).stem
        denominator_module = Path(c["denominator_file"]).stem
        imports.extend([f"import Grothe.UpperChaos.{table_module}",
                        f"import Grothe.UpperChaos.{denominator_module}"])
        pairs.append(f"  (((phaseTerms.drop {offset}).take {count}), "
                     f"Grothe.UpperChaos.{table_module}.literal)")
        denominators.append(c["raw_common_denominator_candidate"])
        sizes.append(str(count))
        table_proofs.append(f"Grothe.UpperChaos.{table_module}.check_phaseTerms")
        denominator_proofs.append(f"Grothe.UpperChaos.{denominator_module}.raw_phaseTerms_commonDen")

    module = '''import Grothe.UpperChaos.Q0LiteralChunkAssembly
import Grothe.UpperChaos.Q0ChunkDenominators
import Mathlib.Data.List.SplitLengths
''' + "\n".join(imports) + f'''

/-! Conditional full-source assembly. Candidate data are untrusted; the
partition-size bound, each chunk/denominator equality, the denominator LCM,
and the combined literal-table equality are explicit hypotheses.
Source Data.lean SHA256: {source_hash}
Agent-ID: codex-8c4d. -/

open GrotheKernel
namespace Grothe.UpperChaos.{assembly_name}
open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0RawWickTerms
open Grothe.UpperChaos.Q0RawWickDense
open Grothe.UpperChaos.Q0ChunkDenominators
open Grothe.UpperChaos.Q0LiteralSourceData
open Grothe.UpperChaos.Q0LiteralChunkAssembly

/-- Drop/take chunks with explicit increasing offsets. -/
def offsetChunks {{α : Type}} (xs : List α) : Nat → List Nat → List (List α)
  | _, [] => []
  | offset, n :: ns => (xs.drop offset).take n :: offsetChunks xs (offset + n) ns

theorem offsetChunks_eq_splitLengths {{α : Type}} (xs : List α) (sizes : List Nat)
    (offset : Nat) : offsetChunks xs offset sizes = sizes.splitLengths (xs.drop offset) := by
  induction sizes generalizing offset with
  | nil => rfl
  | cons n sizes ih =>
      simp only [offsetChunks, List.splitLengths_cons, ih, List.drop_drop]

def sizes : List Nat := [{','.join(sizes)}]

set_option maxRecDepth 65536 in
def pairs : List (List Grothe.UpperChaos.Q0WickChunking.SourceTerm × DenseWick) := [
{',\n'.join(pairs)}
]

def candidateDenominators : List Nat := [{','.join(denominators)}]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 12000000 in
/-- Symbolic list bookkeeping only; this does not parse or expand source terms. -/
theorem pairs_sources_eq_offsets :
    pairs.map Prod.fst = offsetChunks phaseTerms 0 sizes := by
  simp only [pairs, sizes, List.map_cons, List.map_nil, offsetChunks, Nat.reduceAdd]

/-- An explicit source-length bound yields the actual phase partition. -/
theorem partition_of_length_bound (hcover : phaseTerms.length ≤ sizes.sum) :
    (pairs.map Prod.fst).flatten = phaseTerms := by
  rw [pairs_sources_eq_offsets, offsetChunks_eq_splitLengths, List.drop_zero]
  exact List.flatten_splitLengths phaseTerms sizes hcover

/-- Individually checked chunk denominators and a checked integer LCM give
the actual canonical denominator; no numeric value is assumed implicitly. -/
theorem denominator_of_checked_chunks
    (hcover : phaseTerms.length ≤ sizes.sum)
    (hdenChunks : ((pairs.map Prod.fst).map
      (fun c => commonDen (rawWickEntries c))) = candidateDenominators)
    (hdenLCM : candidateDenominators.foldl Nat.lcm 1 = sourceDen) :
    q0RawWickDen = sourceDen := by
  rw [q0RawWickDen_eq_chunkLCM (pairs.map Prod.fst) (partition_of_length_bound hcover),
    hdenChunks, hdenLCM]

/-- Full source-sum binding, conditional on every remaining checked piece. -/
theorem sourceSum_of_checked_assembly
    (hcover : phaseTerms.length ≤ sizes.sum)
    (hdenChunks : ((pairs.map Prod.fst).map
      (fun c => commonDen (rawWickEntries c))) = candidateDenominators)
    (hdenLCM : candidateDenominators.foldl Nat.lcm 1 = sourceDen)
    (hchunks : ∀ pair ∈ pairs, sourceChunkDense sourceDen pair.1 = pair.2)
    (hcombined : (pairs.map Prod.snd).foldr add3 [] = sourceCoefficients)
    (s b v : ℝ) :
    Ssum q0RawWickEntries s b v = he3 sourceCoefficients s b v / sourceDen :=
  q0_source_sum_eq_fullLiteral_of_checked_chunks pairs (partition_of_length_bound hcover)
    (denominator_of_checked_chunks hcover hdenChunks hdenLCM) hchunks hcombined s b v

end Grothe.UpperChaos.{assembly_name}
'''
    # The concrete certificate declarations are always emitted.
    if True:
        den_lemmas = ",\n    ".join(denominator_proofs)
        table_steps = ",\n    ".join(table_proofs)
        concrete = f'''
/-! These are generated proof attempts. Their only remaining full-source
obligation, after successful checking of these declarations, is the separate
literal-table combination equality. -/

set_option maxRecDepth 65536 in
set_option maxHeartbeats 12000000 in
set_option cbv.maxSteps 2000000 in
theorem concrete_cover : phaseTerms.length ≤ sizes.sum := by
  simp only [phaseTerms, List.length_map]
  cbv

set_option maxRecDepth 65536 in
set_option maxHeartbeats 12000000 in
theorem concrete_chunk_denominators :
    ((pairs.map Prod.fst).map (fun c => commonDen (rawWickEntries c))) =
      candidateDenominators := by
  simp (config := {{ maxSteps := 1000000 }}) only [pairs, candidateDenominators,
    List.map_cons, List.map_nil,
    {den_lemmas}]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 12000000 in
set_option cbv.maxSteps 2000000 in
theorem concrete_denominator_lcm : candidateDenominators.foldl Nat.lcm 1 = sourceDen := by
  cbv

set_option maxRecDepth 65536 in
set_option maxHeartbeats 12000000 in
theorem concrete_chunk_tables :
    ∀ pair ∈ pairs, sourceChunkDense sourceDen pair.1 = pair.2 := by
  apply (List.forall_iff_forall_mem
    (p := fun (pair : List Grothe.UpperChaos.Q0WickChunking.SourceTerm × DenseWick) =>
      sourceChunkDense sourceDen pair.1 = pair.2)).mp
  simp only [pairs, List.Forall]
  exact ⟨{table_steps}⟩

/-- Conditional only on the separately checked literal-table combination. -/
theorem sourceSum_of_concrete_chunks
    (hcombined : (pairs.map Prod.snd).foldr add3 [] = sourceCoefficients)
    (s b v : ℝ) :
    Ssum q0RawWickEntries s b v = he3 sourceCoefficients s b v / sourceDen :=
  sourceSum_of_checked_assembly concrete_cover concrete_chunk_denominators
    concrete_denominator_lcm concrete_chunk_tables hcombined s b v

'''
        ending = f"end Grothe.UpperChaos.{assembly_name}\n"
        if not module.endswith(ending):
            raise ValueError("could not locate generated namespace end")
        module = module[:-len(ending)] + concrete + ending
    return module


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path, default=DEFAULT_ROOT,
                        help='repository root (default: parent of tracked tools/)')
    parser.add_argument('--source-json', type=Path,
                        default=Path('data/q0-source-binding/source-polynomial.json'),
                        help='canonical source JSON, absolute or root-relative')
    parser.add_argument('--module-name', required=True,
                        help='stable capitalized Lean module name')
    parser.add_argument('--output', type=Path,
                        help='override output path, absolute or root-relative')
    parser.add_argument('--check', action='store_true',
                        help='compare expected bytes without modifying files')
    args = parser.parse_args()
    if not re.fullmatch(r'[A-Z][A-Za-z0-9_]*', args.module_name):
        raise ValueError('module-name must be a capitalized Lean module identifier')
    root = args.root.resolve()
    source_json = args.source_json
    if not source_json.is_absolute():
        source_json = root / source_json
    path = args.output or Path('Grothe/UpperChaos') / (args.module_name + '.lean')
    if not path.is_absolute():
        path = root / path
    if path.name != args.module_name + '.lean':
        raise ValueError('output filename must match module-name')

    terms, denominator, source_hash = read_inputs(root, source_json)
    parts = partition(terms)
    chunks = []
    for offset, count, expected_raw in parts:
        _rendered, actual_raw, local_den = emit_chunk(terms, denominator, offset, count, source_hash)
        if actual_raw != expected_raw:
            raise AssertionError(f'raw count mismatch at offset {offset}')
        chunks.append({
            'offset': offset, 'count': count,
            'table_file': f'Q0Chunk_o{offset}_n{count}.lean',
            'denominator_file': f'Q0ChunkDen_o{offset}_n{count}.lean',
            'raw_common_denominator_candidate': str(local_den),
        })
    expected = render_assembly(chunks, source_hash, args.module_name).encode('utf-8')
    if args.check:
        if not path.is_file() or path.read_bytes() != expected:
            raise SystemExit(f'missing or changed: {path}')
        print(f'verified {path}: {len(chunks)} chunks, {len(expected)} bytes')
    else:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(expected)
        print(f'wrote {path}: {len(chunks)} chunks, {len(expected)} bytes')


if __name__ == '__main__':
    main()
