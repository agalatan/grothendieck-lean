import Mathlib

/-!
# Parseval on a circle for an odd power series (step 2 of the `hardy` plan)

If `f z = ∑ⱼ hⱼ z^{2j+1}` on the circle `‖z‖ = ρ` with `∑ |hⱼ| ρ^{2j+1} < ∞`, then
`∑ⱼ 2π hⱼ² ρ^{2(2j+1)} = ∫₀^{2π} |f(ρ e^{iθ})|² dθ` (`hasSum_parseval_odd`). In particular every
partial sum `∑_{j<J} hⱼ² ρ^{2(2j+1)}` is at most the mean of `|f|²` over the circle
(`sum_sq_le_mean`), which is the form of the `hardy` hypothesis.
-/

open Complex intervalIntegral

namespace Grothe.UpperChaos

/-- One term of the product series: `aⱼ aₖ e^{2i(j−k)θ}` as a continuous map. -/
noncomputable def parsevalTerm (a : ℕ → ℝ) (i : ℕ × ℕ) : C(ℝ, ℂ) :=
  ⟨fun θ => ((a i.1 * a i.2 : ℝ) : ℂ) * Complex.exp (2 * ((i.1 : ℂ) - i.2) * (θ * I)), by
    fun_prop⟩

lemma norm_exp_real_mul_I (c : ℝ) : ‖Complex.exp (c * I)‖ = 1 := Complex.norm_exp_ofReal_mul_I c

lemma integral_parsevalTerm (a : ℕ → ℝ) (i : ℕ × ℕ) :
    ∫ θ in (0 : ℝ)..2 * Real.pi, parsevalTerm a i θ =
      if i.1 = i.2 then ((2 * Real.pi * a i.1 ^ 2 : ℝ) : ℂ) else 0 := by
  simp only [parsevalTerm, ContinuousMap.coe_mk]
  rw [intervalIntegral.integral_const_mul]
  split_ifs with h
  · simp only [h, sub_self, mul_zero, zero_mul, Complex.exp_zero, integral_const, sub_zero,
      Complex.real_smul, mul_one]
    push_cast; ring
  · have hc : (2 * ((i.1 : ℂ) - i.2) * I) ≠ 0 := by
      have : ((i.1 : ℂ) - i.2) ≠ 0 := by
        rw [sub_ne_zero]; exact_mod_cast h
      exact mul_ne_zero (mul_ne_zero two_ne_zero this) I_ne_zero
    have e : ∀ θ : ℝ, Complex.exp (2 * ((i.1 : ℂ) - i.2) * (θ * I)) =
        Complex.exp ((2 * ((i.1 : ℂ) - i.2) * I) * θ) := fun θ => by ring_nf
    simp_rw [e]
    rw [integral_exp_mul_complex hc]
    have h1 : Complex.exp (2 * ((i.1 : ℂ) - i.2) * I * (2 * (Real.pi : ℂ))) = 1 := by
      have : 2 * ((i.1 : ℂ) - i.2) * I * (2 * (Real.pi : ℂ)) =
          ((2 * ((i.1 : ℤ) - i.2) : ℤ) : ℂ) * (2 * Real.pi * I) := by push_cast; ring
      rw [this, Complex.exp_int_mul_two_pi_mul_I]
    push_cast; simp [h1]

/-- **Parseval for an odd series on the circle `‖z‖ = ρ`.** -/
theorem hasSum_parseval_odd {f : ℂ → ℂ} {h : ℕ → ℝ} {ρ : ℝ}
    (hsum : ∀ θ : ℝ, HasSum (fun j => (h j : ℂ) * ((ρ : ℂ) * Complex.exp (θ * I)) ^ (2 * j + 1))
      (f ((ρ : ℂ) * Complex.exp (θ * I))))
    (habs : Summable fun j => |h j * ρ ^ (2 * j + 1)|) :
    HasSum (fun j => 2 * Real.pi * (h j * ρ ^ (2 * j + 1)) ^ 2)
      (∫ θ in (0 : ℝ)..2 * Real.pi, ‖f ((ρ : ℂ) * Complex.exp (θ * I))‖ ^ 2) := by
  set a : ℕ → ℝ := fun j => h j * ρ ^ (2 * j + 1) with ha
  -- the terms on the circle
  have hterm : ∀ (θ : ℝ) (j : ℕ), (h j : ℂ) * ((ρ : ℂ) * Complex.exp (θ * I)) ^ (2 * j + 1) =
      (a j : ℂ) * Complex.exp ((2 * j + 1 : ℂ) * (θ * I)) := fun θ j => by
    rw [mul_pow, ← Complex.exp_nat_mul]; simp only [ha]; push_cast; ring_nf
  have habs' : Summable fun j => ‖a j‖ := by
    simp only [Real.norm_eq_abs, ha]; exact habs
  have hprod : Summable fun i : ℕ × ℕ => |a i.1| * |a i.2| := by
    have := Summable.mul_norm habs' habs'
    simpa [Real.norm_eq_abs, abs_mul] using this
  have hnt : ∀ (i : ℕ × ℕ) (θ : ℝ), ‖parsevalTerm a i θ‖ = |a i.1| * |a i.2| := fun i θ => by
    simp only [parsevalTerm, ContinuousMap.coe_mk, norm_mul, Complex.norm_real, Real.norm_eq_abs]
    have e : 2 * ((i.1 : ℂ) - i.2) * (θ * I) = ((2 * ((i.1 : ℝ) - i.2) * θ : ℝ) : ℂ) * I := by
      push_cast; ring
    rw [e, norm_exp_real_mul_I, mul_one]
  have hsumR : Summable fun i : ℕ × ℕ =>
      ‖(parsevalTerm a i).restrict
        (⟨Set.uIcc 0 (2 * Real.pi), isCompact_uIcc⟩ : TopologicalSpace.Compacts ℝ)‖ := by
    refine hprod.of_nonneg_of_le (fun _ => norm_nonneg _) fun i => ?_
    refine (ContinuousMap.norm_le _ (by positivity)).2 fun x => ?_
    rw [ContinuousMap.restrict_apply, hnt]
  have hint := hasSum_intervalIntegral_of_summable_norm (a := 0) (b := 2 * Real.pi) hsumR
  -- pointwise: the product series sums to `|f|²`
  have hpt : ∀ θ : ℝ, ∑' i : ℕ × ℕ, parsevalTerm a i θ =
      ((‖f ((ρ : ℂ) * Complex.exp (θ * I))‖ ^ 2 : ℝ) : ℂ) := by
    intro θ
    have h1 : HasSum (fun j => (a j : ℂ) * Complex.exp ((2 * j + 1 : ℂ) * (θ * I)))
        (f ((ρ : ℂ) * Complex.exp (θ * I))) := by
      simpa only [hterm] using hsum θ
    have h2 := (Complex.hasSum_conj'.2 h1)
    have hmul := h1.mul h2 (by
      refine Summable.of_norm (hprod.congr fun i => ?_)
      simp only [norm_mul, map_mul, Complex.conj_ofReal, Complex.norm_conj, Complex.norm_real,
        Real.norm_eq_abs]
      have e1 : ∀ m : ℕ, ‖Complex.exp ((2 * m + 1 : ℂ) * (θ * I))‖ = 1 := fun m => by
        have : (2 * m + 1 : ℂ) * (θ * I) = (((2 * m + 1) * θ : ℝ) : ℂ) * I := by push_cast; ring
        rw [this, norm_exp_real_mul_I]
      rw [e1, e1]; ring)
    have hc : ∀ m : ℕ, (starRingEnd ℂ) (Complex.exp ((2 * m + 1 : ℂ) * (θ * I))) =
        Complex.exp (-((2 * m + 1 : ℂ) * (θ * I))) := fun m => by
      rw [← Complex.exp_conj]; congr 1
      simp only [map_mul, map_add, map_ofNat, map_one, Complex.conj_natCast, Complex.conj_ofReal,
        Complex.conj_I]
      ring
    rw [Complex.ofReal_pow, ← Complex.mul_conj', ← hmul.tsum_eq]
    refine tsum_congr fun i => ?_
    simp only [parsevalTerm, ContinuousMap.coe_mk, map_mul, Complex.conj_ofReal, hc]
    rw [show ∀ (u v x y : ℂ), u * Complex.exp x * (v * Complex.exp y) =
        u * v * Complex.exp (x + y) from fun u v x y => by rw [Complex.exp_add]; ring]
    simp only [ha]
    push_cast
    ring_nf
  simp_rw [hpt] at hint
  rw [intervalIntegral.integral_ofReal] at hint
  -- the integrals of the terms vanish off the diagonal
  simp_rw [integral_parsevalTerm] at hint
  have hdiag : HasSum (fun j => ((2 * Real.pi * a j ^ 2 : ℝ) : ℂ))
      (((∫ θ in (0 : ℝ)..2 * Real.pi, ‖f ((ρ : ℂ) * Complex.exp (θ * I))‖ ^ 2 : ℝ) : ℂ)) := by
    have hinj : Function.Injective fun j : ℕ => (j, j) := fun a b hab => (Prod.mk.inj hab).1
    rw [← hinj.hasSum_iff] at hint
    · convert hint using 1
      funext j
      simp [Function.comp]
    · intro i hi
      have : i.1 ≠ i.2 := fun he => hi ⟨i.1, by ext <;> simp [he]⟩
      simp [this]
  exact_mod_cast hdiag

/-- **The `hardy` shape.** If the mean of `|f|²` over the circle `‖z‖ = ρ` is at most `B`, every partial
sum `∑_{j<J} hⱼ² ρ^{2(2j+1)}` is at most `B`. -/
theorem sum_sq_le_of_mean_le {f : ℂ → ℂ} {h : ℕ → ℝ} {ρ B : ℝ}
    (hsum : ∀ θ : ℝ, HasSum (fun j => (h j : ℂ) * ((ρ : ℂ) * Complex.exp (θ * I)) ^ (2 * j + 1))
      (f ((ρ : ℂ) * Complex.exp (θ * I))))
    (habs : Summable fun j => |h j * ρ ^ (2 * j + 1)|)
    (hmean : (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi, ‖f ((ρ : ℂ) * Complex.exp (θ * I))‖ ^ 2 ≤ B)
    (J : ℕ) : ∑ j ∈ Finset.range J, h j ^ 2 * ρ ^ (2 * (2 * j + 1)) ≤ B := by
  have hP := hasSum_parseval_odd hsum habs
  have hle := sum_le_hasSum (Finset.range J) (fun j _ => by positivity) hP
  have hpi : 0 < 2 * Real.pi := by positivity
  have e : ∑ j ∈ Finset.range J, 2 * Real.pi * (h j * ρ ^ (2 * j + 1)) ^ 2 =
      2 * Real.pi * ∑ j ∈ Finset.range J, h j ^ 2 * ρ ^ (2 * (2 * j + 1)) := by
    rw [Finset.mul_sum]; refine Finset.sum_congr rfl fun j _ => by ring
  rw [e] at hle
  have := mul_le_mul_of_nonneg_left hle (inv_nonneg.2 hpi.le)
  rw [← mul_assoc, inv_mul_cancel₀ hpi.ne', one_mul] at this
  linarith

end Grothe.UpperChaos
