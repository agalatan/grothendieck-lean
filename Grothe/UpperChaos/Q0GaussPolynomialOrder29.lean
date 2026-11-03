import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder29

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p29 (recurrenceStep 27 p27 p28) = true := by
  decide +kernel

theorem identities_checked :
    check 28 p28 p29 w29 r29 = true := by
  decide +kernel

theorem square_integral_checked :
    (p29.mul p29).integralRat (-1) 1 = (2 / 59 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p29 29 = ((1879204156221315 / 33554432) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder29
