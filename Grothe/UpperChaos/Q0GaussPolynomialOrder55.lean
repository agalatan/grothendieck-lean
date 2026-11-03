import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder55

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p55 (recurrenceStep 53 p53 p54) = true := by
  decide +kernel

theorem identities_checked :
    check 54 p54 p55 w55 r55 = true := by
  decide +kernel

theorem square_integral_checked :
    (p55.mul p55).integralRat (-1) 1 = (2 / 111 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p55 55 = ((3078975579065433024236839782951 / 1125899906842624) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder55
