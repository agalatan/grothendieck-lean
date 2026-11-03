import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder17

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p17 (recurrenceStep 15 p15 p16) = true := by
  decide +kernel

theorem identities_checked :
    check 16 p16 p17 w17 r17 = true := by
  decide +kernel

theorem square_integral_checked :
    (p17.mul p17).integralRat (-1) 1 = (2 / 35 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p17 17 = ((583401555 / 32768) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder17
