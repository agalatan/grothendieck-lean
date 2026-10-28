import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder23

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p23 (recurrenceStep 21 p21 p22) = true := by
  decide +kernel

theorem identities_checked :
    check 22 p22 p23 w23 r23 = true := by
  decide +kernel

theorem square_integral_checked :
    (p23.mul p23).integralRat (-1) 1 = (2 / 47 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p23 23 = ((514589420475 / 524288) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder23
