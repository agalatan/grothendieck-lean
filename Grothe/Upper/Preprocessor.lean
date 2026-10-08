import Grothe.Transfer

/-!
# Allowable preprocessors (`l1_preprocessor_allowable`)

A real coefficient sequence `e` with `∑_{j<N} |e_j| ≤ 1` defines the *physical* odd map
`physPoly e N z = ∑_{j<N} e_j z|z|^{2j}`.  For unit vectors `x, y` of a finite-dimensional
complex Hilbert space there are unit *feature vectors* `featL e N x`, `featR e N y` with

  `⟪featL e N x, featR e N y⟫ = physPoly e N ⟪x, y⟫`.

They are direct sums of the weighted tensor monomials `√|e_j| · tpow j x` and
`sign(e_j)√|e_j| · tpow j y`, padded by two orthogonal unit directions.  Consequently a
dominated kernel composed with `physPoly e N` is again dominated (`DominatedKernel.comp_physPoly`).
-/

namespace Grothe

open Finset
open scoped ComplexConjugate

noncomputable section

/-- The physical odd map `z ↦ ∑_{j<N} e_j z |z|^{2j}`. -/
def physPoly (e : ℕ → ℝ) (N : ℕ) (z : ℂ) : ℂ :=
  ∑ j ∈ range N, (e j : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * j))

/-- Index type of the feature maps. -/
abbrev FIdx (ι : Type) (N : ℕ) : Type := (Σ j : Fin N, TIdx ι j) ⊕ Bool

/-- Signed square root `a / √|a|`, so that `ssq a * √|a| = a` and `ssq a ^ 2 = |a|`. -/
def ssq (a : ℝ) : ℝ := a / Real.sqrt |a|

lemma ssq_mul_sqrt (a : ℝ) : ssq a * Real.sqrt |a| = a := by
  unfold ssq
  rcases eq_or_ne a 0 with h | h
  · simp [h]
  · have : Real.sqrt |a| ≠ 0 := by
      rw [Ne, Real.sqrt_eq_zero']; push Not; exact abs_pos.2 h
    field_simp

lemma ssq_sq (a : ℝ) : ssq a ^ 2 = |a| := by
  unfold ssq
  rcases eq_or_ne a 0 with h | h
  · simp [h]
  · have hpos : 0 < |a| := abs_pos.2 h
    rw [div_pow, Real.sq_sqrt hpos.le, ← sq_abs a]
    field_simp

variable {ι : Type} [Fintype ι]

/-- Left feature map. -/
def featL (e : ℕ → ℝ) (N : ℕ) (x : EuclideanSpace ℂ ι) : EuclideanSpace ℂ (FIdx ι N) :=
  WithLp.toLp 2 (Sum.elim
    (fun s : Σ j : Fin N, TIdx ι j => ((Real.sqrt |e s.1| : ℝ) : ℂ) * tpow s.1 x s.2)
    (fun b : Bool => if b then ((Real.sqrt (1 - ∑ j ∈ range N, |e j|) : ℝ) : ℂ) else 0))

/-- Right feature map. -/
def featR (e : ℕ → ℝ) (N : ℕ) (y : EuclideanSpace ℂ ι) : EuclideanSpace ℂ (FIdx ι N) :=
  WithLp.toLp 2 (Sum.elim
    (fun s : Σ j : Fin N, TIdx ι j => ((ssq (e s.1) : ℝ) : ℂ) * tpow s.1 y s.2)
    (fun b : Bool => if b then 0 else ((Real.sqrt (1 - ∑ j ∈ range N, |e j|) : ℝ) : ℂ)))

lemma featL_inl (e N) (x : EuclideanSpace ℂ ι) (s : Σ j : Fin N, TIdx ι j) :
    featL e N x (Sum.inl s) = ((Real.sqrt |e s.1| : ℝ) : ℂ) * tpow s.1 x s.2 := rfl
lemma featL_inr (e N) (x : EuclideanSpace ℂ ι) (b : Bool) :
    featL e N x (Sum.inr b) = if b then ((Real.sqrt (1 - ∑ j ∈ range N, |e j|) : ℝ) : ℂ) else 0 := rfl
lemma featR_inl (e N) (y : EuclideanSpace ℂ ι) (s : Σ j : Fin N, TIdx ι j) :
    featR e N y (Sum.inl s) = ((ssq (e s.1) : ℝ) : ℂ) * tpow s.1 y s.2 := rfl
lemma featR_inr (e N) (y : EuclideanSpace ℂ ι) (b : Bool) :
    featR e N y (Sum.inr b) = if b then 0 else ((Real.sqrt (1 - ∑ j ∈ range N, |e j|) : ℝ) : ℂ) := rfl

/-- The cross inner product realises the physical map. -/
theorem inner_featL_featR (e : ℕ → ℝ) (N : ℕ) (x y : EuclideanSpace ℂ ι) :
    inner ℂ (featL e N x) (featR e N y) = physPoly e N (inner ℂ x y) := by
  rw [inner_eq_sum, Fintype.sum_sum_type, Fintype.sum_sigma]
  have hbool : ∑ b : Bool, conj (featL e N x (Sum.inr b)) * featR e N y (Sum.inr b) = 0 := by
    simp [featL_inr, featR_inr]
  rw [hbool, add_zero]
  simp only [featL_inl, featR_inl]
  unfold physPoly
  rw [← Fin.sum_univ_eq_sum_range (fun j => (e j : ℂ) * (inner ℂ x y * ((‖inner ℂ x y‖ : ℝ) : ℂ) ^ (2 * j)))]
  refine sum_congr rfl fun j _ => ?_
  have : ∀ q, conj (((Real.sqrt |e j| : ℝ) : ℂ) * tpow j x q) * (((ssq (e j) : ℝ) : ℂ) * tpow j y q)
      = (e j : ℂ) * (conj (tpow j x q) * tpow j y q) := by
    intro q
    rw [map_mul, Complex.conj_ofReal]
    have h1 : ((Real.sqrt |e j| : ℝ) : ℂ) * ((ssq (e j) : ℝ) : ℂ) = (e j : ℂ) := by
      rw [← Complex.ofReal_mul, mul_comm, ssq_mul_sqrt]
    calc ((Real.sqrt |e j| : ℝ) : ℂ) * conj (tpow j x q) * (((ssq (e j) : ℝ) : ℂ) * tpow j y q)
        = (((Real.sqrt |e j| : ℝ) : ℂ) * ((ssq (e j) : ℝ) : ℂ)) * (conj (tpow j x q) * tpow j y q) := by ring
      _ = _ := by rw [h1]
  simp_rw [this]
  rw [← Finset.mul_sum, ← inner_eq_sum, inner_tpow]

lemma norm_featL (e : ℕ → ℝ) (N : ℕ) (he : ∑ j ∈ range N, |e j| ≤ 1)
    (x : EuclideanSpace ℂ ι) (hx : ‖x‖ = 1) : ‖featL e N x‖ = 1 := by
  have h1 : inner ℂ (featL e N x) (featL e N x) = ((‖featL e N x‖ : ℝ) : ℂ) ^ 2 :=
    inner_self_eq_norm_sq_to_K _
  have h2 : inner ℂ (featL e N x) (featL e N x) = 1 := by
    rw [inner_eq_sum, Fintype.sum_sum_type, Fintype.sum_sigma]
    have hS : 0 ≤ 1 - ∑ j ∈ range N, |e j| := by linarith
    have hsq : ((Real.sqrt (1 - ∑ j ∈ range N, |e j|) : ℝ) : ℂ)
        * ((Real.sqrt (1 - ∑ j ∈ range N, |e j|) : ℝ) : ℂ) = ((1 - ∑ j ∈ range N, |e j| : ℝ) : ℂ) := by
      rw [← Complex.ofReal_mul, Real.mul_self_sqrt hS]
    have hbool : ∑ b : Bool, conj (featL e N x (Sum.inr b)) * featL e N x (Sum.inr b)
        = ((1 - ∑ j ∈ range N, |e j| : ℝ) : ℂ) := by
      rw [Fintype.sum_bool, featL_inr, featL_inr]
      simp only [↓reduceIte, Bool.false_eq_true, Complex.conj_ofReal, map_zero, mul_zero,
        add_zero]
      exact hsq
    rw [hbool]
    simp only [featL_inl]
    have : ∀ (j : Fin N) q, conj (((Real.sqrt |e j| : ℝ) : ℂ) * tpow j x q)
        * (((Real.sqrt |e j| : ℝ) : ℂ) * tpow j x q)
        = ((|e j| : ℝ) : ℂ) * (conj (tpow j x q) * tpow j x q) := by
      intro j q
      rw [map_mul, Complex.conj_ofReal]
      have h1 : ((Real.sqrt |e j| : ℝ) : ℂ) * ((Real.sqrt |e j| : ℝ) : ℂ) = ((|e j| : ℝ) : ℂ) := by
        rw [← Complex.ofReal_mul, Real.mul_self_sqrt (abs_nonneg _)]
      calc ((Real.sqrt |e j| : ℝ) : ℂ) * conj (tpow j x q) * (((Real.sqrt |e j| : ℝ) : ℂ) * tpow j x q)
          = (((Real.sqrt |e j| : ℝ) : ℂ) * ((Real.sqrt |e j| : ℝ) : ℂ)) * (conj (tpow j x q) * tpow j x q) := by ring
        _ = _ := by rw [h1]
    simp_rw [this]
    have htp : ∀ j : Fin N, ∑ q, conj (tpow j x q) * tpow j x q = 1 := by
      intro j
      rw [← inner_eq_sum, inner_self_eq_norm_sq_to_K, norm_tpow j x hx]
      simp
    simp_rw [← Finset.mul_sum, htp, mul_one]
    rw [Fin.sum_univ_eq_sum_range (fun j => ((|e j| : ℝ) : ℂ)) N]
    push_cast
    ring
  rw [h2] at h1
  have h3 : (‖featL e N x‖ : ℝ) ^ 2 = 1 := by exact_mod_cast h1.symm
  exact (pow_eq_one_iff_of_nonneg (norm_nonneg _) two_ne_zero).1 h3

lemma norm_featR (e : ℕ → ℝ) (N : ℕ) (he : ∑ j ∈ range N, |e j| ≤ 1)
    (y : EuclideanSpace ℂ ι) (hy : ‖y‖ = 1) : ‖featR e N y‖ = 1 := by
  have h1 : inner ℂ (featR e N y) (featR e N y) = ((‖featR e N y‖ : ℝ) : ℂ) ^ 2 :=
    inner_self_eq_norm_sq_to_K _
  have h2 : inner ℂ (featR e N y) (featR e N y) = 1 := by
    rw [inner_eq_sum, Fintype.sum_sum_type, Fintype.sum_sigma]
    have hS : 0 ≤ 1 - ∑ j ∈ range N, |e j| := by linarith
    have hsq : ((Real.sqrt (1 - ∑ j ∈ range N, |e j|) : ℝ) : ℂ)
        * ((Real.sqrt (1 - ∑ j ∈ range N, |e j|) : ℝ) : ℂ) = ((1 - ∑ j ∈ range N, |e j| : ℝ) : ℂ) := by
      rw [← Complex.ofReal_mul, Real.mul_self_sqrt hS]
    have hbool : ∑ b : Bool, conj (featR e N y (Sum.inr b)) * featR e N y (Sum.inr b)
        = ((1 - ∑ j ∈ range N, |e j| : ℝ) : ℂ) := by
      rw [Fintype.sum_bool, featR_inr, featR_inr]
      simp only [↓reduceIte, Bool.false_eq_true, Complex.conj_ofReal, map_zero, mul_zero,
        zero_add]
      exact hsq
    rw [hbool]
    simp only [featR_inl]
    have : ∀ (j : Fin N) q, conj (((ssq (e j) : ℝ) : ℂ) * tpow j y q)
        * (((ssq (e j) : ℝ) : ℂ) * tpow j y q)
        = ((|e j| : ℝ) : ℂ) * (conj (tpow j y q) * tpow j y q) := by
      intro j q
      rw [map_mul, Complex.conj_ofReal]
      have h1 : ((ssq (e j) : ℝ) : ℂ) * ((ssq (e j) : ℝ) : ℂ) = ((|e j| : ℝ) : ℂ) := by
        rw [← Complex.ofReal_mul, ← sq, ssq_sq]
      calc ((ssq (e j) : ℝ) : ℂ) * conj (tpow j y q) * (((ssq (e j) : ℝ) : ℂ) * tpow j y q)
          = (((ssq (e j) : ℝ) : ℂ) * ((ssq (e j) : ℝ) : ℂ)) * (conj (tpow j y q) * tpow j y q) := by ring
        _ = _ := by rw [h1]
    simp_rw [this]
    have htp : ∀ j : Fin N, ∑ q, conj (tpow j y q) * tpow j y q = 1 := by
      intro j
      rw [← inner_eq_sum, inner_self_eq_norm_sq_to_K, norm_tpow j y hy]
      simp
    simp_rw [← Finset.mul_sum, htp, mul_one]
    rw [Fin.sum_univ_eq_sum_range (fun j => ((|e j| : ℝ) : ℂ)) N]
    push_cast
    ring
  rw [h2] at h1
  have h3 : (‖featR e N y‖ : ℝ) ^ 2 = 1 := by exact_mod_cast h1.symm
  exact (pow_eq_one_iff_of_nonneg (norm_nonneg _) two_ne_zero).1 h3

/-- **Allowable preprocessing**: composing a dominated kernel with the physical map of a
coefficient sequence of `ℓ¹` norm at most one gives a dominated kernel. -/
theorem DominatedKernel.comp_physPoly {Q : ℂ → ℂ} (hQ : DominatedKernel Q) (e : ℕ → ℝ) (N : ℕ)
    (he : ∑ j ∈ range N, |e j| ≤ 1) : DominatedKernel fun z => Q (physPoly e N z) := by
  intro m n A ι _ x y hx hy
  have := hQ m n A (FIdx ι N) (fun i => featL e N (x i)) (fun j => featR e N (y j))
    (fun i => norm_featL e N he (x i) (hx i)) (fun j => norm_featR e N he (y j) (hy j))
  simpa only [inner_featL_featR] using this

end

end Grothe
