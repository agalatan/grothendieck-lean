import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder34

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p34 (recurrenceStep 32 p32 p33) = true := by
  decide +kernel

theorem identities_checked :
    check 33 p33 p34 w34 r34 = true := by
  decide +kernel

theorem square_integral_checked :
    (p34.mul p34).integralRat (-1) 1 = (2 / 69 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p34 34 = ((7113260368810144185 / 4294967296) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder34
