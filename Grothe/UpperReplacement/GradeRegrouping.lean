import Grothe.UpperReplacement.CellCoefficients
import Grothe.UpperReplacement.CellHeadCompute

set_option warningAsError true

/-!
# Exact regrouping of the complete signed cell head

Agent-ID: codex-a7c4. Residue classes only share the angular transform; they do not discard
frequencies. Each fixed grade has its full triangular set of radial orders.
-/

namespace Grothe.UpperReplacement.CellHeadCompute

open Finset UpperChaos

noncomputable def modeGrade (j : ℕ) (m : ℤ) (f : ℤ → ℕ → ℕ → ℝ) : ℝ :=
  if modeShift m ≤ j then ∑ a ∈ range (j - modeShift m + 1), f m a (j - modeShift m - a)
  else 0

theorem sum_list_range (n : ℕ) (f : ℕ → ℝ) :
    ((List.range n).map f).sum = ∑ k ∈ range n, f k := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [List.range_succ, List.map_append, List.sum_append, Finset.sum_range_succ, ih]
    simp

theorem sum_partition_list {ι : Type*} (l : List ι) (f : ι → ℝ) (r : ι → ℕ) (A : ℕ)
    (hr : ∀ x ∈ l, r x < A) :
    ∑ k ∈ range A, ((l.filter (fun x ↦ r x == k)).map f).sum = (l.map f).sum := by
  induction l with
  | nil => simp
  | cons x l ih =>
    have hstep (k : ℕ) :
        (((x :: l).filter (fun x ↦ r x == k)).map f).sum =
          (if r x = k then f x else 0) + ((l.filter (fun x ↦ r x == k)).map f).sum := by
      by_cases hx : r x = k <;> simp [hx]
    simp_rw [hstep]
    rw [sum_add_distrib, ih (fun x hx ↦ hr x (List.mem_cons_of_mem _ hx))]
    have hx : r x ∈ range A := mem_range.mpr (hr x List.mem_cons_self)
    rw [sum_eq_single_of_mem (r x) hx (fun k _ hk ↦ by simp [Ne.symm hk])]
    simp

theorem sum_frequencies {A : ℕ} (hA : 0 < A) (K : ℕ) (f : ℤ → ℝ) :
    (((List.range A).map fun residue ↦ ((frequencies K A residue).map f).sum).sum) =
      ∑ m ∈ Icc (-(K : ℤ)) ((K : ℤ) + 1), f m := by
  rw [sum_list_range]
  unfold frequencies
  rw [sum_partition_list _ f (fun m ↦ (m % (A : ℤ)).toNat) A
    (fun m _ ↦ Int.natMod_lt (m := m) (Nat.ne_of_gt hA))]
  rw [List.map_map, sum_list_range]
  apply sum_bij (fun (k : ℕ) _ ↦ (k : ℤ) - K)
  · intro k hk
    simp only [mem_range] at hk
    simp only [mem_Icc]
    omega
  · intro a _ b _ hab
    omega
  · intro m hm
    simp only [mem_Icc] at hm
    refine ⟨(m + K).toNat, mem_range.mpr (by omega), ?_⟩
    omega
  · intro k _
    rfl

theorem triangle_sum {K j s : ℕ} (hj : j ≤ K) (f : ℕ → ℕ → ℝ) :
    (if s ≤ j then ∑ a ∈ range (j - s + 1), f a (j - s - a) else 0) =
      ∑ a ∈ range (K + 1), ∑ b ∈ range (K + 1),
        if s + a + b = j then f a b else 0 := by
  by_cases hs : s ≤ j
  · rw [ite_eq_left hs]
    have hrow (a : ℕ) :
        (∑ b ∈ range (K + 1), if s + a + b = j then f a b else 0) =
          if a < j - s + 1 then f a (j - s - a) else 0 := by
      by_cases ha : a < j - s + 1
      · rw [ite_eq_left ha]
        rw [sum_eq_single_of_mem (j - s - a) (mem_range.mpr (by omega))]
        · rw [ite_eq_left (by omega)]
        · intro b _ hb
          exact ite_eq_right (by omega)
      · rw [ite_eq_right ha]
        apply sum_eq_zero
        intro b _
        exact ite_eq_right (by omega)
    simp_rw [hrow]
    symm
    calc (∑ a ∈ range (K + 1), if a < j - s + 1 then f a (j - s - a) else 0)
        = ∑ a ∈ range (j - s + 1), if a < j - s + 1 then f a (j - s - a) else 0 := by
          symm
          apply sum_subset (range_mono (by omega))
          intro a _ ha
          simp only [mem_range] at ha
          exact ite_eq_right ha
      _ = ∑ a ∈ range (j - s + 1), f a (j - s - a) := by
        apply sum_congr rfl
        intro a ha
        exact ite_eq_left (mem_range.mp ha)
  · rw [ite_eq_right hs]
    symm
    apply sum_eq_zero
    intro a _
    apply sum_eq_zero
    intro b _
    exact ite_eq_right (by omega)

theorem sum_modeGrade {K j : ℕ} (hj : j ≤ K) (f : ℤ → ℕ → ℕ → ℝ) :
    (∑ m ∈ Icc (-(K : ℤ)) ((K : ℤ) + 1), modeGrade j m f) =
      ∑ v ∈ cellHeadCoordinates K,
        if modeShift v.1 + v.2.1 + v.2.2 = j then f v.1 v.2.1 v.2.2 else 0 := by
  simp only [cellHeadCoordinates, sum_filter, sum_product]
  apply sum_congr rfl
  intro m _
  rw [modeGrade, triangle_sum hj]
  apply sum_congr rfl
  intro a _
  apply sum_congr rfl
  intro b _
  by_cases he : modeShift m + a + b = j
  · simp only [he, ite_eq_left hj, ite_true]
  · simp only [ite_eq_right he, ite_self]

/-- Exact grade sums over the original Hermite index set, with no angular cutoff. -/
theorem sum_residues_eq_head {A K j : ℕ} (hA : 0 < A) (hj : j ≤ K)
    (f : Idx2 → ℝ) :
    (((List.range A).map fun residue ↦
      ((frequencies K A residue).map fun m ↦
        modeGrade j m (fun m a b ↦ f (cellMode m a b))).sum).sum) =
      ∑ u ∈ cellModeHead K,
        if u.1.2 + u.2.2 = j then f u else 0 := by
  rw [sum_frequencies hA, sum_modeGrade hj]
  simp only [cellModeHead, sum_map, cellModeEmbedding, Function.Embedding.coeFn_mk,
    cellMode_grade]

end Grothe.UpperReplacement.CellHeadCompute
