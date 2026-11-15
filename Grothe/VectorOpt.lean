import Grothe.ScalarOpt
import Grothe.TransferHilbert

/-!
# A compact, fixed-dimensional optimization for the vector optimum

For fixed left vectors, the best right response is the sum of the norms of the column combinations.
Only the span of the left family is needed. Consequently an `m × n` matrix with positive dimensions
attains its vector optimum in dimension `min m n`. In particular, the arbitrary ambient dimension
in `IsGrothendieckBound` can be replaced by this single finite-dimensional compact problem.

Agent-ID: codex-c8a4. Refs #377.
-/

namespace Grothe

open scoped ComplexConjugate
open Finset

noncomputable section

private def euclideanEmbed {d m : ℕ} (h : d ≤ m) :
    EuclideanSpace ℂ (Fin d) →ₗᵢ[ℂ] EuclideanSpace ℂ (Fin m) := by
  let b : OrthonormalBasis (Fin d) ℂ (EuclideanSpace ℂ (Fin d)) :=
    EuclideanSpace.basisFun (Fin d) ℂ
  let v : Fin d → EuclideanSpace ℂ (Fin m) :=
    fun i ↦ EuclideanSpace.single (Fin.castLE h i) 1
  let f : EuclideanSpace ℂ (Fin d) →ₗ[ℂ] EuclideanSpace ℂ (Fin m) :=
    b.toBasis.constr ℂ v
  refine f.isometryOfOrthonormal (v := b.toBasis) ?_ ?_
  · simpa only [OrthonormalBasis.coe_toBasis] using b.orthonormal
  have hv := (EuclideanSpace.orthonormal_single (𝕜 := ℂ) (ι := Fin m)).comp
    (Fin.castLE h) (Fin.castLE_injective h)
  simpa only [Function.comp_def, f, Module.Basis.constr_basis] using hv

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]

/-- A finite family has a norm- and Gram-preserving realization in the fixed dimension equal to
its cardinality. -/
theorem exists_euclidean_gram_card {ι : Type*} [Fintype ι] (v : ι → H) :
    ∃ w : ι → EuclideanSpace ℂ (Fin (Fintype.card ι)),
      (∀ i, ‖w i‖ = ‖v i‖) ∧
      ∀ i j, inner ℂ (w i) (w j) = inner ℂ (v i) (v j) := by
  obtain ⟨d, hd, w, hnorm, hinner⟩ := exists_euclidean_gram v
  refine ⟨fun i ↦ euclideanEmbed hd (w i), ?_, ?_⟩
  · intro i
    rw [LinearIsometry.norm_map, hnorm]
  · intro i j
    rw [LinearIsometry.inner_map_map, hinner]

private theorem norm_sum_smul_eq_of_gram {H' : Type*} [NormedAddCommGroup H']
    [InnerProductSpace ℂ H'] {ι : Type*} [Fintype ι] {x : ι → H} {y : ι → H'}
    (h : ∀ i j, inner ℂ (x i) (x j) = inner ℂ (y i) (y j)) (c : ι → ℂ) :
    ‖∑ i, c i • x i‖ = ‖∑ i, c i • y i‖ := by
  simp only [norm_eq_sqrt_re_inner (𝕜 := ℂ), sum_inner, inner_sum, inner_smul_left,
    inner_smul_right, h]

private theorem exists_unit_response (e : H) (he : ‖e‖ = 1) (v : H) :
    ∃ y : H, ‖y‖ = 1 ∧ inner ℂ v y = (‖v‖ : ℂ) := by
  by_cases hv : v = 0
  · exact ⟨e, he, by simp [hv]⟩
  have hn : ‖v‖ ≠ 0 := norm_ne_zero_iff.mpr hv
  have hc : (‖v‖ : ℂ) ≠ 0 := by exact_mod_cast hn
  refine ⟨(‖v‖ : ℂ)⁻¹ • v, ?_, ?_⟩
  · simp only [norm_smul, norm_inv, Complex.norm_real,
      Real.norm_of_nonneg (norm_nonneg v)]
    exact inv_mul_cancel₀ hn
  · rw [inner_smul_right, inner_self_eq_norm_sq_to_K]
    field_simp
    rfl

variable {m n : ℕ}

private theorem pairing_eq_column_response (A : Fin m → Fin n → ℂ)
    (x : Fin m → H) (y : Fin n → H) :
    ∑ i, ∑ j, A i j * inner ℂ (x i) (y j) =
      ∑ j, inner ℂ (∑ i, conj (A i j) • x i) (y j) := by
  simp only [sum_inner, inner_smul_left, Complex.conj_conj]
  exact sum_comm

/-- Optimizing the right unit vectors gives the sum of the norms of the column combinations. -/
theorem norm_pairing_le_sum_norm_column (A : Fin m → Fin n → ℂ)
    (x : Fin m → H) {y : Fin n → H} (hy : ∀ j, ‖y j‖ ≤ 1) :
    ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖ ≤
      ∑ j, ‖∑ i, conj (A i j) • x i‖ := by
  rw [pairing_eq_column_response]
  refine (norm_sum_le _ _).trans (sum_le_sum fun j _ ↦ ?_)
  exact (norm_inner_le_norm _ _).trans
    (mul_le_of_le_one_right (norm_nonneg _) (hy j))

/-- Every one-sided unit-vector response, in any complex inner product space, is bounded by
the vector optimum, including the empty family. -/
theorem sum_norm_column_le_vectorOpt (A : Fin m → Fin n → ℂ)
    {x : Fin m → H} (hx : ∀ i, ‖x i‖ = 1) :
    ∑ j, ‖∑ i, conj (A i j) • x i‖ ≤ vectorOpt A := by
  rcases Nat.eq_zero_or_pos m with rfl | hm
  · simpa using vectorOpt_nonneg A
  choose y hy hresp using fun j ↦
    exists_unit_response (x ⟨0, hm⟩) (hx _) (∑ i, conj (A i j) • x i)
  have h := le_vectorOpt_of_innerProductSpace A hx hy
  rw [pairing_eq_column_response] at h
  simpa only [hresp, ← Complex.ofReal_sum, Complex.norm_real,
    Real.norm_of_nonneg (sum_nonneg fun _ _ ↦ norm_nonneg _)] using h

/-- Bounding the vector optimum is equivalent to bounding one-sided responses in the fixed
ambient dimension given by the number of rows. -/
theorem vectorOpt_le_iff (A : Fin m → Fin n → ℂ) (B : ℝ) :
    vectorOpt A ≤ B ↔ ∀ x : Fin m → EuclideanSpace ℂ (Fin m),
      (∀ i, ‖x i‖ = 1) → ∑ j, ‖∑ i, conj (A i j) • x i‖ ≤ B := by
  constructor
  · intro h x hx
    exact (sum_norm_column_le_vectorOpt A hx).trans h
  · intro h
    apply csSup_le (vectorSet_nonempty A)
    rintro _ ⟨ι, _, x, y, hx, hy, rfl⟩
    obtain ⟨w, hw, hinner⟩ : ∃ w : Fin m → EuclideanSpace ℂ (Fin m),
        (∀ i, ‖w i‖ = ‖x i‖) ∧
        ∀ i k, inner ℂ (w i) (w k) = inner ℂ (x i) (x k) := by
      have h := exists_euclidean_gram_card x
      rw [Fintype.card_fin] at h
      exact h
    have hw' : ∀ i, ‖w i‖ = 1 := fun i ↦ (hw i).trans (hx i)
    have hresp : ∀ j, ‖∑ i, conj (A i j) • x i‖ = ‖∑ i, conj (A i j) • w i‖ :=
      fun j ↦ norm_sum_smul_eq_of_gram (fun i k ↦ (hinner i k).symm) _
    calc
      ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖ ≤
          ∑ j, ‖∑ i, conj (A i j) • x i‖ :=
        norm_pairing_le_sum_norm_column A x (fun j ↦ (hy j).le)
      _ = ∑ j, ‖∑ i, conj (A i j) • w i‖ := sum_congr rfl fun j _ ↦ hresp j
      _ ≤ B := h w hw'

/-- The vector optimum is an attained maximum of one-sided responses in dimension `m`. -/
theorem exists_vectorOpt_eq_sum_norm (A : Fin m → Fin n → ℂ) :
    ∃ x : Fin m → EuclideanSpace ℂ (Fin m), (∀ i, ‖x i‖ = 1) ∧
      vectorOpt A = ∑ j, ‖∑ i, conj (A i j) • x i‖ := by
  let S : Set (Fin m → EuclideanSpace ℂ (Fin m)) := {x | ∀ i, ‖x i‖ = 1}
  have hS : IsCompact S := by
    convert isCompact_univ_pi (fun _ : Fin m ↦
      isCompact_sphere (0 : EuclideanSpace ℂ (Fin m)) 1) using 1
    ext x
    simp [S]
  have hne : S.Nonempty := ⟨fun i ↦ EuclideanSpace.single i 1, fun _ ↦ by simp⟩
  have hc : Continuous (fun x : Fin m → EuclideanSpace ℂ (Fin m) ↦
      ∑ j, ‖∑ i, conj (A i j) • x i‖) := by fun_prop
  obtain ⟨x, hx, hmax⟩ := hS.exists_isMaxOn hne hc.continuousOn
  refine ⟨x, hx, le_antisymm ?_ (sum_norm_column_le_vectorOpt A hx)⟩
  exact (vectorOpt_le_iff A _).2 fun x' hx' ↦ hmax hx'

/-- The original vector optimum is attained in dimension equal to the number of rows. -/
theorem exists_vectorOpt (A : Fin m → Fin n → ℂ) (hm : 0 < m) :
    ∃ (x : Fin m → EuclideanSpace ℂ (Fin m)) (y : Fin n → EuclideanSpace ℂ (Fin m)),
      (∀ i, ‖x i‖ = 1) ∧ (∀ j, ‖y j‖ = 1) ∧
      vectorOpt A = ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖ := by
  obtain ⟨x, hx, hA⟩ := exists_vectorOpt_eq_sum_norm A
  choose y hy hresp using fun j ↦
    exists_unit_response (x ⟨0, hm⟩) (hx _) (∑ i, conj (A i j) • x i)
  refine ⟨x, y, hx, hy, ?_⟩
  rw [hA, pairing_eq_column_response]
  simp only [hresp, ← Complex.ofReal_sum, Complex.norm_real,
    Real.norm_of_nonneg (sum_nonneg fun _ _ ↦ norm_nonneg _)]

private theorem norm_pairing_conjTranspose (A : Fin m → Fin n → ℂ)
    (x : Fin m → H) (y : Fin n → H) :
    ‖∑ j, ∑ i, conj (A i j) * inner ℂ (y j) (x i)‖ =
      ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖ := by
  rw [← Complex.norm_conj]
  simp only [map_sum, map_mul, Complex.conj_conj, inner_conj_symm]
  rw [sum_comm]

/-- Conjugate transpose preserves the vector optimum. -/
theorem vectorOpt_conjTranspose (A : Fin m → Fin n → ℂ) :
    vectorOpt (fun j i ↦ conj (A i j)) = vectorOpt A := by
  apply le_antisymm
  · apply csSup_le (vectorSet_nonempty _)
    rintro _ ⟨ι, _, y, x, hy, hx, rfl⟩
    rw [norm_pairing_conjTranspose]
    exact le_vectorOpt A hx hy
  · apply csSup_le (vectorSet_nonempty _)
    rintro _ ⟨ι, _, x, y, hx, hy, rfl⟩
    rw [← norm_pairing_conjTranspose]
    exact le_vectorOpt _ hy hx

/-- A matrix with positive dimensions attains its vector optimum in dimension `min m n`. -/
theorem exists_vectorOpt_min (A : Fin m → Fin n → ℂ) (hm : 0 < m) (hn : 0 < n) :
    ∃ (x : Fin m → EuclideanSpace ℂ (Fin (min m n)))
      (y : Fin n → EuclideanSpace ℂ (Fin (min m n))),
      (∀ i, ‖x i‖ = 1) ∧ (∀ j, ‖y j‖ = 1) ∧
      vectorOpt A = ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖ := by
  rcases le_total m n with hmn | hnm
  · rw [Nat.min_eq_left hmn]
    exact exists_vectorOpt A hm
  · rw [Nat.min_eq_right hnm]
    obtain ⟨y, x, hy, hx, hA⟩ := exists_vectorOpt (fun j i ↦ conj (A i j)) hn
    refine ⟨x, y, hx, hy, ?_⟩
    simpa only [vectorOpt_conjTranspose, norm_pairing_conjTranspose] using hA

/-- A matrix with no rows or no columns has vector optimum zero. -/
theorem vectorOpt_eq_zero_of_empty (A : Fin m → Fin n → ℂ) (h : m = 0 ∨ n = 0) :
    vectorOpt A = 0 := by
  apply le_antisymm _ (vectorOpt_nonneg A)
  apply csSup_le (vectorSet_nonempty A)
  rintro _ ⟨ι, _, x, y, hx, hy, rfl⟩
  rcases h with rfl | rfl <;> simp

/-- To establish a Grothendieck bound, it suffices to test positive-size matrices on unit vectors
in the fixed dimension `min m n`. -/
theorem isGrothendieckBound_iff_fixed_dim (K : ℝ) :
    IsGrothendieckBound K ↔ ∀ (m n : ℕ) (A : Fin m → Fin n → ℂ),
      0 < m → 0 < n → ∀ (x : Fin m → EuclideanSpace ℂ (Fin (min m n)))
      (y : Fin n → EuclideanSpace ℂ (Fin (min m n))),
      (∀ i, ‖x i‖ = 1) → (∀ j, ‖y j‖ = 1) →
      ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖ ≤ K * scalarOpt A := by
  constructor
  · intro h m n A _ _ x y hx hy
    exact (le_vectorOpt A hx hy).trans (h m n A)
  · intro h m n A
    by_cases hm : 0 < m
    · by_cases hn : 0 < n
      · obtain ⟨x, y, hx, hy, hA⟩ := exists_vectorOpt_min A hm hn
        rw [hA]
        exact h m n A hm hn x y hx hy
      · have he : m = 0 ∨ n = 0 := Or.inr (Nat.eq_zero_of_not_pos hn)
        rw [vectorOpt_eq_zero_of_empty A he, scalarOpt_eq_zero_of_empty A he, mul_zero]
    · have he : m = 0 ∨ n = 0 := Or.inl (Nat.eq_zero_of_not_pos hm)
      rw [vectorOpt_eq_zero_of_empty A he, scalarOpt_eq_zero_of_empty A he, mul_zero]

end

end Grothe
