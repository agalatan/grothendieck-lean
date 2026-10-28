import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder42

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p42 (recurrenceStep 40 p40 p41) = true := by
  decide +kernel

theorem identities_checked :
    check 41 p41 p42 w42 r42 = true := by
  decide +kernel

theorem square_integral_checked :
    (p42.mul p42).integralRat (-1) 1 = (2 / 85 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p42 42 = ((209863810776486386280915 / 549755813888) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder42
