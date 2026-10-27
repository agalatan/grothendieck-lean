import Grothe.HJM.OriginRadial
import Mathlib.Analysis.Calculus.Deriv.Polynomial
import Mathlib.Analysis.Complex.RealDeriv
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.MeasureTheory.Integral.IntegralEqImproper

/-!
# A scalar Green identity for the origin response

Agent-ID: codex-aa04.

The charge-one radial differential expression is paired with a real polynomial
satisfying the Laguerre equation. A combined Wronskian turns the pairing
identity into one improper fundamental theorem of calculus. Derivatives,
integrability and the boundary limits remain explicit analytic hypotheses;
these results assert no numerical energy enclosure.
-/

open MeasureTheory Filter Set
open scoped Topology

namespace Grothe.HJM

noncomputable section

/-- The radial number-operator expression, with explicit first and second derivatives. -/
def originRadialDifferential (v v1 v2 : ℝ → ℂ) (s : ℝ) : ℂ :=
  -2 * (s : ℂ) * v2 s + (2 * (s : ℂ) - 2) * v1 s + v s / (2 * (s : ℂ))

/-- The combined Green boundary term; this expression is total at zero. -/
def originGreenBoundary (P : Polynomial ℝ) (v v1 : ℝ → ℂ) (s : ℝ) : ℂ :=
  ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
    (((P.eval s : ℂ) + 2 * (s : ℂ) * (P.derivative.eval s : ℂ)) * v s -
      2 * (s : ℂ) * (P.eval s : ℂ) * v1 s)

@[simp] theorem originGreenBoundary_zero (P : Polynomial ℝ) (v v1 : ℝ → ℂ) :
    originGreenBoundary P v v1 0 = 0 := by
  simp [originGreenBoundary]

private lemma hasDerivAt_originGreenWeight {s : ℝ} (hs : 0 < s) :
    HasDerivAt (fun t : ℝ => Real.exp (-t) * Real.sqrt t)
      ((Real.exp (-s) * Real.sqrt s) * (1 / (2 * s) - 1)) s := by
  have hr : Real.sqrt s ≠ 0 := (Real.sqrt_pos.2 hs).ne'
  have hi : 1 / (2 * Real.sqrt s) = Real.sqrt s / (2 * s) := by
    apply (div_eq_div_iff (mul_ne_zero two_ne_zero hr)
      (mul_ne_zero two_ne_zero hs.ne')).2
    nlinarith [Real.sq_sqrt hs.le]
  apply (((hasDerivAt_id s).neg.exp).mul (Real.hasDerivAt_sqrt hs.ne')).congr_deriv
  rw [hi]
  ring

/-- The pointwise Green identity follows from the polynomial ODE and two ordinary
real-parameter derivatives. No abstract number-operator domain is used. -/
theorem hasDerivAt_originGreenBoundary (P : Polynomial ℝ) (n : ℕ)
    {v v1 v2 : ℝ → ℂ} {s : ℝ} (hs : 0 < s)
    (hv : HasDerivAt v (v1 s) s) (hv1 : HasDerivAt v1 (v2 s) s)
    (hode : s * P.derivative.derivative.eval s + (2 - s) * P.derivative.eval s +
      (n : ℝ) * P.eval s = 0) :
    HasDerivAt (originGreenBoundary P v v1)
      (((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) * (P.eval s : ℂ) *
        (originRadialDifferential v v1 v2 s - (2 * (n : ℂ) + 1) * v s)) s := by
  have hX : HasDerivAt (fun t : ℝ => (t : ℂ)) 1 s := by
    simpa using (hasDerivAt_id s).ofReal_comp
  have hP := (P.hasDerivAt s).ofReal_comp
  have hP1 := (P.derivative.hasDerivAt s).ofReal_comp
  have hA : HasDerivAt
      (fun t : ℝ => (P.eval t : ℂ) + 2 * (t : ℂ) * (P.derivative.eval t : ℂ))
      (3 * (P.derivative.eval s : ℂ) + 2 * (s : ℂ) *
        (P.derivative.derivative.eval s : ℂ)) s := by
    apply (hP.add ((hX.const_mul 2).mul hP1)).congr_deriv
    ring
  have hB : HasDerivAt (fun t : ℝ => 2 * (t : ℂ) * (P.eval t : ℂ))
      (2 * (P.eval s : ℂ) + 2 * (s : ℂ) * (P.derivative.eval s : ℂ)) s := by
    apply ((hX.const_mul 2).mul hP).congr_deriv
    ring
  have hc : (s : ℂ) * (P.derivative.derivative.eval s : ℂ) +
      (2 - (s : ℂ)) * (P.derivative.eval s : ℂ) + (n : ℂ) * (P.eval s : ℂ) = 0 := by
    exact_mod_cast hode
  have hsc : (s : ℂ) ≠ 0 := by exact_mod_cast hs.ne'
  have ha :
      (1 / (2 * (s : ℂ)) - 1) *
          (((P.eval s : ℂ) + 2 * (s : ℂ) * (P.derivative.eval s : ℂ)) * v s -
            2 * (s : ℂ) * (P.eval s : ℂ) * v1 s) +
        ((3 * (P.derivative.eval s : ℂ) + 2 * (s : ℂ) *
              (P.derivative.derivative.eval s : ℂ)) * v s +
          ((P.eval s : ℂ) + 2 * (s : ℂ) * (P.derivative.eval s : ℂ)) * v1 s -
          ((2 * (P.eval s : ℂ) + 2 * (s : ℂ) * (P.derivative.eval s : ℂ)) * v1 s +
            (2 * (s : ℂ) * (P.eval s : ℂ)) * v2 s)) =
      (P.eval s : ℂ) * (originRadialDifferential v v1 v2 s -
        (2 * (n : ℂ) + 1) * v s) := by
    calc
      _ = (P.eval s : ℂ) * (originRadialDifferential v v1 v2 s -
            (2 * (n : ℂ) + 1) * v s) + 2 * v s *
          ((s : ℂ) * (P.derivative.derivative.eval s : ℂ) +
            (2 - (s : ℂ)) * (P.derivative.eval s : ℂ) +
            (n : ℂ) * (P.eval s : ℂ)) := by
        unfold originRadialDifferential
        field_simp [hsc]
        ring
      _ = _ := by rw [hc]; ring
  have hd := ((hasDerivAt_originGreenWeight hs).ofReal_comp).mul
    ((hA.mul hv).sub (hB.mul hv1))
  change HasDerivAt
    (fun t : ℝ => ((Real.exp (-t) * Real.sqrt t : ℝ) : ℂ) *
      (((P.eval t : ℂ) + 2 * (t : ℂ) * (P.derivative.eval t : ℂ)) * v t -
        2 * (t : ℂ) * (P.eval t : ℂ) * v1 t)) _ s
  apply hd.congr_deriv
  push_cast
  linear_combination ((Real.exp (-s) : ℂ) * (Real.sqrt s : ℂ)) * ha

/-- The actual charge-one radial polynomial satisfies the Green derivative identity. -/
theorem hasDerivAt_originRadialGreenBoundary (n : ℕ)
    {v v1 v2 : ℝ → ℂ} {s : ℝ} (hs : 0 < s)
    (hv : HasDerivAt v (v1 s) s) (hv1 : HasDerivAt v1 (v2 s) s) :
    HasDerivAt (originGreenBoundary (originRadialPoly n) v v1)
      (((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) * ((originRadialPoly n).eval s : ℂ) *
        (originRadialDifferential v v1 v2 s - (2 * (n : ℂ) + 1) * v s)) s :=
  hasDerivAt_originGreenBoundary (originRadialPoly n) n hs hv hv1
    (originRadialPoly_ode_eval n s)

/-- Improper Green pairing for any polynomial satisfying the Laguerre ODE.
The boundary hypotheses and both integrable coefficient kernels are explicit. -/
theorem originGreen_integral (P : Polynomial ℝ) (n : ℕ)
    {v v1 v2 : ℝ → ℂ}
    (hv : ∀ s ∈ Ioi (0 : ℝ), HasDerivAt v (v1 s) s)
    (hv1 : ∀ s ∈ Ioi (0 : ℝ), HasDerivAt v1 (v2 s) s)
    (hode : ∀ s ∈ Ioi (0 : ℝ), s * P.derivative.derivative.eval s +
      (2 - s) * P.derivative.eval s + (n : ℝ) * P.eval s = 0)
    (hzero : ContinuousWithinAt (originGreenBoundary P v v1) (Ici 0) 0)
    (hinfty : Tendsto (originGreenBoundary P v v1) atTop (𝓝 0))
    (hR : IntegrableOn (fun s : ℝ =>
      ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) * (P.eval s : ℂ) * v s) (Ioi 0))
    (hQ : IntegrableOn (fun s : ℝ =>
      ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) * (P.eval s : ℂ) *
        originRadialDifferential v v1 v2 s) (Ioi 0)) :
    (∫ s in Ioi (0 : ℝ), ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
        (P.eval s : ℂ) * originRadialDifferential v v1 v2 s) =
      (2 * (n : ℂ) + 1) *
        ∫ s in Ioi (0 : ℝ), ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
          (P.eval s : ℂ) * v s := by
  have hi : IntegrableOn (fun s : ℝ =>
      ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) * (P.eval s : ℂ) *
        (originRadialDifferential v v1 v2 s - (2 * (n : ℂ) + 1) * v s)) (Ioi 0) := by
    convert hQ.sub (hR.const_mul (2 * (n : ℂ) + 1)) using 1
    ext s
    ring
  have h := integral_Ioi_of_hasDerivAt_of_tendsto hzero
    (fun s hs => hasDerivAt_originGreenBoundary P n hs (hv s hs) (hv1 s hs) (hode s hs))
    hi hinfty
  simp only [originGreenBoundary_zero, sub_self] at h
  have he : (fun s : ℝ =>
      ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) * (P.eval s : ℂ) *
        (originRadialDifferential v v1 v2 s - (2 * (n : ℂ) + 1) * v s)) =
      (fun s : ℝ => ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) * (P.eval s : ℂ) *
          originRadialDifferential v v1 v2 s - (2 * (n : ℂ) + 1) *
          (((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) * (P.eval s : ℂ) * v s)) := by
    funext s
    ring
  rw [he, integral_sub hQ (hR.const_mul _), integral_const_mul] at h
  exact sub_eq_zero.mp h

end

end Grothe.HJM
