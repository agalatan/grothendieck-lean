import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder07

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p07 (recurrenceStep 5 p05 p06) = true := by
  decide +kernel

theorem identities_checked :
    check 6 p06 p07 w07 r07 = true := by
  decide +kernel

theorem square_integral_checked :
    (p07.mul p07).integralRat (-1) 1 = (2 / 15 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p07 7 = ((429 / 16) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder07
