import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder32

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p32 (recurrenceStep 30 p30 p31) = true := by
  decide +kernel

theorem identities_checked :
    check 31 p31 p32 w32 r32 = true := by
  decide +kernel

theorem square_integral_checked :
    (p32.mul p32).integralRat (-1) 1 = (2 / 65 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p32 32 = ((916312070471295267 / 2147483648) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder32
