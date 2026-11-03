import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder09

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p09 (recurrenceStep 7 p07 p08) = true := by
  decide +kernel

theorem identities_checked :
    check 8 p08 p09 w09 r09 = true := by
  decide +kernel

theorem square_integral_checked :
    (p09.mul p09).integralRat (-1) 1 = (2 / 19 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p09 9 = ((12155 / 128) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder09
