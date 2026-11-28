/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import Mathlib.Data.Rat.Defs

/-!
# The rational parameters of the six-channel certificate

The numbers of Table 1 and of equations (4.8) and (5.2) of the article, as rational numbers and as lists of rational
coefficients (a list `[a₀, a₁, …]` stands for the polynomial `a₀ + a₁ X + …`). The channels are indexed by
`p : Fin 6` as in the article: channels 0, 1 and 5 use the smoothed cell map with the polynomials `(P_p, Q_p)`,
channel 2 is Haagerup's phase channel with the polynomial `P₂`, and channels 3 and 4 use the reflected pair with the
polynomials `(-R_p, R_p)`.

The relations between these numbers that the proof needs (Computation 7 of the article) are proved in
`Haagerup/CertCheck.lean` and `Haagerup.lean`.
-/

set_option warningAsError true

namespace Haagerup

/-- The denominator `Δ = 10¹²` of Table 1. -/
def d12Q : ℚ := 1000000000000
/-- The denominator `Δ₆ = 10⁶` of Table 1. -/
def d6Q : ℚ := 1000000

/-- `c_θ` of (4.8): the cosine of the rotation of the smoothing; `c_θ² + s_θ² = 1`. -/
def ctQ : ℚ := 23187 / 24245
/-- `s_θ` of (4.8): the sine of the rotation of the smoothing. -/
def stQ : ℚ := 7084 / 24245
/-- `s_η` of (4.8): the weight of the map in the smoothing; `s_η² + c_η² = 1`. -/
def seQ : ℚ := 87841 / 98209
/-- `c_η` of (4.8): the weight of the noise in the smoothing. -/
def ceQ : ℚ := 43920 / 98209

/-- The weights `w_p` of the six channels; they are positive and their sum is `1`. -/
def wQ : Fin 6 → ℚ
  | 0 => 855656321685 / d12Q
  | 1 => 87304183672 / d12Q
  | 2 => 156229336 / d12Q
  | 3 => 117021055 / d12Q
  | 4 => 56415370682 / d12Q
  | 5 => 350873570 / d12Q

/-- The coefficients of `P₀ = 991/1000 − 9/1000 X`. -/
def p0Q : List ℚ := [991 / 1000, -9 / 1000]
/-- The coefficients of `Q₀ = −X`. -/
def q0Q : List ℚ := [0, -1]

/-- The coefficients of `P₁ = 99/100 − 1/100 X`. -/
def p1Q : List ℚ := [99 / 100, -1 / 100]
/-- The coefficients of `Q₁ = −X`. -/
def q1Q : List ℚ := [0, -1]

/-- The coefficients of the polynomial `P₂` of degree 14 of the phase channel. -/
def p2Q : List ℚ := [
  91987193366 / d12Q, -494518221970 / d12Q, 403975324766 / d12Q, -99055436 / d12Q,
  0, 0, 0, -27080072 / d12Q, -217490491 / d12Q, -7730415 / d12Q,
  0, -10946266 / d12Q, 0, 475570792 / d12Q, 8681386426 / d12Q
]

/-- The coefficients of `R₃`; channel 3 uses the pair `(−R₃, R₃)`. -/
def r3Q : List ℚ := [980543369477 / d12Q, -19456630523 / d12Q]
/-- The coefficients of `R₄`; channel 4 uses the pair `(−R₄, R₄)`. -/
def r4Q : List ℚ := [930767036298 / d12Q, -69232963702 / d12Q]

/-- The coefficients of the polynomial `P₅` of degree 12. -/
def p5Q : List ℚ := [
  963782504048 / d12Q, -7609745775 / d12Q, 0, -26371854429 / d12Q,
  0, 0, 0, 0, 0, 0, 0, 0, 2235895748 / d12Q
]
/-- The coefficients of `Q₅ = −X`. -/
def q5Q : List ℚ := [0, -1]

/-- The radii `ϱ_p > 1` of the circles on which the mean squares are bounded (Computation 6). -/
def rhoQ : Fin 6 → ℚ
  | 0 => 1037 / 1000
  | 1 => 1037 / 1000
  | 2 => 103 / 100
  | 3 => 207 / 200
  | 4 => 109 / 100
  | 5 => 1037 / 1000

/-- The radii `r_reg,p > ϱ_p` of the disks of holomorphy (Computation 5). -/
def regRQ : Fin 6 → ℚ
  | 0 => 1038 / 1000
  | 1 => 4153 / 4000
  | 2 => 259 / 250
  | 3 => 259 / 250
  | 4 => 1091 / 1000
  | 5 => 4153 / 4000

/-- The weight parameters `β_p` of the Schur denominators (Definition 5.3). -/
def jCertQ : Fin 6 → ℚ
  | 0 => 1 / 4
  | 1 => 1 / 4
  | 2 => 1 / 5
  | 3 => 2 / 5
  | 4 => 2 / 5
  | 5 => 1 / 5

/-- The bounds `B_p` for the mean squares on the circles of radius `ϱ_p` (Computation 6). -/
def budgetQ : Fin 6 → ℚ
  | 0 => 2528814 / d6Q
  | 1 => 2507841 / d6Q
  | 2 => 2919013 / d6Q
  | 3 => 1692090 / d6Q
  | 4 => 1658129 / d6Q
  | 5 => 3355048 / d6Q

/-- The tail bounds `τ_p`: `∑_{k > 250} |h⁽ᵖ⁾_k| ≤ τ_p` (Proposition 7.11). -/
def tailQ : Fin 6 → ℚ
  | 0 => 50024 / d12Q
  | 1 => 49816 / d12Q
  | 2 => 1785796 / d12Q
  | 3 => 110835 / d12Q
  | 4 => 3 / d12Q
  | 5 => 57619 / d12Q

/-- The centre `c_cert` of (5.2). -/
def cCertQ : ℚ := 711974258589 / d12Q
/-- The head bound `η_cert` of (5.2): the bound of Computation 4 for the first 251 coefficients of the mixture. -/
def headCapCertQ : ℚ := 6157850 / d12Q
/-- The error budget `δ_cert` of (5.2). It equals `headCapCertQ + ∑ p, wQ p * tailQ p`; the proof of `isBound_cert`
checks and uses the inequality `headCapCertQ + ∑ p, wQ p * tailQ p ≤ deltaCertQ`. -/
def deltaCertQ : ℚ := 6205314847032059049 / 1000000000000000000000000

end Haagerup
