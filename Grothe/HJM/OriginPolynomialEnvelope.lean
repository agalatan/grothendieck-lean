import Grothe.HJM.OriginEnergyExtension
import Mathlib.Analysis.Asymptotics.Ring
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics
import Mathlib.MeasureTheory.Integral.ExpDecay

/-!
# Polynomial growth and Gaussian analytic inputs

Agent-ID: codex-aa04.

A polynomial envelope on the radial half-line supplies Gaussian square
integrability, integrability of every polynomial Green pairing and the
boundary limit at infinity. The actual phase estimates are supplied by
`OriginAnalytic`; numerical energy enclosures are separate.
-/

open MeasureTheory Filter Set Asymptotics Grothe.LowerAnalytic Grothe.UpperChaos
open scoped Topology

namespace Grothe.HJM.Origin

noncomputable section

/-- Explicit growth only on the physical radial domain. No assertion concerns
negative arguments. -/
def PolynomialEnvelope (F : ℝ → ℂ) : Prop :=
  ∃ C : ℝ, 0 ≤ C ∧ ∃ d : ℕ, ∀ s : ℝ, 0 ≤ s → ‖F s‖ ≤ C * (1 + s) ^ d

namespace PolynomialEnvelope

theorem const (c : ℂ) : PolynomialEnvelope (fun _ : ℝ => c) := by
  refine ⟨‖c‖, norm_nonneg _, 0, ?_⟩
  intro s _hs
  simp

theorem real_id : PolynomialEnvelope (fun s : ℝ => (s : ℂ)) := by
  refine ⟨1, zero_le_one, 1, ?_⟩
  intro s hs
  simp only [Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hs, pow_one, one_mul]
  linarith

theorem add {F G : ℝ → ℂ} (hF : PolynomialEnvelope F) (hG : PolynomialEnvelope G) :
    PolynomialEnvelope (fun s => F s + G s) := by
  rcases hF with ⟨C, hC, d, hF⟩
  rcases hG with ⟨D, hD, e, hG⟩
  refine ⟨C + D, add_nonneg hC hD, d + e, ?_⟩
  intro s hs
  have hb : 1 ≤ 1 + s := by linarith
  have hd : (1 + s) ^ d ≤ (1 + s) ^ (d + e) := pow_le_pow_right₀ hb (by omega)
  have he : (1 + s) ^ e ≤ (1 + s) ^ (d + e) := pow_le_pow_right₀ hb (by omega)
  calc
    ‖F s + G s‖ ≤ ‖F s‖ + ‖G s‖ := norm_add_le _ _
    _ ≤ C * (1 + s) ^ d + D * (1 + s) ^ e := add_le_add (hF s hs) (hG s hs)
    _ ≤ C * (1 + s) ^ (d + e) + D * (1 + s) ^ (d + e) :=
      add_le_add (mul_le_mul_of_nonneg_left hd hC) (mul_le_mul_of_nonneg_left he hD)
    _ = (C + D) * (1 + s) ^ (d + e) := by ring

theorem neg {F : ℝ → ℂ} (hF : PolynomialEnvelope F) :
    PolynomialEnvelope (fun s => -F s) := by
  rcases hF with ⟨C, hC, d, hF⟩
  exact ⟨C, hC, d, fun s hs => by simpa only [norm_neg] using hF s hs⟩

theorem sub {F G : ℝ → ℂ} (hF : PolynomialEnvelope F) (hG : PolynomialEnvelope G) :
    PolynomialEnvelope (fun s => F s - G s) := by
  simpa only [sub_eq_add_neg] using hF.add hG.neg

theorem mul {F G : ℝ → ℂ} (hF : PolynomialEnvelope F) (hG : PolynomialEnvelope G) :
    PolynomialEnvelope (fun s => F s * G s) := by
  rcases hF with ⟨C, hC, d, hF⟩
  rcases hG with ⟨D, hD, e, hG⟩
  refine ⟨C * D, mul_nonneg hC hD, d + e, ?_⟩
  intro s hs
  calc
    ‖F s * G s‖ = ‖F s‖ * ‖G s‖ := norm_mul _ _
    _ ≤ (C * (1 + s) ^ d) * (D * (1 + s) ^ e) :=
      mul_le_mul (hF s hs) (hG s hs) (norm_nonneg _) (by positivity)
    _ = (C * D) * (1 + s) ^ (d + e) := by rw [pow_add]; ring

theorem pow {F : ℝ → ℂ} (hF : PolynomialEnvelope F) (n : ℕ) :
    PolynomialEnvelope (fun s => F s ^ n) := by
  induction n with
  | zero => simpa only [pow_zero] using const (1 : ℂ)
  | succ n ih => simpa only [pow_succ] using ih.mul hF

theorem real_polynomial (P : Polynomial ℝ) :
    PolynomialEnvelope (fun s : ℝ => ((P.eval s : ℝ) : ℂ)) := by
  induction P using Polynomial.induction_on' with
  | monomial n a =>
    simpa only [Polynomial.eval_monomial, Complex.ofReal_mul, Complex.ofReal_pow] using
      (const (a : ℂ)).mul (real_id.pow n)
  | add P Q hP hQ =>
    simpa only [Polynomial.eval_add, Complex.ofReal_add] using hP.add hQ

/-- A concrete real polynomial majorant is enough; its degree and coefficient
sum need not be calculated numerically before using the analytic bridge. -/
theorem of_le_real_polynomial {F : ℝ → ℂ} (P : Polynomial ℝ)
    (hbound : ∀ s : ℝ, 0 ≤ s → ‖F s‖ ≤ P.eval s) : PolynomialEnvelope F := by
  rcases real_polynomial P with ⟨C, hC, d, hP⟩
  refine ⟨C, hC, d, ?_⟩
  intro s hs
  calc
    ‖F s‖ ≤ P.eval s := hbound s hs
    _ ≤ ‖((P.eval s : ℝ) : ℂ)‖ := by
      simp only [Complex.norm_real, Real.norm_eq_abs]
      exact le_abs_self _
    _ ≤ C * (1 + s) ^ d := hP s hs

theorem sqrt : PolynomialEnvelope (fun s : ℝ => (Real.sqrt s : ℂ)) := by
  refine ⟨1, zero_le_one, 1, ?_⟩
  intro s hs
  simp only [Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (Real.sqrt_nonneg s), pow_one, one_mul]
  apply Real.sqrt_le_iff.mpr
  constructor
  · positivity
  · nlinarith [sq_nonneg s]

/-- Only exponential domination is needed; no sharp asymptotic coefficient. -/
theorem isBigO_exp {F : ℝ → ℂ} (hF : PolynomialEnvelope F) {b : ℝ} (hb : 0 < b) :
    F =O[atTop] (fun s : ℝ => Real.exp (b * s)) := by
  rcases hF with ⟨C, hC, d, hF⟩
  have hp : F =O[atTop] (fun s : ℝ => s ^ d) := by
    refine Asymptotics.IsBigO.of_bound (C * 2 ^ d) ?_
    filter_upwards [eventually_ge_atTop (1 : ℝ)] with s hs
    have hs0 : 0 ≤ s := le_trans zero_le_one hs
    have hpow : (1 + s) ^ d ≤ (2 * s) ^ d :=
      pow_le_pow_left₀ (by positivity) (by linarith) d
    calc
      ‖F s‖ ≤ C * (1 + s) ^ d := hF s hs0
      _ ≤ C * (2 * s) ^ d := mul_le_mul_of_nonneg_left hpow hC
      _ = (C * 2 ^ d) * ‖s ^ d‖ := by
        rw [Real.norm_eq_abs, abs_of_nonneg (pow_nonneg hs0 _), mul_pow]
        ring
  exact hp.trans (Real.isLittleO_pow_exp_pos_mul_atTop d hb).isBigO

/-- An actual continuous amplitude with a polynomial envelope is exponentially
integrable on the full radial half-line. -/
theorem exp_mul_integrable {F : ℝ → ℂ} (hc : ContinuousOn F (Ici 0))
    (hF : PolynomialEnvelope F) :
    IntegrableOn (fun s : ℝ => ((Real.exp (-s) : ℝ) : ℂ) * F s) (Ioi 0) := by
  have hi : IntegrableOn (fun s : ℝ => Real.exp (-(1 : ℝ) * s) • F s) (Ici 0) :=
    integrableOn_exp_neg_smul_of_isBigO_exp
      (hc.locallyIntegrableOn measurableSet_Ici)
      (hF.isBigO_exp (b := (1 : ℝ) / 2) (by norm_num)) (by norm_num)
  exact integrableOn_Ici_iff_integrableOn_Ioi.mp
    (by simpa only [neg_mul, one_mul, Complex.real_smul] using hi)

/-- Polynomial growth is strictly weaker than the exponential in the Green
boundary, giving its exact zero limit. -/
theorem exp_mul_tendsto_zero {F : ℝ → ℂ} (hF : PolynomialEnvelope F) :
    Tendsto (fun s : ℝ => ((Real.exp (-s) : ℝ) : ℂ) * F s) atTop (𝓝 0) := by
  have ho : (fun s : ℝ => Real.exp (-s) • F s) =O[atTop]
      (fun s : ℝ => Real.exp (-s) • Real.exp ((1 / 2 : ℝ) * s)) :=
    (isBigO_refl (fun s : ℝ => Real.exp (-s)) atTop).smul
      (hF.isBigO_exp (b := (1 : ℝ) / 2) (by norm_num))
  have he : (fun s : ℝ => Real.exp (-s) • Real.exp ((1 / 2 : ℝ) * s)) =
      (fun s : ℝ => Real.exp (-(1 / 2 : ℝ) * s)) := by
    funext s
    rw [smul_eq_mul, ← Real.exp_add]
    congr 1
    ring
  rw [he] at ho
  have hz : Tendsto (fun s : ℝ => Real.exp (-(1 / 2 : ℝ) * s)) atTop (𝓝 0) := by
    simpa only [Real.rpow_zero, one_mul] using
      Real.tendsto_rpow_mul_exp_neg_mul_atTop_nhds_zero 0 (1 / 2) (by norm_num)
  simpa only [Complex.real_smul] using ho.trans_tendsto hz

end PolynomialEnvelope

private theorem integrable_one_add_norm_sq_pow (d : ℕ) :
    Integrable (fun z : ℂ => (1 + ‖z‖ ^ 2) ^ d) gaussC := by
  have hi : Integrable (fun z : ℂ =>
      (2 : ℝ) ^ (d - 1) * (1 + ‖z‖ ^ (2 * d))) gaussC :=
    ((integrable_const (1 : ℝ)).add (integrable_norm_pow (2 * d))).const_mul _
  refine hi.mono' (by fun_prop) (Filter.Eventually.of_forall fun z => ?_)
  rw [Real.norm_eq_abs, abs_of_nonneg (by positivity)]
  simpa only [one_pow, ← pow_mul] using
    add_pow_le (show (0 : ℝ) ≤ 1 by norm_num) (sq_nonneg ‖z‖) d

/-- A direct Gaussian moment argument, independent of the spectral theorem.
Continuity only on the physical half-line supplies measurability after |z|². -/
theorem memLp_radial_of_polynomialEnvelope {F : ℝ → ℂ}
    (hc : ContinuousOn F (Ici 0)) (hF : PolynomialEnvelope F) :
    MemLp (fun z : ℂ => Grothe.Haag.ph z * F (‖z‖ ^ 2)) 2 gaussC := by
  have hcomp : Continuous (fun z : ℂ => F (‖z‖ ^ 2)) :=
    hc.comp_continuous (continuous_norm.pow 2) (fun z => sq_nonneg ‖z‖)
  have hm : Measurable (fun z : ℂ => Grothe.Haag.ph z * F (‖z‖ ^ 2)) :=
    Grothe.Haag.measurable_ph.mul hcomp.measurable
  apply (memLp_two_iff_integrable_sq_norm hm.aestronglyMeasurable).2
  rcases hF with ⟨C, hC, d, hF⟩
  have hi : Integrable (fun z : ℂ =>
      C ^ 2 * (1 + ‖z‖ ^ 2) ^ (d * 2)) gaussC :=
    (integrable_one_add_norm_sq_pow (d * 2)).const_mul (C ^ 2)
  refine hi.mono' (by fun_prop) (Filter.Eventually.of_forall fun z => ?_)
  rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]
  have hb : ‖Grothe.Haag.ph z * F (‖z‖ ^ 2)‖ ≤ C * (1 + ‖z‖ ^ 2) ^ d := by
    calc
      _ = ‖Grothe.Haag.ph z‖ * ‖F (‖z‖ ^ 2)‖ := norm_mul _ _
      _ ≤ 1 * ‖F (‖z‖ ^ 2)‖ :=
        mul_le_mul_of_nonneg_right (Grothe.Haag.norm_ph_le z) (norm_nonneg _)
      _ ≤ _ := by simpa only [one_mul] using hF (‖z‖ ^ 2) (sq_nonneg _)
  simpa only [mul_pow, ← pow_mul] using pow_le_pow_left₀ (norm_nonneg _) hb 2

/-- Scalar pairing integrability for every polynomial test mode; the exponent
may depend on the polynomial, but there is no truncation in its indices. -/
theorem integrable_green_pairing (P : Polynomial ℝ) {F : ℝ → ℂ}
    (hc : ContinuousOn F (Ici 0)) (hF : PolynomialEnvelope F) :
    IntegrableOn (fun s : ℝ => ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
      ((P.eval s : ℝ) : ℂ) * F s) (Ioi 0) := by
  have hs : ContinuousOn (fun s : ℝ => (Real.sqrt s : ℂ)) (Ici 0) :=
    (Complex.continuous_ofReal.comp Real.continuous_sqrt).continuousOn
  have hp : ContinuousOn (fun s : ℝ => ((P.eval s : ℝ) : ℂ)) (Ici 0) :=
    (Complex.continuous_ofReal.comp P.continuous).continuousOn
  have he := PolynomialEnvelope.exp_mul_integrable ((hs.mul hp).mul hc)
    ((PolynomialEnvelope.sqrt.mul (PolynomialEnvelope.real_polynomial P)).mul hF)
  simpa only [Complex.ofReal_mul, mul_assoc] using he

/-- Green's infinity boundary follows just from growth of v and v1. -/
theorem tendsto_green_boundary (P : Polynomial ℝ) {v v1 : ℝ → ℂ}
    (hv : PolynomialEnvelope v) (hv1 : PolynomialEnvelope v1) :
    Tendsto (originGreenBoundary P v v1) atTop (𝓝 0) := by
  have hp := PolynomialEnvelope.real_polynomial P
  have hp1 := PolynomialEnvelope.real_polynomial P.derivative
  have htwoX := (PolynomialEnvelope.const (2 : ℂ)).mul PolynomialEnvelope.real_id
  have hbody := PolynomialEnvelope.sqrt.mul
    (((hp.add (htwoX.mul hp1)).mul hv).sub ((htwoX.mul hp).mul hv1))
  have h := hbody.exp_mul_tendsto_zero
  simpa only [originGreenBoundary, Complex.ofReal_mul, mul_assoc] using h

/-- Replace the totalized differential expression by its actual continuous
extension after Gaussian radial lifting. No value at s=0 is equated. -/
theorem memLp_radial_of_extension {D E : ℝ → ℂ}
    (hc : ContinuousOn E (Ici 0)) (hE : PolynomialEnvelope E)
    (heq : ∀ s : ℝ, 0 < s → D s = E s) :
    MemLp (fun z : ℂ => Grothe.Haag.ph z * D (‖z‖ ^ 2)) 2 gaussC := by
  have he : (fun z : ℂ => Grothe.Haag.ph z * D (‖z‖ ^ 2)) =
      (fun z : ℂ => Grothe.Haag.ph z * E (‖z‖ ^ 2)) := by
    funext z
    by_cases hz : z = 0
    · subst z
      simp [Grothe.Haag.ph]
    · rw [heq (‖z‖ ^ 2) (sq_pos_of_pos (norm_pos_iff.mpr hz))]
  rw [he]
  exact memLp_radial_of_polynomialEnvelope hc hE

/-- The corresponding integral transport only uses equality on Ioi0. -/
theorem integrable_green_pairing_of_extension (P : Polynomial ℝ) {D E : ℝ → ℂ}
    (hc : ContinuousOn E (Ici 0)) (hE : PolynomialEnvelope E)
    (heq : ∀ s : ℝ, 0 < s → D s = E s) :
    IntegrableOn (fun s : ℝ => ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
      ((P.eval s : ℝ) : ℂ) * D s) (Ioi 0) := by
  apply (integrable_green_pairing P hc hE).congr_fun _ measurableSet_Ioi
  intro s hs
  rw [heq s hs]

/-- Concrete package of the remaining analytic inputs. Actual envelopes for
v1 and E are the only growth estimates; no integrability or infinity limit is
assumed. Continuity of v and E is a finite/local regularity condition. -/
theorem radial_analytic_inputs {v v1 D E : ℝ → ℂ}
    (hv_cont : ContinuousOn v (Ici 0)) (hE_cont : ContinuousOn E (Ici 0))
    (hv : PolynomialEnvelope v) (hv1 : PolynomialEnvelope v1) (hE : PolynomialEnvelope E)
    (heq : ∀ s : ℝ, 0 < s → D s = E s) :
    MemLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2)) 2 gaussC ∧
    MemLp (fun z : ℂ => Grothe.Haag.ph z * D (‖z‖ ^ 2)) 2 gaussC ∧
    (∀ P : Polynomial ℝ, Tendsto (originGreenBoundary P v v1) atTop (𝓝 0)) ∧
    (∀ P : Polynomial ℝ,
      IntegrableOn (fun s : ℝ => ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
        ((P.eval s : ℝ) : ℂ) * v s) (Ioi 0) ∧
      IntegrableOn (fun s : ℝ => ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
        ((P.eval s : ℝ) : ℂ) * D s) (Ioi 0)) := by
  refine ⟨memLp_radial_of_polynomialEnvelope hv_cont hv,
    memLp_radial_of_extension hE_cont hE heq,
    fun P => tendsto_green_boundary P hv hv1, ?_⟩
  intro P
  exact ⟨integrable_green_pairing P hv_cont hv,
    integrable_green_pairing_of_extension P hE_cont hE heq⟩

/-- This envelope is already discharged from the actual disk-valued response. -/
theorem fResidual_polynomialEnvelope : PolynomialEnvelope fResidual := by
  refine ⟨2, by norm_num, 0, ?_⟩
  intro s _hs
  simp only [pow_zero, mul_one]
  calc
    ‖fResidual s‖ ≤ ‖f s‖ + ‖f 0‖ := norm_sub_le _ _
    _ ≤ 1 + 1 := add_le_add (norm_f_le s) (norm_f_le 0)
    _ = 2 := by norm_num

theorem gResidual_polynomialEnvelope : PolynomialEnvelope gResidual := by
  refine ⟨2, by norm_num, 0, ?_⟩
  intro s _hs
  simp only [pow_zero, mul_one]
  calc
    ‖gResidual s‖ ≤ ‖g s‖ + ‖g 0‖ := norm_sub_le _ _
    _ ≤ 1 + 1 := add_le_add (norm_g_le s) (norm_g_le 0)
    _ = 2 := by norm_num

/-- Actual left operator L² from its one outstanding explicit growth estimate. -/
theorem memLp_fRadialDifferential_of_envelope
    (hE : PolynomialEnvelope fEnergyAmplitude) :
    MemLp (fun z : ℂ => Grothe.Haag.ph z *
      originRadialDifferential fResidual (deriv f) (deriv (deriv f)) (‖z‖ ^ 2))
      2 gaussC :=
  memLp_radial_of_extension continuousOn_fEnergyAmplitude hE f_radialDifferential_eq

theorem memLp_gRadialDifferential_of_envelope
    (hE : PolynomialEnvelope gEnergyAmplitude) :
    MemLp (fun z : ℂ => Grothe.Haag.ph z *
      originRadialDifferential gResidual (deriv g) (deriv (deriv g)) (‖z‖ ^ 2))
      2 gaussC :=
  memLp_radial_of_extension continuousOn_gEnergyAmplitude hE g_radialDifferential_eq

/-- All remaining analytic hypotheses of the actual Green identity are
supplied from just the first-derivative and continuous-amplitude envelopes. -/
theorem fResidual_green_integral_of_envelopes (n : ℕ)
    (h1 : PolynomialEnvelope (deriv f)) (hE : PolynomialEnvelope fEnergyAmplitude) :
    (∫ s in Ioi (0 : ℝ), ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
        (((originRadialPoly n).eval s : ℝ) : ℂ) *
        originRadialDifferential fResidual (deriv f) (deriv (deriv f)) s) =
      (2 * (n : ℂ) + 1) * ∫ s in Ioi (0 : ℝ),
        ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
          (((originRadialPoly n).eval s : ℝ) : ℂ) * fResidual s := by
  exact fResidual_green_integral n
    (tendsto_green_boundary _ fResidual_polynomialEnvelope h1)
    (integrable_green_pairing _ continuousOn_fResidual fResidual_polynomialEnvelope)
    (integrable_green_pairing_of_extension _ continuousOn_fEnergyAmplitude hE
      f_radialDifferential_eq)

theorem gResidual_green_integral_of_envelopes (n : ℕ)
    (h1 : PolynomialEnvelope (deriv g)) (hE : PolynomialEnvelope gEnergyAmplitude) :
    (∫ s in Ioi (0 : ℝ), ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
        (((originRadialPoly n).eval s : ℝ) : ℂ) *
        originRadialDifferential gResidual (deriv g) (deriv (deriv g)) s) =
      (2 * (n : ℂ) + 1) * ∫ s in Ioi (0 : ℝ),
        ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
          (((originRadialPoly n).eval s : ℝ) : ℂ) * gResidual s := by
  exact gResidual_green_integral n
    (tendsto_green_boundary _ gResidual_polynomialEnvelope h1)
    (integrable_green_pairing _ continuousOn_gResidual gResidual_polynomialEnvelope)
    (integrable_green_pairing_of_extension _ continuousOn_gEnergyAmplitude hE
      g_radialDifferential_eq)

end

end Grothe.HJM.Origin
