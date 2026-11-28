/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import HaagerupKernel.Basic

/-!
# Fixed-point polynomial arithmetic for the head check

This file defines the Boolean checker `fastHeadOK` of Computation 4 (head) of the article, which runs the
algorithm of Appendix A.5 (the head). It imports only `HaagerupKernel.Basic`. All its arithmetic is exact
integer arithmetic, which Lean's kernel evaluates (`decide +kernel`); the fact `Haagerup.head_sum_ok` in
`Haagerup/HeadCheck.lean` is its evaluation on the data of the certificate.

## What is computed

All polynomials are taken modulo `X^251`. A real polynomial `F` is represented at scale `2^80` by an integer
polynomial whose coefficients approximate those of `2^80 * F`. For each of the six channels the checker computes
such a representation of the head polynomial `∑_{k ≤ 250} h_k X^k`, where the numbers `h_k` are given by the finite
sums of Proposition 6.1 (head formulas). With `P` the polynomial of the channel and `Q = X * P^2`, these are:

* channels 0, 1, 5 (the smoothed map): `P * ∑_{j ≤ 250} E_j * Q^j - X * ∑_{j ≤ 249} O_j * Q^j`, where
  `E_j = ∑_a e(2j+1, 2a) X^(3a)` and `O_j = ∑_a e(2j, 2a+1) X^(3a)`, and `e(d₁, d₂)` is the lower endpoint, at
  scale `2^128`, of the entry `(d₁, d₂)` of the energy table of Computation 3 (energies of `f_sm`);
* channel 2 (the phase map): `P * ∑_{j ≤ 250} r_j * Q^j`, where Haagerup's coefficients `r_j` are generated at
  scale `2^80` by `haagMu80`;
* channels 3, 4 (the reflected pair): `P * ∑_{j ≤ 250} μ_j * Q^j`, where `μ_j` is the lower endpoint, at scale
  `2^128`, of the `j`-th entry of the table of Computation 2 (overlaps of `f_tig`).

The sums are evaluated by Horner's scheme in blocks of sixteen powers of `Q` (`buildPows16L`, `hornerD128`,
`hornerD80`); every product is truncated modulo `X^251` (`trunc251`) and divided coefficientwise with rounding
toward zero (`sd8`). `fastHeadOK` then forms the mixture of the six channels with the weights, subtracts the centre
from the constant coefficient, and compares the `ℓ¹` norm of the result (`l1_8`) plus the allowance `errBudget80`
with the cap: this is the integer inequality (5.5) of Computation 4 (head), part (b). It also verifies the
properties of the two tables required in part (a) (`checkRowsShape`, `checkTigMu`).

## Kronecker substitution

An integer polynomial `∑ c_k X^k` of degree less than `251` is stored as the single integer `∑ c_k B^k` with
`B = 2^224` (`B1N`) and balanced digits `-B/2 ≤ c_k < B/2`, so that one multiplication of integers multiplies two
polynomials. We call this integer the *packed* polynomial. The functions `balDivMod`, `sdStep` and `l1Step`
recover the digits by repeated splitting.

The operations `iAdd`, `iMul`, … on `Int` are written by cases on the constructors of `Int`, in terms of the
operations on `Nat` literals that the kernel evaluates with arbitrary-precision arithmetic.

## Soundness

`Haagerup.head_residual_of_fastHeadOK` in `Haagerup/FastHeadSound.lean` proves that `fastHeadOK … = true` implies
the bound (5.6) of Computation 4 (head) for all values of the overlaps and energies in the intervals of the two
tables; this is Proposition A.3 (soundness of the head algorithm) of Appendix A.5, with larger error constants.

-/

set_option warningAsError true

namespace HaagerupKernel.FastHead

open HaagerupKernel

/-! ### 1. Scales and Kronecker base constants -/

/-- `2^48`: the ratio of the scales `2^128` and `2^80`, and the bound for the lengths of the table intervals. -/
def D48N : Nat := Nat.pow 2 48
/-- `2^80`: the scale of the fixed-point polynomials. -/
def D80N : Nat := Nat.pow 2 80
/-- `2^128`: the scale of the tables of overlaps and energies (the scale `HaagerupKernel.D`). -/
def D128N : Nat := Nat.pow 2 128

/-- `2^48` as an integer. -/
def D48I : Int := Int.ofNat D48N
/-- `2^80` as an integer. -/
def D80I : Int := Int.ofNat D80N
/-- `2^128` as an integer. -/
def D128I : Int := Int.ofNat D128N

/-- The base `B = 2^224` of the Kronecker substitution: the packed form of the monomial `X`. -/
def B1N : Nat := Nat.pow 2 224
/-- `B^2`, the packed form of `X^2`. -/
def B2N : Nat := Nat.mul B1N B1N
/-- `B^3`, the packed form of `X^3`. -/
def B3N : Nat := Nat.mul B2N B1N
/-- `B^4`. -/
def B4N : Nat := Nat.mul B2N B2N
/-- `B^8`. -/
def B8N : Nat := Nat.mul B4N B4N
/-- `B^16`. -/
def B16N : Nat := Nat.mul B8N B8N
/-- `B^32`. -/
def B32N : Nat := Nat.mul B16N B16N
/-- `B^64`. -/
def B64N : Nat := Nat.mul B32N B32N
/-- `B^128`. -/
def B128N : Nat := Nat.mul B64N B64N
/-- `B^251`, the packed form of `X^251`: polynomials are truncated by reduction modulo this number. -/
def B251N : Nat := Nat.pow B1N 251

/-- `B` as an integer. -/
def B1I : Int := Int.ofNat B1N
/-- `B^2` as an integer. -/
def B2I : Int := Int.ofNat B2N
/-- `B^4` as an integer. -/
def B4I : Int := Int.ofNat B4N
/-- `B^8` as an integer. -/
def B8I : Int := Int.ofNat B8N
/-- `B^16` as an integer. -/
def B16I : Int := Int.ofNat B16N
/-- `B^32` as an integer. -/
def B32I : Int := Int.ofNat B32N
/-- `B^64` as an integer. -/
def B64I : Int := Int.ofNat B64N
/-- `B^128` as an integer. -/
def B128I : Int := Int.ofNat B128N

/-- `B / 2`: balanced digits `c` satisfy `-B/2 ≤ c < B/2`. -/
def H1N : Nat := Nat.div B1N 2
/-- `B / 2` as an integer. -/
def H1I : Int := Int.ofNat H1N
/-- `B^2 / 2`, the offset of the balanced division by `B^2`. -/
def H2I : Int := Int.ofNat (Nat.div B2N 2)
/-- `B^4 / 2`, the offset of the balanced division by `B^4`. -/
def H4I : Int := Int.ofNat (Nat.div B4N 2)
/-- `B^8 / 2`, the offset of the balanced division by `B^8`. -/
def H8I : Int := Int.ofNat (Nat.div B8N 2)
/-- `B^16 / 2`, the offset of the balanced division by `B^16`. -/
def H16I : Int := Int.ofNat (Nat.div B16N 2)
/-- `B^32 / 2`, the offset of the balanced division by `B^32`. -/
def H32I : Int := Int.ofNat (Nat.div B32N 2)
/-- `B^64 / 2`, the offset of the balanced division by `B^64`. -/
def H64I : Int := Int.ofNat (Nat.div B64N 2)
/-- `B^128 / 2`, the offset of the balanced division by `B^128`. -/
def H128I : Int := Int.ofNat (Nat.div B128N 2)
/-- `B^251 / 2`, the offset of the balanced division by `B^251`. -/
def H251I : Int := Int.ofNat (Nat.div B251N 2)

/-! ### 2. `Int` arithmetic by cases on the constructors, in terms of the operations on `Nat` -/

/-- Negation of an integer: `iNeg a = -a`. -/
@[inline] def iNeg : Int → Int
  | Int.ofNat 0 => Int.ofNat 0
  | Int.ofNat (Nat.succ n) => Int.negSucc n
  | Int.negSucc n => Int.ofNat (Nat.succ n)

/-- Absolute value of an integer as a natural number: `iNatAbs a = a.natAbs`. -/
@[inline] def iNatAbs : Int → Nat
  | Int.ofNat n => n
  | Int.negSucc n => Nat.succ n

/-- Absolute value of an integer: `iAbs a = |a|`. -/
@[inline] def iAbs (a : Int) : Int := Int.ofNat (iNatAbs a)

/-- The non-negative part of an integer as a natural number: `toNat0 a = a.toNat`, which is `0` for `a < 0`. -/
@[inline] def toNat0 : Int → Nat
  | Int.ofNat n => n
  | Int.negSucc _ => 0

/-- The integer difference of two natural numbers: `natSubInt a b = (a : Int) - (b : Int)`. -/
@[inline] def natSubInt (a b : Nat) : Int :=
  if Nat.ble b a then Int.ofNat (Nat.sub a b)
  else Int.negSucc (Nat.sub (Nat.sub b a) 1)

/-- Addition of integers: `iAdd a b = a + b`. -/
@[inline] def iAdd (a b : Int) : Int :=
  match a, b with
  | Int.ofNat m, Int.ofNat n => Int.ofNat (Nat.add m n)
  | Int.ofNat m, Int.negSucc n => natSubInt m (Nat.succ n)
  | Int.negSucc m, Int.ofNat n => natSubInt n (Nat.succ m)
  | Int.negSucc m, Int.negSucc n => Int.negSucc (Nat.add m (Nat.succ n))

/-- Subtraction of integers: `iSub a b = a - b`. -/
@[inline] def iSub (a b : Int) : Int := iAdd a (iNeg b)

/-- The negative of a natural number as an integer: `negNatInt n = -(n : Int)`. -/
@[inline] def negNatInt (n : Nat) : Int :=
  if Nat.beq n 0 then Int.ofNat 0 else Int.negSucc (Nat.sub n 1)

/-- Multiplication of integers: `iMul a b = a * b`. -/
@[inline] def iMul (a b : Int) : Int :=
  match a, b with
  | Int.ofNat m, Int.ofNat n => Int.ofNat (Nat.mul m n)
  | Int.ofNat m, Int.negSucc n => negNatInt (Nat.mul m (Nat.succ n))
  | Int.negSucc m, Int.ofNat n => negNatInt (Nat.mul (Nat.succ m) n)
  | Int.negSucc m, Int.negSucc n => Int.ofNat (Nat.mul (Nat.succ m) (Nat.succ n))

/-- Comparison of integers: `iLe a b = true` if and only if `a ≤ b`. -/
@[inline] def iLe (a b : Int) : Bool :=
  match a, b with
  | Int.ofNat m, Int.ofNat n => Nat.ble m n
  | Int.negSucc _, Int.ofNat _ => true
  | Int.ofNat _, Int.negSucc _ => false
  | Int.negSucc m, Int.negSucc n => Nat.ble n m

/-- Truncating division toward zero by a positive `Nat`. -/
@[inline] def tdivNat (x : Int) (d : Nat) : Int :=
  match x with
  | Int.ofNat n => Int.ofNat (Nat.div n d)
  | Int.negSucc n => negNatInt (Nat.div (Nat.succ n) d)

/-! ### 3. Balanced base-`B1` splitting, truncation, coefficientwise `tdivNat`, and L1 norm -/

/-- Balanced Euclidean division: `x = q * bN + r` with `-hI ≤ r < hI` (for `bN = 2 * hI > 0`). -/
@[inline] def balDivMod (bN : Nat) (hI : Int) (x : Int) : Int × Int :=
  match iAdd x hI with
  | Int.ofNat n =>
    (Int.ofNat (Nat.div n bN), iSub (Int.ofNat (Nat.mod n bN)) hI)
  | Int.negSucc n =>
    (Int.negSucc (Nat.div n bN), iSub (Int.ofNat (Nat.sub (Nat.sub bN 1) (Nat.mod n bN))) hI)

/-- Truncation of a packed polynomial modulo `X^251`: the balanced remainder of `x` modulo `B^251`, which keeps
the digits (coefficients) of index less than `251`. -/
@[inline] def trunc251 (x : Int) : Int := (balDivMod B251N H251I x).2

/-- One level of the coefficientwise division. With `bI = bN` and `hI = bN / 2`, the integer `x` is split as
`x = hi * bN + lo` (balanced), and the result is `f lo den + f hi den * bN`. If `bN = B^n` and `f · den` divides
each coefficient of a packed polynomial with at most `n` coefficients by `den`, then `sdStep bN bI hI f · den` does
the same for packed polynomials with at most `2 * n` coefficients. -/
def sdStep (bN : Nat) (bI hI : Int) (f : Int → Nat → Int) (x : Int) (den : Nat) : Int :=
  let (hi, lo) := balDivMod bN hI x
  iAdd (f lo den) (iMul (f hi den) bI)

/-- Division of one coefficient by `den`, rounded toward zero. -/
def sd0 (x : Int) (den : Nat) : Int := tdivNat x den
/-- Division by `den`, rounded toward zero, of each coefficient of a packed polynomial with at most `2`
coefficients. -/
def sd1 := sdStep B1N B1I H1I sd0
/-- As `sd1`, for packed polynomials with at most `4` coefficients. -/
def sd2 := sdStep B2N B2I H2I sd1
/-- As `sd1`, for packed polynomials with at most `8` coefficients. -/
def sd3 := sdStep B4N B4I H4I sd2
/-- As `sd1`, for packed polynomials with at most `16` coefficients. -/
def sd4 := sdStep B8N B8I H8I sd3
/-- As `sd1`, for packed polynomials with at most `32` coefficients. -/
def sd5 := sdStep B16N B16I H16I sd4
/-- As `sd1`, for packed polynomials with at most `64` coefficients. -/
def sd6 := sdStep B32N B32I H32I sd5
/-- As `sd1`, for packed polynomials with at most `128` coefficients. -/
def sd7 := sdStep B64N B64I H64I sd6
/-- Division by `den`, rounded toward zero, of each coefficient of a packed polynomial with at most `256`
coefficients. Applied to a polynomial truncated by `trunc251`, this is the operation `A ÷ D` of Appendix A.5 of the
article. -/
def sd8 := sdStep B128N B128I H128I sd7

/-- Product of two packed polynomials at scale `2^80`, again at scale `2^80`: the product of the integers is
truncated modulo `X^251` and its coefficients are divided by `2^80` with rounding toward zero. -/
@[inline] def kronMul (a b : Int) : Int := sd8 (trunc251 (iMul a b)) D80N

/-- One level of the `ℓ¹` norm. With `hI = bN / 2`, the integer `x` is split as `x = hi * bN + lo` (balanced), and
the result is `f lo + f hi`. -/
def l1Step (bN : Nat) (hI : Int) (f : Int → Int) (x : Int) : Int :=
  let (hi, lo) := balDivMod bN hI x
  iAdd (f lo) (f hi)

/-- Absolute value of one coefficient. -/
def l1_0 := iAbs
/-- Sum of the absolute values of the coefficients of a packed polynomial with at most `2` coefficients. -/
def l1_1 := l1Step B1N H1I l1_0
/-- As `l1_1`, for packed polynomials with at most `4` coefficients. -/
def l1_2 := l1Step B2N H2I l1_1
/-- As `l1_1`, for packed polynomials with at most `8` coefficients. -/
def l1_3 := l1Step B4N H4I l1_2
/-- As `l1_1`, for packed polynomials with at most `16` coefficients. -/
def l1_4 := l1Step B8N H8I l1_3
/-- As `l1_1`, for packed polynomials with at most `32` coefficients. -/
def l1_5 := l1Step B16N H16I l1_4
/-- As `l1_1`, for packed polynomials with at most `64` coefficients. -/
def l1_6 := l1Step B32N H32I l1_5
/-- As `l1_1`, for packed polynomials with at most `128` coefficients. -/
def l1_7 := l1Step B64N H64I l1_6
/-- The `ℓ¹` norm (sum of the absolute values of the coefficients) of a packed polynomial with at most `256`
coefficients. -/
def l1_8 := l1Step B128N H128I l1_7

/-! ### 4. Tail-recursive list helpers and table shape/width/L1 validators -/

/-- Tail-recursive reversal onto an accumulator: `revL xs acc = xs.reverse ++ acc`. -/
def revL {α : Type} : List α → List α → List α
  | [], acc => acc
  | x :: xs, acc => revL xs (x :: acc)

/-- The number of entries of the row `m = d₂` of the energy table: `250 - 3 * (m / 2)` for odd `m` and
`251 - 3 * (m / 2)` for even `m`, the number of `d₁` with `d₁ + m` odd and `d₁ + 3 * m ≤ 501`. -/
@[inline] def expectedRowLen (m : Nat) : Nat :=
  let base := if Nat.beq (Nat.mod m 2) 1 then 250 else 251
  Nat.sub base (Nat.mul 3 (Nat.div m 2))

/-- Tail-recursive validation of one row of `tcellRows`: exact `n = expN, expN+2, ...`,
exact length `len`, `0 ≤ iv.lo ≤ D128`, `iv.hi - iv.lo ≤ D48`, accumulating `∑ iv.lo`. -/
def checkEntries : Nat → Nat → List (Nat × Ival) → Nat → Option Nat
  | _, 0, [], tot => some tot
  | expN, len + 1, (n, iv) :: es, tot =>
    if Nat.beq n expN && iLe 0 iv.lo && iLe iv.lo D128I && iLe (iSub iv.hi iv.lo) D48I then
      checkEntries (Nat.add expN 2) len es (Nat.add tot (toNat0 iv.lo))
    else none
  | _, _, _, _ => none

/-- Tail-recursive validation of reversed `tcellRows` (`m = 167` down to `0`) plus `∑ iv.lo ≤ D128`. -/
def checkRowsShape : Nat → List RowI → Nat → Bool
  | 0, [], tot => Nat.ble tot D128N
  | rem + 1, (m, es) :: rest, tot =>
    if Nat.beq m rem then
      let startN := if Nat.beq (Nat.mod m 2) 1 then 0 else 1
      match checkEntries startN (expectedRowLen m) es tot with
      | some tot' => checkRowsShape rem rest tot'
      | none => false
    else false
  | _, _, _ => false

/-- Tail-recursive validation of `tigMuList`: exact length `251`, `|iv.lo| ≤ D128`,
`iv.hi - iv.lo ≤ D48`, and `∑ |iv.lo| ≤ D128`. -/
def checkTigMu : Nat → List Ival → Nat → Bool
  | 0, [], tot => Nat.ble tot D128N
  | rem + 1, iv :: rest, tot =>
    let a := iNatAbs iv.lo
    if Nat.ble a D128N && iLe (iSub iv.hi iv.lo) D48I then
      checkTigMu rem rest (Nat.add tot a)
    else false
  | _, _, _ => false

/-- Tail-recursive validation of a sparse polynomial `l` with denominator `den`:
`0 < den`, `l.length ≤ 16`, degrees strictly increasing and `< 251`, and `∑ |c| ≤ den`. -/
def checkSparseGo : Nat → Nat → List (Nat × Int) → Nat → Nat → Bool
  | _, _, [], den, tot => Nat.ble tot den
  | minD, maxLen, (d, c) :: rest, den, tot =>
    match maxLen with
    | 0 => false
    | k + 1 =>
      if Nat.ble minD d && Nat.ble (Nat.add d 1) 251 then
        checkSparseGo (Nat.add d 1) k rest den (Nat.add tot (iNatAbs c))
      else false

/-- `checkSparse l den = true` if and only if `den ≥ 1` and the list `l` of pairs `(degree, numerator)` has at most
`16` entries, strictly increasing degrees smaller than `251`, and `∑ |numerator| ≤ den`. Such a list describes the
polynomial `∑ (c / den) X^d` over the pairs `(d, c)` of `l`, whose `ℓ¹` norm is at most `1`. -/
def checkSparse (l : List (Nat × Int)) (den : Nat) : Bool :=
  Nat.ble 1 den && checkSparseGo 0 16 l den 0

/-! ### 5. Unsigned `Nat` packing of `tcellRows` into `E_j` (even `m`) and `O_j` (odd `m`) -/

/-- `zipNat es bs []` multiplies the packed polynomials of the list `bs` by `X^3` and adds the lower endpoints of
the row `es` as new constant coefficients: its `i`-th entry is `bs[i] * B^3 + lo_i`, where `lo_i` is the lower
endpoint of the `i`-th entry of `es` (a negative one counts as `0`), and a missing `bs[i]` counts as `0`. The result
has the length of `es`; the argument `acc` holds the entries already produced, in reverse order. -/
def zipNat (es : List (Nat × Ival)) (bs : List Nat) (acc : List Nat) : List Nat :=
  match es, bs with
  | [], _ => revL acc []
  | (_, iv) :: es', [] =>
    zipNat es' [] (toNat0 iv.lo :: acc)
  | (_, iv) :: es', b :: bs' =>
    zipNat es' bs' (Nat.add (Nat.mul b B3N) (toNat0 iv.lo) :: acc)

/-- Packs the rows `(d₂, [(d₁, interval), …])` of the energy table, given in decreasing order of `d₂`, into two
lists of packed polynomials in `X^3` with non-negative coefficients, built from the lower endpoints `e(d₁, d₂)`.
The rows with odd `d₂ = 2a + 1`, whose entries have `d₁ = 0, 2, 4, …`, go into the first list `ev` (even `d₁`):
its `j`-th entry becomes `∑_a e(2j, 2a+1) B^(3a)`, the packed polynomial `O_j` of the module docstring. The rows with
even `d₂ = 2a`, whose entries have `d₁ = 1, 3, 5, …`, go into the second list `od` (odd `d₁`): its `j`-th entry
becomes `∑_a e(2j+1, 2a) B^(3a)`, the packed polynomial `E_j`. -/
def packRowsNat : List RowI → List Nat → List Nat → List Nat × List Nat
  | [], ev, od => (ev, od)
  | (m, es) :: rest, ev, od =>
    if Nat.beq (Nat.mod m 2) 1 then
      packRowsNat rest (zipNat es ev []) od
    else
      packRowsNat rest ev (zipNat es od [])

/-- Tail-recursive cast of a list of natural numbers to integers:
`natListToIntAcc ns acc = acc.reverse ++ ns.map Int.ofNat`. -/
def natListToIntAcc : List Nat → List Int → List Int
  | [], acc => revL acc []
  | n :: ns, acc => natListToIntAcc ns (Int.ofNat n :: acc)

/-! ### 6. Baby-step / giant-step Kronecker polynomial evaluation -/

/-- Dot product with an accumulator: `dot16 as bs acc = acc + ∑ᵢ as[i] * bs[i]`, the sum running over the common
length of the two lists (at most `16` where it is used). -/
def dot16 : List Int → List Int → Int → Int
  | a :: as, b :: bs, acc => dot16 as bs (iAdd acc (iMul a b))
  | _, _, acc => acc

/-- `split16Acc k xs acc = (acc.reverse ++ xs.take k, xs.drop k)`. -/
def split16Acc : Nat → List Int → List Int → List Int × List Int
  | 0, xs, acc => (revL acc [], xs)
  | _, [], acc => (revL acc [], [])
  | k + 1, x :: xs, acc => split16Acc k xs (x :: acc)

/-- Cuts the list `xs` into consecutive blocks of `16` entries (the last block may be shorter), at most `n` blocks,
and pushes them onto `acc` one after the other, so that they appear in reverse order: the block of the highest
indices comes first. With `n = 16` this covers lists of length at most `256`. -/
def chunk16Rev : Nat → List Int → List (List Int) → List (List Int)
  | 0, _, acc => acc
  | _ + 1, [], acc => acc
  | n + 1, xs, acc =>
    let (hd, tl) := split16Acc 16 xs []
    chunk16Rev n tl (hd :: acc)

/-- The powers of `Q` at scale `2^80`: from the packed representation `qEnc` of `Q`, the list of the representations
of `Q^0, Q^1, …, Q^15` (where `Q^0 = 1` is the constant `2^80`), together with that of `Q^16`. Each power is obtained
from the previous one by `kronMul` with `qEnc`. -/
def buildPows16L (qEnc : Int) : List Int × Int :=
  let q0 := D80I
  let q1 := qEnc
  let q2 := kronMul q1 qEnc
  let q3 := kronMul q2 qEnc
  let q4 := kronMul q3 qEnc
  let q5 := kronMul q4 qEnc
  let q6 := kronMul q5 qEnc
  let q7 := kronMul q6 qEnc
  let q8 := kronMul q7 qEnc
  let q9 := kronMul q8 qEnc
  let q10 := kronMul q9 qEnc
  let q11 := kronMul q10 qEnc
  let q12 := kronMul q11 qEnc
  let q13 := kronMul q12 qEnc
  let q14 := kronMul q13 qEnc
  let q15 := kronMul q14 qEnc
  let q16 := kronMul q15 qEnc
  ([q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15], q16)

/-- Block Horner scheme of Appendix A.5 of the article for coefficients at scale `2^128`. Here `qows16` holds the
powers `Q^0, …, Q^15` and `q16` the power `Q^16` at scale `2^80` (see `buildPows16L`). For each block
`blk = [C_{16b}, …, C_{16b+15}]` of packed coefficient polynomials, in the order of the list (highest block first),
the accumulator is replaced by `(2^48 * acc * Q^16 + ∑_r C_{16b+r} * Q^r) ÷ 2^128`, truncated modulo `X^251`. The
result represents `∑_j C_j * Q^j` at scale `2^80`. It is used for the families `E_j`, `O_j` and for the table of
overlaps. -/
def hornerD128 (qows16 : List Int) (q16 : Int) : List (List Int) → Int → Int
  | [], acc => acc
  | blk :: rest, acc =>
    let acc' := sd8 (trunc251 (iAdd (iMul (iMul acc q16) D48I) (dot16 blk qows16 0))) D128N
    hornerD128 qows16 q16 rest acc'

/-- The block Horner scheme `hornerD128` for coefficients at scale `2^80`: the accumulator is replaced by
`(acc * Q^16 + ∑_r C_{16b+r} * Q^r) ÷ 2^80`, truncated modulo `X^251`. It is used for the numbers `haagMu80`. -/
def hornerD80 (qows16 : List Int) (q16 : Int) : List (List Int) → Int → Int
  | [], acc => acc
  | blk :: rest, acc =>
    let acc' := sd8 (trunc251 (iAdd (iMul acc q16) (dot16 blk qows16 0))) D80N
    hornerD80 qows16 q16 rest acc'

/-- The head polynomial of a smoothed channel (channels 0, 1, 5) at scale `2^80`. Here `pEnc` is the packed
representation of the channel polynomial `P` at scale `2^80`, and `revE`, `revO` are the packed polynomials
`E_j`, `O_j` at scale `2^128`, in blocks of sixteen with the highest block first. With `Q̃ = (X * P̃ * P̃) ÷ 2^80`
and the two block Horner sums `A_E`, `A_O` in the powers of `Q̃`, the result is `(A_E * P̃) ÷ 2^80 - X * A_O`,
truncated modulo `X^251`. -/
def evalSmoothed (revE revO : List (List Int)) (pEnc : Int) : Int :=
  let qEnc := kronMul (trunc251 (iMul B1I pEnc)) pEnc
  let (qows16, q16) := buildPows16L qEnc
  let sE := hornerD128 qows16 q16 revE 0
  let sO := hornerD128 qows16 q16 revO 0
  iSub (kronMul sE pEnc) (trunc251 (iMul B1I sO))

/-- The head polynomial `P * ∑_j c_j * Q^j`, `Q = X * P^2`, at scale `2^80`, for integer coefficients `c_j` given at
scale `2^80` in blocks of sixteen with the highest block first (`revMu`); `pEnc` is the packed representation of
`P` at scale `2^80`. The result is `(A * P̃) ÷ 2^80`, where `A` is the block Horner sum `hornerD80`. It is used for
the phase channel (channel 2). -/
def eval1D_D80 (revMu : List (List Int)) (pEnc : Int) : Int :=
  let qEnc := kronMul (trunc251 (iMul B1I pEnc)) pEnc
  let (qows16, q16) := buildPows16L qEnc
  let s := hornerD80 qows16 q16 revMu 0
  kronMul s pEnc

/-- As `eval1D_D80`, for coefficients `c_j` given at scale `2^128`, with the block Horner sum `hornerD128`. It is
used for the channels of the reflected pair (channels 3 and 4), the `c_j` being the lower endpoints of the table of
overlaps. -/
def eval1D_D128 (revMu : List (List Int)) (pEnc : Int) : Int :=
  let qEnc := kronMul (trunc251 (iMul B1I pEnc)) pEnc
  let (qows16, q16) := buildPows16L qEnc
  let s := hornerD128 qows16 q16 revMu 0
  kronMul s pEnc

/-- `encPolyAux l den acc = acc + ∑ t(c) * B^d` over the pairs `(d, c)` of `l`, where `t(c)` is `2^80 * c / den`
rounded toward zero. With `acc = 0` this is the packed representation at scale `2^80` of the polynomial
`∑ (c / den) X^d` described by the sparse list `l` and the denominator `den`. -/
def encPolyAux : List (Nat × Int) → Nat → Int → Int
  | [], _, acc => acc
  | (d, c) :: rest, den, acc =>
    let cd := tdivNat (iMul c D80I) den
    encPolyAux rest den (iAdd acc (iMul cd (Int.ofNat (Nat.pow B1N d))))

/-! ### 7. Haagerup phase coefficients and 1D `tigMu` extraction -/

/-- The integer `⌊2^80 * 3.14159265358979323846 / 4⌋`, a lower bound for `2^80 * π / 4`. It is the first of the
numbers `haagMu80`. -/
def piQuarter80 : Int :=
  tdivNat (iMul 314159265358979323846 D80I) (Nat.mul 4 (Nat.pow 10 20))

/-- `haagMu80Go rem k cur acc` produces `rem` consecutive terms of the sequence defined by the recurrence
`r̃_{j+1} = ⌊r̃_j * (2j+1)^2 / (4 * (j+1) * (j+2))⌋`, starting with `r̃_k = cur`, appended to the reversal of
`acc`. -/
def haagMu80Go : Nat → Nat → Int → List Int → List Int
  | 0, _, _, acc => revL acc []
  | rem + 1, k, cur, acc =>
    let odd := Nat.add (Nat.mul 2 k) 1
    let num := Int.ofNat (Nat.mul odd odd)
    let den := Nat.mul (Nat.mul 4 (Nat.add k 1)) (Nat.add k 2)
    haagMu80Go rem (Nat.add k 1) (tdivNat (iMul num cur) den) (cur :: acc)

/-- The list of the `251` integers `r̃_0, …, r̃_250` with `r̃_0 = piQuarter80` and
`r̃_{j+1} = ⌊r̃_j * (2j+1)^2 / (4 * (j+1) * (j+2))⌋`. They approximate from below, at scale `2^80`, Haagerup's
coefficients `r_j = (π / 4) * r̂_j`, where `r̂_0 = 1` and `r̂_{j+1} = r̂_j * (2j+1)^2 / (4 * (j+1) * (j+2))`: the
coefficients of the phase channel in Proposition 6.1 (head formulas) of the article. -/
def haagMu80 : List Int := haagMu80Go 251 0 piQuarter80 []

/-- Sum of absolute values with an accumulator: `sumNatAbs xs acc = acc + ∑ |x|` over the entries `x` of `xs`. -/
def sumNatAbs : List Int → Nat → Nat
  | [], acc => acc
  | x :: xs, acc => sumNatAbs xs (Nat.add acc (iNatAbs x))

/-- The list of the lower endpoints of a list of intervals:
`tigMu128Acc l acc = acc.reverse ++ l.map (·.lo)`. -/
def tigMu128Acc : List Ival → List Int → List Int
  | [], acc => revL acc []
  | iv :: rest, acc => tigMu128Acc rest (iv.lo :: acc)

/-! ### 8. Complete 6-channel head residual checker -/

/-- The allowance `2 × 10^6`, in units of `2^-80`, for the total rounding error of the fixed-point algorithm in the
inequality (5.5) of the article. -/
def errBudget80 : Int := 2000000

/-- The checker of Computation 4 (head) of the article.

Arguments: `rows` is the table of enclosures of the energies of the smoothed map and `tigMu` the table of
enclosures of the overlaps of the reflected pair, both at scale `2^128`; `p0`, `p1`, `p2`, `r3`, `r4`, `p5` are the
polynomials of the six channels as sparse lists of pairs `(degree, numerator)` with the denominators `d0`, …, `d5`;
the weights are `w0 / wDen`, …, `w5 / wDen`; the centre is `cNum / cDen` and the cap is `capNum / capDen`.

`fastHeadOK … = true` if and only if the following two conditions hold.

* The data are well formed: `rows` has the rows `d₂ = 0, …, 167` in this order, each with the expected indices
  `d₁`, with lower endpoints in `[0, 2^128]`, intervals of length at most `2^48`, and sum of the lower endpoints
  at most `2^128` (`checkRowsShape`); `tigMu` has `251` entries with intervals of length at most `2^48` and sum of
  the absolute values of the lower endpoints at most `2^128` (`checkTigMu`); the sum of the numbers `haagMu80` is at
  most `2^80`; each sparse list passes `checkSparse`; `1 ≤ wDen ≤ 2^80` and the weights sum to `wDen`;
  `cNum ≤ cDen`, `1 ≤ cDen` and `1 ≤ capDen`.
* With the head polynomials `h̃₀, …, h̃₅` of the six channels at scale `2^80` (`evalSmoothed` for channels 0, 1, 5,
  `eval1D_D80` for channel 2, `eval1D_D128` for channels 3, 4) and `H̃ = (∑ₚ wₚ * h̃ₚ) ÷ wDen`,
  `∑_{k ≤ 250} |[X^k] H̃ - ⌊2^80 * cNum / cDen⌋ * δ_{k,0}| + errBudget80 ≤ ⌊2^80 * capNum / capDen⌋`.

The first condition contains part (a) of Computation 4, and the second is its inequality (5.5). -/
def fastHeadOK (rows : List RowI) (tigMu : List Ival)
    (p0 p1 p2 r3 r4 p5 : List (Nat × Int))
    (d0 d1 d2 d3 d4 d5 : Nat)
    (w0 w1 w2 w3 w4 w5 wDen : Nat)
    (cNum cDen capNum capDen : Nat) : Bool :=
  let revRows := revL rows []
  let hMu := haagMu80
  if checkRowsShape 168 revRows 0 &&
     checkTigMu 251 tigMu 0 &&
     Nat.ble (sumNatAbs hMu 0) D80N &&
     checkSparse p0 d0 && checkSparse p1 d1 && checkSparse p2 d2 &&
     checkSparse r3 d3 && checkSparse r4 d4 && checkSparse p5 d5 &&
     Nat.ble 1 wDen && Nat.ble wDen D80N &&
     Nat.beq (Nat.add w0 (Nat.add w1 (Nat.add w2 (Nat.add w3 (Nat.add w4 w5))))) wDen &&
     Nat.ble 1 cDen && Nat.ble cNum cDen &&
     Nat.ble 1 capDen
  then
    let (evN, odN) := packRowsNat revRows [] []
    let revO := chunk16Rev 16 (natListToIntAcc evN []) []
    let revE := chunk16Rev 16 (natListToIntAcc odN []) []
    let h0 := evalSmoothed revE revO (encPolyAux p0 d0 0)
    let h1 := evalSmoothed revE revO (encPolyAux p1 d1 0)
    let h5 := evalSmoothed revE revO (encPolyAux p5 d5 0)
    let revHaag := chunk16Rev 16 hMu []
    let h2 := eval1D_D80 revHaag (encPolyAux p2 d2 0)
    let revTig := chunk16Rev 16 (tigMu128Acc tigMu []) []
    let h3 := eval1D_D128 revTig (encPolyAux r3 d3 0)
    let h4 := eval1D_D128 revTig (encPolyAux r4 d4 0)
    let wSum :=
      iAdd (iMul (Int.ofNat w0) h0)
      (iAdd (iMul (Int.ofNat w1) h1)
      (iAdd (iMul (Int.ofNat w2) h2)
      (iAdd (iMul (Int.ofNat w3) h3)
      (iAdd (iMul (Int.ofNat w4) h4)
            (iMul (Int.ofNat w5) h5)))))
    let hComb := sd8 wSum wDen
    let c80 := tdivNat (iMul (Int.ofNat cNum) D80I) cDen
    let cap80 := tdivNat (iMul (Int.ofNat capNum) D80I) capDen
    let res := l1_8 (iSub hComb c80)
    iLe (iAdd res errBudget80) cap80
  else false

end HaagerupKernel.FastHead
