import Grothe.LowerAnalytic.Potential

/-!
# Gaussian phase and its planar laws

The phase map and the Gaussian coordinates shared by the one-channel and two-channel
roundings.  These definitions are independent of the calculation of the phase correlation.
-/

open MeasureTheory ProbabilityTheory Real Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.Haag

noncomputable section

/-- The planar standard Gaussian. -/
abbrev g2 : Measure (ℝ × ℝ) := (gaussianReal 0 1).prod (gaussianReal 0 1)

/-- Two independent planar standard Gaussians. -/
abbrev g4 : Measure ((ℝ × ℝ) × (ℝ × ℝ)) := g2.prod g2

/-- `(a, b) ↦ a + ib`. -/
def cx (p : ℝ × ℝ) : ℂ := ⟨p.1, p.2⟩

@[simp] lemma cx_re (p : ℝ × ℝ) : (cx p).re = p.1 := rfl
@[simp] lemma cx_im (p : ℝ × ℝ) : (cx p).im = p.2 := rfl

@[fun_prop] lemma continuous_cx : Continuous cx :=
  Complex.equivRealProdCLM.symm.continuous

/-- The phase `a/|a|`, with value zero at zero. -/
def ph (a : ℂ) : ℂ := a / ((‖a‖ : ℝ) : ℂ)

lemma norm_ph_le (a : ℂ) : ‖ph a‖ ≤ 1 := by
  unfold ph
  rcases eq_or_ne a 0 with rfl | ha
  · simp
  · rw [norm_div, Complex.norm_real, Real.norm_of_nonneg (norm_nonneg _),
      div_self (norm_ne_zero_iff.2 ha)]

lemma measurable_ph : Measurable ph := by unfold ph; fun_prop

lemma memLp_ph : MemLp ph 2 gaussC :=
  MemLp.of_bound measurable_ph.aestronglyMeasurable 1
    (Filter.Eventually.of_forall norm_ph_le)

/-- The phase as an element of the Gaussian `L²` space. -/
def phaseLp : Lp ℂ 2 gaussC := memLp_ph.toLp ph

/-- The phase correlation of two planar Gaussians. -/
def Phi2 (z : ℂ) (s : ℝ) : ℂ :=
  ∫ p, conj (ph (cx p.1)) * ph (z * cx p.1 + (s : ℂ) * cx p.2) ∂g4

end

end Grothe.Haag

namespace Grothe.UpperChaos

open Grothe.Haag

noncomputable section

/-- `(a, b) ↦ (a + ib)/√2`. -/
def cxs (q : ℝ × ℝ) : ℂ := cx q / ((√2 : ℝ) : ℂ)

lemma continuous_cxs : Continuous cxs := by
  unfold cxs; fun_prop

lemma measurable_cxs : Measurable cxs := continuous_cxs.measurable

lemma map_cxs : g2.map cxs = gaussC := by
  have h := (measurePreserving_finTwoArrow (gaussianReal 0 1)).map_eq
  have e : toC = cxs ∘ MeasurableEquiv.finTwoArrow := by
    funext x; simp [toC, cxs, cx, MeasurableEquiv.finTwoArrow, Complex.ext_iff]
  rw [gaussC, Grothe.LowerAnalytic.stdGaussian, e, ← Measure.map_map measurable_cxs
    MeasurableEquiv.finTwoArrow.measurable, h]

end

end Grothe.UpperChaos
