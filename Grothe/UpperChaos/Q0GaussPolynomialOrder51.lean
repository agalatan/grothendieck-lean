import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder51

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p51 (recurrenceStep 49 p49 p50) = true := by
  decide +kernel

theorem identities_checked :
    check 50 p50 p51 w51 r51 = true := by
  decide +kernel

theorem square_integral_checked :
    (p51.mul p51).integralRat (-1) 1 = (2 / 103 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p51 51 = ((24975553429171528252000152507 / 140737488355328) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder51
