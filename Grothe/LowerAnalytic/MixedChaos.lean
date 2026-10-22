import Grothe.LowerAnalytic.FibreHermite

/-!
# The mixed chaos decomposition: first steps (L4, INFRA-D)

* `starProjection_H10_eq`: `P₁,₀ u = Σ_l (⟪z_l, u⟫/2) z_l` (the `z_l` are orthogonal with
  `‖z_l‖² = 2`), and `norm_sq_starProjection_H10 : ‖P₁,₀ u‖² = Σ_l |⟪z_l, u⟫|²/2`.
* `inner_zL_split`: in the fibre split, `⟪z₀, u⟫ = √2 ∫_w ∫_z conj(z) u(join z w)` (the visible
  coordinate), the raw form of `‖Pk‖² = |Π₀,₀ c_z|² + ‖Π₁,₀ c₁‖²`.
-/

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

variable (n : ℕ)

/-- **`P₁,₀` in the coordinate basis**: `P₁,₀ u = Σ_l (⟪z_l, u⟫/2) z_l`. -/
theorem starProjection_H10_eq (u : L2G n) :
    (H10 n).starProjection u = ∑ l, (inner ℂ (zL n l) u / 2) • zL n l := by
  refine Submodule.eq_starProjection_of_mem_orthogonal
    (Submodule.sum_mem _ fun l _ => Submodule.smul_mem _ _ (zL_mem_H10 n l)) ?_
  have h : H10 n ≤ (ℂ ∙ (u - ∑ l, (inner ℂ (zL n l) u / 2) • zL n l))ᗮ := by
    refine Submodule.span_le.2 ?_
    rintro _ ⟨m, rfl⟩
    refine Submodule.mem_orthogonal_singleton_iff_inner_left.2 ?_
    rw [inner_sub_right, inner_sum]
    simp_rw [inner_smul_right, inner_zL_zL]
    simp
  exact Submodule.orthogonal_le h
    (Submodule.le_orthogonal_orthogonal _ (Submodule.mem_span_singleton_self _))

/-- **`‖P₁,₀ u‖² = Σ_l |⟪z_l, u⟫|²/2`.** -/
theorem norm_sq_starProjection_H10 (u : L2G n) :
    ‖(H10 n).starProjection u‖ ^ 2 = ∑ l, ‖inner ℂ (zL n l) u‖ ^ 2 / 2 := by
  rw [starProjection_H10_eq, @norm_sq_eq_re_inner ℂ, sum_inner]
  simp_rw [inner_sum, inner_smul_left, inner_smul_right, inner_zL_zL]
  simp only [mul_ite, mul_one, mul_zero, Finset.sum_ite_eq, Finset.mem_univ, ite_true]
  rw [RCLike.re_to_complex, Complex.re_sum]
  refine Finset.sum_congr rfl fun l _ => ?_
  rw [map_div₀, Complex.conj_ofNat,
    show conj (inner ℂ (zL n l) u) / 2 * (inner ℂ (zL n l) u / 2 * 2)
      = conj (inner ℂ (zL n l) u) * inner ℂ (zL n l) u / 2 by ring,
    Complex.conj_mul', ← Complex.ofReal_pow, ← Complex.ofReal_ofNat, ← Complex.ofReal_div,
    Complex.ofReal_re]

/-! ### The coordinate inner products in the fibre split -/

variable {n}

lemma castAdd_not_vis (l : Fin (n + 1)) (hl : l ≠ 0) : ¬ isVis n (Fin.castAdd (n + 1) l) := by
  rintro (h | h)
  · exact hl (Fin.ext (by simpa [i0] using congrArg Fin.val h))
  · have := congrArg Fin.val h; simp [i1] at this; omega

lemma natAdd_not_vis (l : Fin (n + 1)) (hl : l ≠ 0) : ¬ isVis n (Fin.natAdd (n + 1) l) := by
  rintro (h | h)
  · have := congrArg Fin.val h; simp [i0] at this
  · exact hl (Fin.ext (by simpa [i1] using congrArg Fin.val h))

/-- The remote complex coordinate `z_l(w)`, `l ≠ 0`. -/
def rz (l : Fin (n + 1)) (hl : l ≠ 0) (w : RemT n → ℝ) : ℂ :=
  ⟨w ⟨Fin.castAdd (n + 1) l, castAdd_not_vis l hl⟩, w ⟨Fin.natAdd (n + 1) l, natAdd_not_vis l hl⟩⟩

lemma zc_join_remote (l : Fin (n + 1)) (hl : l ≠ 0) (z : ℂ) (w : RemT n → ℝ) :
    zc (n + 1) l (join n z w) = rz l hl w := by
  simp only [zc, rz, join, splitE_symm_apply, dite_eq_right (castAdd_not_vis l hl),
    dite_eq_right (natAdd_not_vis l hl)]

lemma integrable_conj_zc_mul (l : Fin (n + 1)) (u : L2G (n + 1)) :
    Integrable (fun x => conj (zc (n + 1) l x) * u x) (stdGaussian ((n + 1) + (n + 1))) := by
  have h := L2.integrable_inner (𝕜 := ℂ) (zL (n + 1) l) u
  refine h.congr ?_
  filter_upwards [MemLp.coeFn_toLp (memLp_zc (n + 1) l)] with x hx
  rw [RCLike.inner_apply', zL, hx]

lemma inner_zL_eq_integral (l : Fin (n + 1)) (u : L2G (n + 1)) :
    inner ℂ (zL (n + 1) l) u
      = ∫ x, conj (zc (n + 1) l x) * u x ∂(stdGaussian ((n + 1) + (n + 1))) := by
  rw [inner_L2]
  refine integral_congr_ae ?_
  filter_upwards [MemLp.coeFn_toLp (memLp_zc (n + 1) l)] with x hx
  rw [zL, hx]

/-- **The visible coordinate in the fibre split**: `⟪z₀, u⟫ = √2 ∫_w ∫_z conj(z) u(join z w)`. -/
theorem inner_zL0_split (u : L2G (n + 1)) :
    inner ℂ (zL (n + 1) 0) u = ((√2 : ℝ) : ℂ) * ∫ w, ∫ z, conj z * u (join n z w) ∂gaussC ∂(γW n) := by
  rw [inner_zL_eq_integral, integral_split _ (integrable_conj_zc_mul 0 u)]
  simp_rw [zc_join, map_mul, Complex.conj_ofReal, mul_assoc]
  rw [← integral_const_mul]
  congr 1; funext w
  rw [integral_const_mul]

/-- **The remote coordinates in the fibre split**: `⟪z_l, u⟫ = ∫_w conj(z_l(w)) ∫_z u(join z w)`
for `l ≠ 0` (the first-chaos coefficients of the fibre mean `c₁(w) = ∫_z u(join z w)`). -/
theorem inner_zL_remote_split (l : Fin (n + 1)) (hl : l ≠ 0) (u : L2G (n + 1)) :
    inner ℂ (zL (n + 1) l) u = ∫ w, conj (rz l hl w) * ∫ z, u (join n z w) ∂gaussC ∂(γW n) := by
  rw [inner_zL_eq_integral, integral_split _ (integrable_conj_zc_mul l u)]
  simp_rw [zc_join_remote l hl]
  congr 1; funext w
  rw [integral_const_mul]

/-- **`‖P₁,₀ u‖²` in the fibre split**: the visible part `|∫_w c_z(w)|²` plus the first-chaos content
`Σ_l |⟪z_l, c₁⟫_w|²/2` of the fibre mean `c₁(w) = ∫_z u(join z w)` (raw form of
`‖Pk‖² = |Π₀,₀ c_z|² + ‖Π₁,₀ c₁‖²`). -/
theorem norm_sq_starProjection_H10_split (u : L2G (n + 1)) :
    ‖(H10 (n + 1)).starProjection u‖ ^ 2
      = ‖∫ w, ∫ z, conj z * u (join n z w) ∂gaussC ∂(γW n)‖ ^ 2
        + ∑ l : Fin n, ‖∫ w, conj (rz l.succ (Fin.succ_ne_zero l) w)
            * ∫ z, u (join n z w) ∂gaussC ∂(γW n)‖ ^ 2 / 2 := by
  rw [norm_sq_starProjection_H10, Fin.sum_univ_succ, inner_zL0_split, norm_mul, mul_pow,
    Complex.norm_real, Real.norm_eq_abs, sq_abs, Real.sq_sqrt (by norm_num)]
  congr 1
  · ring
  · refine Finset.sum_congr rfl fun l _ => ?_
    rw [inner_zL_remote_split l.succ (Fin.succ_ne_zero l)]

end

end Grothe.LowerAnalytic
