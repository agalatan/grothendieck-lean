import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder37

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p37 (recurrenceStep 35 p35 p36) = true := by
  decide +kernel

theorem identities_checked :
    check 36 p36 p37 w37 r37 = true := by
  decide +kernel

theorem square_integral_checked :
    (p37.mul p37).integralRat (-1) 1 = (2 / 75 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p37 37 = ((218266320541953276229 / 17179869184) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder37
