import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder43

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p43 (recurrenceStep 41 p41 p42) = true := by
  decide +kernel

theorem identities_checked :
    check 42 p42 p43 w43 r43 = true := by
  decide +kernel

theorem square_integral_checked :
    (p43.mul p43).integralRat (-1) 1 = (2 / 87 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p43 43 = ((414847067813984717066925 / 549755813888) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder43
