import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder47

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p47 (recurrenceStep 45 p45 p46) = true := by
  decide +kernel

theorem identities_checked :
    check 46 p46 p47 w47 r47 = true := by
  decide +kernel

theorem square_integral_checked :
    (p47.mul p47).integralRat (-1) 1 = (2 / 95 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p47 47 = ((50803160635786570329644235 / 4398046511104) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder47
