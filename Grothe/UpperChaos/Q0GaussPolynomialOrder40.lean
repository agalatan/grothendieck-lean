import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder40

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p40 (recurrenceStep 38 p38 p39) = true := by
  decide +kernel

theorem identities_checked :
    check 39 p39 p40 w40 r40 = true := by
  decide +kernel

theorem square_integral_checked :
    (p40.mul p40).integralRat (-1) 1 = (2 / 81 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p40 40 = ((26876802183334044115405 / 274877906944) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder40
