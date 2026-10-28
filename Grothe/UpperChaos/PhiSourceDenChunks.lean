import Grothe.UpperChaos.CommonDenAppend
import Grothe.Upper.Data
import Mathlib.Data.List.SplitLengths

/-!
# Chunkwise common denominators for the actual phase source

This module contains only generic LCM and partition composition. Candidate
chunk denominators, coverage and the final LCM are explicit obligations; no
particular numerical value or phase-cover leaf is asserted here.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.PhiSourceDenChunks

open GrotheKernel
open Grothe.UpperChaos.CommonDenAppend

abbrev SourceTerm := (Nat × Nat × Nat) × Rat

/-- The common denominator of flattened chunks is the LCM of the individual
source-chunk denominators. -/
theorem commonDen_flatten (chunks : List (List SourceTerm)) :
    commonDen chunks.flatten =
      (chunks.map commonDen).foldl Nat.lcm 1 := by
  rw [List.foldl_map]
  induction chunks with
  | nil => rfl
  | cons chunk chunks ih =>
      rw [List.flatten_cons, commonDen_append]
      simp only [List.foldl_cons, Nat.lcm_one_left]
      rw [foldl_lcm_seed, ← ih]

/-- Two adjacent prefixes compose without any assumption about their contents. -/
theorem commonDen_parse_take_add (xs : List String) (a b : Nat) :
    commonDen ((xs.take (a + b)).map parseTerm) =
      Nat.lcm (commonDen ((xs.take a).map parseTerm))
        (commonDen (((xs.drop a).take b).map parseTerm)) := by
  rw [List.take_add, List.map_append, commonDen_append]

/-- Once coverage and each denominator are checked, their checked LCM is the
common denominator of the actual parsed phase-source list. -/
theorem phase_source_commonDen_of_checked_chunks
    (sizes denominators : List Nat) (D : Nat)
    (hcover : Grothe.Upper.phaseStrs.length ≤ sizes.sum)
    (hchunks : ((sizes.splitLengths (Grothe.Upper.phaseStrs.map parseTerm)).map commonDen) =
      denominators)
    (hlcm : denominators.foldl Nat.lcm 1 = D) :
    commonDen (Grothe.Upper.phaseStrs.map parseTerm) = D := by
  have hpartition :
      (sizes.splitLengths (Grothe.Upper.phaseStrs.map parseTerm)).flatten =
        Grothe.Upper.phaseStrs.map parseTerm := by
    apply List.flatten_splitLengths
    simpa only [List.length_map] using hcover
  rw [← hpartition, commonDen_flatten, hchunks, hlcm]

end Grothe.UpperChaos.PhiSourceDenChunks
