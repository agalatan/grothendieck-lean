import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder58

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p58 (recurrenceStep 56 p56 p57) = true := by
  decide +kernel

theorem identities_checked :
    check 57 p57 p58 w58 r58 = true := by
  decide +kernel

theorem square_integral_checked :
    (p58.mul p58).integralRat (-1) 1 = (2 / 117 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p58 58 = ((383826197316138496123525050619545 / 18014398509481984) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder58
