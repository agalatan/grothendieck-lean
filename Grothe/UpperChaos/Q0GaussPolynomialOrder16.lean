import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder16

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p16 (recurrenceStep 14 p14 p15) = true := by
  decide +kernel

theorem identities_checked :
    check 15 p15 p16 w16 r16 = true := by
  decide +kernel

theorem square_integral_checked :
    (p16.mul p16).integralRat (-1) 1 = (2 / 33 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p16 16 = ((300540195 / 32768) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder16
