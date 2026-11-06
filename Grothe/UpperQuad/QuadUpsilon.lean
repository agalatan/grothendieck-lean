import Grothe.UpperQuad.CanonicalExplicit
import Grothe.UpperQuad.QuadTaylorShift
import Grothe.UpperChaos.ConditionalSeedNormalization

/-!
# The two bounds of the conditional coefficient mass off the real axis (part (Q) of `hQuad`)

`Υ(A) = Σ_{c+d ≤ D} |Uext c d A|²` for complex `A`:

* `sqSum_Uext_le_shift` (small `Im A`): `Υ(A) ≤ (Σ_r shiftTerm D (|Im A| + δ) r)²` for any `δ > 0`,
  from the raising derivative `Uext' = √(c+1) Uext_{c+1,d} + √(d+1) Uext_{c,d+1}`
  (`hasDerivAt_Uext`), Bessel at a real base point `α ≠ 0` (`canonicalCoefficient_eq_Uext`,
  `sum_sq_canonicalCoefficient_le_one`) and `TaylorShift.sqSum_shift_le`;
* `sqSum_Uext_le_large` (large `|A|`, `Re A² > 0`):
  `Υ(A) ≤ θ Σ_{m ≤ D} m! T_m (θ²/|A|²)^m`, `θ = |A|²/Re A²`, from `norm_Uext_le` (E5′),
  `T_m = Σ_{c ≤ m} C(m,c) (1 + c/m)^{2(m−c+1)}`.

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.QuadRem

open Complex Grothe.UpperChaos Grothe.UpperQuad.Explicit Grothe.UpperQuad.TaylorShift

noncomputable section

/-- **The raising derivative of the explicit coefficients.** -/
theorem hasDerivAt_Uext (c d : ℕ) (A : ℂ) :
    HasDerivAt (Uext c d) (((Real.sqrt (c + 1) : ℝ) : ℂ) * Uext (c + 1) d A +
      ((Real.sqrt (d + 1) : ℝ) : ℂ) * Uext c (d + 1) A) A := by
  have h0 := (hasDerivAt_Dcd c d A).div_const
    ((Real.sqrt ((c.factorial : ℝ) * d.factorial * Real.pi) : ℝ) : ℂ)
  have h : HasDerivAt (Uext c d) ((Dcd (c + 1) d A + Dcd c (d + 1) A) /
      ((Real.sqrt ((c.factorial : ℝ) * d.factorial * Real.pi) : ℝ) : ℂ)) A := h0
  convert h using 1
  unfold Uext
  have hc : Real.sqrt (((c + 1).factorial : ℝ) * d.factorial * Real.pi) =
      Real.sqrt ((c : ℝ) + 1) * Real.sqrt ((c.factorial : ℝ) * d.factorial * Real.pi) := by
    rw [← Real.sqrt_mul (by positivity)]; congr 1; push_cast [Nat.factorial_succ]; ring
  have hd : Real.sqrt ((c.factorial : ℝ) * (d + 1).factorial * Real.pi) =
      Real.sqrt ((d : ℝ) + 1) * Real.sqrt ((c.factorial : ℝ) * d.factorial * Real.pi) := by
    rw [← Real.sqrt_mul (by positivity)]; congr 1; push_cast [Nat.factorial_succ]; ring
  have h1 : Real.sqrt ((c : ℝ) + 1) ≠ 0 := by positivity
  have h2 : Real.sqrt ((d : ℝ) + 1) ≠ 0 := by positivity
  have h3 : Real.sqrt ((c.factorial : ℝ) * d.factorial * Real.pi) ≠ 0 := by positivity
  rw [hc, hd]
  push_cast
  field_simp

theorem differentiable_Uext (c d : ℕ) : Differentiable ℂ (Uext c d) :=
  fun A => (hasDerivAt_Uext c d A).differentiableAt

/-- Bessel at a real base point. -/
lemma sqSum_Uext_real_le_one {α : ℝ} (hα : α ≠ 0) (M : ℕ) :
    sqSum M (fun c d => Uext c d (α : ℂ)) ≤ 1 := by
  unfold sqSum
  simp_rw [← canonicalCoefficient_eq_Uext α hα]
  exact ConditionalSeedNormalization.sum_sq_canonicalCoefficient_le_one α (tri M)

lemma shiftTerm_mono (D r : ℕ) {s t : ℝ} (hs : 0 ≤ s) (hst : s ≤ t) :
    shiftTerm D s r ≤ shiftTerm D t r := by
  unfold shiftTerm
  apply div_le_div_of_nonneg_right _ (by positivity)
  exact mul_le_mul_of_nonneg_right (pow_le_pow_left₀ hs hst r) (Real.sqrt_nonneg _)

/-- **The off-axis bound of the conditional mass.** -/
theorem sqSum_Uext_le_shift (A : ℂ) {δ : ℝ} (hδ : 0 < δ) (D : ℕ) :
    sqSum D (fun c d => Uext c d A) ≤ (∑' r, shiftTerm D (|A.im| + δ) r) ^ 2 := by
  -- a real base point `α ≠ 0` with `|A − α| ≤ |Im A| + δ`
  obtain ⟨α, hα0, hαd⟩ : ∃ α : ℝ, α ≠ 0 ∧ ‖A - α‖ ≤ |A.im| + δ := by
    by_cases hre : A.re = 0
    · refine ⟨δ, hδ.ne', ?_⟩
      calc ‖A - (δ : ℂ)‖ ≤ ‖A‖ + ‖(δ : ℂ)‖ := norm_sub_le _ _
        _ = |A.im| + δ := by
          rw [Complex.norm_real, Real.norm_eq_abs, abs_of_pos hδ]
          congr 1
          have hA : A = (A.im : ℂ) * I := by apply Complex.ext <;> simp [hre]
          conv_lhs => rw [hA]
          rw [norm_mul, Complex.norm_I, mul_one, Complex.norm_real, Real.norm_eq_abs]
    · refine ⟨A.re, hre, ?_⟩
      have : A - (A.re : ℂ) = (A.im : ℂ) * I := by
        apply Complex.ext <;> simp
      rw [this, norm_mul, Complex.norm_I, mul_one, Complex.norm_real, Real.norm_eq_abs]
      linarith
  have hshift := sqSum_shift_le (fun c d => Uext c d) (fun c d => differentiable_Uext c d)
    (fun c d A => (hasDerivAt_Uext c d A).deriv) (α : ℂ)
    (fun M => sqSum_Uext_real_le_one hα0 M) D (A - α)
  rw [add_sub_cancel] at hshift
  refine hshift.trans (pow_le_pow_left₀ (tsum_nonneg fun r =>
    shiftTerm_nonneg D (norm_nonneg _) r) ?_ 2)
  exact Summable.tsum_le_tsum (fun r => shiftTerm_mono D r (norm_nonneg _) hαd)
    (summable_shiftTerm D (norm_nonneg _)) (summable_shiftTerm D (by positivity))

/-- The triangle by total degree. -/
lemma sum_tri_eq (D : ℕ) (f : ℕ × ℕ → ℝ) :
    ∑ p ∈ tri D, f p = ∑ m ∈ Finset.range (D + 1), ∑ c ∈ Finset.range (m + 1), f (c, m - c) := by
  rw [Finset.sum_sigma']
  apply Finset.sum_nbij' (fun p => (⟨p.1 + p.2, p.1⟩ : Σ _ : ℕ, ℕ)) (fun x => (x.2, x.1 - x.2))
  · intro p hp
    simp only [mem_tri] at hp
    simp only [Finset.mem_sigma, Finset.mem_range]; omega
  · intro x hx
    simp only [Finset.mem_sigma, Finset.mem_range] at hx
    simp only [mem_tri]; omega
  · intro p _
    simp
  · intro x hx
    obtain ⟨a, b⟩ := x
    simp only [Finset.mem_sigma, Finset.mem_range] at hx
    simp only [Sigma.mk.injEq, heq_eq_eq, and_true]; omega
  · intro p _
    simp

/-- `T_m = Σ_{c ≤ m} C(m,c) (1 + c/m)^{2(m−c+1)}`, `T_0 = 1`. -/
def Tm (m : ℕ) : ℝ :=
  if m = 0 then 1 else
    ∑ c ∈ Finset.range (m + 1), (m.choose c : ℝ) * (1 + (c : ℝ) / m) ^ (2 * (m - c + 1))

/-- **The large-`|A|` bound of the conditional mass.** -/
theorem sqSum_Uext_le_large {A : ℂ} (hr : 0 < (A ^ 2).re) (D : ℕ) :
    sqSum D (fun c d => Uext c d A) ≤
      (‖A‖ ^ 2 / (A ^ 2).re) * ∑ m ∈ Finset.range (D + 1),
        (m.factorial : ℝ) * Tm m * ((‖A‖ ^ 2 / (A ^ 2).re) ^ 2 / ‖A‖ ^ 2) ^ m := by
  obtain ⟨θ, hθ⟩ : ∃ θ, θ = ‖A‖ ^ 2 / (A ^ 2).re := ⟨_, rfl⟩
  rw [← hθ]
  have ha : 0 < ‖A‖ := norm_pos_of_re_sq_pos hr
  have hθ1 : 1 ≤ θ := by rw [hθ, le_div_iff₀ hr, one_mul]; exact re_sq_le_norm_sq A
  unfold sqSum
  rw [sum_tri_eq D (fun p => ‖Uext p.1 p.2 A‖ ^ 2), Finset.mul_sum]
  apply Finset.sum_le_sum
  intro m _
  -- each pair of degree `m`
  have hpair : ∀ c ∈ Finset.range (m + 1), ‖Uext c (m - c) A‖ ^ 2 ≤
      θ * ((m.factorial : ℝ) * (if m = 0 then 1 else (m.choose c : ℝ) *
        (1 + (c : ℝ) / m) ^ (2 * (m - c + 1))) * (θ ^ 2 / ‖A‖ ^ 2) ^ m) := by
    intro c hc
    have hcm : c ≤ m := by have := Finset.mem_range.mp hc; omega
    have hb := norm_Uext_le c (m - c) hr
    rw [show c + (m - c) = m by omega, ← hθ] at hb
    have hb0 : 0 ≤ ‖Uext c (m - c) A‖ := norm_nonneg _
    have hsq := pow_le_pow_left₀ hb0 hb 2
    refine hsq.trans (le_of_eq ?_)
    have hfc : (0 : ℝ) < (c.factorial : ℝ) * (m - c).factorial := by positivity
    have hchoose : (m.choose c : ℝ) * ((c.factorial : ℝ) * (m - c).factorial) = m.factorial := by
      have := Nat.choose_mul_factorial_mul_factorial hcm
      rw [mul_assoc] at this
      exact_mod_cast this
    have hθ0 : 0 ≤ θ := by linarith
    have e1 : Real.sqrt θ ^ 2 = θ := Real.sq_sqrt hθ0
    have e2 : Real.sqrt ((c.factorial : ℝ) * (m - c).factorial) ^ 2 =
        (c.factorial : ℝ) * (m - c).factorial := Real.sq_sqrt hfc.le
    rw [mul_pow, mul_pow, mul_pow, mul_pow, div_pow (m.factorial : ℝ), e1, e2]
    by_cases hm0 : m = 0
    · subst hm0
      have hc0 : c = 0 := by omega
      subst hc0
      simp
    · simp only [hm0, ↓reduceIte]
      rw [show (2 * (m - c + 1)) = (m - c + 1) * 2 by ring, pow_mul]
      have ha2 : (0 : ℝ) < ‖A‖ ^ 2 := by positivity
      rw [← hchoose]
      field_simp
      ring
  calc ∑ c ∈ Finset.range (m + 1), ‖Uext c (m - c) A‖ ^ 2
      ≤ ∑ c ∈ Finset.range (m + 1), θ * ((m.factorial : ℝ) * (if m = 0 then 1 else
          (m.choose c : ℝ) * (1 + (c : ℝ) / m) ^ (2 * (m - c + 1))) * (θ ^ 2 / ‖A‖ ^ 2) ^ m) :=
        Finset.sum_le_sum hpair
    _ = θ * ((m.factorial : ℝ) * Tm m * (θ ^ 2 / ‖A‖ ^ 2) ^ m) := by
        rw [← Finset.mul_sum]
        congr 1
        unfold Tm
        by_cases hm0 : m = 0
        · subst hm0; simp
        · simp only [hm0, ite_false]
          rw [← Finset.sum_mul, ← Finset.mul_sum]

end

end Grothe.UpperQuad.QuadRem
