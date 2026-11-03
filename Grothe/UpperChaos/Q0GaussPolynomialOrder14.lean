import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder14

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p14 (recurrenceStep 12 p12 p13) = true := by
  decide +kernel

theorem identities_checked :
    check 13 p13 p14 w14 r14 = true := by
  decide +kernel

theorem square_integral_checked :
    (p14.mul p14).integralRat (-1) 1 = (2 / 29 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p14 14 = ((5014575 / 2048) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder14
