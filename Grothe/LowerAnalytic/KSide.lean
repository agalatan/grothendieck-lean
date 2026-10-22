import Grothe.LowerAnalytic.Pieces

/-!
# The k-side of the row reduction (L4, S3.4″)

Hilbert-space forms `formH3 M u = Σ m_ij Re⟪u_i, u_j⟫` (`formH2` likewise), equal to the integral of
the pointwise forms (`formH3_eq_integral`), nonnegative for checked gates, additive on orthogonal
triples; the decomposition `u = Au + Bu + r` along two orthogonal subspaces.
-/

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

variable {n : ℕ}

/-! ### Real parts of inner products as integrals -/

lemma re_inner_eq_integral (a b : L2G n) :
    (inner ℂ a b).re = ∫ y, hre (a y) (b y) ∂(stdGaussian (n + n)) := by
  have hi : Integrable (fun y => conj (a y) * b y) (stdGaussian (n + n)) :=
    (L2.integrable_inner (𝕜 := ℂ) a b).congr
      (Filter.Eventually.of_forall fun y => RCLike.inner_apply' _ _)
  have h := integral_re hi
  simp only [RCLike.re_to_complex] at h
  rw [inner_L2, ← h]
  rfl

lemma integrable_hre (a b : L2G n) :
    Integrable (fun y => hre (a y) (b y)) (stdGaussian (n + n)) :=
  ((L2.integrable_inner (𝕜 := ℂ) a b).congr
    (Filter.Eventually.of_forall fun _ => RCLike.inner_apply' _ _)).re

/-! ### Hilbert forms -/

/-- `Σ m_ij Re⟪u_i, u_j⟫`. -/
def formH3 (M : Sym3) (u1 u2 u3 : L2G n) : ℝ :=
  M.m11 * (inner ℂ u1 u1).re + 2 * M.m12 * (inner ℂ u1 u2).re + 2 * M.m13 * (inner ℂ u1 u3).re
    + M.m22 * (inner ℂ u2 u2).re + 2 * M.m23 * (inner ℂ u2 u3).re + M.m33 * (inner ℂ u3 u3).re

def formH2 (M : Sym2) (u1 u2 : L2G n) : ℝ :=
  M.m11 * (inner ℂ u1 u1).re + 2 * M.m12 * (inner ℂ u1 u2).re + M.m22 * (inner ℂ u2 u2).re

lemma integral_lin6 {α : Type*} [MeasurableSpace α] {μ : Measure α}
    {f1 f2 f3 f4 f5 f6 : α → ℝ} (h1 : Integrable f1 μ) (h2 : Integrable f2 μ) (h3 : Integrable f3 μ)
    (h4 : Integrable f4 μ) (h5 : Integrable f5 μ) (h6 : Integrable f6 μ) (c1 c2 c3 c4 c5 c6 : ℝ) :
    ∫ y, (c1 * f1 y + c2 * f2 y + c3 * f3 y + c4 * f4 y + c5 * f5 y + c6 * f6 y) ∂μ
      = c1 * ∫ y, f1 y ∂μ + c2 * ∫ y, f2 y ∂μ + c3 * ∫ y, f3 y ∂μ + c4 * ∫ y, f4 y ∂μ
        + c5 * ∫ y, f5 y ∂μ + c6 * ∫ y, f6 y ∂μ := by
  have g1 : Integrable (fun y => c1 * f1 y) μ := h1.const_mul _
  have g2 : Integrable (fun y => c2 * f2 y) μ := h2.const_mul _
  have g3 : Integrable (fun y => c3 * f3 y) μ := h3.const_mul _
  have g4 : Integrable (fun y => c4 * f4 y) μ := h4.const_mul _
  have g5 : Integrable (fun y => c5 * f5 y) μ := h5.const_mul _
  have g6 : Integrable (fun y => c6 * f6 y) μ := h6.const_mul _
  have k2 : Integrable (fun y => c1 * f1 y + c2 * f2 y) μ := g1.add g2
  have k3 : Integrable (fun y => c1 * f1 y + c2 * f2 y + c3 * f3 y) μ := k2.add g3
  have k4 : Integrable (fun y => c1 * f1 y + c2 * f2 y + c3 * f3 y + c4 * f4 y) μ := k3.add g4
  have k5 : Integrable (fun y => c1 * f1 y + c2 * f2 y + c3 * f3 y + c4 * f4 y + c5 * f5 y) μ :=
    k4.add g5
  rw [integral_add k5 g6, integral_add k4 g5, integral_add k3 g4, integral_add k2 g3,
    integral_add g1 g2, integral_const_mul, integral_const_mul, integral_const_mul,
    integral_const_mul, integral_const_mul, integral_const_mul]

lemma formH3_eq_integral (M : Sym3) (u1 u2 u3 : L2G n) :
    formH3 M u1 u2 u3 = ∫ y, M.form (u1 y) (u2 y) (u3 y) ∂(stdGaussian (n + n)) := by
  simp only [formH3, re_inner_eq_integral, Sym3.form]
  rw [integral_lin6 (integrable_hre _ _) (integrable_hre _ _) (integrable_hre _ _)
    (integrable_hre _ _) (integrable_hre _ _) (integrable_hre _ _)]

lemma formH2_eq_integral (M : Sym2) (u1 u2 : L2G n) :
    formH2 M u1 u2 = ∫ y, M.form (u1 y) (u2 y) ∂(stdGaussian (n + n)) := by
  have := integral_lin6 (μ := stdGaussian (n + n)) (integrable_hre u1 u1) (integrable_hre u1 u2)
    (integrable_hre u2 u2) (integrable_hre u2 u2) (integrable_hre u2 u2) (integrable_hre u2 u2)
    M.m11 (2 * M.m12) M.m22 0 0 0
  simp only [zero_mul, add_zero] at this
  simp only [formH2, re_inner_eq_integral, Sym2.form]
  rw [this]

lemma formH3_nonneg (M : Sym3) (h : M.psdOK = true) (u1 u2 u3 : L2G n) : 0 ≤ formH3 M u1 u2 u3 := by
  rw [formH3_eq_integral]
  exact integral_nonneg fun y => Sym3.form_nonneg_of_psdOK M h _ _ _

lemma formH2_nonneg (M : Sym2) (h : M.psdOK = true) (u1 u2 : L2G n) : 0 ≤ formH2 M u1 u2 := by
  rw [formH2_eq_integral]
  exact integral_nonneg fun y => Sym2.form_nonneg_of_psdOK M h _ _

lemma re_inner_self (u : L2G n) : (inner ℂ u u).re = ‖u‖ ^ 2 := by
  rw [inner_self_eq_norm_sq_to_K]; norm_cast

lemma formH3_subDiag (M : Sym3) (a b c : ℚ) (u1 u2 u3 : L2G n) :
    formH3 (M.subDiag a b c) u1 u2 u3
      = formH3 M u1 u2 u3 - a * ‖u1‖ ^ 2 - b * ‖u2‖ ^ 2 - c * ‖u3‖ ^ 2 := by
  simp only [formH3, Sym3.subDiag, re_inner_self]; push_cast; ring

lemma formH2_subDiag (M : Sym2) (a b : ℚ) (u1 u2 : L2G n) :
    formH2 (M.subDiag a b) u1 u2 = formH2 M u1 u2 - a * ‖u1‖ ^ 2 - b * ‖u2‖ ^ 2 := by
  simp only [formH2, Sym2.subDiag, re_inner_self]; push_cast; ring

/-- Additivity on orthogonal vectors. -/
lemma formH3_add (M : Sym3) (u1 u2 u3 w1 w2 w3 : L2G n)
    (h : ∀ a ∈ ({u1, u2, u3} : Set (L2G n)), ∀ b ∈ ({w1, w2, w3} : Set (L2G n)), inner ℂ a b = 0) :
    formH3 M (u1 + w1) (u2 + w2) (u3 + w3) = formH3 M u1 u2 u3 + formH3 M w1 w2 w3 := by
  have h' : ∀ a ∈ ({u1, u2, u3} : Set (L2G n)), ∀ b ∈ ({w1, w2, w3} : Set (L2G n)),
      inner ℂ b a = 0 := fun a ha b hb => by rw [← inner_conj_symm, h a ha b hb, map_zero]
  simp only [formH3, inner_add_left, inner_add_right, Complex.add_re]
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff, forall_eq_or_imp, forall_eq] at h h'
  obtain ⟨⟨a1, a2, a3⟩, ⟨b1, b2, b3⟩, ⟨c1, c2, c3⟩⟩ := h
  obtain ⟨⟨d1, d2, d3⟩, ⟨e1, e2, e3⟩, ⟨g1, g2, g3⟩⟩ := h'
  simp only [a1, a2, a3, b2, b3, c3, d1, e1, e2, g1, g2, g3,
    Complex.zero_re]
  ring

lemma formH2_add (M : Sym2) (u1 u2 w1 w2 : L2G n)
    (h : ∀ a ∈ ({u1, u2} : Set (L2G n)), ∀ b ∈ ({w1, w2} : Set (L2G n)), inner ℂ a b = 0) :
    formH2 M (u1 + w1) (u2 + w2) = formH2 M u1 u2 + formH2 M w1 w2 := by
  have h' : ∀ a ∈ ({u1, u2} : Set (L2G n)), ∀ b ∈ ({w1, w2} : Set (L2G n)),
      inner ℂ b a = 0 := fun a ha b hb => by rw [← inner_conj_symm, h a ha b hb, map_zero]
  simp only [formH2, inner_add_left, inner_add_right, Complex.add_re]
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff, forall_eq_or_imp, forall_eq] at h h'
  obtain ⟨⟨a1, a2⟩, ⟨b1, b2⟩⟩ := h
  obtain ⟨⟨d1, d2⟩, ⟨e1, e2⟩⟩ := h'
  simp only [a1, a2, b2, d1, e1, e2, Complex.zero_re]
  ring

/-! ### Decomposition along two orthogonal subspaces -/

section decomp

variable (A B : Submodule ℂ (L2G n)) [A.HasOrthogonalProjection] [B.HasOrthogonalProjection]
  (hAB : A ≤ Bᗮ)
include hAB

/-- The remainder `u − Π_A u − Π_B u`. -/
def remd (u : L2G n) : L2G n := u - A.starProjection u - B.starProjection u

lemma inner_projA_projB (a b : L2G n) : inner ℂ (A.starProjection a) (B.starProjection b) = 0 := by
  have ha : A.starProjection a ∈ Bᗮ := hAB (by rw [Submodule.starProjection_apply]; exact Submodule.coe_mem _)
  have hb : B.starProjection b ∈ B := by rw [Submodule.starProjection_apply]; exact Submodule.coe_mem _
  rw [← inner_conj_symm, (Submodule.mem_orthogonal _ _).1 ha _ hb, map_zero]

omit hAB in
lemma inner_proj_proj_self (K : Submodule ℂ (L2G n)) [K.HasOrthogonalProjection] (a b : L2G n) :
    inner ℂ (K.starProjection a) (K.starProjection b) = inner ℂ (K.starProjection a) b := by
  rw [← Submodule.inner_starProjection_left_eq_right, Submodule.starProjection_eq_self_iff.2
    (by rw [Submodule.starProjection_apply]; exact Submodule.coe_mem _)]

lemma inner_projA_remd (a b : L2G n) : inner ℂ (A.starProjection a) (remd A B b) = 0 := by
  rw [remd, inner_sub_right, inner_sub_right, inner_proj_proj_self, inner_projA_projB A B hAB]
  ring

lemma inner_projB_remd (a b : L2G n) : inner ℂ (B.starProjection a) (remd A B b) = 0 := by
  have hBA : B ≤ Aᗮ := by
    intro x hx; rw [Submodule.mem_orthogonal]; intro y hy
    rw [← inner_conj_symm, (Submodule.mem_orthogonal _ _).1 (hAB hy) x hx, map_zero]
  rw [remd, inner_sub_right, inner_sub_right, inner_proj_proj_self, inner_projA_projB B A hBA]
  ring

omit hAB in
lemma decomp_eq (u : L2G n) : u = A.starProjection u + (B.starProjection u + remd A B u) := by
  rw [remd]; abel

/-- `formH3 M u = formH3 M (Π_A u) + formH3 M (Π_B u) + formH3 M (r u)`. -/
theorem formH3_decomp (M : Sym3) (u1 u2 u3 : L2G n) :
    formH3 M u1 u2 u3 = formH3 M (A.starProjection u1) (A.starProjection u2) (A.starProjection u3)
      + formH3 M (B.starProjection u1) (B.starProjection u2) (B.starProjection u3)
      + formH3 M (remd A B u1) (remd A B u2) (remd A B u3) := by
  conv_lhs => rw [decomp_eq A B u1, decomp_eq A B u2, decomp_eq A B u3]
  rw [formH3_add, formH3_add, add_assoc]
  · simp only [Set.mem_insert_iff, Set.mem_singleton_iff]
    rintro a (rfl | rfl | rfl) b (rfl | rfl | rfl) <;> exact inner_projB_remd A B hAB _ _
  · simp only [Set.mem_insert_iff, Set.mem_singleton_iff]
    rintro a (rfl | rfl | rfl) b (rfl | rfl | rfl) <;>
      rw [inner_add_right, inner_projA_projB A B hAB, inner_projA_remd A B hAB, add_zero]

theorem formH2_decomp (M : Sym2) (u1 u2 : L2G n) :
    formH2 M u1 u2 = formH2 M (A.starProjection u1) (A.starProjection u2)
      + formH2 M (B.starProjection u1) (B.starProjection u2)
      + formH2 M (remd A B u1) (remd A B u2) := by
  conv_lhs => rw [decomp_eq A B u1, decomp_eq A B u2]
  rw [formH2_add, formH2_add, add_assoc]
  · simp only [Set.mem_insert_iff, Set.mem_singleton_iff]
    rintro a (rfl | rfl) b (rfl | rfl) <;> exact inner_projB_remd A B hAB _ _
  · simp only [Set.mem_insert_iff, Set.mem_singleton_iff]
    rintro a (rfl | rfl) b (rfl | rfl) <;>
      rw [inner_add_right, inner_projA_projB A B hAB, inner_projA_remd A B hAB, add_zero]

end decomp

/-! ### Conjugation and the remote projection formulas -/

/-- `conj u`. -/
def conjL (u : L2G n) : L2G n :=
  ((Lp.memLp u).of_le (Complex.continuous_conj.comp_aestronglyMeasurable (Lp.memLp u).aestronglyMeasurable)
    (Filter.Eventually.of_forall fun y => by simp)).toLp (fun y => conj (u y))

lemma conjL_ae (u : L2G n) : ⇑(conjL u) =ᵐ[stdGaussian (n + n)] fun y => conj (u y) :=
  MemLp.coeFn_toLp _

/-- **Projection onto the span of an orthogonal family of equal norms.** -/
theorem norm_sq_starProjection_span_orth {ι : Type*} [Fintype ι] [DecidableEq ι]
    (g : ι → L2G n) (lam : ℝ) (hlam : 0 < lam)
    (hg : ∀ i j, inner ℂ (g i) (g j) = if i = j then (lam : ℂ) else 0)
    [(Submodule.span ℂ (Set.range g)).HasOrthogonalProjection] (u : L2G n) :
    ‖(Submodule.span ℂ (Set.range g)).starProjection u‖ ^ 2 = ∑ i, ‖inner ℂ (g i) u‖ ^ 2 / lam := by
  have hl : (lam : ℂ) ≠ 0 := by exact_mod_cast hlam.ne'
  have hP : (Submodule.span ℂ (Set.range g)).starProjection u
      = ∑ i, (inner ℂ (g i) u / lam) • g i := by
    refine Submodule.eq_starProjection_of_mem_orthogonal
      (Submodule.sum_mem _ fun i _ => Submodule.smul_mem _ _ (Submodule.subset_span ⟨i, rfl⟩)) ?_
    have h : Submodule.span ℂ (Set.range g) ≤ (ℂ ∙ (u - ∑ i, (inner ℂ (g i) u / lam) • g i))ᗮ := by
      refine Submodule.span_le.2 ?_
      rintro _ ⟨m, rfl⟩
      refine Submodule.mem_orthogonal_singleton_iff_inner_left.2 ?_
      rw [inner_sub_right, inner_sum]
      simp_rw [inner_smul_right, hg, mul_ite, mul_zero, Finset.sum_ite_eq, Finset.mem_univ, ite_true]
      field_simp; ring
    exact Submodule.orthogonal_le h
      (Submodule.le_orthogonal_orthogonal _ (Submodule.mem_span_singleton_self _))
  rw [hP, @norm_sq_eq_re_inner ℂ, sum_inner]
  simp_rw [inner_sum, inner_smul_left, inner_smul_right, hg, mul_ite, mul_zero, Finset.sum_ite_eq,
    Finset.mem_univ, ite_true]
  rw [RCLike.re_to_complex, Complex.re_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [map_div₀, Complex.conj_ofReal,
    show conj (inner ℂ (g i) u) / lam * (inner ℂ (g i) u / lam * lam)
      = conj (inner ℂ (g i) u) * inner ℂ (g i) u / lam by field_simp,
    Complex.conj_mul', ← Complex.ofReal_pow, ← Complex.ofReal_div, Complex.ofReal_re]

lemma inner_zbL_zbL (a b : Fin n) :
    inner ℂ (zbL n a) (zbL n b) = if a = b then (2 : ℂ) else 0 := by
  have h := inner_zL_zL n a b
  rw [inner_L2] at h ⊢
  have e : ∫ y, conj (zbL n a y) * zbL n b y ∂(stdGaussian (n + n))
      = conj (∫ y, conj (zL n a y) * zL n b y ∂(stdGaussian (n + n))) := by
    rw [← integral_conj]
    refine integral_congr_ae ?_
    filter_upwards [zbL_ae n a, zbL_ae n b, zL_ae n a, zL_ae n b] with y h1 h2 h3 h4
    rw [h1, h2, h3, h4, map_mul, Complex.conj_conj]
  rw [e, h]
  split_ifs <;> norm_num [Complex.ext_iff]

lemma inner_zbL_eq (c : Fin n) (u : L2G n) :
    inner ℂ (zbL n c) u = conj (inner ℂ (zL n c) (conjL u)) := by
  rw [inner_L2, inner_L2, ← integral_conj]
  refine integral_congr_ae ?_
  filter_upwards [zbL_ae n c, zL_ae n c, conjL_ae u] with y h1 h2 h3
  rw [h1, h2, h3, map_mul, Complex.conj_conj, Complex.conj_conj]

/-- `‖Π_{span z̄} u‖² = ‖Π_{H₁,₀} conj u‖²`. -/
theorem norm_sq_proj_K2 (u : L2G n) :
    ‖(Kspace n 2).starProjection u‖ ^ 2 = ‖(H10 n).starProjection (conjL u)‖ ^ 2 := by
  classical
  have inst : (Submodule.span ℂ (Set.range (zbL n))).HasOrthogonalProjection :=
    (inferInstance : (Kspace n 2).HasOrthogonalProjection)
  have := norm_sq_starProjection_span_orth (zbL n) 2 two_pos
    (fun i j => by rw [inner_zbL_zbL]; push_cast; rfl) u
  simp only [Kspace, Matrix.cons_val, Fin.isValue] at this ⊢
  rw [this, norm_sq_starProjection_H10]
  simp_rw [inner_zbL_eq, Complex.norm_conj]

lemma norm_oneL : ‖oneL n‖ = 1 := by
  have h := inner_self_eq_norm_sq_to_K (𝕜 := ℂ) (oneL n)
  rw [inner_L2] at h
  have e : ∫ y, conj (oneL n y) * oneL n y ∂(stdGaussian (n + n)) = 1 := by
    rw [integral_congr_ae (g := fun _ => (1 : ℂ)) (by
      filter_upwards [oneL_ae n] with y hy; rw [hy]; simp)]
    simp
  rw [e] at h
  have h2' : ((‖oneL n‖ ^ 2 : ℝ) : ℂ) = 1 := by rw [Complex.ofReal_pow]; exact h.symm
  have h2 : ‖oneL n‖ ^ 2 = 1 := by exact_mod_cast h2'
  nlinarith [norm_nonneg (oneL n)]

lemma inner_oneL (u : L2G n) : inner ℂ (oneL n) u = ∫ y, u y ∂(stdGaussian (n + n)) := by
  rw [inner_L2]
  refine integral_congr_ae ?_
  filter_upwards [oneL_ae n] with y hy
  rw [hy]; simp

/-- `‖Π_{constants} u‖² = |∫ u|²`. -/
theorem norm_sq_proj_K4 (u : L2G n) :
    ‖(Kspace n 4).starProjection u‖ ^ 2 = ‖∫ y, u y ∂(stdGaussian (n + n))‖ ^ 2 := by
  simp only [Kspace, Matrix.cons_val, Fin.isValue]
  rw [Submodule.starProjection_singleton, norm_oneL, norm_smul, norm_oneL, inner_oneL]
  simp

lemma inner_oneL_qL (a b : Fin n) : inner ℂ (oneL n) (qL n a b) = 0 := by
  have h := inner_zL_zL n b a
  have e : inner ℂ (oneL n) (zzbL n a b) = inner ℂ (zL n b) (zL n a) := by
    rw [inner_L2, inner_L2]
    refine integral_congr_ae ?_
    filter_upwards [oneL_ae n, (MemLp.coeFn_toLp _ : ⇑(zzbL n a b) =ᵐ[stdGaussian (n + n)] _),
      zL_ae n a, zL_ae n b] with y h1 h2 h3 h4
    rw [h1, h3, h4]; unfold zzbL; rw [h2]; simp only [map_one, one_mul]; ring
  rw [qL, inner_sub_right, inner_smul_right, e, h, inner_self_eq_norm_sq_to_K, norm_oneL]
  by_cases hab : a = b
  · subst hab; simp
  · simp [hab, Ne.symm hab]

/-- The constants are orthogonal to `span (z z̄ − 2δ)`. -/
lemma K4_le_K3_orth : Kspace n 4 ≤ (Kspace n 3)ᗮ := by
  simp only [Kspace, Matrix.cons_val, Fin.isValue]
  rw [Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe, Submodule.mem_orthogonal]
  intro v hv
  induction hv using Submodule.span_induction with
  | mem x hx =>
    obtain ⟨p, rfl⟩ := hx
    rw [← inner_conj_symm, inner_oneL_qL, map_zero]
  | zero => simp
  | add x y _ _ hx hy => rw [inner_add_left, hx, hy, add_zero]
  | smul r x _ hx => rw [inner_smul_left, hx, mul_zero]

/-! ### `‖Pk‖²` in the reindexed split -/

section psplit

variable {k : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ} (hkm : Measurable k) (hkb : ∀ x, ‖k x‖ ≤ 1)
  (u : L2G (n + 1)) (hu : ⇑u =ᵐ[stdGaussian ((n + 1) + (n + 1))] k)
include hkm hkb hu

omit hkm hkb in
lemma section_eq (G : ℂ → ℂ) :
    ∀ᵐ y ∂(stdGaussian (n + n)), ∫ z, G z * u (joinR z y) ∂gaussC = ∫ z, G z * k (joinR z y) ∂gaussC := by
  filter_upwards [ae_split2 hu] with y hy
  exact integral_congr_ae (by filter_upwards [hy] with z hz; rw [hz])

lemma inner_zL0_split2 :
    inner ℂ (zL (n + 1) 0) u = ((√2 : ℝ) : ℂ) * inner ℂ (oneL n) (cfL n hkm hkb 3) := by
  rw [inner_zL_eq_integral, integral_split2 _ (integrable_conj_zc_mul 0 u), inner_oneL,
    ← integral_const_mul]
  refine integral_congr_ae ?_
  filter_upwards [section_eq u hu (fun z => conj z), cfL_ae hkm hkb 3] with y hy hc
  simp_rw [joinR_zc0, map_mul, Complex.conj_ofReal, mul_assoc]
  rw [integral_const_mul, hy, hc]
  rfl

lemma inner_zL_succ_split2 (l : Fin n) :
    inner ℂ (zL (n + 1) l.succ) u = inner ℂ (zL n l) (cfL n hkm hkb 0) := by
  rw [inner_zL_eq_integral, integral_split2 _ (integrable_conj_zc_mul l.succ u), inner_L2]
  refine integral_congr_ae ?_
  filter_upwards [section_eq u hu (fun _ => 1), cfL_ae hkm hkb 0, zL_ae n l] with y hy hc hz
  simp_rw [joinR_zc_succ]
  rw [integral_const_mul, hz, hc]
  simp only [one_mul] at hy
  rw [hy]
  simp [cf, fibreB]

/-- **`‖Pk‖² = |Π₀,₀ c_z|² + ‖Π₁,₀ c₁‖²`** in the reindexed split. -/
theorem norm_sq_P_split2 :
    ‖(H10 (n + 1)).starProjection u‖ ^ 2
      = ‖(Kspace n 4).starProjection (cfL n hkm hkb 3)‖ ^ 2
        + ‖(H10 n).starProjection (cfL n hkm hkb 0)‖ ^ 2 := by
  rw [norm_sq_starProjection_H10, Fin.sum_univ_succ, inner_zL0_split2 hkm hkb u hu, norm_mul,
    mul_pow, Complex.norm_real, Real.norm_eq_abs, sq_abs, Real.sq_sqrt (by norm_num),
    norm_sq_proj_K4, ← inner_oneL, norm_sq_starProjection_H10]
  congr 1
  · ring
  · refine Finset.sum_congr rfl fun l _ => ?_
    rw [inner_zL_succ_split2 hkm hkb u hu]

end psplit

lemma H10_le_H21_orth : H10 n ≤ (H21 n)ᗮ :=
  (Submodule.le_orthogonal_orthogonal _).trans (Submodule.orthogonal_le (H21_le_orthogonal n))

/-- **The k-side inequality (S3.4″)**: for gates `E ⪰ 0`, `E ⪰ diag(−1, ε, ε)`, `R ⪰ 0`,
`R ⪰ diag(−1, ε)`, `R ⪰ diag(ε, 0)` and a bounded representative `k` of `u`, with the coefficient
functions `c_j = c_j[k]`, `ξ = (c₀, c₁, conj c₂)`, `ζ = (c₃, c₄)`, `d = c₅` and `X = Π_{H₂,₁} ξ`:

  `ε‖P₂,₁ u‖² − ‖P₁,₀ u‖² ≤ ξ*Eξ + ζ*Rζ + ε‖d‖² − X*EX + ε‖X₁‖²`  (integrated forms). -/
theorem kside (E : Sym3) (R : Sym2) (hE : E.psdOK = true) (hE1 : (E.subDiag (-1) ε ε).psdOK = true)
    (hR : R.psdOK = true) (hR1 : (R.subDiag (-1) ε).psdOK = true) (hR2 : (R.subDiag ε 0).psdOK = true)
    {k : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ} (hkm : Measurable k) (hkb : ∀ x, ‖k x‖ ≤ 1)
    (u : L2G (n + 1)) (hu : ⇑u =ᵐ[stdGaussian ((n + 1) + (n + 1))] k) :
    (ε : ℝ) * ‖(H21 (n + 1)).starProjection u‖ ^ 2 - ‖(H10 (n + 1)).starProjection u‖ ^ 2
      ≤ formH3 E (cfL n hkm hkb 0) (cfL n hkm hkb 1) (conjL (cfL n hkm hkb 2))
        + formH2 R (cfL n hkm hkb 3) (cfL n hkm hkb 4) + ε * ‖cfL n hkm hkb 5‖ ^ 2
        - formH3 E ((H21 n).starProjection (cfL n hkm hkb 0))
            ((H21 n).starProjection (cfL n hkm hkb 1))
            ((H21 n).starProjection (conjL (cfL n hkm hkb 2)))
        + ε * ‖(H21 n).starProjection (cfL n hkm hkb 0)‖ ^ 2 := by
  have hε : (0 : ℝ) ≤ ε := by unfold ε; norm_num
  set c : Fin 6 → L2G n := fun j => cfL n hkm hkb j with hc
  have hQ := norm_sq_starProjection_H21_le hkm hkb u hu
  rw [Fin.sum_univ_six] at hQ
  have k0 : Kspace n 0 = H21 n := rfl
  have k1 : Kspace n 1 = H10 n := rfl
  have hQ' : ‖(H21 (n + 1)).starProjection u‖ ^ 2
      ≤ ‖(H21 n).starProjection (c 0)‖ ^ 2 + ‖(H10 n).starProjection (c 1)‖ ^ 2
        + ‖(H10 n).starProjection (conjL (c 2))‖ ^ 2 + ‖(Kspace n 3).starProjection (c 3)‖ ^ 2
        + ‖(Kspace n 4).starProjection (c 4)‖ ^ 2 + ‖(Kspace n 5).starProjection (c 5)‖ ^ 2 := by
    rw [← norm_sq_proj_K2]; exact hQ
  have hP := norm_sq_P_split2 hkm hkb u hu
  -- the ξ-part
  have hd3 := formH3_decomp (H10 n) (H21 n) H10_le_H21_orth E (c 0) (c 1) (conjL (c 2))
  have hA := formH3_nonneg _ hE1 ((H10 n).starProjection (c 0)) ((H10 n).starProjection (c 1))
    ((H10 n).starProjection (conjL (c 2)))
  rw [formH3_subDiag] at hA
  have hr3 := formH3_nonneg _ hE (remd (H10 n) (H21 n) (c 0)) (remd (H10 n) (H21 n) (c 1))
    (remd (H10 n) (H21 n) (conjL (c 2)))
  -- the ζ-part
  have hd2 := formH2_decomp (Kspace n 4) (Kspace n 3) K4_le_K3_orth R (c 3) (c 4)
  have hA2 := formH2_nonneg _ hR1 ((Kspace n 4).starProjection (c 3))
    ((Kspace n 4).starProjection (c 4))
  rw [formH2_subDiag] at hA2
  have hB2 := formH2_nonneg _ hR2 ((Kspace n 3).starProjection (c 3))
    ((Kspace n 3).starProjection (c 4))
  rw [formH2_subDiag] at hB2
  have hr2 := formH2_nonneg _ hR (remd (Kspace n 4) (Kspace n 3) (c 3))
    (remd (Kspace n 4) (Kspace n 3) (c 4))
  -- the d-part
  have hd5 : ‖(Kspace n 5).starProjection (c 5)‖ ^ 2 ≤ ‖c 5‖ ^ 2 :=
    pow_le_pow_left₀ (norm_nonneg _) (Submodule.norm_starProjection_apply_le _ _) 2
  push_cast at hA hA2 hB2
  simp only [hc] at *
  nlinarith [mul_le_mul_of_nonneg_left hQ' hε, mul_le_mul_of_nonneg_left hd5 hε]

end

end Grothe.LowerAnalytic
