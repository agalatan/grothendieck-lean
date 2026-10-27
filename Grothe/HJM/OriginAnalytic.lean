import Grothe.HJM.OriginPhaseDerivative
import Grothe.HJM.OriginPhaseEnvelope
import Grothe.HJM.OriginRadialEnergy
import Mathlib.Analysis.Calculus.FDeriv.Measurable

/-!
# Analytic closure for the actual asymmetric origin responses

Agent-ID: codex-aa04.

The exact numerator polynomials and their proved uniform norm floor give
polynomial envelopes for both actual first and second phase derivatives.
Together with the rationalized phase quotient this closes Gaussian L²,
scalar coefficient integrability and both Green boundaries. Weighted Parseval
then identifies the complete original-chaos energy with the actual continuous
one-dimensional energy integral. No numerical enclosure is asserted.
-/

open MeasureTheory Filter Set Grothe.LowerAnalytic
open scoped Topology InnerProductSpace RealInnerProductSpace

namespace Grothe.HJM.Origin

noncomputable section

namespace PolynomialEnvelope

/-- The explicit phase differential has polynomial growth whenever its
numerator and velocity do and its norm is bounded away from zero. -/
theorem phaseDerivative {Z V : ℝ → ℂ} (hZ : PolynomialEnvelope Z)
    (hV : PolynomialEnvelope V) {m : ℝ} (hm : 0 < m)
    (hfloor : ∀ s : ℝ, 0 ≤ s → m ≤ ‖Z s‖) :
    PolynomialEnvelope (fun s => Grothe.HJM.Origin.phaseDerivative (Z s) (V s)) := by
  have hi : PolynomialEnvelope (fun s : ℝ => (‖Z s‖ : ℂ)⁻¹) := by
    apply inv_of_norm_lower hm
    intro s hs
    simpa only [Complex.norm_real, norm_norm] using hfloor s hs
  have ha := hZ.real_inner hV
  have h := (hV.mul hi).sub ((hZ.mul ha).mul (hi.pow 3))
  simpa only [Grothe.HJM.Origin.phaseDerivative, div_eq_mul_inv, inv_pow] using h

/-- The second phase differential is also finite algebra in polynomially
bounded functions and a uniformly bounded reciprocal norm. -/
theorem phaseSecondDerivative {Z V W : ℝ → ℂ} (hZ : PolynomialEnvelope Z)
    (hV : PolynomialEnvelope V) (hW : PolynomialEnvelope W) {m : ℝ} (hm : 0 < m)
    (hfloor : ∀ s : ℝ, 0 ≤ s → m ≤ ‖Z s‖) :
    PolynomialEnvelope (fun s => Grothe.HJM.Origin.phaseSecondDerivative (Z s) (V s) (W s)) := by
  have hi : PolynomialEnvelope (fun s : ℝ => (‖Z s‖ : ℂ)⁻¹) := by
    apply inv_of_norm_lower hm
    intro s hs
    simpa only [Complex.norm_real, norm_norm] using hfloor s hs
  have ha := hZ.real_inner hV
  have hb := (hV.norm.pow 2).add (hZ.real_inner hW)
  have hfirst := hW.mul hi
  have hsecond := (((const (2 : ℂ)).mul hV).mul ha).mul (hi.pow 3)
  have hthird := (hZ.mul hb).mul (hi.pow 3)
  have hfourth := (((const (3 : ℂ)).mul hZ).mul (ha.pow 2)).mul (hi.pow 5)
  simpa only [Grothe.HJM.Origin.phaseSecondDerivative, Complex.ofReal_add, Complex.ofReal_pow,
    div_eq_mul_inv, inv_pow] using ((hfirst.sub hsecond).sub hthird).add hfourth

end PolynomialEnvelope

/-- Pointwise derivative formulas turn the explicit algebraic envelope into
an envelope for the ordinary derivative function, including s=0. -/
theorem polynomialPhase_deriv_polynomialEnvelope (p : Polynomial ℂ) {m : ℝ}
    (hm : 0 < m) (hp : ∀ s : ℝ, 0 ≤ s → m ≤ ‖p.eval (s : ℂ)‖) :
    PolynomialEnvelope (deriv (fun s : ℝ => Grothe.Haag.ph (p.eval (s : ℂ)))) := by
  have h := (PolynomialEnvelope.complex_polynomial p).phaseDerivative
    (PolynomialEnvelope.complex_polynomial p.derivative) hm hp
  apply h.of_norm_le
  intro s hs
  have hne : p.eval (s : ℂ) ≠ 0 :=
    norm_pos_iff.mp (lt_of_lt_of_le hm (hp s hs))
  exact (congrArg norm (hasDerivAt_polynomialPhase p s hne).deriv).le

/-- The local second-derivative identity closes the actual ordinary second
derivative, without assuming a global choice of phase angle. -/
theorem polynomialPhase_deriv_deriv_polynomialEnvelope (p : Polynomial ℂ) {m : ℝ}
    (hm : 0 < m) (hp : ∀ s : ℝ, 0 ≤ s → m ≤ ‖p.eval (s : ℂ)‖) :
    PolynomialEnvelope (deriv (deriv (fun s : ℝ => Grothe.Haag.ph (p.eval (s : ℂ))))) := by
  have h := (PolynomialEnvelope.complex_polynomial p).phaseSecondDerivative
    (PolynomialEnvelope.complex_polynomial p.derivative)
    (PolynomialEnvelope.complex_polynomial p.derivative.derivative) hm hp
  apply h.of_norm_le
  intro s hs
  have hne : p.eval (s : ℂ) ≠ 0 :=
    norm_pos_iff.mp (lt_of_lt_of_le hm (hp s hs))
  exact (congrArg norm (deriv_deriv_polynomialPhase p s hne)).le

private theorem f_eq_polynomialPhase :
    f = (fun s : ℝ => Grothe.Haag.ph (leftNumeratorPolynomial.eval (s : ℂ))) := by
  funext s
  simp only [f, eval_leftNumeratorPolynomial]

private theorem g_eq_polynomialPhase :
    g = (fun s : ℝ => Grothe.Haag.ph (rightNumeratorPolynomial.eval (s : ℂ))) := by
  funext s
  simp only [g, eval_rightNumeratorPolynomial]

/-- The first actual left derivative has a proved polynomial envelope. -/
theorem deriv_f_polynomialEnvelope : PolynomialEnvelope (deriv f) := by
  rw [f_eq_polynomialPhase]
  apply polynomialPhase_deriv_polynomialEnvelope leftNumeratorPolynomial
    (m := (1 : ℝ) / 250) (by norm_num)
  intro s hs
  rw [eval_leftNumeratorPolynomial]
  exact (norm_leftNumerator_lower s hs).le

theorem deriv_g_polynomialEnvelope : PolynomialEnvelope (deriv g) := by
  rw [g_eq_polynomialPhase]
  apply polynomialPhase_deriv_polynomialEnvelope rightNumeratorPolynomial
    (m := (1 : ℝ) / 250) (by norm_num)
  intro s hs
  rw [eval_rightNumeratorPolynomial]
  exact (norm_rightNumerator_lower s hs).le

/-- The actual second derivative follows from the same fixed numerator. -/
theorem deriv_deriv_f_polynomialEnvelope : PolynomialEnvelope (deriv (deriv f)) := by
  rw [f_eq_polynomialPhase]
  apply polynomialPhase_deriv_deriv_polynomialEnvelope leftNumeratorPolynomial
    (m := (1 : ℝ) / 250) (by norm_num)
  intro s hs
  rw [eval_leftNumeratorPolynomial]
  exact (norm_leftNumerator_lower s hs).le

theorem deriv_deriv_g_polynomialEnvelope : PolynomialEnvelope (deriv (deriv g)) := by
  rw [g_eq_polynomialPhase]
  apply polynomialPhase_deriv_deriv_polynomialEnvelope rightNumeratorPolynomial
    (m := (1 : ℝ) / 250) (by norm_num)
  intro s hs
  rw [eval_rightNumeratorPolynomial]
  exact (norm_rightNumerator_lower s hs).le

/-- The exact continuous left energy amplitude has polynomial growth with
all inputs discharged by the actual numerator and denominator certificate. -/
theorem fEnergyAmplitude_polynomialEnvelope : PolynomialEnvelope fEnergyAmplitude := by
  have hfirst := (((PolynomialEnvelope.const (-2 : ℂ)).mul PolynomialEnvelope.real_id)
    .mul deriv_deriv_f_polynomialEnvelope)
  have hsecond := (((PolynomialEnvelope.const (2 : ℂ)).mul PolynomialEnvelope.real_id)
    .sub (PolynomialEnvelope.const (2 : ℂ))).mul deriv_f_polynomialEnvelope
  have hthird := fPhaseQuotient_polynomialEnvelope.mul (PolynomialEnvelope.const ((2 : ℂ)⁻¹))
  simpa only [fEnergyAmplitude, div_eq_mul_inv] using (hfirst.add hsecond).add hthird

theorem gEnergyAmplitude_polynomialEnvelope : PolynomialEnvelope gEnergyAmplitude := by
  have hfirst := (((PolynomialEnvelope.const (-2 : ℂ)).mul PolynomialEnvelope.real_id)
    .mul deriv_deriv_g_polynomialEnvelope)
  have hsecond := (((PolynomialEnvelope.const (2 : ℂ)).mul PolynomialEnvelope.real_id)
    .sub (PolynomialEnvelope.const (2 : ℂ))).mul deriv_g_polynomialEnvelope
  have hthird := gPhaseQuotient_polynomialEnvelope.mul (PolynomialEnvelope.const ((2 : ℂ)⁻¹))
  simpa only [gEnergyAmplitude, div_eq_mul_inv] using (hfirst.add hsecond).add hthird

lemma measurable_fResidual : Measurable fResidual := measurable_f.sub measurable_const

lemma measurable_gResidual : Measurable gResidual := measurable_g.sub measurable_const

/-- Measurability uses the global measurable-derivative theorem, independently
of whether either phase is differentiable at negative parameters. -/
lemma measurable_fRadialDifferential :
    Measurable (originRadialDifferential fResidual (deriv f) (deriv (deriv f))) := by
  have h0 := measurable_fResidual
  have h1 := measurable_deriv f
  have h2 := measurable_deriv (deriv f)
  unfold originRadialDifferential
  fun_prop

lemma measurable_gRadialDifferential :
    Measurable (originRadialDifferential gResidual (deriv g) (deriv (deriv g))) := by
  have h0 := measurable_gResidual
  have h1 := measurable_deriv g
  have h2 := measurable_deriv (deriv g)
  unfold originRadialDifferential
  fun_prop

/-- Actual residual responses and their actual differential expressions lie
in Gaussian L². These facts precede, and do not rely on, weighted Parseval. -/
theorem memLp_fResidual :
    MemLp (fun z : ℂ => Grothe.Haag.ph z * fResidual (‖z‖ ^ 2)) 2 gaussC :=
  memLp_radial_of_polynomialEnvelope continuousOn_fResidual fResidual_polynomialEnvelope

theorem memLp_gResidual :
    MemLp (fun z : ℂ => Grothe.Haag.ph z * gResidual (‖z‖ ^ 2)) 2 gaussC :=
  memLp_radial_of_polynomialEnvelope continuousOn_gResidual gResidual_polynomialEnvelope

theorem memLp_fRadialDifferential :
    MemLp (fun z : ℂ => Grothe.Haag.ph z *
      originRadialDifferential fResidual (deriv f) (deriv (deriv f)) (‖z‖ ^ 2)) 2 gaussC :=
  memLp_fRadialDifferential_of_envelope fEnergyAmplitude_polynomialEnvelope

theorem memLp_gRadialDifferential :
    MemLp (fun z : ℂ => Grothe.Haag.ph z *
      originRadialDifferential gResidual (deriv g) (deriv (deriv g)) (‖z‖ ^ 2)) 2 gaussC :=
  memLp_gRadialDifferential_of_envelope gEnergyAmplitude_polynomialEnvelope

/-- The left residual as an actual Gaussian L² vector. -/
def fResidualLp : Lp ℂ 2 gaussC :=
  memLp_fResidual.toLp (fun z : ℂ => Grothe.Haag.ph z * fResidual (‖z‖ ^ 2))

/-- The corresponding right residual vector. -/
def gResidualLp : Lp ℂ 2 gaussC :=
  memLp_gResidual.toLp (fun z : ℂ => Grothe.Haag.ph z * gResidual (‖z‖ ^ 2))

/-- Actual Green pairing: no growth, integrability or boundary assumptions
remain beyond the fixed definitions of the two responses. -/
theorem fResidual_green_identity (n : ℕ) :
    (∫ s in Ioi (0 : ℝ), ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
        (((originRadialPoly n).eval s : ℝ) : ℂ) *
        originRadialDifferential fResidual (deriv f) (deriv (deriv f)) s) =
      (2 * (n : ℂ) + 1) * ∫ s in Ioi (0 : ℝ),
        ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
          (((originRadialPoly n).eval s : ℝ) : ℂ) * fResidual s :=
  fResidual_green_integral_of_envelopes n
    deriv_f_polynomialEnvelope fEnergyAmplitude_polynomialEnvelope

theorem gResidual_green_identity (n : ℕ) :
    (∫ s in Ioi (0 : ℝ), ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
        (((originRadialPoly n).eval s : ℝ) : ℂ) *
        originRadialDifferential gResidual (deriv g) (deriv (deriv g)) s) =
      (2 * (n : ℂ) + 1) * ∫ s in Ioi (0 : ℝ),
        ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
          (((originRadialPoly n).eval s : ℝ) : ℂ) * gResidual s :=
  gResidual_green_integral_of_envelopes n
    deriv_g_polynomialEnvelope gEnergyAmplitude_polynomialEnvelope

/-- Exact full weighted energy of the actual left residual. The integral uses
the continuous amplitude, so its endpoint does not retain a totalized 0/0. -/
theorem fResidual_hasSum_weighted_energy :
    HasSum (fun n : ℕ => (2 * (n : ℝ) + 1) ^ 2 * ‖chargeOneCoeff fResidualLp n‖ ^ 2)
      (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖fEnergyAmplitude s‖ ^ 2) := by
  have h := originRadialDifferential_hasSum_energy
    measurable_fResidual measurable_fRadialDifferential memLp_fResidual memLp_fRadialDifferential
    (fun s hs => hasDerivAt_fResidual s hs.le)
    (fun s hs => hasDerivAt_deriv_f s hs.le)
    (fun n => continuousWithinAt_fResidual_greenBoundary (originRadialPoly n))
    (fun n => tendsto_green_boundary (originRadialPoly n)
      fResidual_polynomialEnvelope deriv_f_polynomialEnvelope)
    (fun n => integrable_green_pairing (originRadialPoly n)
      continuousOn_fResidual fResidual_polynomialEnvelope)
    (fun n => integrable_green_pairing_of_extension (originRadialPoly n)
      continuousOn_fEnergyAmplitude fEnergyAmplitude_polynomialEnvelope f_radialDifferential_eq)
  have he : (∫ s in Ioi (0 : ℝ), Real.exp (-s) *
      ‖originRadialDifferential fResidual (deriv f) (deriv (deriv f)) s‖ ^ 2) =
      ∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖fEnergyAmplitude s‖ ^ 2 := by
    refine setIntegral_congr_fun measurableSet_Ioi fun s hs => ?_
    rw [f_radialDifferential_eq s hs]
  rw [he] at h
  exact h

theorem gResidual_hasSum_weighted_energy :
    HasSum (fun n : ℕ => (2 * (n : ℝ) + 1) ^ 2 * ‖chargeOneCoeff gResidualLp n‖ ^ 2)
      (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖gEnergyAmplitude s‖ ^ 2) := by
  have h := originRadialDifferential_hasSum_energy
    measurable_gResidual measurable_gRadialDifferential memLp_gResidual memLp_gRadialDifferential
    (fun s hs => hasDerivAt_gResidual s hs.le)
    (fun s hs => hasDerivAt_deriv_g s hs.le)
    (fun n => continuousWithinAt_gResidual_greenBoundary (originRadialPoly n))
    (fun n => tendsto_green_boundary (originRadialPoly n)
      gResidual_polynomialEnvelope deriv_g_polynomialEnvelope)
    (fun n => integrable_green_pairing (originRadialPoly n)
      continuousOn_gResidual gResidual_polynomialEnvelope)
    (fun n => integrable_green_pairing_of_extension (originRadialPoly n)
      continuousOn_gEnergyAmplitude gEnergyAmplitude_polynomialEnvelope g_radialDifferential_eq)
  have he : (∫ s in Ioi (0 : ℝ), Real.exp (-s) *
      ‖originRadialDifferential gResidual (deriv g) (deriv (deriv g)) s‖ ^ 2) =
      ∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖gEnergyAmplitude s‖ ^ 2 := by
    refine setIntegral_congr_fun measurableSet_Ioi fun s hs => ?_
    rw [g_radialDifferential_eq s hs]
  rw [he] at h
  exact h

end

end Grothe.HJM.Origin
