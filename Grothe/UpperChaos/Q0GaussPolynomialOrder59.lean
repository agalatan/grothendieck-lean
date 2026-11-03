import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder59

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p59 (recurrenceStep 57 p57 p58) = true := by
  decide +kernel

theorem identities_checked :
    check 58 p58 p59 w59 r59 = true := by
  decide +kernel

theorem square_integral_checked :
    (p59.mul p59).integralRat (-1) 1 = (2 / 119 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p59 59 = ((761146865864206848244956456313335 / 18014398509481984) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder59
