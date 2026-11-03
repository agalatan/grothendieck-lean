import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder04

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p04 (recurrenceStep 2 p02 p03) = true := by
  decide +kernel

theorem identities_checked :
    check 3 p03 p04 w04 r04 = true := by
  decide +kernel

theorem square_integral_checked :
    (p04.mul p04).integralRat (-1) 1 = (2 / 9 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p04 4 = ((35 / 8) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder04
