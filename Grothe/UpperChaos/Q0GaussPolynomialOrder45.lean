import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialData

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.Q0GaussPolynomialOrder45

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem recurrence_checked :
    checkEq p45 (recurrenceStep 43 p43 p44) = true := by
  decide +kernel

theorem identities_checked :
    check 44 p44 p45 w45 r45 = true := by
  decide +kernel

theorem square_integral_checked :
    (p45.mul p45).integralRat (-1) 1 = (2 / 91 : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p45 45 = ((6489213830472088210604445 / 2199023255552) : ℚ) := by
  decide +kernel

end Grothe.UpperChaos.Q0GaussPolynomialOrder45
