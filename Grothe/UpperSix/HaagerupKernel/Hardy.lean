import Grothe.UpperSix.HaagerupKernel.Basic

set_option warningAsError true

/-!
# Hardy-space Gaussian Schur checker & disc quadtree (Mathlib-free, precompiled)

Interval evaluation of:
1. the fixed-amplitude Gaussian Schur bound
   `1 / (16 j² |det(I − R)|² |det(I + R)|² det Z det(T + j I) det(T + 2 E + j I))`
   along the circle `|t| = ρ` via adaptive half-angle rational parametrization
   `t = σ ρ ((1 − s²) + 2 i s) / (1 + s²)`, `s ∈ [−1, 1]`;
2. the positive-definite kernel gates `det(I ∓ R) ≠ 0`, `Re(I ∓ R)⁻¹ ≻ 0` on a quadtree cover
   of the open disc `|t| < r`.

Agent-ID: gemini-21d5
-/

namespace HaagerupKernel.Hardy

open HaagerupKernel

/-- Complex interval `re + i · im`. -/
structure CI where
  re : Ival
  im : Ival

namespace CI

def ofR (a : Ival) : CI := ⟨a, zeroI⟩
def add (z w : CI) : CI := ⟨addI z.re w.re, addI z.im w.im⟩
def neg (z : CI) : CI := ⟨negI z.re, negI z.im⟩
def sub (z w : CI) : CI := ⟨subI z.re w.re, subI z.im w.im⟩
def mul (z w : CI) : CI :=
  ⟨subI (mulI z.re w.re) (mulI z.im w.im), addI (mulI z.re w.im) (mulI z.im w.re)⟩
def normSq (z : CI) : Ival := addI (mulI z.re z.re) (mulI z.im z.im)
def inv (z : CI) : CI := let n := invPosI (normSq z); ⟨mulI z.re n, negI (mulI z.im n)⟩
def one : CI := ofR (intI 1)

/-- Horner evaluation `c₀ + x (c₁ + x (c₂ + …))`. -/
def horner (x : CI) : List Ival → CI
  | [] => ofR zeroI
  | c :: cs => add (ofR c) (mul x (horner x cs))

end CI

/-- Complex symmetric `2 × 2` matrix `[[a, b], [b, c]]`. -/
structure SC where
  a : CI
  b : CI
  c : CI

/-- Real symmetric `2 × 2` matrix `[[a, b], [b, c]]`. -/
structure SR where
  a : Ival
  b : Ival
  c : Ival

namespace SC
def re (S : SC) : SR := ⟨S.a.re, S.b.re, S.c.re⟩
def im (S : SC) : SR := ⟨S.a.im, S.b.im, S.c.im⟩
end SC

namespace SR

def det (S : SR) : Ival := subI (mulI S.a S.c) (mulI S.b S.b)
def adj (S : SR) : SR := ⟨S.c, negI S.b, S.a⟩
def add (S T : SR) : SR := ⟨addI S.a T.a, addI S.b T.b, addI S.c T.c⟩
def smul (r : Ival) (S : SR) : SR := ⟨mulI r S.a, mulI r S.b, mulI r S.c⟩

/-- Sandwich product `S N S`. -/
def sand (S N : SR) : SR :=
  ⟨addI (addI (mulI N.a (mulI S.a S.a)) (mulI (intI 2) (mulI N.b (mulI S.a S.b)))) (mulI N.c (mulI S.b S.b)),
   addI (addI (mulI N.a (mulI S.a S.b)) (mulI N.b (addI (mulI S.a S.c) (mulI S.b S.b)))) (mulI N.c (mulI S.b S.c)),
   addI (addI (mulI N.a (mulI S.b S.b)) (mulI (intI 2) (mulI N.b (mulI S.b S.c)))) (mulI N.c (mulI S.c S.c))⟩

/-- Sylvester positive-definiteness check `a > 0 ∧ det > 0`. -/
def PD (S : SR) : Bool := posI S.a && posI S.det

end SR

/-- General real `2 × 2` matrix `[[a, b], [c, d]]` for `G₋ Z⁻¹ G₊`. -/
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
def toSR (M : GR) : SR := ⟨M.a, M.b, M.d⟩
end GR

/-- `(I − σ R)⁻¹` (`σ = ±1`) and `det(I − σ R)`. -/
def invIm (R : SC) (neg : Bool) : SC × CI :=
  let r : SC := if neg then ⟨CI.neg R.a, CI.neg R.b, CI.neg R.c⟩ else R
  let m00 := CI.sub CI.one r.a
  let m01 := CI.neg r.b
  let m11 := CI.sub CI.one r.c
  let d := CI.sub (CI.mul m00 m11) (CI.mul m01 m01)
  let di := CI.inv d
  (⟨CI.mul m11 di, CI.neg (CI.mul m01 di), CI.mul m00 di⟩, d)

def negjI (j : Ival) : SR := SR.smul (negI (intI 1)) ⟨j, zeroI, j⟩
def half : Ival := invPosI (intI 2)
def gpm (j : Ival) (R : SC) (neg : Bool) : SR := SR.add (SC.re (invIm R neg).1) (negjI j)
def zOf (j : Ival) (R : SC) : SR := SR.smul half (SR.add (gpm j R false) (gpm j R true))
def crOf (j : Ival) (R : SC) : SR :=
  SR.smul half (SR.add (gpm j R false) (SR.smul (negI (intI 1)) (gpm j R true)))
def ciOf (R : SC) : SR :=
  SR.smul half (SR.add (SC.im (invIm R false).1) (SR.smul (negI (intI 1)) (SC.im (invIm R true).1)))
def ziOf (j : Ival) (R : SC) : SR := SR.smul (invPosI (zOf j R).det) (zOf j R).adj
def tOf (j : Ival) (R : SC) : SR :=
  (GR.mul (GR.mul (GR.ofSR (gpm j R true)) (GR.ofSR (ziOf j R))) (GR.ofSR (gpm j R false))).toSR
def eOf (j : Ival) (R : SC) : SR :=
  SR.smul half (SR.add (SR.sand (crOf j R) (ziOf j R)) (SR.sand (ciOf R) (ziOf j R)))
def ndOf (R : SC) : Ival := mulI (CI.normSq (invIm R false).2) (CI.normSq (invIm R true).2)

/-- Fixed-amplitude Gaussian Schur denominator
`16 j² |det(I − R)|² |det(I + R)|² det Z det(T + j I) det(T + 2 E + j I)`. -/
def gaussDenOf (j : Ival) (R : SC) : Ival :=
  let t := tOf j R
  let e := eOf j R
  let ji : SR := ⟨j, zeroI, j⟩
  mulI (mulI (mulI (mulI (intI 16) (mulI j j)) (ndOf R)) (zOf j R).det)
    (mulI (SR.add t ji).det (SR.add (SR.add t (SR.smul (intI 2) e)) ji).det)

/-- Positivity gates and comparison `1 ≤ cap * gaussDenOf j R` (sharing intermediate terms). -/
def boxOK (j : Ival) (R : SC) (cap : Ival) : Bool :=
  let ip := invIm R false
  let im := invIm R true
  let np := CI.normSq ip.2
  let nm := CI.normSq im.2
  let gp := SR.add (SC.re ip.1) (negjI j)
  let gm := SR.add (SC.re im.1) (negjI j)
  let z := SR.smul half (SR.add gp gm)
  let zi := SR.smul (invPosI z.det) z.adj
  let t := (GR.mul (GR.mul (GR.ofSR gm) (GR.ofSR zi)) (GR.ofSR gp)).toSR
  let cr := SR.smul half (SR.add gp (SR.smul (negI (intI 1)) gm))
  let ci := SR.smul half (SR.add (SC.im ip.1) (SR.smul (negI (intI 1)) (SC.im im.1)))
  let e := SR.smul half (SR.add (SR.sand cr zi) (SR.sand ci zi))
  let ji : SR := ⟨j, zeroI, j⟩
  let den := mulI (mulI (mulI (mulI (intI 16) (mulI j j)) (mulI np nm)) z.det)
    (mulI (SR.add t ji).det (SR.add (SR.add t (SR.smul (intI 2) e)) ji).det)
  posI np && posI nm && z.PD && t.PD && posI den && decide (D ≤ (mulI cap den).lo)

theorem boxOK_eq_spec (j : Ival) (R : SC) (cap : Ival) :
    boxOK j R cap =
      (posI (CI.normSq (invIm R false).2) && posI (CI.normSq (invIm R true).2) &&
        (zOf j R).PD && (tOf j R).PD && posI (gaussDenOf j R) &&
        decide (D ≤ (mulI cap (gaussDenOf j R)).lo)) := rfl

/-- Covariance parameters `R(t) = M diag(t P(t²), t Q(t²)) M`. -/
structure RData where
  m00 : Ival
  m01 : Ival
  m11 : Ival
  P : List Ival
  Q : List Ival

/-- `R(t)` box evaluation. -/
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

/-- Rational circle chart `σ ρ ((1 − s²) + 2 i s) / (1 + s²)`. -/
def circleBox (rho : Ival) (neg : Bool) (s : Ival) : CI :=
  let s2 := mulI s s
  let den := invPosI (addI (intI 1) s2)
  let z : CI := ⟨mulI (mulI rho (subI (intI 1) s2)) den, mulI (mulI rho (mulI (intI 2) s)) den⟩
  if neg then CI.neg z else z

/-- Scaled upper bound of `2 arctan s₂ − 2 arctan s₁` on `[lo, hi] / D` (`lo * hi ≥ 0`). -/
def arcLenUp (lo hi : Int) : Int :=
  ceilDiv (2 * (hi - lo) * D * D) (D * D + min (lo * lo) (hi * hi))

/-- Certified upper bound of `1 / gaussDenOf j R`. -/
def gaussVal (j : Ival) (R : SC) : Option Int :=
  let den := gaussDenOf j R
  if posI den then
    let v := (invPosI den).hi
    if boxOK j R ⟨v, v⟩ then some v else none
  else none

/-- Try accepting `[lo, hi] / D` as one Riemann-sum leaf; bisect unless tight or at max depth. -/
def leafGauss (j rho : Ival) (dat : RData) (neg : Bool) (w tol : Int) (last : Bool)
    (lo hi : Int) : Option Int :=
  if hi - lo ≤ w && posI (addI (intI 1) (mulI ⟨lo, hi⟩ ⟨lo, hi⟩)) then
    match gaussVal j (Rbox dat (circleBox rho neg ⟨lo, hi⟩)) with
    | some v =>
      let mid := (lo + hi) / 2
      let tight := match gaussVal j (Rbox dat (circleBox rho neg ⟨mid, mid⟩)) with
        | some vm => decide ((v - vm) * (hi - lo) ≤ tol)
        | none => false
      if tight || last then some (shUp (v * arcLenUp lo hi)) else none
    | none => none
  else none

/-- Adaptive binary bisection cover of `[lo, hi] / D` returning scaled `∫ gF dθ` upper bound. -/
def coverGauss (j rho : Ival) (dat : RData) (neg : Bool) (w tol : Int) :
    Nat → Int → Int → Option Int
  | depth, lo, hi =>
    match leafGauss j rho dat neg w tol (depth == 0) lo hi with
    | some x => some x
    | none =>
      match depth with
      | 0 => none
      | d + 1 =>
        let mid := (lo + hi) / 2
        match coverGauss j rho dat neg w tol d lo mid,
              coverGauss j rho dat neg w tol d mid hi with
        | some x, some y => some (x + y)
        | _, _ => none

/-- Rational lower bound for `π` (`Real.pi_gt_d20`). -/
def piLo20Q : Rat := (314159265358979323846 : Int) / ((10 : Int) ^ 20)

/-- Certify `(2π)⁻¹ ∫₀^{2π} ‖HholPair‖² ≤ budgetQ` over all four half-charts. -/
def circleMeanOK (dat : RData) (rhoQ jQ budgetQ : Rat) (depth : Nat) : Bool :=
  let j := ofRatI jQ
  let rho := ofRatI rhoQ
  let w := D / 64
  let tol := D * D / 50000
  match coverGauss j rho dat false w tol depth (-D) 0,
        coverGauss j rho dat false w tol depth 0 D,
        coverGauss j rho dat true w tol depth (-D) 0,
        coverGauss j rho dat true w tol depth 0 D with
  | some a, some b, some c, some d =>
    decide (a + b + c + d ≤ ofRatLo (2 * piLo20Q * budgetQ))
  | _, _, _, _ => false

/-- Kernel positivity gates `det(I ∓ R) ≠ 0` and `Re(I ∓ R)⁻¹ ≻ 0`. -/
def kerGates (R : SC) : Bool :=
  let ip := invIm R false
  let im := invIm R true
  posI (CI.normSq ip.2) && posI (CI.normSq im.2) &&
    (SC.re ip.1).PD && (SC.re im.1).PD

/-- Whether `[xlo, xhi] + i [ylo, yhi]` lies outside the open disc `|t|² < r2 / D`. -/
def outsideDisc (r2 : Int) (x y : Ival) : Bool :=
  decide (r2 ≤ (addI (mulI x x) (mulI y y)).lo)

/-- Quadtree cover of `[xlo, xhi] × [ylo, yhi]` checking `KerPos` on `|t|² < r2 / D`. -/
def discCover (dat : RData) (r2 : Int) : Nat → Int → Int → Int → Int → Bool
  | depth, xlo, xhi, ylo, yhi =>
    outsideDisc r2 ⟨xlo, xhi⟩ ⟨ylo, yhi⟩ || kerGates (Rbox dat ⟨⟨xlo, xhi⟩, ⟨ylo, yhi⟩⟩) ||
      match depth with
      | 0 => false
      | d + 1 =>
        let xm := (xlo + xhi) / 2
        let ym := (ylo + yhi) / 2
        discCover dat r2 d xlo xm ylo ym && discCover dat r2 d xm xhi ylo ym &&
          discCover dat r2 d xlo xm ym yhi && discCover dat r2 d xm xhi ym yhi

/-- Certify `KerPos` on the open disc `|t| < regionRQ` (`regionRQ ≤ 2`). -/
def regionOK (dat : RData) (regionRQ : Rat) : Bool :=
  discCover dat (ofRatHi (regionRQ * regionRQ)) 30 (-2 * D) (2 * D) (-2 * D) (2 * D)

end HaagerupKernel.Hardy
