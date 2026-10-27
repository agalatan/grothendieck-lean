import Grothe.HJM.OriginNonvanishing
import Mathlib.Algebra.Polynomial.Inductions

/-!
# Removing the origin phase quotient's apparent singularity

Agent-ID: codex-aa04.

Polynomial divided differences are defined by `divX`, including their values
at zero. Rationalizing the difference of the two norms then removes the
explicit division by the radial parameter. The resulting expression is
continuous wherever the numerator is nonzero and at the endpoint itself.
The original totalized difference quotient is only identified away from zero.
No energy enclosure or numerical integration is asserted here.
-/

open scoped ComplexConjugate

namespace Grothe.HJM.Origin

open Grothe.Haag Grothe.Upper

noncomputable section

/-- The coefficientwise conjugate product evaluates to the squared norm on the real axis. -/
def normSqPolynomial (p : Polynomial ℂ) : Polynomial ℂ := p * p.map (starRingEnd ℂ)

lemma eval_conjugatePolynomial (p : Polynomial ℂ) (s : ℝ) :
    (p.map (starRingEnd ℂ)).eval (s : ℂ) = conj (p.eval (s : ℂ)) := by
  simpa only [Complex.conj_ofReal] using
    (Polynomial.eval_map_apply (p := p) (f := starRingEnd ℂ) (s : ℂ))

lemma eval_normSqPolynomial (p : Polynomial ℂ) (s : ℝ) :
    (normSqPolynomial p).eval (s : ℂ) = ((‖p.eval (s : ℂ)‖ ^ 2 : ℝ) : ℂ) := by
  rw [normSqPolynomial, Polynomial.eval_mul, eval_conjugatePolynomial,
    Complex.mul_conj, Complex.normSq_eq_norm_sq]

/-- Exact polynomial divided difference, before division by the parameter. -/
theorem mul_eval_divX (p : Polynomial ℂ) (z : ℂ) :
    z * p.divX.eval z = p.eval z - p.eval 0 := by
  have h := congrArg (fun q : Polynomial ℂ => q.eval z) (Polynomial.X_mul_divX_add p)
  simp only [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_X,
    Polynomial.eval_C] at h
  simpa only [← Polynomial.coeff_zero_eq_eval_zero] using (eq_sub_iff_add_eq.mpr h)

lemma eval_divX_eq_div (p : Polynomial ℂ) (z : ℂ) (hz : z ≠ 0) :
    p.divX.eval z = (p.eval z - p.eval 0) / z := by
  apply (eq_div_iff hz).mpr
  simpa only [mul_comm] using mul_eval_divX p z

/-- The rationalized phase divided difference has no explicit `1/s` factor. -/
def phaseQuotient (p : Polynomial ℂ) (s : ℝ) : ℂ :=
  p.divX.eval (s : ℂ) / (‖p.eval (s : ℂ)‖ : ℂ) -
    p.eval 0 * (normSqPolynomial p).divX.eval (s : ℂ) /
      ((‖p.eval (s : ℂ)‖ : ℂ) * (‖p.eval 0‖ : ℂ) *
        ((‖p.eval (s : ℂ)‖ : ℂ) + (‖p.eval 0‖ : ℂ)))

/-- Exact endpoint rationalization, valid for every nonzero real parameter. -/
theorem phase_difference_quotient (p : Polynomial ℂ) (s : ℝ) (hs : s ≠ 0)
    (h0 : p.eval 0 ≠ 0) (hp : p.eval (s : ℂ) ≠ 0) :
    (ph (p.eval (s : ℂ)) - ph (p.eval 0)) / (s : ℂ) = phaseQuotient p s := by
  have hsC : (s : ℂ) ≠ 0 := by exact_mod_cast hs
  have hr : (‖p.eval (s : ℂ)‖ : ℂ) ≠ 0 := by
    exact_mod_cast (norm_ne_zero_iff.mpr hp)
  have hr0 : (‖p.eval 0‖ : ℂ) ≠ 0 := by
    exact_mod_cast (norm_ne_zero_iff.mpr h0)
  have hsumR : 0 < ‖p.eval (s : ℂ)‖ + ‖p.eval 0‖ :=
    add_pos (norm_pos_iff.mpr hp) (norm_pos_iff.mpr h0)
  have hsum : (‖p.eval (s : ℂ)‖ : ℂ) + (‖p.eval 0‖ : ℂ) ≠ 0 := by
    exact_mod_cast hsumR.ne'
  have hq0 : (normSqPolynomial p).eval 0 = ((‖p.eval 0‖ ^ 2 : ℝ) : ℂ) := by
    simpa only [Complex.ofReal_zero] using eval_normSqPolynomial p 0
  rw [phaseQuotient, eval_divX_eq_div p _ hsC,
    eval_divX_eq_div (normSqPolynomial p) _ hsC, eval_normSqPolynomial, hq0]
  unfold ph
  push_cast
  field_simp [hsC, hr, hr0, hsum]
  ring

/-- The rationalized expression is continuous at every nonvanishing point. -/
theorem continuousAt_phaseQuotient (p : Polynomial ℂ) (s : ℝ)
    (h0 : p.eval 0 ≠ 0) (hp : p.eval (s : ℂ) ≠ 0) :
    ContinuousAt (phaseQuotient p) s := by
  have hc : Continuous (fun t : ℝ => p.eval (t : ℂ)) :=
    p.continuous.comp Complex.continuous_ofReal
  have hn : Continuous (fun t : ℝ => (‖p.eval (t : ℂ)‖ : ℂ)) :=
    Complex.continuous_ofReal.comp hc.norm
  have hd : Continuous (fun t : ℝ => p.divX.eval (t : ℂ)) :=
    p.divX.continuous.comp Complex.continuous_ofReal
  have hqd : Continuous (fun t : ℝ => (normSqPolynomial p).divX.eval (t : ℂ)) :=
    (normSqPolynomial p).divX.continuous.comp Complex.continuous_ofReal
  have hc0 : Continuous (fun _ : ℝ => p.eval 0) := continuous_const
  have hn0 : Continuous (fun _ : ℝ => (‖p.eval 0‖ : ℂ)) := continuous_const
  have hr : (‖p.eval (s : ℂ)‖ : ℂ) ≠ 0 := by
    exact_mod_cast (norm_ne_zero_iff.mpr hp)
  have hr0 : (‖p.eval 0‖ : ℂ) ≠ 0 := by
    exact_mod_cast (norm_ne_zero_iff.mpr h0)
  have hsum : (‖p.eval (s : ℂ)‖ : ℂ) + (‖p.eval 0‖ : ℂ) ≠ 0 := by
    have h : 0 < ‖p.eval (s : ℂ)‖ + ‖p.eval 0‖ :=
      add_pos (norm_pos_iff.mpr hp) (norm_pos_iff.mpr h0)
    exact_mod_cast h.ne'
  exact (hd.continuousAt.div hn.continuousAt hr).sub
    ((hc0.mul hqd).continuousAt.div
      ((hn.mul hn0).mul (hn.add hn0)).continuousAt
      (mul_ne_zero (mul_ne_zero hr hr0) hsum))

/-- Nonvanishing at the endpoint supplies a genuine continuous extension there. -/
theorem continuousAt_phaseQuotient_zero (p : Polynomial ℂ) (h0 : p.eval 0 ≠ 0) :
    ContinuousAt (phaseQuotient p) 0 :=
  continuousAt_phaseQuotient p 0 h0 (by simpa only [Complex.ofReal_zero] using h0)

/-- The extension is continuous on the full radial half-line under nonvanishing there. -/
theorem continuousOn_phaseQuotient (p : Polynomial ℂ)
    (hp : ∀ s : ℝ, 0 ≤ s → p.eval (s : ℂ) ≠ 0) :
    ContinuousOn (phaseQuotient p) (Set.Ici 0) := by
  have h0 : p.eval 0 ≠ 0 := by simpa only [Complex.ofReal_zero] using hp 0 le_rfl
  intro s hs
  exact (continuousAt_phaseQuotient p s h0 (hp s hs)).continuousWithinAt

/-- At zero the divided differences become the first polynomial coefficients. -/
theorem phaseQuotient_zero (p : Polynomial ℂ) :
    phaseQuotient p 0 = p.coeff 1 / (‖p.eval 0‖ : ℂ) -
      p.eval 0 * (normSqPolynomial p).coeff 1 / (2 * (‖p.eval 0‖ : ℂ) ^ 3) := by
  have hden : (‖p.eval 0‖ : ℂ) * (‖p.eval 0‖ : ℂ) *
      ((‖p.eval 0‖ : ℂ) + (‖p.eval 0‖ : ℂ)) = 2 * (‖p.eval 0‖ : ℂ) ^ 3 := by ring
  simp only [phaseQuotient, Complex.ofReal_zero, ← Polynomial.coeff_zero_eq_eval_zero,
    Polynomial.coeff_divX] at hden ⊢
  rw [hden]

/-! ## The actual HJM radial numerators -/

/-- The complex polynomial underlying the exact real-parameter function `P`. -/
def originPolynomial : Polynomial ℂ :=
  (ofListQ OriginData.pReal).map (algebraMap ℝ ℂ) +
    Polynomial.C Complex.I * (ofListQ OriginData.pImag).map (algebraMap ℝ ℂ)

lemma eval_originPolynomial (s : ℝ) : originPolynomial.eval (s : ℂ) = P s := by
  have heval (q : Polynomial ℝ) :
      (q.map (algebraMap ℝ ℂ)).eval (s : ℂ) = ((q.eval s : ℝ) : ℂ) := by
    change (q.map (algebraMap ℝ ℂ)).eval ((algebraMap ℝ ℂ) s) =
      (algebraMap ℝ ℂ) (q.eval s)
    exact Polynomial.eval_map_apply s
  simp only [originPolynomial, Polynomial.eval_add, Polynomial.eval_mul,
    Polynomial.eval_C, heval, P]

def leftNumeratorPolynomial : Polynomial ℂ :=
  originPolynomial * (Polynomial.X + Polynomial.C ((OriginData.delta : ℂ) * A))

def rightNumeratorPolynomial : Polynomial ℂ :=
  Polynomial.C C * originPolynomial.map (starRingEnd ℂ) *
    (Polynomial.X + Polynomial.C ((OriginData.delta : ℂ) * B))

lemma eval_leftNumeratorPolynomial (s : ℝ) :
    leftNumeratorPolynomial.eval (s : ℂ) = leftNumerator s := by
  simp [leftNumeratorPolynomial, eval_originPolynomial, leftNumerator]

lemma eval_rightNumeratorPolynomial (s : ℝ) :
    rightNumeratorPolynomial.eval (s : ℂ) = rightNumerator s := by
  simp [rightNumeratorPolynomial, eval_conjugatePolynomial, eval_originPolynomial,
    rightNumerator]

def fPhaseQuotient : ℝ → ℂ := phaseQuotient leftNumeratorPolynomial

def gPhaseQuotient : ℝ → ℂ := phaseQuotient rightNumeratorPolynomial

/-- Exact replacement for the apparent singularity in the actual left energy amplitude. -/
theorem f_difference_quotient (s : ℝ) (hs : 0 < s) :
    (f s - f 0) / (s : ℂ) = fPhaseQuotient s := by
  have he0 : leftNumeratorPolynomial.eval 0 = leftNumerator 0 := by
    simpa only [Complex.ofReal_zero] using eval_leftNumeratorPolynomial 0
  have h0 : leftNumeratorPolynomial.eval 0 ≠ 0 := by
    rw [he0]
    exact leftNumerator_ne_zero 0 le_rfl
  have hp : leftNumeratorPolynomial.eval (s : ℂ) ≠ 0 := by
    rw [eval_leftNumeratorPolynomial]
    exact leftNumerator_ne_zero s hs.le
  simpa only [eval_leftNumeratorPolynomial, he0, f, fPhaseQuotient] using
    phase_difference_quotient leftNumeratorPolynomial s hs.ne' h0 hp

/-- The same exact replacement for the asymmetric right energy amplitude. -/
theorem g_difference_quotient (s : ℝ) (hs : 0 < s) :
    (g s - g 0) / (s : ℂ) = gPhaseQuotient s := by
  have he0 : rightNumeratorPolynomial.eval 0 = rightNumerator 0 := by
    simpa only [Complex.ofReal_zero] using eval_rightNumeratorPolynomial 0
  have h0 : rightNumeratorPolynomial.eval 0 ≠ 0 := by
    rw [he0]
    exact rightNumerator_ne_zero 0 le_rfl
  have hp : rightNumeratorPolynomial.eval (s : ℂ) ≠ 0 := by
    rw [eval_rightNumeratorPolynomial]
    exact rightNumerator_ne_zero s hs.le
  simpa only [eval_rightNumeratorPolynomial, he0, g, gPhaseQuotient] using
    phase_difference_quotient rightNumeratorPolynomial s hs.ne' h0 hp

/-- Continuous extensions of both actual radial phase quotients through the endpoint. -/
theorem continuousOn_fPhaseQuotient : ContinuousOn fPhaseQuotient (Set.Ici 0) := by
  apply continuousOn_phaseQuotient
  intro s hs
  rw [eval_leftNumeratorPolynomial]
  exact leftNumerator_ne_zero s hs

theorem continuousOn_gPhaseQuotient : ContinuousOn gPhaseQuotient (Set.Ici 0) := by
  apply continuousOn_phaseQuotient
  intro s hs
  rw [eval_rightNumeratorPolynomial]
  exact rightNumerator_ne_zero s hs

end

end Grothe.HJM.Origin
