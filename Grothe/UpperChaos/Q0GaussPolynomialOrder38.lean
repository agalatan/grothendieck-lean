import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder38

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p38 (recurrenceStep 36 p36 p37) = true := by
  decide +kernel

theorem identities_checked :
    check 37 p37 p38 w38 r38 = true := by
  decide +kernel

theorem square_integral_checked :
    (p38.mul p38).integralRat (-1) 1 = (2 / 77 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p38 38 = ((861577581086657669325 / 34359738368) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder38
