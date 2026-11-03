import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder54

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p54 (recurrenceStep 52 p52 p53) = true := by
  decide +kernel

theorem identities_checked :
    check 53 p53 p54 w54 r54 = true := by
  decide +kernel

theorem square_integral_checked :
    (p54.mul p54).integralRat (-1) 1 = (2 / 109 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p54 54 = ((1553611530721090058101157688645 / 1125899906842624) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder54
