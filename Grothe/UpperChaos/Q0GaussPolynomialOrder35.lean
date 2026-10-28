import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder35

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p35 (recurrenceStep 33 p33 p34) = true := by
  decide +kernel

theorem identities_checked :
    check 34 p34 p35 w35 r35 = true := by
  decide +kernel

theorem square_integral_checked :
    (p35.mul p35).integralRat (-1) 1 = (2 / 71 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p35 35 = ((14023284727082855679 / 4294967296) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder35
