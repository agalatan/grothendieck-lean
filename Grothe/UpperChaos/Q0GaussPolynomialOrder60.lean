import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder60

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p60 (recurrenceStep 58 p58 p59) = true := by
  decide +kernel

theorem identities_checked :
    check 59 p59 p60 w60 r60 = true := by
  decide +kernel

theorem square_integral_checked :
    (p60.mul p60).integralRat (-1) 1 = (2 / 121 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p60 60 = ((6038431802522707662743321220085791 / 72057594037927936) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder60
