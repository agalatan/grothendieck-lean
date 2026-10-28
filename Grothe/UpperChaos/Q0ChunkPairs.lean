import Grothe.UpperChaos.Q0WickChunking

/-!
# Semantic evaluation of source-derived q0 chunk pairs

This generic list lemma does not import the full literal source table or the
production source-sum proof.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.Q0LiteralChunkAssembly

open GrotheKernel
open Grothe.UpperChaos.PhaseMomentCheck
open Grothe.UpperChaos.Q0RawWickTerms
open Grothe.UpperChaos.Q0WickChunking

/-- If each listed source chunk has its stated dense table, the combined
literal tables evaluate like the expansion of the flattened source chunks. -/
theorem eval_flatten_of_chunk_pairs (L : ℕ)
    (pairs : List (List SourceTerm × DenseWick))
    (hchunks : ∀ pair ∈ pairs, sourceChunkDense L pair.1 = pair.2)
    (s b v : ℝ) :
    he3 (sourceChunkDense L (pairs.map Prod.fst).flatten) s b v =
      he3 ((pairs.map Prod.snd).foldr add3 []) s b v := by
  revert hchunks
  induction pairs with
  | nil =>
      intro hchunks
      simp [sourceChunkDense, rawWickEntries, ofTerms, he3]
  | cons pair pairs ih =>
      intro hchunks
      have htail : ∀ p ∈ pairs, sourceChunkDense L p.1 = p.2 :=
        fun p hp => hchunks p (List.mem_cons_of_mem pair hp)
      change he3 (sourceChunkDense L (pair.1 ++ (pairs.map Prod.fst).flatten)) s b v =
        he3 (add3 pair.2 ((pairs.map Prod.snd).foldr add3 [])) s b v
      rw [eval_sourceChunkDense_append, e3_add3, ← ih htail, hchunks pair (by simp)]

end Grothe.UpperChaos.Q0LiteralChunkAssembly
