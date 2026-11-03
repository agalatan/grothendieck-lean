import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder53

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p53 (recurrenceStep 51 p51 p52) = true := by
  decide +kernel

theorem identities_checked :
    check 52 p52 p53 w53 r53 = true := by
  decide +kernel

theorem square_integral_checked :
    (p53.mul p53).integralRat (-1) 1 = (2 / 107 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p53 53 = ((392032816163265715595619229845 / 562949953421312) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder53
