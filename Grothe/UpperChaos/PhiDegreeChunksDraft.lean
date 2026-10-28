import GrotheKernel.PhiCheck
import Mathlib.Data.List.SplitLengths

/-! Source-degree checker split over bounded chunks, independent of source
common denominators and phase-cover leaves. Agent-ID: codex-8c4d. -/

open GrotheKernel
namespace Grothe.UpperChaos.PhiDegreeChunksDraft

/-- Parse only the three exponent fields, without parsing a rational coefficient. -/
def parseIndices (s : String) : ℕ × ℕ × ℕ :=
  match s.splitOn ":" with
  | [p, _] =>
    match p.splitOn "," with
    | [i, j, k] => ((i.toNat?).getD 0, (j.toNat?).getD 0, (k.toNat?).getD 0)
    | _ => (0, 0, 0)
  | _ => (0, 0, 0)

/-- The lightweight parser agrees exactly with the indices of the existing
production parser, including malformed-input fallbacks. -/
theorem parseTerm_indices (s : String) : (parseTerm s).1 = parseIndices s := by
  unfold parseTerm parseIndices
  split <;> simp_all
  split <;> simp_all

/-- A degree check on raw source strings. -/
def degreeOK (s : String) : Bool :=
  let t := parseIndices s
  decide (t.1 + t.2.1 + t.2.2 ≤ DEG)

/-- The same partitions expressed as bounded slices of the original list.
This lets independently checked `(drop offset).take width` certificates feed
the source-wide theorem without unfolding the source list in assembly. -/
def offsetChunks {α : Type} (xs : List α) : List ℕ → ℕ → List (List α)
  | [], _ => []
  | n :: ns, off => ((xs.drop off).take n) :: offsetChunks xs ns (off + n)

theorem splitLengths_drop_eq_offsetChunks {α : Type} (xs : List α)
    (sizes : List ℕ) (off : ℕ) :
    sizes.splitLengths (xs.drop off) = offsetChunks xs sizes off := by
  induction sizes generalizing off with
  | nil => rfl
  | cons n ns ih =>
      simp only [List.splitLengths_cons, offsetChunks, List.drop_drop, ih]

theorem splitLengths_eq_offsetChunks {α : Type} (xs : List α) (sizes : List ℕ) :
    sizes.splitLengths xs = offsetChunks xs sizes 0 := by
  simpa only [List.drop_zero] using splitLengths_drop_eq_offsetChunks xs sizes 0

/-- A proof of every finite chunk and its coverage gives the exact source
premise of the sparse polynomial semantic theorem. -/
theorem degree_bound_of_chunks (strs : List String) (sizes : List ℕ)
    (hcover : strs.length ≤ sizes.sum)
    (hchecked : (sizes.splitLengths strs).all (fun chunk => chunk.all degreeOK) = true) :
    ∀ t ∈ strs.map parseTerm, t.1.1 + t.1.2.1 + t.1.2.2 ≤ DEG := by
  have hall : strs.all degreeOK = true := by
    rw [← List.flatten_splitLengths strs sizes hcover, List.all_flatten]
    exact hchecked
  intro t ht
  obtain ⟨s, hs, rfl⟩ := List.mem_map.mp ht
  have h := List.all_eq_true.mp hall s hs
  simp only [degreeOK, decide_eq_true_eq] at h
  simpa only [parseTerm_indices] using h

/-- Assembly smoke test: three checked bounded slices imply the corresponding
partition check, without unfolding the source strings. -/
theorem three_slice_assembly (xs : List String)
    (h0 : ((xs.drop 0).take 8).all degreeOK = true)
    (h1 : ((xs.drop 8).take 8).all degreeOK = true)
    (h2 : ((xs.drop 16).take 4).all degreeOK = true) :
    (offsetChunks xs [8, 8, 4] 0).all (fun c => c.all degreeOK) = true := by
  simp only [offsetChunks, List.all_cons, List.all_nil, Nat.zero_add,
    Nat.reduceAdd, h0, h1, h2, Bool.true_and]

#print axioms three_slice_assembly
#print axioms splitLengths_eq_offsetChunks
#print axioms parseTerm_indices
#print axioms degree_bound_of_chunks
end Grothe.UpperChaos.PhiDegreeChunksDraft
