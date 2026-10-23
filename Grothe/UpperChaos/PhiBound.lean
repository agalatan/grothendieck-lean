import Grothe.UpperChaos.PhiCover
import Grothe.UpperChaos.PhiCoverCheck

/-!
# `φ² ≤ 3` everywhere, and the upper bound with only the numerical comparisons left

`phiBound : PhiBound` from the cover (`walk_sound`, `phi_cover_check`) on `U + V < 60` and the far
field (`far_sound`).  `fresh_upper_rounder`: the sharp upper bound for the concrete rounding `G_T`
assuming only `compare`, `energy_close`, `hardy` (for a charge-one `X ∈ L²`).
-/

open GrotheKernel Grothe.Upper
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

lemma phaseEps_eq : ((phaseEpsQ : ℚ) : ℝ) = 21 / 20 := by
  simp [phaseEpsQ]

/-- `φ² = g(U, V, W)`. -/
lemma phiT_sq (u : ℂ × ℂ) :
    phiT u ^ 2 = gphi phaseTerms (‖u.1‖ ^ 2) (‖u.2‖ ^ 2) (conj u.1 * u.2).re := by
  have hD : (conj u.1 * u.2).im ^ 2 = ‖u.1‖ ^ 2 * ‖u.2‖ ^ 2 - (conj u.1 * u.2).re ^ 2 := by
    have h := Complex.normSq_apply (conj u.1 * u.2)
    rw [Complex.normSq_mul, Complex.normSq_conj, Complex.normSq_eq_norm_sq,
      Complex.normSq_eq_norm_sq] at h
    nlinarith [h]
  unfold phiT gphi
  rw [phaseEps_eq]
  have he : Real.exp (-(21 / 20) * (‖u.1‖ ^ 2 + ‖u.2‖ ^ 2)) ^ 2
      = Real.exp (-(21 / 10) * (‖u.1‖ ^ 2 + ‖u.2‖ ^ 2)) := by
    rw [← Real.exp_nat_mul]; congr 1; push_cast; ring
  rw [mul_pow, mul_pow, hD, he]
  rfl

/-- **The phase cover**: `φ² ≤ 3` everywhere. -/
theorem phiBound : PhiBound := by
  intro u
  have hc := phi_cover_check
  simp only [phiCoverOK, Bool.and_eq_true, beq_iff_eq] at hc
  obtain ⟨⟨hts, hfar⟩, hwalk⟩ := hc
  rw [phiT_sq]
  set U := ‖u.1‖ ^ 2
  set V := ‖u.2‖ ^ 2
  set W := (conj u.1 * u.2).re
  have hU : 0 ≤ U := by positivity
  have hV : 0 ≤ V := by positivity
  have hW2 : W ^ 2 ≤ U * V := by
    have h := Complex.normSq_apply (conj u.1 * u.2)
    rw [Complex.normSq_mul, Complex.normSq_conj, Complex.normSq_eq_norm_sq,
      Complex.normSq_eq_norm_sq] at h
    nlinarith [sq_nonneg (conj u.1 * u.2).im]
  rcases lt_or_ge (U + V) 60 with h60 | h60
  · refine walk_sound hts 64 _ rootBox [] hwalk U V W ?_ hW2 h60
    have hS : (0 : ℝ) < (2 : ℝ) ^ SC := by positivity
    have hUV : U * V ≤ 900 := by nlinarith [sq_nonneg (U - V)]
    have hWs : |W| ≤ 30 := by
      rw [abs_le]; constructor <;> nlinarith
    obtain ⟨hW1, hW2'⟩ := abs_le.1 hWs
    simp only [InBox, rootBox]
    push_cast
    refine ⟨by positivity, by nlinarith, by positivity, by nlinarith, by nlinarith, by nlinarith⟩
  · exact far_sound hts hfar hU hV hW2 h60

/-- **The sharp upper bound for the concrete rounding** with only the numerical comparisons
`compare`, `energy_close`, `hardy` as hypotheses. -/
theorem fresh_upper_rounder {X : ℂ × ℂ → ℂ} (hXL : MeasureTheory.MemLp X 2 mu2)
    (hXch : ∀ c u, ‖c‖ = 1 → X (rot2 c u) = c * X u)
    (hcompare : ∑' p, |energy ((memLp_GT phiBound).toLp GT) p - energy (hXL.toLp X) p|
      ≤ (compareQ : ℝ))
    (hclose : ∑ p ∈ headIdx 501, |energy (hXL.toLp X) p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ))
    (hhardy : ∀ J, ∑ n ∈ Finset.range J, kernelCoeff (energy ((memLp_GT phiBound).toLp GT)) n ^ 2
      * (4149 / 4000 : ℝ) ^ (2 * (2 * n + 1)) ≤ 7 / 4) :
    IsGrothendieckBound (500000000000000000 / 355973593026532891) :=
  fresh_upper_concrete phiBound hXL hXch hcompare hclose hhardy

end

end Grothe.UpperChaos
