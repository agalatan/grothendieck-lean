import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder61

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p61 (recurrenceStep 59 p59 p60) = true := by
  decide +kernel

theorem identities_checked :
    check 60 p60 p61 w61 r61 = true := by
  decide +kernel

theorem square_integral_checked :
    (p61.mul p61).integralRat (-1) 1 = (2 / 123 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p61 61 = ((11977872919758157822818719141481651 / 72057594037927936) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder61
