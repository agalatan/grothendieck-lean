import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder49

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p49 (recurrenceStep 47 p47 p48) = true := by
  decide +kernel

theorem identities_checked :
    check 48 p48 p49 w49 r49 = true := by
  decide +kernel

theorem square_integral_checked :
    (p49.mul p49).integralRat (-1) 1 = (2 / 99 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p49 49 = ((3184701532372607112841303575 / 70368744177664) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder49
