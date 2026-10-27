import Grothe.HJM.OriginPhaseDerivative
import Grothe.HJM.OriginEnergyExtension

/-!
# Coarse phase-derivative bounds for the remote origin-energy tail

Agent-ID: codex-aa04. The actual numerator's first and second polynomial derivative bounds remain
explicit inputs. These inequalities use no interval quadrature.
-/

open scoped InnerProductSpace RealInnerProductSpace

namespace Grothe.HJM.Origin

noncomputable section

/-- A nonvanishing phase has second derivative controlled only by the
first two numerator derivatives and its modulus. -/
theorem norm_phaseSecondDerivative_le (z v w : ℂ) (hz : z ≠ 0) :
    ‖phaseSecondDerivative z v w‖ ≤
      2 * ‖w‖ / ‖z‖ + 6 * ‖v‖ ^ 2 / ‖z‖ ^ 2 := by
  have hr : 0 < ‖z‖ := norm_pos_iff.mpr hz
  have ha : |⟪z, v⟫_ℝ| ≤ ‖z‖ * ‖v‖ := abs_real_inner_le_norm z v
  have hw : |⟪z, w⟫_ℝ| ≤ ‖z‖ * ‖w‖ := abs_real_inner_le_norm z w
  have hb : |‖v‖ ^ 2 + ⟪z, w⟫_ℝ| ≤ ‖v‖ ^ 2 + ‖z‖ * ‖w‖ := by
    calc
      _ ≤ |‖v‖ ^ 2| + |⟪z, w⟫_ℝ| := abs_add_le _ _
      _ ≤ _ := by rw [abs_of_nonneg (sq_nonneg _)]; linarith
  have ha2 : |⟪z, v⟫_ℝ| ^ 2 ≤ (‖z‖ * ‖v‖) ^ 2 :=
    (sq_le_sq₀ (abs_nonneg _) (mul_nonneg (norm_nonneg _) (norm_nonneg _))).mpr ha
  let A : ℂ := w / (‖z‖ : ℂ)
  let B : ℂ := 2 * v * (⟪z, v⟫_ℝ : ℂ) / (‖z‖ : ℂ) ^ 3
  let C : ℂ := z * ((‖v‖ ^ 2 + ⟪z, w⟫_ℝ : ℝ) : ℂ) / (‖z‖ : ℂ) ^ 3
  let D : ℂ := 3 * z * (⟪z, v⟫_ℝ : ℂ) ^ 2 / (‖z‖ : ℂ) ^ 5
  have ht : ‖A - B - C + D‖ ≤ ‖A‖ + ‖B‖ + ‖C‖ + ‖D‖ := by
    have h1 := norm_sub_le A B
    have h2 := norm_sub_le (A - B) C
    have h3 := norm_add_le (A - B - C) D
    linarith
  calc
    ‖phaseSecondDerivative z v w‖ ≤ ‖A‖ + ‖B‖ + ‖C‖ + ‖D‖ := by
      simpa only [phaseSecondDerivative, A, B, C, D] using ht
    _ = ‖w‖ / ‖z‖ + 2 * ‖v‖ * |⟪z, v⟫_ℝ| / ‖z‖ ^ 3 +
        ‖z‖ * |‖v‖ ^ 2 + ⟪z, w⟫_ℝ| / ‖z‖ ^ 3 +
        3 * ‖z‖ * |⟪z, v⟫_ℝ| ^ 2 / ‖z‖ ^ 5 := by
      simp only [A, B, C, D, norm_div, norm_mul, norm_pow, Complex.norm_real,
        Real.norm_eq_abs, abs_of_nonneg (norm_nonneg z), Complex.norm_ofNat]
    _ ≤ ‖w‖ / ‖z‖ + 2 * ‖v‖ * (‖z‖ * ‖v‖) / ‖z‖ ^ 3 +
        ‖z‖ * (‖v‖ ^ 2 + ‖z‖ * ‖w‖) / ‖z‖ ^ 3 +
        3 * ‖z‖ * (‖z‖ * ‖v‖) ^ 2 / ‖z‖ ^ 5 := by
      gcongr
    _ = _ := by field_simp [hr.ne']; ring

/-- Concrete coarse derivative growth, supplied by exact polynomial
coefficient-sum bounds for the actual numerator. -/
theorem phase_jet_growth (s : ℝ) (hs : 0 ≤ s) (z v w : ℂ)
    (hz : (1 : ℝ) / 250 < ‖z‖)
    (hv : ‖v‖ ≤ 16 * (1 + s) ^ 10)
    (hw : ‖w‖ ≤ 27 * (1 + s) ^ 9) :
    ‖phaseDerivative z v‖ ≤ 8000 * (1 + s) ^ 10 ∧
    ‖phaseSecondDerivative z v w‖ ≤ 96013500 * (1 + s) ^ 20 := by
  have hr : 0 < ‖z‖ := lt_trans (by norm_num) hz
  have hn : z ≠ 0 := norm_pos_iff.mp hr
  have hR : 1 ≤ 1 + s := by linarith
  have hR0 : 0 ≤ 1 + s := by linarith
  have hri : (‖z‖)⁻¹ ≤ 250 := by
    apply (inv_le_iff_one_le_mul₀ hr).mpr
    nlinarith
  have hri2 : (‖z‖⁻¹) ^ 2 ≤ (250 : ℝ) ^ 2 :=
    pow_le_pow_left₀ (inv_nonneg.mpr hr.le) hri 2
  have hv2 : ‖v‖ ^ 2 ≤ (16 * (1 + s) ^ 10) ^ 2 :=
    (sq_le_sq₀ (norm_nonneg _) (by positivity)).mpr hv
  have hR9 : (1 + s) ^ 9 ≤ (1 + s) ^ 20 := by
    exact pow_le_pow_right₀ hR (by norm_num)
  have hp : ((1 + s) ^ 10) ^ 2 = (1 + s) ^ 20 := by ring
  constructor
  · calc
      _ ≤ 2 * ‖v‖ / ‖z‖ := norm_phaseDerivative_le_two z v hn
      _ ≤ 2 * ‖v‖ * 250 := by
        rw [div_eq_mul_inv]
        gcongr
      _ ≤ _ := by nlinarith
  · calc
      _ ≤ 2 * ‖w‖ / ‖z‖ + 6 * ‖v‖ ^ 2 / ‖z‖ ^ 2 :=
        norm_phaseSecondDerivative_le z v w hn
      _ ≤ 2 * ‖w‖ * 250 + 6 * ‖v‖ ^ 2 * (250 : ℝ) ^ 2 := by
        rw [div_eq_mul_inv, div_eq_mul_inv, ← inv_pow]
        gcongr
      _ ≤ 2 * (27 * (1 + s) ^ 9) * 250 +
          6 * (16 * (1 + s) ^ 10) ^ 2 * (250 : ℝ) ^ 2 := by gcongr
      _ ≤ _ := by nlinarith [sq_nonneg ((1 + s) ^ 10), pow_nonneg hR0 20]

/-- The actual energy expression on the positive radial half-line, in
terms of a numerator's value and two derivatives. -/
def phaseEnergyJet (s : ℝ) (z v w z0 : ℂ) : ℂ :=
  -2 * (s : ℂ) * phaseSecondDerivative z v w +
    (2 * (s : ℂ) - 2) * phaseDerivative z v +
      (Grothe.Haag.ph z - Grothe.Haag.ph z0) / (2 * (s : ℂ))

/-- On the far half-line the rational coefficient and modulus bounds imply a
single explicit polynomial bound for the actual energy amplitude. -/
theorem phaseEnergyJet_far_growth (s : ℝ) (hs : 512 ≤ s) (z v w z0 : ℂ)
    (hz : (1 : ℝ) / 250 < ‖z‖)
    (hv : ‖v‖ ≤ 16 * (1 + s) ^ 10)
    (hw : ‖w‖ ≤ 27 * (1 + s) ^ 9) :
    ‖phaseEnergyJet s z v w z0‖ ≤ 192043001 * (1 + s) ^ 21 := by
  have hs0 : 0 ≤ s := by linarith
  have hspos : 0 < s := by linarith
  have hR0 : 0 ≤ 1 + s := by linarith
  have hR : 1 ≤ 1 + s := by linarith
  obtain ⟨hfirst, hsecond⟩ := phase_jet_growth s hs0 z v w hz hv hw
  have hph : ‖Grothe.Haag.ph z - Grothe.Haag.ph z0‖ ≤ 2 := by
    have h := (norm_sub_le (Grothe.Haag.ph z) (Grothe.Haag.ph z0)).trans
      (add_le_add (Grothe.Haag.norm_ph_le z) (Grothe.Haag.norm_ph_le z0))
    norm_num at h ⊢
    exact h
  have hquot : ‖(Grothe.Haag.ph z - Grothe.Haag.ph z0) / (2 * (s : ℂ))‖ ≤ 1 := by
    rw [norm_div, norm_mul, Complex.norm_real, Real.norm_of_nonneg hs0]
    norm_num only [Complex.norm_ofNat]
    apply (div_le_one (by positivity)).mpr
    nlinarith
  have hfactor : |2 * s - 2| ≤ 2 * (1 + s) := by
    apply abs_le.mpr
    constructor <;> linarith
  let A : ℂ := -2 * (s : ℂ) * phaseSecondDerivative z v w
  let B : ℂ := (2 * (s : ℂ) - 2) * phaseDerivative z v
  let Q : ℂ := (Grothe.Haag.ph z - Grothe.Haag.ph z0) / (2 * (s : ℂ))
  have hA : ‖A‖ ≤ 2 * s * (96013500 * (1 + s) ^ 20) := by
    simp only [A, norm_mul, norm_neg, Complex.norm_real, Real.norm_of_nonneg hs0, Complex.norm_ofNat]
    exact mul_le_mul_of_nonneg_left hsecond (by positivity)
  have hB : ‖B‖ ≤ 2 * (1 + s) * (8000 * (1 + s) ^ 10) := by
    have he : (2 * (s : ℂ) - 2) = ((2 * s - 2 : ℝ) : ℂ) := by push_cast; ring
    dsimp only [B]
    rw [he, norm_mul, Complex.norm_real, Real.norm_eq_abs]
    exact mul_le_mul hfactor hfirst (norm_nonneg _) (by positivity)
  have hsR : s * (1 + s) ^ 20 ≤ (1 + s) ^ 21 := by
    rw [pow_succ]
    nlinarith [mul_le_mul_of_nonneg_right (show s ≤ 1 + s by linarith)
      (pow_nonneg hR0 20)]
  have hR11 : (1 + s) ^ 11 ≤ (1 + s) ^ 21 :=
    pow_le_pow_right₀ hR (by norm_num)
  have hR21 : (1 : ℝ) ≤ (1 + s) ^ 21 := one_le_pow₀ hR
  have hsum : ‖A + B + Q‖ ≤ ‖A‖ + ‖B‖ + ‖Q‖ := by
    have h1 := norm_add_le (A + B) Q
    have h2 := norm_add_le A B
    linarith
  have hfinal : ‖A + B + Q‖ ≤ 192043001 * (1 + s) ^ 21 := by
    have hQ : ‖Q‖ ≤ 1 := hquot
    nlinarith [hsR, hR11, hR21, pow_nonneg hR0 10, pow_nonneg hR0 20]
  simpa only [phaseEnergyJet, A, B, Q] using hfinal

/-- The pointwise jet is the actual left continuous energy amplitude at
strictly positive radius. -/
theorem fEnergyAmplitude_eq_phaseEnergyJet (s : ℝ) (hs : 0 < s) :
    fEnergyAmplitude s = phaseEnergyJet s
      (leftNumeratorPolynomial.eval (s : ℂ))
      (leftNumeratorPolynomial.derivative.eval (s : ℂ))
      (leftNumeratorPolynomial.derivative.derivative.eval (s : ℂ))
      (leftNumeratorPolynomial.eval 0) := by
  have hf : f = (fun t : ℝ => Grothe.Haag.ph (leftNumeratorPolynomial.eval (t : ℂ))) := by
    funext t
    simp only [f, eval_leftNumeratorPolynomial]
  have hp : leftNumeratorPolynomial.eval (s : ℂ) ≠ 0 := by
    rw [eval_leftNumeratorPolynomial]
    exact leftNumerator_ne_zero s hs.le
  have hfirst := (hasDerivAt_polynomialPhase leftNumeratorPolynomial s hp).deriv
  unfold fEnergyAmplitude phaseEnergyJet
  rw [← f_difference_quotient s hs]
  simp only [hf, Complex.ofReal_zero]
  rw [hfirst, deriv_deriv_polynomialPhase leftNumeratorPolynomial s hp]
  simp only [div_eq_mul_inv, mul_inv_rev]
  ring

/-- The corresponding bridge for the asymmetric right response. -/
theorem gEnergyAmplitude_eq_phaseEnergyJet (s : ℝ) (hs : 0 < s) :
    gEnergyAmplitude s = phaseEnergyJet s
      (rightNumeratorPolynomial.eval (s : ℂ))
      (rightNumeratorPolynomial.derivative.eval (s : ℂ))
      (rightNumeratorPolynomial.derivative.derivative.eval (s : ℂ))
      (rightNumeratorPolynomial.eval 0) := by
  have hg : g = (fun t : ℝ => Grothe.Haag.ph (rightNumeratorPolynomial.eval (t : ℂ))) := by
    funext t
    simp only [g, eval_rightNumeratorPolynomial]
  have hp : rightNumeratorPolynomial.eval (s : ℂ) ≠ 0 := by
    rw [eval_rightNumeratorPolynomial]
    exact rightNumerator_ne_zero s hs.le
  have hfirst := (hasDerivAt_polynomialPhase rightNumeratorPolynomial s hp).deriv
  unfold gEnergyAmplitude phaseEnergyJet
  rw [← g_difference_quotient s hs]
  simp only [hg, Complex.ofReal_zero]
  rw [hfirst, deriv_deriv_polynomialPhase rightNumeratorPolynomial s hp]
  simp only [div_eq_mul_inv, mul_inv_rev]
  ring

end

end Grothe.HJM.Origin
