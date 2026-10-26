import GrotheCapsKernel.Basic

/-!
# The Hardy arc checker (Mathlib-free, precompiled)

Interval evaluation of the Gaussian Schur bound `1/(64 j⁴ |det(I − R²)|² det Z det W)` along the circle
`|t| = ρ`, with the gates `Z ≻ 0`, `T ≻ 0` (step 4 of the `hardy` plan). Every operation mirrors a Lean
definition (`Sym2C.sq`, `detIm`, `Amat`, `Cmat`, `SchurMain.Bj`, `SchurKernel.Z/Kr/Ki/T/E/W`), so that soundness is
the composition of per-operation membership lemmas (`Grothe/UpperChaos/HardyArcSound.lean`).

The circle is parametrized without trigonometry: `t = σ ρ ((1 − s²) + 2 i s)/(1 + s²)`, `s = tan(θ/2) ∈ [−1, 1]`,
`σ = ±1` (two charts cover the circle). `cover` bisects `s`-intervals until the gates pass on a small enough
piece, and returns the sum over the accepted pieces of `(upper bound of the Schur value) × (upper bound of the
arc length 2Δs/(1 + min s²))`, all scaled by `D`.
-/

namespace GrotheKernel.HardyArc

/-- `a − b`. -/
def subI (a b : Ival) : Ival := addI a (negI b)

/-- `0 < a` on the whole interval. -/
def posI (a : Ival) : Bool := decide (0 < a.lo)

/-- Outward-rounded `1/a` for a positive interval: `[⌊D²/hi⌋, ⌈D²/lo⌉]`. -/
def invPosI (a : Ival) : Ival := ⟨(D * D) / a.hi, -((-(D * D)) / a.lo)⟩

/-- Ceiling division by a positive integer. -/
def ceilDiv (a b : Int) : Int := Int.neg ((Int.neg a) / b)

/-- The thin interval of an integer. -/
def intI (n : Int) : Ival := ⟨n * D, n * D⟩

/-! ### Complex intervals -/

structure CI where
  re : Ival
  im : Ival

namespace CI

def ofR (a : Ival) : CI := ⟨a, zeroI⟩
def add (z w : CI) : CI := ⟨addI z.re w.re, addI z.im w.im⟩
def neg (z : CI) : CI := ⟨negI z.re, negI z.im⟩
def sub (z w : CI) : CI := ⟨subI z.re w.re, subI z.im w.im⟩
def mul (z w : CI) : CI := ⟨subI (mulI z.re w.re) (mulI z.im w.im), addI (mulI z.re w.im) (mulI z.im w.re)⟩
def normSq (z : CI) : Ival := addI (mulI z.re z.re) (mulI z.im z.im)
/-- `z⁻¹ = conj z / |z|²` (valid when `posI (normSq z)`). -/
def inv (z : CI) : CI := let n := invPosI (normSq z); ⟨mulI z.re n, negI (mulI z.im n)⟩
def one : CI := ofR (intI 1)

/-- Horner evaluation `c₀ + x (c₁ + x (c₂ + …))`. -/
def horner (x : CI) : List Ival → CI
  | [] => ofR zeroI
  | c :: cs => add (ofR c) (mul x (horner x cs))

end CI

/-! ### Symmetric 2×2 matrices -/

/-- A complex symmetric matrix `[[a, b], [b, c]]` (mirrors `Sym2C`). -/
structure SC where
  a : CI
  b : CI
  c : CI

/-- A real symmetric matrix (mirrors `Sym2R`). -/
structure SR where
  a : Ival
  b : Ival
  c : Ival

namespace SC

/-- `det(I − R²)` (mirrors `Sym2C.detIm` with `Sym2C.sq`). -/
def detIm (R : SC) : CI :=
  let s1 := CI.add (CI.mul R.a R.a) (CI.mul R.b R.b)
  let s2 := CI.add (CI.mul R.a R.b) (CI.mul R.b R.c)
  let s3 := CI.add (CI.mul R.b R.a) (CI.mul R.c R.b)
  let s4 := CI.add (CI.mul R.b R.b) (CI.mul R.c R.c)
  CI.sub (CI.mul (CI.sub CI.one s1) (CI.sub CI.one s4)) (CI.mul s2 s3)

/-- `A = (I − R²)⁻¹` (mirrors `Sym2C.Amat`). -/
def Amat (R : SC) : SC :=
  let s1 := CI.add (CI.mul R.a R.a) (CI.mul R.b R.b)
  let s2 := CI.add (CI.mul R.a R.b) (CI.mul R.b R.c)
  let s4 := CI.add (CI.mul R.b R.b) (CI.mul R.c R.c)
  let di := CI.inv R.detIm
  ⟨CI.mul (CI.sub CI.one s4) di, CI.mul s2 di, CI.mul (CI.sub CI.one s1) di⟩

/-- `C = R A` (mirrors `Sym2C.Cmat`). -/
def Cmat (R : SC) : SC :=
  let A := R.Amat
  ⟨CI.add (CI.mul R.a A.a) (CI.mul R.b A.b), CI.add (CI.mul R.a A.b) (CI.mul R.b A.c),
    CI.add (CI.mul R.b A.b) (CI.mul R.c A.c)⟩

def re (S : SC) : SR := ⟨S.a.re, S.b.re, S.c.re⟩
def im (S : SC) : SR := ⟨S.a.im, S.b.im, S.c.im⟩

end SC

namespace SR

def det (S : SR) : Ival := subI (mulI S.a S.c) (mulI S.b S.b)
def adj (S : SR) : SR := ⟨S.c, negI S.b, S.a⟩
def add (S T : SR) : SR := ⟨addI S.a T.a, addI S.b T.b, addI S.c T.c⟩
def smul (r : Ival) (S : SR) : SR := ⟨mulI r S.a, mulI r S.b, mulI r S.c⟩
/-- `S N S` (mirrors `SchurKernel.sand`). -/
def sand (S N : SR) : SR :=
  ⟨addI (addI (mulI N.a (mulI S.a S.a)) (mulI (intI 2) (mulI N.b (mulI S.a S.b)))) (mulI N.c (mulI S.b S.b)),
   addI (addI (mulI N.a (mulI S.a S.b)) (mulI N.b (addI (mulI S.a S.c) (mulI S.b S.b)))) (mulI N.c (mulI S.b S.c)),
   addI (addI (mulI N.a (mulI S.b S.b)) (mulI (intI 2) (mulI N.b (mulI S.b S.c)))) (mulI N.c (mulI S.c S.c))⟩
/-- Positive definite on the whole box. -/
def PD (S : SR) : Bool := posI S.a && posI S.det

end SR

/-! ### The Schur value at one box of `R` -/

/-- A general real 2×2 matrix `[[a, b], [c, d]]` (for the product `G₋ Z⁻¹ G₊`). -/
structure GR where
  a : Ival
  b : Ival
  c : Ival
  d : Ival

namespace GR
def ofSR (S : SR) : GR := ⟨S.a, S.b, S.b, S.c⟩
def mul (M N : GR) : GR :=
  ⟨addI (mulI M.a N.a) (mulI M.b N.c), addI (mulI M.a N.b) (mulI M.b N.d),
   addI (mulI M.c N.a) (mulI M.d N.c), addI (mulI M.c N.b) (mulI M.d N.d)⟩
/-- The symmetric reading `[[a, b], [b, d]]` (valid when the true matrix is symmetric). -/
def toSR (M : GR) : SR := ⟨M.a, M.b, M.d⟩
end GR

/-- `(I − σR)⁻¹` for `σ = ±1`, as `adj(I − σR) / det(I − σR)`, with its determinant. -/
def invIm (R : SC) (neg : Bool) : SC × CI :=
  let r : SC := if neg then ⟨CI.neg R.a, CI.neg R.b, CI.neg R.c⟩ else R
  let m00 := CI.sub CI.one r.a
  let m01 := CI.neg r.b
  let m11 := CI.sub CI.one r.c
  let d := CI.sub (CI.mul m00 m11) (CI.mul m01 m01)
  let di := CI.inv d
  (⟨CI.mul m11 di, CI.neg (CI.mul m01 di), CI.mul m00 di⟩, d)

/-- `jI` as a symmetric matrix, negated: `−j I`. -/
def negjI (j : Ival) : SR := SR.smul (negI (intI 1)) ⟨j, zeroI, j⟩
/-- `1/2`. -/
def half : Ival := invPosI (intI 2)
/-- `G± = Re (I ∓ R)⁻¹ − jI` (`neg = false`: `G₊`). -/
def gpm (j : Ival) (R : SC) (neg : Bool) : SR := SR.add (SC.re (invIm R neg).1) (negjI j)
/-- `Z = (G₊ + G₋)/2`. -/
def zOf (j : Ival) (R : SC) : SR := SR.smul half (SR.add (gpm j R false) (gpm j R true))
/-- `Cr = (G₊ − G₋)/2`. -/
def crOf (j : Ival) (R : SC) : SR := SR.smul half (SR.add (gpm j R false) (SR.smul (negI (intI 1)) (gpm j R true)))
/-- `Ci = Im((I − R)⁻¹ − (I + R)⁻¹)/2`. -/
def ciOf (R : SC) : SR :=
  SR.smul half (SR.add (SC.im (invIm R false).1) (SR.smul (negI (intI 1)) (SC.im (invIm R true).1)))
/-- `Z⁻¹ = adj Z / det Z`. -/
def ziOf (j : Ival) (R : SC) : SR := SR.smul (invPosI (zOf j R).det) (zOf j R).adj
/-- `T = G₋ Z⁻¹ G₊`. -/
def tOf (j : Ival) (R : SC) : SR :=
  (GR.mul (GR.mul (GR.ofSR (gpm j R true)) (GR.ofSR (ziOf j R))) (GR.ofSR (gpm j R false))).toSR
/-- `E = (Cr Z⁻¹ Cr + Ci Z⁻¹ Ci)/2`. -/
def eOf (j : Ival) (R : SC) : SR :=
  SR.smul half (SR.add (SR.sand (crOf j R) (ziOf j R)) (SR.sand (ciOf R) (ziOf j R)))
/-- `W = 2T + E`. -/
def wOf (j : Ival) (R : SC) : SR := SR.add (SR.smul (intI 2) (tOf j R)) (eOf j R)
/-- `|det(I − R)|² |det(I + R)|²`. -/
def ndOf (R : SC) : Ival := mulI (CI.normSq (invIm R false).2) (CI.normSq (invIm R true).2)
/-- `64 j⁴ |det(I − R²)|² det Z det W`. -/
def denOf (j : Ival) (R : SC) : Ival :=
  mulI (mulI (mulI (mulI (intI 64) (mulI (mulI j j) (mulI j j))) (ndOf R)) (zOf j R).det) (wOf j R).det

/-- All gates: both determinants nonzero, `Z ≻ 0`, `T ≻ 0`, positive denominator. -/
def gatesOK (j : Ival) (R : SC) : Bool :=
  posI (CI.normSq (invIm R false).2) && posI (CI.normSq (invIm R true).2) && (zOf j R).PD && (tOf j R).PD &&
    posI (denOf j R)

/-- Gates and the scaled upper bound of `1/(64 j⁴ |det(I − R²)|² det Z det W)`; `none` if a gate fails.
Cancellation-free form: `G± = Re (I ∓ R)⁻¹ − jI = Z ± Cr`, `T = G₋ Z⁻¹ G₊`,
`|det(I − R²)|² = |det(I − R)|² |det(I + R)|²`. -/
def schurValue (j : Ival) (R : SC) : Option Int :=
  if gatesOK j R then some (invPosI (denOf j R)).hi else none

/-! ### The covariance along the circle -/

/-- Data of `R(t) = M diag(p(t), q(t)) M`: the smoothing entries and the coefficient lists of `P`, `Q`
(`p(t) = t P(t²)`, `q(t) = t Q(t²)`). -/
structure RData where
  m00 : Ival
  m01 : Ival
  m11 : Ival
  P : List Ival
  Q : List Ival

/-- `R(t)` (mirrors `Rt`). -/
def Rbox (dat : RData) (t : CI) : SC :=
  let t2 := CI.mul t t
  let p := CI.mul t (CI.horner t2 dat.P)
  let q := CI.mul t (CI.horner t2 dat.Q)
  let m00 := CI.ofR dat.m00
  let m01 := CI.ofR dat.m01
  let m11 := CI.ofR dat.m11
  ⟨CI.add (CI.mul (CI.mul m00 m00) p) (CI.mul (CI.mul m01 m01) q),
   CI.add (CI.mul (CI.mul m00 m01) p) (CI.mul (CI.mul m01 m11) q),
   CI.add (CI.mul (CI.mul m01 m01) p) (CI.mul (CI.mul m11 m11) q)⟩

/-- The circle point `σ ρ ((1 − s²) + 2 i s)/(1 + s²)` for `s` in an interval. -/
def circleBox (rho : Ival) (neg : Bool) (s : Ival) : CI :=
  let s2 := mulI s s
  let den := invPosI (addI (intI 1) s2)
  let z : CI := ⟨mulI (mulI rho (subI (intI 1) s2)) den, mulI (mulI rho (mulI (intI 2) s)) den⟩
  if neg then CI.neg z else z

/-- Upper bound (scaled) of the arc length `2 arctan s₂ − 2 arctan s₁ ≤ 2 (s₂ − s₁) / (1 + min(s₁², s₂²))` for
`s₁ ≤ s₂` with `s₁ s₂ ≥ 0`. -/
def arcLenUp (lo hi : Int) : Int :=
  ceilDiv (2 * (hi - lo) * D * D) (D * D + min (lo * lo) (hi * hi))

/-- Try to accept `[lo, hi]` as one piece: width at most `w`, `1 + s² > 0`, the gates pass, and the bound exceeds the
midpoint value by at most `tol` (scaled) unless `last`. Returns the scaled `value × length`. -/
def leafAttempt (j rho : Ival) (dat : RData) (neg : Bool) (w tol : Int) (last : Bool) (lo hi : Int) : Option Int :=
  if hi - lo ≤ w && posI (addI (intI 1) (mulI ⟨lo, hi⟩ ⟨lo, hi⟩)) then
    match schurValue j (Rbox dat (circleBox rho neg ⟨lo, hi⟩)) with
    | some v =>
      let mid := (lo + hi) / 2
      let tight := match schurValue j (Rbox dat (circleBox rho neg ⟨mid, mid⟩)) with
        | some vm => decide (v ≤ vm + tol)
        | none => false
      if tight || last then some (shUp (v * arcLenUp lo hi)) else none
    | none => none
  else none

/-- The recursive cover of `[lo, hi]` (scaled `s`): accept a piece (`leafAttempt`), else bisect (at most `depth` more
times; pieces never straddle `0`). Returns the scaled sum of `value × length`, or `none`. -/
def cover (j rho : Ival) (dat : RData) (neg : Bool) (w tol : Int) : Nat → Int → Int → Option Int
  | depth, lo, hi =>
    match leafAttempt j rho dat neg w tol (depth == 0) lo hi with
    | some x => some x
    | none =>
      match depth with
      | 0 => none
      | d + 1 =>
        match cover j rho dat neg w tol d lo ((lo + hi) / 2), cover j rho dat neg w tol d ((lo + hi) / 2) hi with
        | some x, some y => some (x + y)
        | _, _ => none

/-- The left endpoint `−1 + k/n` (scaled) of piece `k` of `[−1, 1]` cut into `2n` pieces (`n` divides `D`). -/
def pieceLo (n k : Nat) : Int := -D + Int.ofNat k * (D / Int.ofNat n)

/-- The sum of `cover` over the pieces `k ∈ [k₀, k₀ + m)` of one chart (`none` if a piece fails). -/
def chartSum (j rho : Ival) (dat : RData) (neg : Bool) (w tol : Int) (depth n : Nat) : Nat → Nat → Option Int
  | _, 0 => some 0
  | k₀, m + 1 =>
    match cover j rho dat neg w tol depth (pieceLo n k₀) (pieceLo n (k₀ + 1)),
        chartSum j rho dat neg w tol depth n (k₀ + 1) m with
    | some x, some y => some (x + y)
    | _, _ => none

/-- A part of the circle passes when its sum is at most `cap` (scaled). -/
def partOK (j rho : Ival) (dat : RData) (neg : Bool) (w tol : Int) (depth n k₀ m : Nat) (cap : Int) : Bool :=
  match chartSum j rho dat neg w tol depth n k₀ m with
  | some x => decide (x ≤ cap)
  | none => false

/-! ### The tube gates on a larger circle (for the region of holomorphy) -/

/-- `I ± Re R ≻ 0` on a box of `R`. -/
def tubeOK (R : SC) : Bool :=
  let reR := SC.re R
  let one : SR := ⟨intI 1, zeroI, intI 1⟩
  (SR.add one (SR.smul (negI (intI 1)) reR)).PD && (SR.add one reR).PD

/-- The tube gates on all pieces of `[lo, hi]` (scaled `s`), bisecting at most `depth` times. -/
def tubeCover (rho : Ival) (dat : RData) (neg : Bool) : Nat → Int → Int → Bool
  | depth, lo, hi =>
    (posI (addI (intI 1) (mulI ⟨lo, hi⟩ ⟨lo, hi⟩)) && tubeOK (Rbox dat (circleBox rho neg ⟨lo, hi⟩))) ||
      match depth with
      | 0 => false
      | d + 1 => tubeCover rho dat neg d lo ((lo + hi) / 2) && tubeCover rho dat neg d ((lo + hi) / 2) hi

end GrotheKernel.HardyArc
