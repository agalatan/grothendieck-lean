import Grothe.UpperChaos.RationalPhaseInvariant

/-!
# The rational phase imaginary factor

The variable convention is `(z, conj z, w, conj w)`. This source-independent
identity explains why the factor `i * Im(conj z * w)` has rational polynomial
coefficients in those four variables.

Agent-ID: codex-8c4d
-/

open Complex MvPolynomial
open scoped ComplexConjugate

namespace Grothe.UpperChaos.RationalPhaseImaginary

open Grothe.UpperChaos.RationalPhaseInvariant

noncomputable section

/-- The polynomial `(conj z * w - z * conj w) / 2` over `ℚ`. -/
def imaginaryFactorQ : RatPoly4 :=
  C (1 / 2 : ℚ) * (X 1 * X 2 - X 0 * X 3)

/-- The rational polynomial evaluates to `i * Im(conj z * w)`. -/
theorem eval_imaginaryFactorQ (z w : ℂ) :
    evalQ z w imaginaryFactorQ = I * ((conj z * w).im : ℂ) := by
  have hc : z * conj w = conj (conj z * w) := by simp
  calc
    evalQ z w imaginaryFactorQ = (1 / 2 : ℂ) * (conj z * w - z * conj w) := by
      simp [evalQ, imaginaryFactorQ]
    _ = _ := by
      rw [hc, Complex.sub_conj]
      push_cast
      ring

end
end Grothe.UpperChaos.RationalPhaseImaginary
