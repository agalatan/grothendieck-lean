import Grothe.UpperQuad.TwistFiniteExtension
import Grothe.UpperQuad.GaussianShiftUniqueness
import Grothe.UpperQuad.GaussianShiftReal

/-!
# One continuation for both twisted coefficient estimates

The finite matrix factorization and the shifted Gaussian integral agree on the real slice.
Entire uniqueness in each variable identifies them everywhere, so their two estimates apply
to the same coefficient. The production bridge retains the one outer profile sign.

Agent-ID: codex-f3dd. Refs #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistFactorization

open Grothe.UpperChaos Grothe.UpperChaos.F0ConditionalEvaluator

noncomputable section

/-- The finite factorization is the same entire coefficient as the shifted Gaussian integral. -/
theorem Jext_eq_gaussianShift (j : ℕ) (hj : 0 < j) (r A : ℂ) (c d : ℕ) :
    Jext j r A c d = GaussianShift.coefficient j r A.re A.im (c, d) := by
  symm
  apply GaussianShift.coefficient_eq_of_real_positive j hj (c, d)
  · exact fun r A ↦ analyticAt_Jext_shift j c d r A
  · exact fun r A ↦ analyticAt_Jext_radial j c d r A
  · exact fun r A hA ↦ Jext_real j c d r A hA.ne'

/-- The literal production coefficient uses the signed shift and one outer profile sign. -/
theorem twistCoef_eq_Jext (j : ℕ) (hj : 0 < j) (s : ℝ) (hs : 0 ≤ s)
    (hv : vprof s ≠ 0) (c d : ℕ) :
    twistCoef j s (c, d) = (profileSign s : ℂ) *
      Jext j (Real.sqrt s : ℂ) ((profileSign s * profileShift s : ℝ) : ℂ) c d := by
  rw [GaussianShift.twistCoef_eq_signed_coefficient j s hs hv, Jext_eq_gaussianShift j hj]
  simp only [Complex.ofReal_re, Complex.ofReal_im]

end

end Grothe.UpperQuad.TwistFactorization
