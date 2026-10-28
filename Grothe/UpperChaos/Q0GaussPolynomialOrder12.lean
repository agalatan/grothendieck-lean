import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder12

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p12 (recurrenceStep 10 p10 p11) = true := by
  decide +kernel

theorem identities_checked :
    check 11 p11 p12 w12 r12 = true := by
  decide +kernel

theorem square_integral_checked :
    (p12.mul p12).integralRat (-1) 1 = (2 / 25 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p12 12 = ((676039 / 1024) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder12
