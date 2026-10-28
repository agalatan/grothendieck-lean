import Grothe.UpperChaos.Q0ChunkPairs
import Grothe.UpperChaos.Q0LiteralSourceData
import Grothe.UpperChaos.Q0RawWickDense

/-!
# Conditional assembly of source-derived q0 chunk literals

All computational obligations remain explicit: a source partition, each
chunk's exact table, the canonical denominator, and equality of the combined
literal tables with the full exported literal. No such concrete obligations
are asserted or checked in this module.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.Q0LiteralChunkAssembly

open GrotheKernel
open Grothe.UpperChaos.PhaseMomentCheck
open Grothe.UpperChaos.Q0RawWickTerms
open Grothe.UpperChaos.Q0RawWickDense
open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

/-- Once all explicit chunk, denominator, and literal-combination equalities
are proved, the full literal evaluates to the source-derived rational sum.
The result is reusable across cells and retains the exported denominator. -/
theorem q0_source_sum_eq_fullLiteral_of_checked_chunks
    (pairs : List (List SourceTerm × DenseWick))
    (hpartition : (pairs.map Prod.fst).flatten = phaseTerms)
    (hden : q0RawWickDen = sourceDen)
    (hchunks : ∀ pair ∈ pairs, sourceChunkDense sourceDen pair.1 = pair.2)
    (hcombined : (pairs.map Prod.snd).foldr add3 [] = sourceCoefficients)
    (s b v : ℝ) :
    Ssum q0RawWickEntries s b v = he3 sourceCoefficients s b v / sourceDen := by
  have hcompiled := eval_flatten_of_chunk_pairs sourceDen pairs hchunks s b v
  rw [hpartition, hcombined] at hcompiled
  have hcanonical : he3 q0RawWickDense s b v =
      he3 (sourceChunkDense sourceDen phaseTerms) s b v := by
    change he3 (ofTerms q0RawWickDen q0RawWickEntries) s b v =
      he3 (ofTerms sourceDen (rawWickEntries phaseTerms)) s b v
    rw [hden]
    rfl
  rw [q0RawWickSsum_eq_dense, hden, hcanonical, hcompiled]

end Grothe.UpperChaos.Q0LiteralChunkAssembly
