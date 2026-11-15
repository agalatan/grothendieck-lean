-- Grothe/UpperChaos/HardyGaussianCheck.lean
import Grothe.UpperChaos.HardyArcData

/-!
# Finite interval checks for the fixed Gaussian amplitude

The existing covariance data and interval operations certify the stronger Gaussian
denominator on the same Hardy circle. No frozen arithmetic kernel is changed.

Agent-ID: codex-9b17. Refs #380.
-/

namespace Grothe.UpperChaos.HardyGaussianCheck

open GrotheKernel GrotheKernel.HardyArc
open HardyArcSound HardyArcCover

/-- The denominator obtained by integrating both fixed Gaussian amplitudes. -/
def denOf (j : Ival) (R : SC) : Ival :=
  let t := tOf j R
  let e := eOf j R
  let ji : SR := ⟨j, zeroI, j⟩
  mulI (mulI (mulI (mulI (intI 16) (mulI j j)) (ndOf R)) (zOf j R).det)
    (mulI (SR.add t ji).det (SR.add (SR.add t (SR.smul (intI 2) e)) ji).det)

/-- Gates and the exact comparison `denominator ≥ 4/5`. -/
def boxOK (j : Ival) (R : SC) : Bool :=
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
  posI np && posI nm && z.PD && t.PD && decide (4 * D ≤ 5 * den.lo)

theorem boxOK_eq_spec (j : Ival) (R : SC) :
    boxOK j R =
      (posI (CI.normSq (invIm R false).2) && posI (CI.normSq (invIm R true).2) &&
        (zOf j R).PD && (tOf j R).PD && decide (4 * D ≤ 5 * (denOf j R).lo)) := rfl

/-- One interval of either rational circle chart. -/
def leafOK (neg : Bool) (lo hi : Int) : Bool :=
  posI (addI (intI 1) (mulI ⟨lo, hi⟩ ⟨lo, hi⟩)) &&
    boxOK (ofRatI jQ) (Rbox hardyData (circleBox (ofRatI rhoQ) neg ⟨lo, hi⟩))

/-- Bisect only when the current interval does not certify the bound. -/
def coverOK (neg : Bool) : Nat → Int → Int → Bool
  | 0, lo, hi => leafOK neg lo hi
  | depth + 1, lo, hi =>
      leafOK neg lo hi ||
        (coverOK neg depth lo ((lo + hi) / 2) &&
          coverOK neg depth ((lo + hi) / 2) hi)

/-- The left and right halves of each circle chart. -/
def chartOK (neg right : Bool) : Bool :=
  if right then coverOK neg 24 0 D else coverOK neg 24 (-D) 0

end Grothe.UpperChaos.HardyGaussianCheck
