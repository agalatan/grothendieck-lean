/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import HaagerupKernel.FastHead
import Haagerup.Data.OverlapData

/-!
# The head check

This file contains the fact `head_sum_ok` of Computation 4 (head) of the article: the checker
`HaagerupKernel.FastHead.fastHeadOK`, which runs the fixed-point algorithm of Appendix A.5 (the head), returns
`true` on the table `tcellRows` of Computation 3 (energies of `f_sm`), the table `tigMuList` of Computation 2
(overlaps of `f_tig`) and the parameters of Table 1 (the rational parameters of the six-channel certificate). The
fact is proved by evaluation in Lean's kernel (`decide +kernel`).

The parameters are given here in the form which the checker expects: the channel polynomials as sparse lists of
pairs `(degree, numerator)` (`p0Sparse`, `p1Sparse`, `p2Sparse`, `r3Sparse`, `r4Sparse`, `p5Sparse`) with their
denominators, and the weights, the centre `c_cert` and the cap `η_cert` of equation (5.2) as numerators over
`10^12`. They are the same numbers as in `Haagerup/Parameters.lean`; the identifications are proved in
`Haagerup/CertCheck.lean`, where `head_sum_ok` is used through the soundness theorem
`head_residual_of_fastHeadOK` of `Haagerup/FastHeadSound.lean` to obtain the head bound, Proposition 6.2 (head
bound).

-/

set_option warningAsError true

namespace Haagerup
open HaagerupKernel HaagerupKernel.FastHead Haagerup.Data

/-- The polynomial `P₀ = (991 - 9 X) / 1000` of channel 0, as pairs `(degree, numerator)` over `d0Sparse`. -/
def p0Sparse : List (Nat × Int) := [(0, 991), (1, -9)]
/-- The polynomial `P₁ = (99 - X) / 100` of channel 1, as pairs `(degree, numerator)` over `d1Sparse`. -/
def p1Sparse : List (Nat × Int) := [(0, 99), (1, -1)]
/-- The polynomial `P₂` of channel 2 (degree 14, ten nonzero coefficients), as pairs `(degree, numerator)` over
`d12Sparse`. -/
def p2Sparse : List (Nat × Int) := [
  (0, 91987193366), (1, -494518221970), (2, 403975324766), (3, -99055436),
  (7, -27080072), (8, -217490491), (9, -7730415), (11, -10946266),
  (13, 475570792), (14, 8681386426)
]
/-- The polynomial `R₃ = (980543369477 - 19456630523 X) / 10^12` of channel 3, as pairs `(degree, numerator)` over
`d12Sparse`. -/
def r3Sparse : List (Nat × Int) := [(0, 980543369477), (1, -19456630523)]
/-- The polynomial `R₄ = (930767036298 - 69232963702 X) / 10^12` of channel 4, as pairs `(degree, numerator)` over
`d12Sparse`. -/
def r4Sparse : List (Nat × Int) := [(0, 930767036298), (1, -69232963702)]
/-- The polynomial `P₅` of channel 5 (degree 12, four nonzero coefficients), as pairs `(degree, numerator)` over
`d12Sparse`. -/
def p5Sparse : List (Nat × Int) := [
  (0, 963782504048), (1, -7609745775), (3, -26371854429), (12, 2235895748)
]

/-- The denominator `1000` of the coefficients of `P₀`. -/
def d0Sparse : Nat := 1000
/-- The denominator `100` of the coefficients of `P₁`. -/
def d1Sparse : Nat := 100
/-- The denominator `Δ = 10^12` of the coefficients of `P₂`, `R₃`, `R₄`, `P₅`, of the weights, of the centre and of
the cap. -/
def d12Sparse : Nat := 1000000000000

/-- The numerator of the weight `w₀ = 855656321685 / 10^12`. -/
def w0Sparse : Nat := 855656321685
/-- The numerator of the weight `w₁ = 87304183672 / 10^12`. -/
def w1Sparse : Nat := 87304183672
/-- The numerator of the weight `w₂ = 156229336 / 10^12`. -/
def w2Sparse : Nat := 156229336
/-- The numerator of the weight `w₃ = 117021055 / 10^12`. -/
def w3Sparse : Nat := 117021055
/-- The numerator of the weight `w₄ = 56415370682 / 10^12`. -/
def w4Sparse : Nat := 56415370682
/-- The numerator of the weight `w₅ = 350873570 / 10^12`. -/
def w5Sparse : Nat := 350873570

/-- The numerator of the centre `c_cert = 711974258589 / 10^12` (`Haagerup.cCertQ`). -/
def cCertNum : Nat := 711974258589
/-- The numerator of the head cap `η_cert = 6157850 / 10^12` (`Haagerup.headCapCertQ`). -/
def headCapNum : Nat := 6157850

/-- Computation 4 (head) of the article, parts (a) and (b): the checker `fastHeadOK` returns `true` on the two
tables and the parameters of the certificate. The proof is an evaluation in Lean's kernel. -/
theorem head_sum_ok :
    fastHeadOK tcellRows tigMuList
      p0Sparse p1Sparse p2Sparse r3Sparse r4Sparse p5Sparse
      d0Sparse d1Sparse d12Sparse d12Sparse d12Sparse d12Sparse
      w0Sparse w1Sparse w2Sparse w3Sparse w4Sparse w5Sparse d12Sparse
      cCertNum d12Sparse headCapNum d12Sparse = true := by
  decide +kernel

end Haagerup
