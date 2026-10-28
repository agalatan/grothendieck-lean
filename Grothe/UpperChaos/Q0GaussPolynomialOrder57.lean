import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder57

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p57 (recurrenceStep 55 p55 p56) = true := by
  decide +kernel

theorem identities_checked :
    check 56 p56 p57 w57 r57 = true := by
  decide +kernel

theorem square_integral_checked :
    (p57.mul p57).integralRat (-1) 1 = (2 / 115 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p57 57 = ((96790954105808838152888925808407 / 9007199254740992) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder57
