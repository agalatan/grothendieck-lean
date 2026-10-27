import Grothe.UpperChaos.HermiteFinite
import Mathlib.Algebra.BigOperators.Fin

/-!
# Graded finite Hermite expansions of charge one

At level `q`, the valid coordinates satisfy `c < q + 2` and `d < q + 1`.
They embed into the tensor Hermite basis as `((q + 1 - c, q - d), (c, d))`.
The dependent finite index type makes these bounds intrinsic, and injectivity
allows the support to use `Finset.map` without deduplication. The grade is
recovered directly from the two antiholomorphic degrees, so coefficient lookup
requires no search. Exact energies are bounded triple sums of rational squares.

Agent-ID: codex-2ca4
-/

open MeasureTheory
open scoped InnerProductSpace

namespace Grothe.UpperChaos

/-- Valid charge-one coordinates in the first `N` graded levels. -/
abbrev GradedIdx (N : ℕ) := Σ q : Fin N, Fin (q.val + 2) × Fin (q.val + 1)

/-- The tensor Hermite mode at coordinates `(q, c, d)`. -/
def gradedMode (q c d : ℕ) : Idx2 := ((q + 1 - c, q - d), (c, d))

/-- The Hermite mode corresponding to a bounded graded index. -/
def gradedIdx {N : ℕ} (i : GradedIdx N) : Idx2 := gradedMode i.1 i.2.1 i.2.2

/-- The antiholomorphic degree recovers the grade without a lookup. -/
theorem gradedIdx_antidegree {N : ℕ} (i : GradedIdx N) :
    (gradedIdx i).1.2 + (gradedIdx i).2.2 = i.1 := by
  have hd := i.2.2.isLt
  dsimp [gradedIdx, gradedMode]
  omega

/-- Every graded mode has charge one. -/
theorem gradedIdx_charge {N : ℕ} (i : GradedIdx N) :
    (gradedIdx i).1.1 + (gradedIdx i).2.1 = (gradedIdx i).1.2 + (gradedIdx i).2.2 + 1 := by
  have hc := i.2.1.isLt
  have hd := i.2.2.isLt
  dsimp [gradedIdx, gradedMode]
  omega

/-- The total degree at grade `q` is `2q + 1`. -/
theorem gradedIdx_total_degree {N : ℕ} (i : GradedIdx N) :
    (bideg (gradedIdx i)).1 + (bideg (gradedIdx i)).2 = 2 * (i.1 : ℕ) + 1 := by
  have hc := i.2.1.isLt
  have hd := i.2.2.isLt
  dsimp [gradedIdx, gradedMode, bideg]
  omega

/-- Distinct bounded graded coordinates specify distinct Hermite modes. -/
theorem gradedIdx_injective (N : ℕ) : Function.Injective (gradedIdx (N := N)) := by
  rintro ⟨q, c, d⟩ ⟨r, e, f⟩ h
  have hqr : q = r := by
    apply Fin.ext
    have hgrade := congrArg (fun i : Idx2 => i.1.2 + i.2.2) h
    simpa only [gradedIdx_antidegree] using hgrade
  subst r
  have hce : c = e := Fin.ext (congrArg (fun i : Idx2 => i.2.1) h)
  have hdf : d = f := Fin.ext (congrArg (fun i : Idx2 => i.2.2) h)
  subst e f
  rfl

/-- The injective map used to enumerate the finite support. -/
def gradedIdxEmbedding (N : ℕ) : GradedIdx N ↪ Idx2 :=
  ⟨gradedIdx, gradedIdx_injective N⟩

/-- The first `N` charge-one levels, enumerated without deduplication. -/
def gradedSupport (N : ℕ) : Finset Idx2 :=
  (Finset.univ : Finset (GradedIdx N)).map (gradedIdxEmbedding N)

/-- The support consists exactly of charge-one modes of antiholomorphic degree below `N`. -/
theorem mem_gradedSupport_iff {N : ℕ} {i : Idx2} :
    i ∈ gradedSupport N ↔
      i.1.2 + i.2.2 < N ∧ i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1 := by
  constructor
  · intro hi
    obtain ⟨j, _, rfl⟩ := Finset.mem_map.mp hi
    change (gradedIdx j).1.2 + (gradedIdx j).2.2 < N ∧
      (gradedIdx j).1.1 + (gradedIdx j).2.1 = (gradedIdx j).1.2 + (gradedIdx j).2.2 + 1
    exact ⟨by rw [gradedIdx_antidegree]; exact j.1.isLt, gradedIdx_charge j⟩
  · rintro ⟨hgrade, hcharge⟩
    have hc : i.2.1 < i.1.2 + i.2.2 + 2 := by omega
    have hd : i.2.2 < i.1.2 + i.2.2 + 1 := by omega
    let j : GradedIdx N := ⟨⟨i.1.2 + i.2.2, hgrade⟩, ⟨i.2.1, hc⟩, ⟨i.2.2, hd⟩⟩
    have hj : gradedIdx j = i := by
      apply Prod.ext
      · apply Prod.ext
        · dsimp [gradedIdx, gradedMode, j]
          omega
        · dsimp [gradedIdx, gradedMode, j]
          omega
      · rfl
    exact Finset.mem_map.mpr ⟨j, Finset.mem_univ j, hj⟩

/-- Every supported mode has total degree strictly below `2N`. -/
theorem gradedSupport_total_degree_lt {N : ℕ} {i : Idx2} (hi : i ∈ gradedSupport N) :
    (bideg i).1 + (bideg i).2 < 2 * N := by
  obtain ⟨j, _, rfl⟩ := Finset.mem_map.mp hi
  change (bideg (gradedIdx j)).1 + (bideg (gradedIdx j)).2 < 2 * N
  rw [gradedIdx_total_degree]
  have hj := j.1.isLt
  omega

/-- Reindex a support sum as the finite dependent triple sum. -/
theorem sum_gradedSupport {M : Type*} [AddCommMonoid M] (N : ℕ) (F : Idx2 → M) :
    ∑ i ∈ gradedSupport N, F i =
      ∑ q : Fin N, ∑ c : Fin (q.val + 2), ∑ d : Fin (q.val + 1),
        F (gradedMode q c d) := by
  rw [gradedSupport, Finset.sum_map]
  change (∑ i : GradedIdx N, F (gradedIdx i)) = _
  simp only [Fintype.sum_sigma, Fintype.sum_prod_type, gradedIdx]

/-- Direct coefficient lookup from the grade and the second-coordinate degrees. -/
def gradedHermiteCoeff (a : ℕ → ℕ → ℕ → ℚ) (i : Idx2) : ℚ :=
  a (i.1.2 + i.2.2) i.2.1 i.2.2

lemma gradedHermiteCoeff_gradedIdx {N : ℕ} (a : ℕ → ℕ → ℕ → ℚ) (i : GradedIdx N) :
    gradedHermiteCoeff a (gradedIdx i) = a i.1 i.2.1 i.2.2 := by
  unfold gradedHermiteCoeff
  rw [gradedIdx_antidegree]

/-- A graded finite expansion with abstract, directly indexed rational coefficients. -/
noncomputable def gradedHermite (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) : Lp ℂ 2 mu2 :=
  hermiteFinite (gradedSupport N) (gradedHermiteCoeff a)

/-- Exact coefficient lookup, with the charge and grade restrictions explicit. -/
theorem inner_hvec2_gradedHermite (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (i : Idx2) :
    ⟪hvec2 i, gradedHermite N a⟫_ℂ =
      if i.1.2 + i.2.2 < N ∧ i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1 then
        (a (i.1.2 + i.2.2) i.2.1 i.2.2 : ℂ) else 0 := by
  simp only [gradedHermite, inner_hvec2_hermiteFinite, mem_gradedSupport_iff, gradedHermiteCoeff]

/-- The exact total energy is a bounded triple rational sum. -/
theorem norm_gradedHermite_sq_cast (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    ‖gradedHermite N a‖ ^ 2 =
      ((∑ q ∈ Finset.range N, ∑ c ∈ Finset.range (q + 2),
        ∑ d ∈ Finset.range (q + 1), a q c d ^ 2 : ℚ) : ℝ) := by
  rw [gradedHermite, norm_hermiteFinite_sq_cast]
  apply congrArg (fun r : ℚ => (r : ℝ))
  rw [sum_gradedSupport]
  have hcoeff (q : Fin N) (c : Fin (q.val + 2)) (d : Fin (q.val + 1)) :
      gradedHermiteCoeff a (gradedMode q c d) = a q c d :=
    gradedHermiteCoeff_gradedIdx a (⟨q, c, d⟩ : GradedIdx N)
  simp only [hcoeff]
  simp_rw [Fin.sum_univ_eq_sum_range]

/-- The total norm formula with rational coefficients cast termwise into the reals. -/
theorem norm_gradedHermite_sq (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    ‖gradedHermite N a‖ ^ 2 =
      ∑ q ∈ Finset.range N, ∑ c ∈ Finset.range (q + 2),
        ∑ d ∈ Finset.range (q + 1), (a q c d : ℝ) ^ 2 := by
  rw [norm_gradedHermite_sq_cast]
  simp only [Rat.cast_sum, Rat.cast_pow]

/-- A projected energy is a triple rational sum selecting the requested modes directly. -/
theorem norm_projOn_gradedHermite_sq_cast (B : Set Idx2) [DecidablePred (· ∈ B)]
    (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    ‖projOn B (gradedHermite N a)‖ ^ 2 =
      ((∑ q ∈ Finset.range N, ∑ c ∈ Finset.range (q + 2),
        ∑ d ∈ Finset.range (q + 1),
          if gradedMode q c d ∈ B then a q c d ^ 2 else 0 : ℚ) : ℝ) := by
  rw [gradedHermite, norm_projOn_hermiteFinite_sq_cast]
  apply congrArg (fun r : ℚ => (r : ℝ))
  rw [Finset.sum_filter, sum_gradedSupport]
  have hcoeff (q : Fin N) (c : Fin (q.val + 2)) (d : Fin (q.val + 1)) :
      gradedHermiteCoeff a (gradedMode q c d) = a q c d :=
    gradedHermiteCoeff_gradedIdx a (⟨q, c, d⟩ : GradedIdx N)
  simp only [hcoeff]
  simp_rw [Fin.sum_univ_eq_sum_range]

/-- A graded expansion has no coefficient of a charge other than one. -/
theorem inner_gradedHermite_eq_zero_of_charge (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (i : Idx2)
    (hi : i.1.1 + i.2.1 ≠ i.1.2 + i.2.2 + 1) : ⟪hvec2 i, gradedHermite N a⟫_ℂ = 0 := by
  rw [inner_hvec2_gradedHermite, ite_eq_right (fun h => hi h.2)]

/-- A graded expansion has no coefficient at total degree `2N` or above. -/
theorem inner_gradedHermite_eq_zero_of_total_degree (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (i : Idx2)
    (hi : 2 * N ≤ (bideg i).1 + (bideg i).2) : ⟪hvec2 i, gradedHermite N a⟫_ℂ = 0 := by
  have hnot : i ∉ gradedSupport N := fun h => (not_lt_of_ge hi) (gradedSupport_total_degree_lt h)
  rw [gradedHermite, inner_hvec2_hermiteFinite, ite_eq_right hnot]

/-- Projection onto modes above the graded cutoff vanishes exactly. -/
theorem projOn_gradedHermite_eq_zero_of_total_degree (B : Set Idx2) [DecidablePred (· ∈ B)]
    (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (hB : ∀ i ∈ B, 2 * N ≤ (bideg i).1 + (bideg i).2) :
    projOn B (gradedHermite N a) = 0 := by
  apply projOn_hermiteFinite_eq_zero B (gradedSupport N) (gradedHermiteCoeff a)
  intro i hi hiB
  exact (not_lt_of_ge (hB i hiB)) (gradedSupport_total_degree_lt hi)

end Grothe.UpperChaos
