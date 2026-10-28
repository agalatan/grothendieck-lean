import Grothe.UpperChaos.Q0RawWickDefs
import Grothe.UpperChaos.CommonDenAppend
import Grothe.UpperChaos.PhiHorner
import Mathlib.Tactic.Ring

/-!
# Semantic composition of source-derived Wick chunks

Each chunk is expanded and scaled with the same chosen denominator. The
lemmas compose chunks at the Horner-evaluation level, so ragged zero padding
does not need to be equal. They assert no concrete chunk or literal table.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.Q0WickChunking

open GrotheKernel
open Grothe.UpperChaos.PhaseMomentCheck
open Grothe.UpperChaos.Q0RawWickTerms
open Grothe.UpperChaos.Q0RawWickDense

abbrev SourceTerm := (ℕ × ℕ × ℕ) × ℚ
abbrev DenseWick := List (List (List ℤ))

/-- Expand and scale one source chunk with a chosen common denominator. -/
def sourceChunkDense (L : ℕ) (xs : List SourceTerm) : DenseWick :=
  ofTerms L (rawWickEntries xs)

/-- Combine separately computed chunk tables with the existing integer
polynomial addition. -/
def combineChunks (chunks : List (List SourceTerm)) (emit : List SourceTerm → DenseWick) :
    DenseWick :=
  chunks.foldr (fun chunk acc => add3 (emit chunk) acc) []

/-- The raw expansion distributes over source-list concatenation. -/
theorem rawWickEntries_append (xs ys : List SourceTerm) :
    rawWickEntries (xs ++ ys) = rawWickEntries xs ++ rawWickEntries ys := by
  induction xs with
  | nil => simp [rawWickEntries]
  | cons t ts ih => simp [rawWickEntries, ih, List.append_assoc]

/-- Adding compiled chunks agrees semantically with compiling their appended
raw entries, even when the dense representations have different zero padding. -/
theorem eval_ofTerms_append (L : ℕ) (xs ys : List SourceTerm) (s b v : ℝ) :
    he3 (ofTerms L (xs ++ ys)) s b v =
      he3 (ofTerms L xs) s b v + he3 (ofTerms L ys) s b v := by
  induction xs with
  | nil => simp [ofTerms, he3]
  | cons t ts ih =>
      change he3 (add3 (monomial3 t.1.1 t.1.2.1 t.1.2.2
        (t.2 * (L : ℚ)).num) (ofTerms L (ts ++ ys))) s b v =
          he3 (add3 (monomial3 t.1.1 t.1.2.1 t.1.2.2
            (t.2 * (L : ℚ)).num) (ofTerms L ts)) s b v + he3 (ofTerms L ys) s b v
      rw [e3_add3, e3_add3, ih]
      ring

theorem eval_sourceChunkDense_append (L : ℕ) (xs ys : List SourceTerm) (s b v : ℝ) :
    he3 (sourceChunkDense L (xs ++ ys)) s b v =
      he3 (sourceChunkDense L xs) s b v + he3 (sourceChunkDense L ys) s b v := by
  simp only [sourceChunkDense, rawWickEntries_append, eval_ofTerms_append]

/-- Combining any finite list of chunks evaluates like compiling the flattened
source list once. -/
theorem eval_combineChunks (L : ℕ) (chunks : List (List SourceTerm)) (s b v : ℝ) :
    he3 (combineChunks chunks (sourceChunkDense L)) s b v =
      he3 (sourceChunkDense L chunks.flatten) s b v := by
  induction chunks with
  | nil => simp [combineChunks, sourceChunkDense, rawWickEntries, ofTerms, he3]
  | cons chunk chunks ih =>
      change he3 (add3 (sourceChunkDense L chunk)
        (combineChunks chunks (sourceChunkDense L))) s b v =
          he3 (sourceChunkDense L (chunk ++ chunks.flatten)) s b v
      rw [e3_add3, eval_sourceChunkDense_append, ih]

/-- Replacing independently checked chunk tables preserves the combined
integer table. -/
theorem combineChunks_congr (chunks : List (List SourceTerm))
    (emit₁ emit₂ : List SourceTerm → DenseWick)
    (h : ∀ chunk ∈ chunks, emit₁ chunk = emit₂ chunk) :
    combineChunks chunks emit₁ = combineChunks chunks emit₂ := by
  revert h
  induction chunks with
  | nil => intro h; rfl
  | cons chunk chunks ih =>
      intro h
      have htail : ∀ c ∈ chunks, emit₁ c = emit₂ c :=
        fun c hc => h c (List.mem_cons_of_mem chunk hc)
      change add3 (emit₁ chunk) (combineChunks chunks emit₁) =
        add3 (emit₂ chunk) (combineChunks chunks emit₂)
      rw [h chunk (by simp), ih htail]

/-- A chunk partition and per-chunk literal equalities bind the source's
canonical dense evaluation to the combined literal chunk tables. -/
theorem q0_dense_eval_of_checked_chunks (chunks : List (List SourceTerm))
    (literal : List SourceTerm → DenseWick) (hpartition : chunks.flatten = phaseTerms)
    (hchunks : ∀ chunk ∈ chunks, sourceChunkDense q0RawWickDen chunk = literal chunk)
    (s b v : ℝ) :
    he3 q0RawWickDense s b v = he3 (combineChunks chunks literal) s b v := by
  have hcombine := combineChunks_congr chunks (sourceChunkDense q0RawWickDen) literal hchunks
  rw [← hcombine, eval_combineChunks, hpartition]
  rfl

end Grothe.UpperChaos.Q0WickChunking
