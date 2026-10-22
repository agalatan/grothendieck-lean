import Grothe.LowerAnalytic.Witness

/-!
# The Wick cubics lie in `H₂,₁`

`H21 n` was defined as the orthogonal complement of the first chaos inside the charge-one
polynomials of degree `≤ 3`.  Here we check that the Wick cubics

  `wickL a b c = z_a z_b z̄_c − 2δ_ac z_b − 2δ_bc z_a`

(with `E|z_l|² = 2`) belong to it, so that `H21 n` is visibly the Wick space `H₂,₁`.  The tool is
the complex Gaussian integration by parts `E[z̄_i F] = E[∂_{x_i} F] − i E[∂_{y_i} F]`
(`integral_conj_zc_mul`, from the coordinate Stein identity applied to real and imaginary parts),
which gives `E[z̄_c z_b] = 2δ_bc` (`integral_zc_mul_conj`) and the complex Wick identity
`E[z̄_i z_a z_b z̄_c] = 4(δ_ia δ_bc + δ_ib δ_ac)` (`integral_conj_zc_mul_wc`).
-/

namespace Grothe.LowerAnalytic

open MeasureTheory MvPolynomial Grothe.Lower
open scoped ComplexConjugate

noncomputable section

/-! ### The complex-valued coordinate Stein identity -/

/-- **Coordinate Stein identity for complex-valued functions.** -/
theorem stein_coordinate_complex {d : ℕ} (j : Fin d) (F D : (Fin d → ℝ) → ℂ)
    (hF : Integrable F (stdGaussian d)) (hD : Integrable D (stdGaussian d))
    (hxF : Integrable (fun x => (x j : ℂ) * F x) (stdGaussian d))
    (hderiv : ∀ x, HasDerivAt (fun t => F (Function.update x j t)) (D x) (x j)) :
    ∫ x, D x ∂(stdGaussian d) = ∫ x, (x j : ℂ) * F x ∂(stdGaussian d) := by
  have hre := stein_coordinate j (fun x => (F x).re) (fun x => (D x).re) hF.re hD.re
    (by simpa [Complex.re_ofReal_mul] using hxF.re)
    (fun x => Complex.reCLM.hasFDerivAt.comp_hasDerivAt (x j) (hderiv x))
  have him := stein_coordinate j (fun x => (F x).im) (fun x => (D x).im) hF.im hD.im
    (by simpa [Complex.im_ofReal_mul] using hxF.im)
    (fun x => Complex.imCLM.hasFDerivAt.comp_hasDerivAt (x j) (hderiv x))
  rw [← integral_re_add_im hD, ← integral_re_add_im hxF]
  simp only [RCLike.re_to_complex, RCLike.im_to_complex, RCLike.I_to_complex,
    Complex.re_ofReal_mul, Complex.im_ofReal_mul]
  rw [hre, him]

variable (n : ℕ)

/-! ### Slice derivatives of the complex coordinates -/

lemma castAdd_ne_natAdd (i l : Fin n) : Fin.castAdd n i ≠ Fin.natAdd n l := by
  intro h
  have := congrArg Fin.val h
  simp only [Fin.val_castAdd, Fin.val_natAdd] at this
  omega

lemma castAdd_inj_iff {i l : Fin n} : Fin.castAdd n i = Fin.castAdd n l ↔ i = l :=
  ⟨fun h => Fin.ext (by simpa using congrArg Fin.val h), fun h => h ▸ rfl⟩

lemma natAdd_inj_iff {i l : Fin n} : Fin.natAdd n i = Fin.natAdd n l ↔ i = l :=
  ⟨fun h => Fin.ext (by have := congrArg Fin.val h; simp only [Fin.val_natAdd] at this; omega),
    fun h => h ▸ rfl⟩

/-- `∂ z_l / ∂ x_j`: `1` at the real coordinate of `z_l`, `i` at its imaginary coordinate, `0`
otherwise. -/
def dz (l : Fin n) (j : Fin (n + n)) : ℂ :=
  if j = Fin.castAdd n l then 1 else if j = Fin.natAdd n l then Complex.I else 0

lemma dz_castAdd (l i : Fin n) : dz n l (Fin.castAdd n i) = if i = l then 1 else 0 := by
  simp only [dz, castAdd_inj_iff, castAdd_ne_natAdd, ite_false]

lemma dz_natAdd (l i : Fin n) : dz n l (Fin.natAdd n i) = if i = l then Complex.I else 0 := by
  simp only [dz, natAdd_inj_iff, (castAdd_ne_natAdd n l i).symm, ite_false]

lemma norm_dz_le (l : Fin n) (j : Fin (n + n)) : ‖dz n l j‖ ≤ 1 := by
  unfold dz; split_ifs <;> simp

lemma zc_eq (l : Fin n) (x : Fin (n + n) → ℝ) :
    zc n l x = ((x (Fin.castAdd n l) : ℝ) : ℂ) + ((x (Fin.natAdd n l) : ℝ) : ℂ) * Complex.I := by
  apply Complex.ext <;> simp [zc]

lemma hasDerivAt_coord (x : Fin (n + n) → ℝ) (j k : Fin (n + n)) :
    HasDerivAt (fun t => ((Function.update x j t k : ℝ) : ℂ)) (if k = j then 1 else 0) (x j) := by
  by_cases h : k = j
  · subst h
    simp only [Function.update_self, ite_true]
    exact (hasDerivAt_id' (x k)).ofReal_comp
  · simp only [Function.update_of_ne h, h, ite_false]
    exact hasDerivAt_const _ _

lemma hasDerivAt_zc (l : Fin n) (x : Fin (n + n) → ℝ) (j : Fin (n + n)) :
    HasDerivAt (fun t => zc n l (Function.update x j t)) (dz n l j) (x j) := by
  simp_rw [zc_eq]
  have h1 := hasDerivAt_coord n x j (Fin.castAdd n l)
  have h2 := (hasDerivAt_coord n x j (Fin.natAdd n l)).mul_const Complex.I
  convert h1.add h2 using 1
  unfold dz
  by_cases ha : j = Fin.castAdd n l
  · subst ha
    simp only [ite_true, castAdd_ne_natAdd n l l, (castAdd_ne_natAdd n l l).symm, ite_false]
    ring
  · by_cases hb : j = Fin.natAdd n l
    · subst hb
      simp only [ite_true, castAdd_ne_natAdd n l l, (castAdd_ne_natAdd n l l).symm, ite_false]
      ring
    · simp only [ha, hb, Ne.symm ha, Ne.symm hb, ite_false]
      ring

/-! ### Integrability -/

lemma integrable_of_norm_le_rad_pow {F : (Fin (n + n) → ℝ) → ℂ}
    (hF : AEStronglyMeasurable F (stdGaussian (n + n))) (C : ℝ) (hC : 0 ≤ C) (k : ℕ)
    (h : ∀ x, ‖F x‖ ≤ C * rad n x ^ k) : Integrable F (stdGaussian (n + n)) :=
  ((integrable_eval (1 + (∑ i : Fin (n + n), X i ^ 2) ^ k)).const_mul C).mono' hF
    (Filter.Eventually.of_forall fun x => by
      refine (h x).trans ?_
      simp only [map_add, map_one, map_pow, map_sum, eval_X]
      rw [← rad_sq, ← pow_mul]
      have hr := rad_nonneg n x
      refine mul_le_mul_of_nonneg_left ?_ hC
      rcases le_or_gt (rad n x) 1 with h1 | h1
      · have : rad n x ^ k ≤ 1 := pow_le_one₀ hr h1
        linarith [pow_nonneg hr (2 * k)]
      · have : rad n x ^ k ≤ rad n x ^ (2 * k) := pow_le_pow_right₀ h1.le (by omega)
        linarith)

lemma norm_coord_le (x : Fin (n + n) → ℝ) (j : Fin (n + n)) : ‖((x j : ℝ) : ℂ)‖ ≤ rad n x := by
  rw [Complex.norm_real, Real.norm_eq_abs, rad]
  exact Real.abs_le_sqrt (Finset.single_le_sum (f := fun i => x i ^ 2) (fun _ _ => sq_nonneg _)
    (Finset.mem_univ j))

/-- The slice derivative of `z_a z_b z̄_c` in the direction `j`. -/
def D3 (a b c : Fin n) (j : Fin (n + n)) (x : Fin (n + n) → ℝ) : ℂ :=
  dz n a j * zc n b x * conj (zc n c x) + zc n a x * dz n b j * conj (zc n c x)
    + zc n a x * zc n b x * conj (dz n c j)

lemma hasDerivAt_wc (a b c : Fin n) (x : Fin (n + n) → ℝ) (j : Fin (n + n)) :
    HasDerivAt (fun t => wc n a b c (Function.update x j t)) (D3 n a b c j x) (x j) := by
  have h := ((hasDerivAt_zc n a x j).mul (hasDerivAt_zc n b x j)).mul (hasDerivAt_zc n c x j).star
  simp only [Function.update_eq_self, Complex.star_def] at h
  convert h using 1 <;> first | (funext t; rfl) | (simp only [D3, Pi.mul_apply, Function.update_eq_self]; ring)

lemma norm_wc_le (a b c : Fin n) (x : Fin (n + n) → ℝ) : ‖wc n a b c x‖ ≤ rad n x ^ 3 := by
  have hr := rad_nonneg n x
  rw [wc, norm_mul, norm_mul, Complex.norm_conj, pow_succ, pow_two]
  exact mul_le_mul (mul_le_mul (norm_zc_le n a x) (norm_zc_le n b x) (norm_nonneg _) hr)
    (norm_zc_le n c x) (norm_nonneg _) (mul_nonneg hr hr)

lemma integrable_wc (a b c : Fin n) : Integrable (wc n a b c) (stdGaussian (n + n)) :=
  integrable_of_norm_le_rad_pow n (continuous_wc n a b c).aestronglyMeasurable 1 zero_le_one 3
    fun x => by rw [one_mul]; exact norm_wc_le n a b c x

lemma integrable_coord_mul_wc (a b c : Fin n) (j : Fin (n + n)) :
    Integrable (fun x => (x j : ℂ) * wc n a b c x) (stdGaussian (n + n)) :=
  integrable_of_norm_le_rad_pow n
    (((Complex.continuous_ofReal.comp (continuous_apply j)).mul
      (continuous_wc n a b c)).aestronglyMeasurable) 1 zero_le_one 4 fun x => by
    have hr := rad_nonneg n x
    rw [one_mul, norm_mul]
    calc ‖((x j : ℝ) : ℂ)‖ * ‖wc n a b c x‖ ≤ rad n x * rad n x ^ 3 :=
          mul_le_mul (norm_coord_le n x j) (norm_wc_le n a b c x) (norm_nonneg _) hr
      _ = rad n x ^ 4 := by ring

lemma continuous_D3 (a b c : Fin n) (j : Fin (n + n)) : Continuous (D3 n a b c j) := by
  unfold D3
  have := continuous_zc n a; have := continuous_zc n b; have := continuous_zc n c
  fun_prop

lemma integrable_D3 (a b c : Fin n) (j : Fin (n + n)) :
    Integrable (D3 n a b c j) (stdGaussian (n + n)) :=
  integrable_of_norm_le_rad_pow n (continuous_D3 n a b c j).aestronglyMeasurable 3 (by norm_num) 2
    fun x => by
    have hr := rad_nonneg n x
    have h1 := norm_zc_le n a x
    have h2 := norm_zc_le n b x
    have h3 := norm_zc_le n c x
    have d1 := norm_dz_le n a j
    have d2 := norm_dz_le n b j
    have d3 := norm_dz_le n c j
    unfold D3
    refine (norm_add_le _ _).trans ((add_le_add (norm_add_le _ _) le_rfl).trans ?_)
    simp only [norm_mul, Complex.norm_conj]
    have e1 : ‖dz n a j‖ * ‖zc n b x‖ * ‖zc n c x‖ ≤ rad n x ^ 2 := by
      rw [pow_two]
      calc ‖dz n a j‖ * ‖zc n b x‖ * ‖zc n c x‖ ≤ 1 * rad n x * rad n x :=
            mul_le_mul (mul_le_mul d1 h2 (norm_nonneg _) zero_le_one) h3 (norm_nonneg _)
              (by linarith)
        _ = rad n x * rad n x := by ring
    have e2 : ‖zc n a x‖ * ‖dz n b j‖ * ‖zc n c x‖ ≤ rad n x ^ 2 := by
      rw [pow_two]
      calc ‖zc n a x‖ * ‖dz n b j‖ * ‖zc n c x‖ ≤ rad n x * 1 * rad n x :=
            mul_le_mul (mul_le_mul h1 d2 (norm_nonneg _) hr) h3 (norm_nonneg _) (by linarith)
        _ = rad n x * rad n x := by ring
    have e3 : ‖zc n a x‖ * ‖zc n b x‖ * ‖dz n c j‖ ≤ rad n x ^ 2 := by
      rw [pow_two]
      calc ‖zc n a x‖ * ‖zc n b x‖ * ‖dz n c j‖ ≤ rad n x * rad n x * 1 :=
            mul_le_mul (mul_le_mul h1 h2 (norm_nonneg _) hr) d3 (norm_nonneg _)
              (mul_nonneg hr hr)
        _ = rad n x * rad n x := by ring
    linarith

lemma integrable_zc (b : Fin n) : Integrable (zc n b) (stdGaussian (n + n)) :=
  integrable_of_norm_le_rad_pow n (continuous_zc n b).aestronglyMeasurable 1 zero_le_one 1
    fun x => by rw [one_mul, pow_one]; exact norm_zc_le n b x

lemma integrable_coord_mul_zc (b : Fin n) (j : Fin (n + n)) :
    Integrable (fun x => (x j : ℂ) * zc n b x) (stdGaussian (n + n)) :=
  integrable_of_norm_le_rad_pow n
    (((Complex.continuous_ofReal.comp (continuous_apply j)).mul
      (continuous_zc n b)).aestronglyMeasurable) 1 zero_le_one 2 fun x => by
    rw [one_mul, norm_mul, pow_two]
    exact mul_le_mul (norm_coord_le n x j) (norm_zc_le n b x) (norm_nonneg _) (rad_nonneg n x)

/-! ### The complex integration by parts and the Wick identities -/

/-- **Complex Gaussian integration by parts**: `E[z̄_i F] = E[∂_{x_i}F] − i E[∂_{y_i}F]`. -/
theorem integral_conj_zc_mul (i : Fin n) (F : (Fin (n + n) → ℝ) → ℂ)
    (D : Fin (n + n) → (Fin (n + n) → ℝ) → ℂ) (hF : Integrable F (stdGaussian (n + n)))
    (hD : ∀ j, Integrable (D j) (stdGaussian (n + n)))
    (hxF : ∀ j, Integrable (fun x => (x j : ℂ) * F x) (stdGaussian (n + n)))
    (hderiv : ∀ j x, HasDerivAt (fun t => F (Function.update x j t)) (D j x) (x j)) :
    ∫ x, conj (zc n i x) * F x ∂(stdGaussian (n + n))
      = ∫ x, D (Fin.castAdd n i) x ∂(stdGaussian (n + n))
        - Complex.I * ∫ x, D (Fin.natAdd n i) x ∂(stdGaussian (n + n)) := by
  rw [stein_coordinate_complex _ F _ hF (hD _) (hxF _) (hderiv _),
    stein_coordinate_complex _ F _ hF (hD _) (hxF _) (hderiv _), ← integral_const_mul,
    ← integral_sub (hxF _) ((hxF _).const_mul _)]
  congr 1; ext x
  rw [zc_eq]
  simp only [map_add, map_mul, Complex.conj_ofReal, Complex.conj_I]
  ring

/-- `E[z_b z̄_c] = 2δ_bc`. -/
theorem integral_zc_mul_conj (b c : Fin n) :
    ∫ x, zc n b x * conj (zc n c x) ∂(stdGaussian (n + n)) = 2 * if b = c then 1 else 0 := by
  simp_rw [mul_comm (zc n b _)]
  rw [integral_conj_zc_mul n c (zc n b) (fun j _ => dz n b j) (integrable_zc n b)
    (fun j => integrable_const _) (integrable_coord_mul_zc n b) (fun j x => hasDerivAt_zc n b x j)]
  simp only [integral_const, probReal_univ, one_smul, dz_castAdd, dz_natAdd]
  by_cases h : b = c
  · subst h
    simp only [ite_true, Complex.I_mul_I]
    norm_num
  · simp only [h, Ne.symm h, ite_false]
    ring

/-- **The complex Wick identity** `E[z̄_i z_a z_b z̄_c] = 4(δ_ia δ_bc + δ_ib δ_ac)`. -/
theorem integral_conj_zc_mul_wc (i a b c : Fin n) :
    ∫ x, conj (zc n i x) * wc n a b c x ∂(stdGaussian (n + n))
      = 4 * ((if i = a then 1 else 0) * (if b = c then 1 else 0)
        + (if i = b then 1 else 0) * (if a = c then 1 else 0)) := by
  rw [integral_conj_zc_mul n i (wc n a b c) (D3 n a b c) (integrable_wc n a b c)
    (integrable_D3 n a b c) (integrable_coord_mul_wc n a b c) (fun j x => hasDerivAt_wc n a b c x j)]
  have hpt : ∀ x, D3 n a b c (Fin.castAdd n i) x - Complex.I * D3 n a b c (Fin.natAdd n i) x
      = (2 * if i = a then 1 else 0) * (zc n b x * conj (zc n c x))
        + (2 * if i = b then 1 else 0) * (zc n a x * conj (zc n c x)) := by
    intro x
    simp only [D3, dz_castAdd, dz_natAdd]
    split_ifs <;> apply Complex.ext <;>
      simp [Complex.mul_re, Complex.mul_im, Complex.conj_re, Complex.conj_im] <;> ring
  rw [← integral_const_mul, ← integral_sub (integrable_D3 n a b c _)
    ((integrable_D3 n a b c _).const_mul _)]
  simp_rw [hpt]
  have hbc : Integrable (fun x => zc n b x * conj (zc n c x)) (stdGaussian (n + n)) :=
    integrable_of_norm_le_rad_pow n ((continuous_zc n b).mul
      (Complex.continuous_conj.comp (continuous_zc n c))).aestronglyMeasurable 1 zero_le_one 2
      fun x => by
        rw [one_mul, norm_mul, Complex.norm_conj, pow_two]
        exact mul_le_mul (norm_zc_le n b x) (norm_zc_le n c x) (norm_nonneg _) (rad_nonneg n x)
  have hac : Integrable (fun x => zc n a x * conj (zc n c x)) (stdGaussian (n + n)) :=
    integrable_of_norm_le_rad_pow n ((continuous_zc n a).mul
      (Complex.continuous_conj.comp (continuous_zc n c))).aestronglyMeasurable 1 zero_le_one 2
      fun x => by
        rw [one_mul, norm_mul, Complex.norm_conj, pow_two]
        exact mul_le_mul (norm_zc_le n a x) (norm_zc_le n c x) (norm_nonneg _) (rad_nonneg n x)
  rw [integral_add (hbc.const_mul _) (hac.const_mul _), integral_const_mul, integral_const_mul,
    integral_zc_mul_conj, integral_zc_mul_conj]
  ring

/-! ### The Wick cubics in `L²` -/

lemma inner_zL_zL (i b : Fin n) : inner ℂ (zL n i) (zL n b) = 2 * if i = b then 1 else 0 := by
  rw [inner_L2]
  have : ∫ x, conj (zL n i x) * zL n b x ∂(stdGaussian (n + n))
      = ∫ x, zc n b x * conj (zc n i x) ∂(stdGaussian (n + n)) := by
    refine integral_congr_ae ?_
    filter_upwards [MemLp.coeFn_toLp (memLp_zc n i), MemLp.coeFn_toLp (memLp_zc n b)] with x h1 h2
    rw [zL, zL, h1, h2, mul_comm]
  rw [this, integral_zc_mul_conj]
  by_cases h : i = b
  · subst h; simp
  · simp [h, Ne.symm h]

lemma inner_zL_wL (i a b c : Fin n) :
    inner ℂ (zL n i) (wL n a b c)
      = 4 * ((if i = a then 1 else 0) * (if b = c then 1 else 0)
        + (if i = b then 1 else 0) * (if a = c then 1 else 0)) := by
  rw [inner_L2, ← integral_conj_zc_mul_wc]
  refine integral_congr_ae ?_
  filter_upwards [MemLp.coeFn_toLp (memLp_zc n i), MemLp.coeFn_toLp (memLp_wc n a b c)] with x h1 h2
  rw [zL, wL, h1, h2]

/-- **The Wick cubic** `z_a z_b z̄_c − 2δ_ac z_b − 2δ_bc z_a` (`E|z_l|² = 2`). -/
def wickL (a b c : Fin n) : L2G n :=
  wL n a b c - (if a = c then (2 : ℂ) else 0) • zL n b - (if b = c then (2 : ℂ) else 0) • zL n a

/-- The Wick cubics are orthogonal to the first chaos. -/
theorem inner_zL_wickL (i a b c : Fin n) : inner ℂ (zL n i) (wickL n a b c) = 0 := by
  simp only [wickL, inner_sub_right, inner_smul_right, inner_zL_zL, inner_zL_wL]
  split_ifs <;> norm_num

/-- **The Wick cubics lie in `H₂,₁`.** -/
theorem wickL_mem_H21 (a b c : Fin n) : wickL n a b c ∈ H21 n := by
  refine Submodule.mem_inf.2 ⟨?_, ?_⟩
  · unfold chargeOne3 wickL
    refine Submodule.sub_mem _ (Submodule.sub_mem _ ?_ (Submodule.smul_mem _ _ ?_))
      (Submodule.smul_mem _ _ ?_)
    · exact Submodule.subset_span (Set.mem_union_right _ ⟨(a, b, c), rfl⟩)
    · exact Submodule.subset_span (Set.mem_union_left _ ⟨b, rfl⟩)
    · exact Submodule.subset_span (Set.mem_union_left _ ⟨a, rfl⟩)
  · rw [Submodule.mem_orthogonal]
    intro u hu
    unfold H10 at hu
    induction hu using Submodule.span_induction with
    | mem x hx => obtain ⟨i, rfl⟩ := hx; exact inner_zL_wickL n i a b c
    | zero => simp
    | add x y _ _ hx hy => rw [inner_add_left, hx, hy, add_zero]
    | smul r x _ hx => rw [inner_smul_left, hx, mul_zero]

end

end Grothe.LowerAnalytic
