import Grothe.Transfer

/-!
# The finite transfer: cell-constant functions and finite matrices (H5, stage 1)

Let `H` be a complex inner product space (the role of `L²(μ)`), `T : H →L[ℂ] H` a bounded
operator and `e : Fin N → H`, `e' : Fin M → H` two finite families (the role of the indicator
functions `1_{Eᵢ}`, `1_{Fⱼ}` of two finite measurable partitions).  The *cell-constant functions*
are the combinations `cellFun e c = ∑ᵢ cᵢ eᵢ`, and the matrix of `T` on the two families is

  `cellMatrix T e e' i j = ⟪eᵢ, T e'ⱼ⟫`.

Everything in this module is finite-dimensional linear algebra:

* `inner_cellFun`: `⟪cellFun e ε, T (cellFun e' δ)⟫ = ∑ᵢⱼ aᵢⱼ conj(εᵢ) δⱼ`, so the scalar
  optimum `C(A)` of the matrix is bounded by any cap on the pairing over unimodular cell-constant
  functions (`scalarOpt_cellMatrix_le`);
* `pairVal_cellVec`: for cell-constant vector functions `uₗ = ∑ᵢ (xᵢ)ₗ eᵢ`, `vₗ = ∑ⱼ (yⱼ)ₗ e'ⱼ`
  the value `∑ₗ ⟪uₗ, T vₗ⟫` equals `∑ᵢⱼ aᵢⱼ ⟪xᵢ, yⱼ⟫`, hence is at most `V(A)` when the `xᵢ, yⱼ`
  lie in the unit ball (`le_vectorOpt_of_ball`, by padding the vectors to unit vectors in two
  extra coordinates);
* `finite_transfer`: `IsGrothendieckBound K` and a cap `B` on the unimodular cell-constant
  pairings give `‖∑ₗ ⟪uₗ, T vₗ⟫‖ ≤ K · B` for every ball-valued cell-constant pair.

Nothing here is hypothetical.
-/

namespace Grothe.Lower

open scoped ComplexConjugate
open Finset

noncomputable section

/-! ### Ball-valued families and the vector optimum -/

section Ball

variable {m n : ℕ} {ι : Type} [Fintype ι]

/-- Padding `x` (of norm `≤ 1`) to a unit vector: the coordinate `√(1 - ‖x‖²)` is placed in
the extra slot `k : Fin 2`, the other extra slot is `0`. -/
def pad (k : Fin 2) (x : EuclideanSpace ℂ ι) : EuclideanSpace ℂ (ι ⊕ Fin 2) :=
  WithLp.toLp 2 (Sum.elim (fun a => x a)
    (fun k' => if k' = k then ((√(1 - ‖x‖ ^ 2) : ℝ) : ℂ) else 0))

lemma sum_norm_sq_eq (x : EuclideanSpace ℂ ι) : ∑ a, ‖x a‖ ^ 2 = ‖x‖ ^ 2 := by
  rw [EuclideanSpace.norm_eq, Real.sq_sqrt (sum_nonneg fun _ _ => sq_nonneg _)]

lemma norm_pad (k : Fin 2) (x : EuclideanSpace ℂ ι) (hx : ‖x‖ ≤ 1) : ‖pad k x‖ = 1 := by
  have h0 : 0 ≤ 1 - ‖x‖ ^ 2 := by nlinarith [norm_nonneg x]
  rw [EuclideanSpace.norm_eq, Real.sqrt_eq_one]
  simp only [pad, PiLp.toLp_apply, Fintype.sum_sum_type, Sum.elim_inl, Sum.elim_inr]
  rw [sum_norm_sq_eq]
  have h2 : ∑ k' : Fin 2, ‖(if k' = k then ((√(1 - ‖x‖ ^ 2) : ℝ) : ℂ) else 0)‖ ^ 2
      = 1 - ‖x‖ ^ 2 := by
    fin_cases k <;>
      simp [Fin.sum_univ_two, Complex.norm_real, Real.norm_eq_abs,
        abs_of_nonneg (Real.sqrt_nonneg _), Real.sq_sqrt h0]
  rw [h2]; ring

lemma inner_pad (x y : EuclideanSpace ℂ ι) : inner ℂ (pad 0 x) (pad 1 y) = inner ℂ x y := by
  simp only [PiLp.inner_apply, pad, Fintype.sum_sum_type, Sum.elim_inl, Sum.elim_inr,
    Fin.sum_univ_two]
  simp

/-- The vector optimum bounds the bilinear form on families in the closed unit ball
(pad the vectors to unit vectors in two extra coordinates). -/
theorem le_vectorOpt_of_ball (A : Fin m → Fin n → ℂ) {x : Fin m → EuclideanSpace ℂ ι}
    {y : Fin n → EuclideanSpace ℂ ι} (hx : ∀ i, ‖x i‖ ≤ 1) (hy : ∀ j, ‖y j‖ ≤ 1) :
    ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖ ≤ vectorOpt A := by
  have := le_vectorOpt A (x := fun i => pad 0 (x i)) (y := fun j => pad 1 (y j))
    (fun i => norm_pad 0 _ (hx i)) (fun j => norm_pad 1 _ (hy j))
  simpa only [inner_pad] using this

end Ball

/-- A Grothendieck bound is at least `1` (the `1 × 1` matrix `[1]`). -/
theorem _root_.Grothe.IsGrothendieckBound.one_le {K : ℝ} (hK : IsGrothendieckBound K) : 1 ≤ K := by
  let A : Fin 1 → Fin 1 → ℂ := fun _ _ => 1
  have hV : 1 ≤ vectorOpt A := by
    have := le_vectorOpt A (ι := Unit) (x := fun _ => EuclideanSpace.single () 1)
      (y := fun _ => EuclideanSpace.single () 1) (fun _ => by simp) (fun _ => by simp)
    simpa [A] using this
  have hC : scalarOpt A ≤ 1 := by
    apply csSup_le (scalarSet_nonempty A)
    rintro r ⟨ε, δ, hε, hδ, rfl⟩
    simp [A, hε, hδ]
  have h := hK 1 1 A
  have hC0 := scalarOpt_nonneg A
  rcases le_or_gt 0 K with hK0 | hK0
  · nlinarith [mul_le_mul_of_nonneg_left hC hK0]
  · nlinarith [mul_nonpos_of_nonpos_of_nonneg hK0.le hC0]

/-! ### Cell-constant functions and the matrix of `T` -/

section Cells

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
variable {N M : ℕ} {ι : Type} [Fintype ι]

/-- The cell-constant function with coefficients `c` on the cell family `e`: `∑ᵢ cᵢ eᵢ`. -/
def cellFun (e : Fin N → H) (c : Fin N → ℂ) : H := ∑ i, c i • e i

/-- The matrix `aᵢⱼ = ⟪eᵢ, T e'ⱼ⟫` of `T` on two cell families. -/
def cellMatrix (T : H →L[ℂ] H) (e : Fin N → H) (e' : Fin M → H) : Fin N → Fin M → ℂ :=
  fun i j => inner ℂ (e i) (T (e' j))

/-- The coordinates `ℓ ↦ ∑ᵢ (xᵢ)ₗ eᵢ` of the cell-constant vector function with values `xᵢ`. -/
def cellVec (e : Fin N → H) (x : Fin N → EuclideanSpace ℂ ι) : ι → H :=
  fun ℓ => cellFun e fun i => x i ℓ

/-- The value of `T` on a pair of vector functions: `∑ₗ ⟪uₗ, T vₗ⟫`. -/
def pairVal (T : H →L[ℂ] H) (u v : ι → H) : ℂ := ∑ ℓ, inner ℂ (u ℓ) (T (v ℓ))

lemma inner_cellFun (T : H →L[ℂ] H) (e : Fin N → H) (e' : Fin M → H) (c : Fin N → ℂ)
    (d : Fin M → ℂ) :
    inner ℂ (cellFun e c) (T (cellFun e' d))
      = ∑ i, ∑ j, cellMatrix T e e' i j * (conj (c i) * d j) := by
  simp only [cellFun, cellMatrix, map_sum, map_smul, sum_inner, inner_sum, inner_smul_left,
    inner_smul_right, Finset.mul_sum]
  rw [Finset.sum_comm]
  refine sum_congr rfl fun i _ => sum_congr rfl fun j _ => ?_
  ring

lemma pairVal_cellVec (T : H →L[ℂ] H) (e : Fin N → H) (e' : Fin M → H)
    (x : Fin N → EuclideanSpace ℂ ι) (y : Fin M → EuclideanSpace ℂ ι) :
    pairVal T (cellVec e x) (cellVec e' y)
      = ∑ i, ∑ j, cellMatrix T e e' i j * inner ℂ (x i) (y j) := by
  simp only [pairVal, cellVec, inner_cellFun, inner_eq_sum]
  rw [Finset.sum_comm]
  refine sum_congr rfl fun i _ => ?_
  rw [Finset.sum_comm]
  refine sum_congr rfl fun j _ => ?_
  rw [Finset.mul_sum]

/-- The scalar optimum of the matrix of `T` is bounded by any cap on the pairing over
unimodular cell-constant functions. -/
theorem scalarOpt_cellMatrix_le (T : H →L[ℂ] H) (e : Fin N → H) (e' : Fin M → H) {B : ℝ}
    (hB : ∀ (ε : Fin N → ℂ) (δ : Fin M → ℂ), (∀ i, ‖ε i‖ = 1) → (∀ j, ‖δ j‖ = 1) →
      ‖inner ℂ (cellFun e ε) (T (cellFun e' δ))‖ ≤ B) :
    scalarOpt (cellMatrix T e e') ≤ B := by
  apply csSup_le (scalarSet_nonempty _)
  rintro r ⟨ε, δ, hε, hδ, rfl⟩
  rw [← inner_cellFun]
  exact hB ε δ hε hδ

/-- The value of `T` on ball-valued cell-constant vector functions is at most `V(A)`. -/
theorem norm_pairVal_cellVec_le (T : H →L[ℂ] H) (e : Fin N → H) (e' : Fin M → H)
    {x : Fin N → EuclideanSpace ℂ ι} {y : Fin M → EuclideanSpace ℂ ι}
    (hx : ∀ i, ‖x i‖ ≤ 1) (hy : ∀ j, ‖y j‖ ≤ 1) :
    ‖pairVal T (cellVec e x) (cellVec e' y)‖ ≤ vectorOpt (cellMatrix T e e') := by
  rw [pairVal_cellVec]
  exact le_vectorOpt_of_ball _ hx hy

/-- **Finite transfer.**  A Grothendieck bound `K` and a cap `B` on the pairing of `T` over
unimodular cell-constant functions bound the value of `T` on every ball-valued cell-constant
vector pair by `K · B`. -/
theorem finite_transfer {K B : ℝ} (hK : IsGrothendieckBound K) (T : H →L[ℂ] H)
    (e : Fin N → H) (e' : Fin M → H)
    (hB : ∀ (ε : Fin N → ℂ) (δ : Fin M → ℂ), (∀ i, ‖ε i‖ = 1) → (∀ j, ‖δ j‖ = 1) →
      ‖inner ℂ (cellFun e ε) (T (cellFun e' δ))‖ ≤ B)
    {x : Fin N → EuclideanSpace ℂ ι} {y : Fin M → EuclideanSpace ℂ ι}
    (hx : ∀ i, ‖x i‖ ≤ 1) (hy : ∀ j, ‖y j‖ ≤ 1) :
    ‖pairVal T (cellVec e x) (cellVec e' y)‖ ≤ K * B :=
  calc ‖pairVal T (cellVec e x) (cellVec e' y)‖
      ≤ vectorOpt (cellMatrix T e e') := norm_pairVal_cellVec_le T e e' hx hy
    _ ≤ K * scalarOpt (cellMatrix T e e') := hK _ _ _
    _ ≤ K * B := mul_le_mul_of_nonneg_left (scalarOpt_cellMatrix_le T e e' hB)
          (by linarith [hK.one_le])

end Cells

end

end Grothe.Lower
