import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder15

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p15 (recurrenceStep 13 p13 p14) = true := by
  decide +kernel

theorem identities_checked :
    check 14 p14 p15 w15 r15 = true := by
  decide +kernel

theorem square_integral_checked :
    (p15.mul p15).integralRat (-1) 1 = (2 / 31 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p15 15 = ((9694845 / 2048) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder15
