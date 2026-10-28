import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder20

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p20 (recurrenceStep 18 p18 p19) = true := by
  decide +kernel

theorem identities_checked :
    check 19 p19 p20 w20 r20 = true := by
  decide +kernel

theorem square_integral_checked :
    (p20.mul p20).integralRat (-1) 1 = (2 / 41 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p20 20 = ((34461632205 / 262144) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder20
