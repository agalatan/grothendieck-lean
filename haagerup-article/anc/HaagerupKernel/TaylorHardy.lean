/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import HaagerupKernel.Basic

/-!
# Taylor models of degree two on the circle

This file defines the Boolean checkers of Computation 5 (positivity on the outer circles) and Computation 6
(circle means) of the article, which use the Taylor models of Appendix A.6 (Taylor models on the circle). It imports
only `HaagerupKernel.Basic`; all its arithmetic is exact integer and rational arithmetic, which Lean's kernel
evaluates (`decide +kernel`) in the twelve facts `reg0_ok`, …, `reg5_ok`, `mean0_ok`, …, `mean5_ok` of
`Haagerup/ContourChecks/`.

## Contents

1. Taylor models `TM2`: a quadruple `(c, d, q; r)` of integers, `r ≥ 0`, is a model of a real function `g` on a
   subinterval `[σ₀ - ε, σ₀ + ε]` if `|2^64 * g(σ₀ + ε u) - (c + d u + q u²)| ≤ r` for all `u ∈ [-1, 1]`. The
   operations are `tmAdd`, `tmSub`, `tmNeg`, `tmDouble`, `tmHalf`, `tmMul` and the reciprocal `tmInvPos`; `tmLo` is a
   lower bound for `2^64 * g`, and a function is certified to be positive only through `tmLo`.
2. Models `TMC` of complex functions and `SCT` of complex symmetric `2 × 2` matrices; the matrices `Γ_p(t)` of
   equation (5.3) of the article (`evalRSmoothed`, `evalOddPoly`) and the parametrisation
   `t_ϱ(σ) = ϱ (1 - σ² + 2 i σ) / (1 + σ²)`, `σ ∈ [0, 1]`, of the arc of the circle `|t| = ϱ` in the first quadrant,
   equation (5.4) (`circleTM`). In the Lean code the variable `σ` is called `s`.
3. Computation 5: `regQ1SmoothedOK` (channels 0, 1, 5) and `regQ1DiagOK` (channels 2, 3, 4) check that
   `I - Re Γ_p(t)` and `I + Re Γ_p(t)` are positive definite on the arc of radius `r_reg,p`.
4. Computation 6: `meanQ1SmoothedOK` (channels 0, 1, 5), `meanQ1PhaseOK` (channel 2) and `meanQ1AntiOK` (channels
   3, 4) check that the pair `(Γ_p(t), β_p)` is admissible on the arc of radius `ϱ_p` and that
   `(4 / π) ∫₀¹ dσ / ((1 + σ²) Λ_β(Γ_p(t_ϱ(σ)))) ≤ B_p`, where `Λ_β` is the Schur denominator of Definition 5.3
   (Schur denominator). For the diagonal matrices of channels 2, 3, 4 they use the closed formula of Lemma A.4
   (the Schur denominator of a diagonal matrix) in `gauss1DFactorTM`.

In the names, `Q1` stands for the first quadrant. The partition of `[0, 1]` is given by an exponent `k` and a list
`steps` of natural numbers with sum `2^k`: the subintervals have the lengths `w / 2^k`, `w ∈ steps`, in this order.
The parameter `β` of the article is called `j` in the Lean code.

## Soundness

`Haagerup/TaylorHardySound.lean` proves that the operations preserve the model relation (`Haagerup.memTM2`) and
derives the conclusions of the two computations: `kerPos_on_ball_of_regQ1SmoothedOK`,
`kerPos_on_ball_of_regQ1PhaseOK`, `kerPos_on_ball_of_regQ1AntiOK` for Computation 5, and the tail bounds
`hardy_smoothed_channel_tm`, `hardy_phase_channel_tm`, `hardy_anti_channel_tm` of Proposition 7.11 (tail bounds),
which use Computation 6.

-/

set_option warningAsError true

namespace HaagerupKernel.TaylorHardy

open HaagerupKernel

/-! ### 1. Integer operations at scale `2^64` -/

/-- `2^64`, the scale of the Taylor models, as a natural number. -/
def D64N : Nat := 18446744073709551616
/-- `2^64`, the scale of the Taylor models, as an integer. -/
def D64 : Int := 18446744073709551616
/-- `2^128 = (2^64)^2`. -/
def D64SqN : Nat := 340282366920938463463374607431768211456

/-- Addition of integers, `a + b`. -/
@[inline] def iAdd (a b : Int) : Int := Int.add a b
/-- Subtraction of integers, `a - b`. -/
@[inline] def iSub (a b : Int) : Int := Int.sub a b
/-- Multiplication of integers, `a * b`. -/
@[inline] def iMul (a b : Int) : Int := Int.mul a b
/-- Negation of an integer, `-a`. -/
@[inline] def iNeg (a : Int) : Int := Int.neg a

/-- Absolute value of an integer as a natural number: `iAbs a = a.natAbs`. -/
@[inline] def iAbs (a : Int) : Nat :=
  match a with
  | Int.ofNat n => n
  | Int.negSucc n => Nat.succ n

/-- `iPos a = true` if and only if `0 < a`. -/
@[inline] def iPos (a : Int) : Bool :=
  match a with
  | Int.ofNat (Nat.succ _) => true
  | _ => false

/-- `iLe a b = true` if and only if `a ≤ b`. -/
@[inline] def iLe (a b : Int) : Bool :=
  match Int.sub b a with
  | Int.ofNat _ => true
  | Int.negSucc _ => false

/-- Floor division by `D64 = 2^64` (equals `Int.ediv x D64`). -/
@[inline] def fDown (x : Int) : Int :=
  match x with
  | Int.ofNat n => Int.ofNat (Nat.div n 18446744073709551616)
  | Int.negSucc n => Int.negSucc (Nat.div n 18446744073709551616)

/-- Ceiling division of `n : Nat` by `D64 = 2^64`. -/
@[inline] def fUpNat (n : Nat) : Nat :=
  match n with
  | 0 => 0
  | Nat.succ m => Nat.succ (Nat.div m 18446744073709551616)

/-- Ceiling division of `n : Nat` by `d : Nat` (`d > 0`). -/
@[inline] def divUpNat (n d : Nat) : Nat :=
  match n with
  | 0 => 0
  | Nat.succ m => Nat.succ (Nat.div m d)

/-- Floor division by `2` (equals `Int.ediv x 2`). -/
@[inline] def iHalfDown (x : Int) : Int :=
  match x with
  | Int.ofNat n => Int.ofNat (Nat.div n 2)
  | Int.negSucc n => Int.negSucc (Nat.div n 2)

/-- Floor of `q * D64`. -/
def ofRatDown64 (q : Rat) : Int := Rat.floor (q * (D64 : Rat))

/-! ### 2. Degree-2 Taylor models `TM2` on `u ∈ [-1, 1]` -/

/-- Taylor model of degree two at scale `2^64`: the quadruple `(c, d, q; r)` is a model of a real function `g` of
`u ∈ [-1, 1]` if `|2^64 * g(u) - (c + d u + q u²)| ≤ r` for all such `u` (the relation `Haagerup.memTM2`). In the
article this is the quadruple `(𝔞₀, 𝔞₁, 𝔞₂; 𝔯)` of Appendix A.6, with `u` the rescaled variable of a subinterval. -/
structure TM2 where
  c : Int
  d : Int
  q : Int
  r : Nat

/-- The exact model of the constant function `0`. -/
@[inline] def tmZero : TM2 := ⟨0, 0, 0, 0⟩
/-- The exact model of the constant function `1`. -/
@[inline] def tmOne : TM2 := ⟨D64, 0, 0, 0⟩

/-- The model `(⌊2^64 * q⌋, 0, 0; 1)` of the constant function with the rational value `q`. -/
def ofRatTM (q : Rat) : TM2 := ⟨ofRatDown64 q, 0, 0, 1⟩

/-- Sum of two Taylor models: the coefficients and the remainders are added. -/
@[inline] def tmAdd (a b : TM2) : TM2 :=
  ⟨iAdd a.c b.c, iAdd a.d b.d, iAdd a.q b.q, Nat.add a.r b.r⟩

/-- Difference of two Taylor models: the coefficients are subtracted and the remainders are added. -/
@[inline] def tmSub (a b : TM2) : TM2 :=
  ⟨iSub a.c b.c, iSub a.d b.d, iSub a.q b.q, Nat.add a.r b.r⟩

/-- Negative of a Taylor model: the coefficients change sign and the remainder is kept. -/
@[inline] def tmNeg (a : TM2) : TM2 :=
  ⟨iNeg a.c, iNeg a.d, iNeg a.q, a.r⟩

/-- Twice a Taylor model: the coefficients and the remainder are doubled. -/
@[inline] def tmDouble (a : TM2) : TM2 :=
  ⟨iAdd a.c a.c, iAdd a.d a.d, iAdd a.q a.q, Nat.add a.r a.r⟩

/-- Half of a Taylor model: the three coefficients are halved and rounded down, and the remainder is
`⌈r / 2⌉ + 2`. -/
@[inline] def tmHalf (a : TM2) : TM2 :=
  ⟨iHalfDown a.c, iHalfDown a.d, iHalfDown a.q, Nat.add (Nat.div (Nat.add a.r 1) 2) 2⟩

/-- Product of two Taylor models `(a; r)` and `(b; s)`, as in Appendix A.6 of the article. The coefficients are
`⌊a₀ b₀ / 2^64⌋`, `⌊(a₀ b₁ + a₁ b₀) / 2^64⌋`, `⌊(a₀ b₂ + a₁ b₁ + a₂ b₀) / 2^64⌋`, and the remainder is
`⌈(|a₁ b₂ + a₂ b₁| + |a₂ b₂| + r |b| + s |a| + r s) / 2^64⌉ + 3`, where `|a| = |a₀| + |a₁| + |a₂|`; here
`(a₀, a₁, a₂) = (a.c, a.d, a.q)`. The terms of degree three and four of the product of the two polynomials are
absorbed into the remainder. -/
@[inline] def tmMul (a b : TM2) : TM2 :=
  let c := fDown (iMul a.c b.c)
  let d := fDown (iAdd (iMul a.c b.d) (iMul a.d b.c))
  let q := fDown (iAdd (iAdd (iMul a.c b.q) (iMul a.d b.d)) (iMul a.q b.c))
  let b1 := Nat.add (Nat.add (iAbs a.c) (iAbs a.d)) (iAbs a.q)
  let b2 := Nat.add (Nat.add (iAbs b.c) (iAbs b.d)) (iAbs b.q)
  let t3 := iAbs (iAdd (iMul a.d b.q) (iMul a.q b.d))
  let t4 := Nat.mul (iAbs a.q) (iAbs b.q)
  let tr := Nat.add (Nat.add t3 t4)
    (Nat.add (Nat.add (Nat.mul a.r b2) (Nat.mul b.r b1)) (Nat.mul a.r b.r))
  ⟨c, d, q, Nat.add (fUpNat tr) 3⟩

/-- The lower bound `c - |d| - |q| - r` of a Taylor model: if the model represents `g`, then `2^64 * g ≥ tmLo` on
the subinterval. -/
@[inline] def tmLo (a : TM2) : Int :=
  iSub a.c (Int.ofNat (Nat.add (Nat.add (iAbs a.d) (iAbs a.q)) a.r))

/-- The bound `|c| + |d| + |q| + r` of a Taylor model: if the model represents `g`, then `2^64 * |g| ≤ tmAbsHi` on
the subinterval. -/
@[inline] def tmAbsHi (a : TM2) : Nat :=
  Nat.add (Nat.add (Nat.add (iAbs a.c) (iAbs a.d)) (iAbs a.q)) a.r

/-- Reciprocal of a Taylor model with positive lower bound, as in Appendix A.6 of the article. If `a` is a model of
`g` with `a.c ≥ 0` and `tmLo a > 0`, the result is `some` model of `1 / g`; otherwise it is `none`. A quadratic
polynomial `p` is proposed (the first terms of the geometric series, starting with `⌊2^128 / a.c⌋`), and a model
`res` of `1 - g * p` is computed with `tmMul` and `tmSub`. Since
`|1 / g - p| = |1 - g * p| / g ≤ tmAbsHi res / tmLo a`, the model is `p` with the remainder
`⌈2^64 * tmAbsHi res / tmLo a⌉`. -/
@[inline] def tmInvPos (a : TM2) : Option TM2 :=
  let mN := Nat.add (Nat.add (iAbs a.d) (iAbs a.q)) a.r
  let lo := iSub a.c (Int.ofNat mN)
  match a.c, lo with
  | Int.ofNat cN, Int.ofNat (Nat.succ loM) =>
    let loN := Nat.succ loM
    let icN := Nat.div D64SqN cN
    let ic := Int.ofNat icN
    let ic2 := fDown (iMul ic ic)
    let d2 := fDown (iMul (iNeg a.d) ic2)
    let d2c := fDown (iMul (fDown (iMul a.d a.d)) ic)
    let q2 := fDown (iMul (iSub d2c a.q) ic2)
    let p : TM2 := ⟨ic, d2, q2, 0⟩
    let res := tmSub tmOne (tmMul a p)
    let ah := tmAbsHi res
    let rem := divUpNat (Nat.mul ah D64N) loN
    some ⟨ic, d2, q2, rem⟩
  | _, _ => none

/-! ### 3. Complex Taylor models and models of symmetric `2 × 2` matrices -/

/-- Taylor model of a complex function: Taylor models of its real part and of its imaginary part. -/
structure TMC where
  re : TM2
  im : TM2

/-- A real Taylor model as a complex one, with imaginary part `0`. -/
@[inline] def tmcOfR (a : TM2) : TMC := ⟨a, tmZero⟩
/-- The exact complex model of the constant function `1`. -/
@[inline] def tmcOne : TMC := ⟨tmOne, tmZero⟩
/-- Sum of two complex Taylor models. -/
@[inline] def tmcAdd (z w : TMC) : TMC := ⟨tmAdd z.re w.re, tmAdd z.im w.im⟩
/-- Difference of two complex Taylor models. -/
@[inline] def tmcSub (z w : TMC) : TMC := ⟨tmSub z.re w.re, tmSub z.im w.im⟩
/-- Negative of a complex Taylor model. -/
@[inline] def tmcNeg (z : TMC) : TMC := ⟨tmNeg z.re, tmNeg z.im⟩
/-- Product of two complex Taylor models: `(z.re w.re - z.im w.im) + i (z.re w.im + z.im w.re)`, with the real
products computed by `tmMul`. -/
@[inline] def tmcMul (z w : TMC) : TMC :=
  ⟨tmSub (tmMul z.re w.re) (tmMul z.im w.im), tmAdd (tmMul z.re w.im) (tmMul z.im w.re)⟩
/-- Real Taylor model of the squared modulus `|z|² = (Re z)² + (Im z)²` of a complex Taylor model. -/
@[inline] def tmcNormSq (z : TMC) : TM2 := tmAdd (tmMul z.re z.re) (tmMul z.im z.im)

/-- Horner evaluation `c₀ + x (c₁ + x (…))` for real-coefficient polynomial `cs`. -/
def tmcHorner (x : TMC) : List TM2 → TMC
  | [] => ⟨tmZero, tmZero⟩
  | c :: cs => tmcAdd (tmcOfR c) (tmcMul x (tmcHorner x cs))

/-- Taylor model of a complex symmetric `2 × 2` matrix with the rows `(a, b)` and `(b, c)`. -/
structure SCT where
  a : TMC
  b : TMC
  c : TMC

/-- The data of a smoothed channel as Taylor models of constants: the products `m00²`, `m01²`, `m00 m01`,
`m01 m11`, `m11²` of the entries of the real symmetric matrix `M` with the rows `(m00, m01)` and `(m01, m11)`, and
the coefficients of the polynomials `P` and `Q` (constant coefficient first). -/
structure SmoothedTMData where
  c00 : TM2
  c01sq : TM2
  c0001 : TM2
  c0111 : TM2
  c11 : TM2
  P : List TM2
  Q : List TM2

/-- The data of a smoothed channel from the rational parameters `ctQ = c_θ`, `stQ = s_θ`, `seQ = s_η` and the
coefficient lists `pl`, `ql` of `P` and `Q` (constant coefficient first). The matrix `M` of Section 5.2 of the
article has the entries `m00 = c_θ² + s_η s_θ²`, `m01 = c_θ s_θ (1 - s_η)`, `m11 = s_θ² + s_η c_θ²`. Every rational
number is converted by `ofRatTM`. -/
def mkSmoothedTMData (ctQ stQ seQ : Rat) (pl ql : List Rat) : SmoothedTMData :=
  let m00 := ctQ * ctQ + seQ * stQ * stQ
  let m01 := ctQ * stQ * (1 - seQ)
  let m11 := stQ * stQ + seQ * ctQ * ctQ
  { c00 := ofRatTM (m00 * m00)
    c01sq := ofRatTM (m01 * m01)
    c0001 := ofRatTM (m00 * m01)
    c0111 := ofRatTM (m01 * m11)
    c11 := ofRatTM (m11 * m11)
    P := pl.map ofRatTM
    Q := ql.map ofRatTM }

/-- Model of the matrix `R(t) = M diag(t P(t²), t Q(t²)) M` from a model of the complex number `t`. This is the
matrix `Γ_p(t)` of equation (5.3) of the article for `p ∈ {0, 1, 5}` (`Haagerup.RtGen`). -/
def evalRSmoothed (dat : SmoothedTMData) (t : TMC) : SCT :=
  let t2 := tmcMul t t
  let p := tmcMul t (tmcHorner t2 dat.P)
  let q := tmcMul t (tmcHorner t2 dat.Q)
  let lc := fun (a b : TM2) =>
    (⟨tmAdd (tmMul a p.re) (tmMul b q.re), tmAdd (tmMul a p.im) (tmMul b q.im)⟩ : TMC)
  ⟨lc dat.c00 dat.c01sq, lc dat.c0001 dat.c0111, lc dat.c01sq dat.c11⟩

/-- Model of `t P(t²)` from a model of the complex number `t`; `P` is given by its coefficients, constant first. -/
def evalOddPoly (P : List TM2) (t : TMC) : TMC :=
  let t2 := tmcMul t t
  tmcMul t (tmcHorner t2 P)

/-- The parametrisation (5.4) of the article on one subinterval: models of `t(s) = rho (1 - s² + 2 i s) / (1 + s²)`
and of `1 + s²` as functions of `u ∈ [-1, 1]`, where `s = (sm + h u) / 2^64`; that is, the subinterval has the centre
`sm / 2^64` and the half-length `h / 2^64`. The result is `none` if the reciprocal of `1 + s²` fails. -/
@[inline] def circleTM (rho : TM2) (sm h : Int) : Option (TMC × TM2) :=
  let s : TM2 := ⟨sm, h, 0, 0⟩
  let s2 := tmMul s s
  let onePs2 := tmAdd tmOne s2
  match tmInvPos onePs2 with
  | none => none
  | some di =>
    let x := tmMul (tmMul rho (tmSub tmOne s2)) di
    let y := tmMul (tmMul rho (tmDouble s)) di
    some (⟨x, y⟩, onePs2)

/-! ### 4. Computation 5: positivity of `I ± Re R(t)` on the arc `|t| = r` in the first quadrant -/

/-- Returns `true` only if `I - Re R` and `I + Re R` are positive definite on the subinterval: for each of the two
real symmetric matrices, the models of the upper left entry and of the determinant have positive lower bounds. -/
def reContractive2x2 (R : SCT) : Bool :=
  let ma := tmSub tmOne R.a.re
  let mc := tmSub tmOne R.c.re
  let pa := tmAdd tmOne R.a.re
  let pc := tmAdd tmOne R.c.re
  let b2 := tmMul R.b.re R.b.re
  iPos (tmLo ma) && iPos (tmLo (tmSub (tmMul ma mc) b2)) &&
    iPos (tmLo pa) && iPos (tmLo (tmSub (tmMul pa pc) b2))

/-- Returns `true` only if `|Re r| < 1` on the subinterval: the models of `1 - Re r` and `1 + Re r` have positive
lower bounds. This is equivalent to the positive definiteness of `I ± Re R` for `R = diag(r, 0)` and for
`R = diag(-r, r)`. -/
def reContractive1D (r : TMC) : Bool :=
  iPos (tmLo (tmSub tmOne r.re)) && iPos (tmLo (tmAdd tmOne r.re))

/-- Walk a dyadic partition `steps` of `[0, 1]` with denominator `M = 2^k` (`unit = D64 / (2 * M)`),
testing `leafOK sm h` on every subinterval `[pos / M, (pos + w) / M]`. -/
def checkPartBool (unit : Nat) (leafOK : Int → Int → Bool) : Nat → List Nat → Bool
  | _, [] => true
  | pos, w :: rest =>
    let sm := Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit)
    let h := Int.ofNat (Nat.mul w unit)
    leafOK sm h && checkPartBool unit leafOK (Nat.add pos w) rest

/-- The sum of a list of natural numbers. -/
def sumNatList : List Nat → Nat
  | [] => 0
  | w :: rest => Nat.add w (sumNatList rest)

/-- The checker of Computation 5 (positivity on the outer circles) for a smoothed channel (channels 0, 1, 5). It
returns `true` only if `k ≤ 63`, the list `steps` has the sum `2^k`, and on every subinterval of the partition of
`[0, 1]` given by `steps` the check `reContractive2x2` succeeds for the matrix `R(t)` of `evalRSmoothed` at
`t = t(s)` on the circle of radius `regRQ`. Then `I - Re R(t)` and `I + Re R(t)` are positive definite on the arc of
this circle in the first quadrant. -/
def regQ1SmoothedOK (ctQ stQ seQ : Rat) (pl ql : List Rat) (regRQ : Rat)
    (k : Nat) (steps : List Nat) : Bool :=
  let M := Nat.pow 2 k
  let unit := Nat.div D64N (Nat.mul 2 M)
  let dat := mkSmoothedTMData ctQ stQ seQ pl ql
  let rTM := ofRatTM regRQ
  decide (k ≤ 63) && decide (sumNatList steps = M) &&
    checkPartBool unit (fun sm h =>
      match circleTM rTM sm h with
      | none => false
      | some (t, _) => reContractive2x2 (evalRSmoothed dat t)) 0 steps

/-- The checker of Computation 5 (positivity on the outer circles) for the channels with diagonal matrices
(channels 2, 3, 4). It returns `true` only if `k ≤ 63`, the list `steps` has the sum `2^k`, and on every subinterval
of the partition the check `reContractive1D` succeeds for `t P(t²)` at `t = t(s)` on the circle of radius `regRQ`.
Then `|Re (t P(t²))| < 1` on the arc of this circle in the first quadrant. -/
def regQ1DiagOK (pl : List Rat) (regRQ : Rat) (k : Nat) (steps : List Nat) : Bool :=
  let M := Nat.pow 2 k
  let unit := Nat.div D64N (Nat.mul 2 M)
  let P := pl.map ofRatTM
  let rTM := ofRatTM regRQ
  decide (k ≤ 63) && decide (sumNatList steps = M) &&
    checkPartBool unit (fun sm h =>
      match circleTM rTM sm h with
      | none => false
      | some (t, _) => reContractive1D (evalOddPoly P t)) 0 steps

/-! ### 5. Computation 6: the circle means -/

/-- Models of the matrix `(I - R)⁻¹` and of `|det (I - R)|²` if `neg = false`, and of `(I + R)⁻¹` and
`|det (I + R)|²` if `neg = true`. The inverse is computed by the formula for `2 × 2` matrices, with
`1 / det = conj(det) / |det|²`; the result is `none` if the reciprocal of `|det|²` fails. -/
def invImTM (R : SCT) (neg : Bool) : Option (SCT × TM2) :=
  let (a, b, c) := if neg then (tmcNeg R.a, tmcNeg R.b, tmcNeg R.c) else (R.a, R.b, R.c)
  let m00 := tmcSub tmcOne a
  let m01 := tmcNeg b
  let m11 := tmcSub tmcOne c
  let d := tmcSub (tmcMul m00 m11) (tmcMul m01 m01)
  let nd := tmcNormSq d
  match tmInvPos nd with
  | none => none
  | some ndi =>
    let di : TMC := ⟨tmMul d.re ndi, tmNeg (tmMul d.im ndi)⟩
    some (⟨tmcMul m11 di, tmcNeg (tmcMul m01 di), tmcMul m00 di⟩, nd)

/-- Model of the Schur denominator `Λ_β(R)` of Definition 5.3 (Schur denominator) of the article
(`Haagerup.gaussDenominator`), for a model `R` of a complex symmetric matrix, `j` a model of `β` and `j16sq` a model
of `16 β²`. It follows steps (1)-(5) of Appendix A.6: with `G₊ = Re (I - R)⁻¹ - β I` and `G₋ = Re (I + R)⁻¹ - β I`
it forms `Z = (G₊ + G₋) / 2`, `T = G₋ Z⁻¹ G₊`, `C_i = Im ((I - R)⁻¹ - (I + R)⁻¹) / 2` and
`T + 2 E = Z + C_i Z⁻¹ C_i`, and returns the model of
`16 β² |det (I - R)|² |det (I + R)|² det Z det (T + β I) det (T + 2 E + β I)`.
The result is `none` unless the upper left entries and the determinants of `Z` and of `T`, and the determinants
`det (T + β I)` and `det (T + 2 E + β I)`, have models with positive lower bounds; in particular `some` certifies
that `Z` and `T` are positive definite, that is, that the pair `(R, β)` is admissible. -/
def gauss2x2DenTM (R : SCT) (j j16sq : TM2) : Option TM2 :=
  match invImTM R false, invImTM R true with
  | some (ip, np), some (im, nm) =>
    let gpa := tmSub ip.a.re j; let gpb := ip.b.re; let gpc := tmSub ip.c.re j
    let gma := tmSub im.a.re j; let gmb := im.b.re; let gmc := tmSub im.c.re j
    let za := tmHalf (tmAdd gpa gma)
    let zb := tmHalf (tmAdd gpb gmb)
    let zc := tmHalf (tmAdd gpc gmc)
    let zdet := tmSub (tmMul za zc) (tmMul zb zb)
    if !(iPos (tmLo za) && iPos (tmLo zdet)) then none
    else
      match tmInvPos zdet with
      | none => none
      | some zdi =>
        let zia := tmMul zc zdi; let zib := tmNeg (tmMul zb zdi); let zic := tmMul za zdi
        let m00 := tmAdd (tmMul gma zia) (tmMul gmb zib)
        let m01 := tmAdd (tmMul gma zib) (tmMul gmb zic)
        let m10 := tmAdd (tmMul gmb zia) (tmMul gmc zib)
        let m11 := tmAdd (tmMul gmb zib) (tmMul gmc zic)
        let ta := tmAdd (tmMul m00 gpa) (tmMul m01 gpb)
        let tb := tmAdd (tmMul m00 gpb) (tmMul m01 gpc)
        let tc := tmAdd (tmMul m10 gpb) (tmMul m11 gpc)
        let tdet := tmSub (tmMul ta tc) (tmMul tb tb)
        if !(iPos (tmLo ta) && iPos (tmLo tdet)) then none
        else
          let cia := tmHalf (tmSub ip.a.im im.a.im)
          let cib := tmHalf (tmSub ip.b.im im.b.im)
          let cic := tmHalf (tmSub ip.c.im im.c.im)
          let cia2 := tmMul cia cia
          let cib2 := tmMul cib cib
          let cic2 := tmMul cic cic
          let ciab := tmMul cia cib
          let cibc := tmMul cib cic
          let sa := tmAdd (tmAdd (tmMul zia cia2) (tmDouble (tmMul zib ciab))) (tmMul zic cib2)
          let sb := tmAdd (tmAdd (tmMul zia ciab) (tmMul zib (tmAdd (tmMul cia cic) cib2))) (tmMul zic cibc)
          let sc := tmAdd (tmAdd (tmMul zia cib2) (tmDouble (tmMul zib cibc))) (tmMul zic cic2)
          -- `T + 2 E + β I`, from `T + 2 E = Z + C_i Z⁻¹ C_i`
          let tea := tmAdd (tmAdd za sa) j
          let teb := tmAdd zb sb
          let tec := tmAdd (tmAdd zc sc) j
          let tja := tmAdd ta j
          let tjc := tmAdd tc j
          let dtj := tmSub (tmMul tja tjc) (tmMul tb tb)
          let dtej := tmSub (tmMul tea tec) (tmMul teb teb)
          if !(iPos (tmLo dtj) && iPos (tmLo dtej)) then none
          else
            some (tmMul (tmMul (tmMul j16sq (tmMul np nm)) zdet) (tmMul dtj dtej))
  | _, _ => none

/-- Model of the scalar factor `λ_β(γ)` of Lemma A.4 (the Schur denominator of a diagonal matrix) of the article,
for a model `r` of `γ = x + i y` and models `j`, `omj`, `om2j`, `j2` of `β`, `1 - β`, `1 - 2 β`, `β²`. With
`u = 1 - x² + y²`, `w = y² / u` and `ς = u + 4 x² w` (the quantities `υ₀`, `ω`, `ς` of the lemma), the result is the
model of `(1 - β - w) (1 + y² - β u) / (1 - β ς)`. It is `none` unless the models of the five quantities `u`,
`1 - β ς`, `1 - 2 β - w + β² ς`, `1 - β - w` and `1 + y² - β u` have positive lower bounds; the first three are the
conditions of the lemma for the scalar versions of `Z` and `T` to be positive. -/
def gauss1DFactorTM (r : TMC) (j omj om2j j2 : TM2) : Option TM2 :=
  let x2 := tmMul r.re r.re
  let y2 := tmMul r.im r.im
  let u := tmAdd (tmSub tmOne x2) y2
  match tmInvPos u with
  | none => none
  | some ui =>
    let w := tmMul y2 ui
    let sTerm := tmAdd u (tmDouble (tmDouble (tmMul x2 w)))
    let denom := tmSub tmOne (tmMul j sTerm)
    match tmInvPos denom with
    | none => none
    | some deni =>
      let tGate := tmAdd (tmSub om2j w) (tmMul j2 sTerm)
      let num1 := tmSub omj w
      let num2 := tmSub (tmAdd tmOne y2) (tmMul j u)
      if iPos (tmLo tGate) && iPos (tmLo num1) && iPos (tmLo num2) then
        some (tmMul (tmMul num1 num2) deni)
      else none

/-- Sum of the integral bounds over a partition. On the subinterval of length `w / 2^k` given by `w ∈ steps`,
`leafInv sm h` is a model `(c, d, q; r)` of the integrand, and its integral over the subinterval is at most
`w (3 c + q + 3 r) / (3 * 2^k * 2^64)`, the exact integral of `c + d u + q u² + r` (the bound of Appendix A.6 of the
article; the term `d u` integrates to `0`). The function adds `w * (3 * c + q + 3 * r)` to `acc` for every
subinterval, and returns `none` if `leafInv` fails on one of them. Here `unit = 2^64 / (2 * 2^k)`, as in
`checkPartBool`. -/
def sumSimpsonPart (unit : Nat) (leafInv : Int → Int → Option TM2) :
    Nat → List Nat → Int → Option Int
  | _, [], acc => some acc
  | pos, w :: rest, acc =>
    let sm := Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit)
    let h := Int.ofNat (Nat.mul w unit)
    match leafInv sm h with
    | none => none
    | some inv =>
      let c3 := iAdd (iAdd inv.c inv.c) inv.c
      let r3 := Int.ofNat (Nat.add (Nat.add inv.r inv.r) inv.r)
      let term := iMul (Int.ofNat w) (iAdd (iAdd c3 inv.q) r3)
      sumSimpsonPart unit leafInv (Nat.add pos w) rest (iAdd acc term)

/-- The rational number `3.14159265358979323846`, a lower bound for `π` (Mathlib: `Real.pi_gt_d20`). -/
def piLo20Q : Rat := (314159265358979323846 : Int) / ((10 : Int) ^ 20)

/-- The checker of Computation 6 (circle means) for a smoothed channel (channels 0, 1, 5), with radius `rhoQ = ϱ`,
`jQ = β` and `budgetQ = B`. It returns `true` only if `k ≤ 63`, the list `steps` has the sum `2^k`, on every
subinterval `gauss2x2DenTM` yields a model of `Λ_β(R(t(s)))` and the reciprocal of `(1 + s²) Λ_β` has a model, and
the sum `acc` of `sumSimpsonPart` satisfies `4 * acc ≤ 3 * 2^k * ⌊2^64 * piLo20Q * B⌋`. Then the pair `(R(t), β)` is
admissible on the arc and `(4 / π) ∫₀¹ ds / ((1 + s²) Λ_β(R(t(s)))) ≤ B`. In `Haagerup/TaylorHardySound.lean` this
gives the bound `B` for the mean over the circle `|t| = ϱ` of `‖HholPair‖²`. -/
def meanQ1SmoothedOK (ctQ stQ seQ : Rat) (pl ql : List Rat) (rhoQ jQ budgetQ : Rat)
    (k : Nat) (steps : List Nat) : Bool :=
  let M := Nat.pow 2 k
  let unit := Nat.div D64N (Nat.mul 2 M)
  let dat := mkSmoothedTMData ctQ stQ seQ pl ql
  let rhoTM := ofRatTM rhoQ
  let jTM := ofRatTM jQ
  let j16sq := ofRatTM (16 * jQ * jQ)
  let cap := iMul (Int.ofNat (Nat.mul 3 M)) (ofRatDown64 (piLo20Q * budgetQ))
  if !(decide (k ≤ 63) && decide (sumNatList steps = M)) then false
  else
    match sumSimpsonPart unit (fun sm h =>
      match circleTM rhoTM sm h with
      | none => none
      | some (t, onePs2) =>
        match gauss2x2DenTM (evalRSmoothed dat t) jTM j16sq with
        | none => none
        | some den => tmInvPos (tmMul onePs2 den)) 0 steps 0 with
    | none => false
    | some acc => iLe (iMul 4 acc) cap

/-- The checker of Computation 6 (circle means) for the phase channel (channel 2), where `R(t) = diag(γ, 0)` with
`γ = t P(t²)`. It is `meanQ1SmoothedOK` with the model of `Λ_β(R) = 16 β² (1 - β) λ_β(γ)` obtained from
`gauss1DFactorTM`. -/
def meanQ1PhaseOK (pl : List Rat) (rhoQ jQ budgetQ : Rat) (k : Nat) (steps : List Nat) : Bool :=
  let M := Nat.pow 2 k
  let unit := Nat.div D64N (Nat.mul 2 M)
  let P := pl.map ofRatTM
  let rhoTM := ofRatTM rhoQ
  let jTM := ofRatTM jQ
  let omjTM := ofRatTM (1 - jQ)
  let om2jTM := ofRatTM (1 - 2 * jQ)
  let j2TM := ofRatTM (jQ * jQ)
  let j16omj := ofRatTM (16 * jQ * jQ * (1 - jQ))
  let cap := iMul (Int.ofNat (Nat.mul 3 M)) (ofRatDown64 (piLo20Q * budgetQ))
  if !(decide (k ≤ 63) && decide (sumNatList steps = M)) then false
  else
    match sumSimpsonPart unit (fun sm h =>
      match circleTM rhoTM sm h with
      | none => none
      | some (t, onePs2) =>
        match gauss1DFactorTM (evalOddPoly P t) jTM omjTM om2jTM j2TM with
        | none => none
        | some f => tmInvPos (tmMul onePs2 (tmMul j16omj f))) 0 steps 0 with
    | none => false
    | some acc => iLe (iMul 4 acc) cap

/-- The checker of Computation 6 (circle means) for a channel of the reflected pair (channels 3, 4), where
`R(t) = diag(-γ, γ)` with `γ = t R_p(t²)` and `rl` the coefficients of `R_p`. It is `meanQ1SmoothedOK` with the
model of `Λ_β(R) = 16 β² λ_β(γ)²` obtained from `gauss1DFactorTM`. -/
def meanQ1AntiOK (rl : List Rat) (rhoQ jQ budgetQ : Rat) (k : Nat) (steps : List Nat) : Bool :=
  let M := Nat.pow 2 k
  let unit := Nat.div D64N (Nat.mul 2 M)
  let R := rl.map ofRatTM
  let rhoTM := ofRatTM rhoQ
  let jTM := ofRatTM jQ
  let omjTM := ofRatTM (1 - jQ)
  let om2jTM := ofRatTM (1 - 2 * jQ)
  let j2TM := ofRatTM (jQ * jQ)
  let j16sq := ofRatTM (16 * jQ * jQ)
  let cap := iMul (Int.ofNat (Nat.mul 3 M)) (ofRatDown64 (piLo20Q * budgetQ))
  if !(decide (k ≤ 63) && decide (sumNatList steps = M)) then false
  else
    match sumSimpsonPart unit (fun sm h =>
      match circleTM rhoTM sm h with
      | none => none
      | some (t, onePs2) =>
        match gauss1DFactorTM (evalOddPoly R t) jTM omjTM om2jTM j2TM with
        | none => none
        | some f => tmInvPos (tmMul onePs2 (tmMul j16sq (tmMul f f)))) 0 steps 0 with
    | none => false
    | some acc => iLe (iMul 4 acc) cap

end HaagerupKernel.TaylorHardy
