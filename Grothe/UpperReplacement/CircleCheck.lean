import GrotheKernel.HardyArc

set_option warningAsError true

/-!
# Adaptive Gaussian-amplitude circle and disc checkers for arbitrary channels

Combines the `HardyGaussianCheck.boxOK` arithmetic (the sharper `16 j²` fixed-amplitude Schur
denominator) with `HardyArc.arcLenUp` adaptive half-angle bisection so sharp boundary peaks near
`θ = 0, π` are resolved automatically without fitting channel-specific majorant polynomials.

Agent-ID: codex-a7c4. Adapted from the local gemini-21d5 draft.
Source SHA256: 18dfdd28b382cbdb4a7a3b564577a475e23a8fd02ce5cdc6ca874a6b1bcdba3c
-/

namespace Grothe.UpperReplacement.CircleCheck

open GrotheKernel GrotheKernel.HardyArc

local notation "ℚ" => Rat

/-- The arithmetic smoothing data are kept Mathlib-free. `CircleSound` checks equality with
the production smoothing entries, including these rational endpoints. -/
def smoothingB : ℚ := 954738503521943 / 3125000000000000
def smoothingPu : ℚ := 1 / (1 + smoothingB ^ 2)
def smoothingSqrt : Ival :=
  ⟨ofRatLo (894427190999915878563669467492 / 10 ^ 30),
    ofRatHi (894427190999915878563669467493 / 10 ^ 30)⟩

/-- `RData` for a smoothed `GT` channel `(pl, ql)` sharing the smoothing matrix of `hardyData`. -/
def gtRData (pl ql : List ℚ) : RData :=
  ⟨addI (ofRatI smoothingPu) (mulI smoothingSqrt (ofRatI (1 - smoothingPu))),
   subI (ofRatI (smoothingPu * smoothingB))
     (mulI smoothingSqrt (ofRatI (smoothingPu * smoothingB))),
   addI (ofRatI (smoothingPu * smoothingB ^ 2))
     (mulI smoothingSqrt (ofRatI (1 - smoothingPu * smoothingB ^ 2))),
   pl.map ofRatI, ql.map ofRatI⟩

/-- `RData` for an unsmoothed (`M = I₂`) channel `(pl, ql)` (e.g., `tiger` or `phase`). -/
def unsmoothedRData (pl ql : List ℚ) : RData :=
  ⟨intI 1, zeroI, intI 1, pl.map ofRatI, ql.map ofRatI⟩

/-- The existing fixed-amplitude Schur denominator, without analytic imports. -/
def gaussianDen (j : Ival) (R : SC) : Ival :=
  let t := tOf j R
  let e := eOf j R
  let ji : SR := ⟨j, zeroI, j⟩
  mulI (mulI (mulI (mulI (intI 16) (mulI j j)) (ndOf R)) (zOf j R).det)
    (mulI (SR.add t ji).det (SR.add (SR.add t (SR.smul (intI 2) e)) ji).det)

/-- All positivity gates and the whole-box denominator comparison remain mandatory. -/
def gaussianBoxOK (j : Ival) (R : SC) (cap : Ival) : Bool :=
  posI (CI.normSq (invIm R false).2) && posI (CI.normSq (invIm R true).2) &&
    (zOf j R).PD && (tOf j R).PD && posI (gaussianDen j R) &&
      decide (D ≤ (mulI cap (gaussianDen j R)).lo)

/-- Scaled upper bound of `1 / denominator` on box `R`, certified via `HardyGaussianCheck.boxOK`. -/
def gaussVal (j : Ival) (R : SC) : Option Int :=
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
  let ci := SR.smul half
    (SR.add (SC.im ip.1) (SR.smul (negI (intI 1)) (SC.im im.1)))
  let e := SR.smul half (SR.add (SR.sand cr zi) (SR.sand ci zi))
  let ji : SR := ⟨j, zeroI, j⟩
  let den := mulI (mulI (mulI (mulI (intI 16) (mulI j j)) (mulI np nm)) z.det)
    (mulI (SR.add t ji).det (SR.add (SR.add t (SR.smul (intI 2) e)) ji).det)
  if posI den then
    let v := (invPosI den).hi
    if posI np && posI nm && z.PD && t.PD && posI den &&
        decide (D ≤ (mulI ⟨v, v⟩ den).lo) then some v else none
  else none

/-- Sharing the intermediate matrices does not change the original arithmetic specification. -/
theorem gaussVal_eq_spec (j : Ival) (R : SC) :
    gaussVal j R =
      (let den := gaussianDen j R
       if posI den then
         let v := (invPosI den).hi
         if gaussianBoxOK j R ⟨v, v⟩ then some v else none
       else none) := rfl

/-- Try accepting `[lo, hi] / D` as one Riemann-sum leaf; bisect unless tight or at max depth. -/
def leafGauss (j rho : Ival) (dat : RData) (neg : Bool) (w tol : Int) (last : Bool)
    (lo hi : Int) : Option Int :=
  if hi - lo ≤ w && posI (addI (intI 1) (mulI ⟨lo, hi⟩ ⟨lo, hi⟩)) then
    match gaussVal j (Rbox dat (circleBox rho neg ⟨lo, hi⟩)) with
    | some v =>
      let mid := (lo + hi) / 2
      let tight := match gaussVal j (Rbox dat (circleBox rho neg ⟨mid, mid⟩)) with
        | some vm => decide (v ≤ vm + tol)
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
def piLo20Q : ℚ := 314159265358979323846 / 10 ^ 20

/-- Certify `(2π)⁻¹ ∫_0^{2π} ‖HholPair‖² ≤ budgetQ` over all four half-charts. -/
def circleMeanOK (dat : RData) (rhoQ jQ budgetQ : ℚ) (depth : Nat) : Bool :=
  let j := ofRatI jQ
  let rho := ofRatI rhoQ
  let w := D / 64
  let tol := D / 40
  match coverGauss j rho dat false w tol depth (-D) 0,
        coverGauss j rho dat false w tol depth 0 D,
        coverGauss j rho dat true w tol depth (-D) 0,
        coverGauss j rho dat true w tol depth 0 D with
  | some a, some b, some c, some d =>
    decide (a + b + c + d ≤ ofRatLo (2 * piLo20Q * budgetQ))
  | _, _, _, _ => false

/-- Quadtree `KerPos` check on the open disc `|t| < regionRQ`. -/
def regionOK (dat : RData) (regionRQ : ℚ) : Bool :=
  discCheck dat (ofRatHi (regionRQ ^ 2))

end Grothe.UpperReplacement.CircleCheck
