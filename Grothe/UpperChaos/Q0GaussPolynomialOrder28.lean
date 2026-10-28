import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder28

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p28 (recurrenceStep 26 p26 p27) = true := by
  decide +kernel

theorem identities_checked :
    check 27 p27 p28 w28 r28 = true := by
  decide +kernel

theorem square_integral_checked :
    (p28.mul p28).integralRat (-1) 1 = (2 / 57 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p28 28 = ((956086325095055 / 33554432) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder28
