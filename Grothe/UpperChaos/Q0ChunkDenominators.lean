import Grothe.UpperChaos.Q0RawWickDefs
import Grothe.UpperChaos.CommonDenAppend

/-!
# Composing source-chunk Wick denominators

This source-independent list identity reduces a common denominator of the
flattened raw expansion to the LCM of the individual chunk denominators.
It asserts no particular partition, numerical denominator, or computation.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.Q0ChunkDenominators

open GrotheKernel
open Grothe.UpperChaos.Q0RawWickTerms
open Grothe.UpperChaos.Q0RawWickDense
open Grothe.UpperChaos.CommonDenAppend

abbrev SourceTerm := (ℕ × ℕ × ℕ) × ℚ

/-- Raw Wick expansion distributes over concatenated source chunks. -/
theorem rawWickEntries_append (xs ys : List SourceTerm) :
    rawWickEntries (xs ++ ys) = rawWickEntries xs ++ rawWickEntries ys := by
  induction xs with
  | nil => simp [rawWickEntries]
  | cons t ts ih => simp [rawWickEntries, ih, List.append_assoc]

/-- The common denominator of flattened source chunks is the LCM of their
separately computed raw Wick denominators. -/
theorem commonDen_rawWickEntries_flatten (chunks : List (List SourceTerm)) :
    commonDen (rawWickEntries chunks.flatten) =
      (chunks.map (fun chunk => commonDen (rawWickEntries chunk))).foldl Nat.lcm 1 := by
  rw [List.foldl_map]
  induction chunks with
  | nil => rfl
  | cons chunk chunks ih =>
      rw [List.flatten_cons, rawWickEntries_append, commonDen_append]
      simp only [List.foldl_cons, Nat.lcm_one_left]
      rw [foldl_lcm_seed, ← ih]

/-- Any checked partition of the actual phase list gives a chunkwise
decomposition of its canonical raw Wick denominator. -/
theorem q0RawWickDen_eq_chunkLCM (chunks : List (List SourceTerm))
    (hpartition : chunks.flatten = phaseTerms) :
    q0RawWickDen =
      (chunks.map (fun chunk => commonDen (rawWickEntries chunk))).foldl Nat.lcm 1 := by
  unfold q0RawWickDen q0RawWickEntries
  rw [← hpartition, commonDen_rawWickEntries_flatten]

end Grothe.UpperChaos.Q0ChunkDenominators
