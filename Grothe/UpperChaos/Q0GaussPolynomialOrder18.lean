import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder18

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p18 (recurrenceStep 16 p16 p17) = true := by
  decide +kernel

theorem identities_checked :
    check 17 p17 p18 w18 r18 = true := by
  decide +kernel

theorem square_integral_checked :
    (p18.mul p18).integralRat (-1) 1 = (2 / 37 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p18 18 = ((2268783825 / 65536) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder18
