import GrotheKernel.HardyArc

/-!
# Shared evaluation of the Hardy checks

The interval checker exposes individual Schur quantities for its soundness
proofs. Evaluating those quantities separately repeats matrix inversions and
products. This evaluator shares their values and is proved equal to the
original checker, including every outward rounding operation and failed gate.

Agent-ID: codex-7c2e
-/

namespace Grothe.UpperChaos.HardyArcEval

open GrotheKernel GrotheKernel.HardyArc

/-- Evaluate the Schur quantities once per box. -/
def schurValueShared (j : Ival) (R : SC) : Option Int :=
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
  let w := SR.add (SR.smul (intI 2) t) e
  let den := mulI (mulI (mulI (mulI (intI 64) (mulI (mulI j j) (mulI j j)))
    (mulI np nm)) z.det) w.det
  if posI np && posI nm && z.PD && t.PD && posI den then
    some (invPosI den).hi
  else none

theorem schurValueShared_eq (j : Ival) (R : SC) :
    schurValueShared j R = schurValue j R := rfl

/-- The region gates share the two inverses rather than computing each twice. -/
def kerGatesShared (R : SC) : Bool :=
  let ip := invIm R false
  let im := invIm R true
  posI (CI.normSq ip.2) && posI (CI.normSq im.2) &&
    (SC.re ip.1).PD && (SC.re im.1).PD

theorem kerGatesShared_eq (R : SC) : kerGatesShared R = kerGates R := rfl

/-- The same leaf test with shared Schur evaluation at the box and its midpoint. -/
def leafAttemptShared (j rho : Ival) (dat : RData) (neg : Bool)
    (w tol : Int) (last : Bool) (lo hi : Int) : Option Int :=
  if hi - lo ≤ w && posI (addI (intI 1) (mulI ⟨lo, hi⟩ ⟨lo, hi⟩)) then
    match schurValueShared j (Rbox dat (circleBox rho neg ⟨lo, hi⟩)) with
    | some v =>
      let mid := (lo + hi) / 2
      let tight := match schurValueShared j (Rbox dat (circleBox rho neg ⟨mid, mid⟩)) with
        | some vm => decide (v ≤ vm + tol)
        | none => false
      if tight || last then some (shUp (v * arcLenUp lo hi)) else none
    | none => none
  else none

theorem leafAttemptShared_eq (j rho : Ival) (dat : RData) (neg : Bool)
    (w tol : Int) (last : Bool) (lo hi : Int) :
    leafAttemptShared j rho dat neg w tol last lo hi =
      leafAttempt j rho dat neg w tol last lo hi := by
  unfold leafAttemptShared leafAttempt
  simp only [schurValueShared_eq]
  rfl

/-- The original adaptive subdivision, with exactly the same leaf results. -/
def coverShared (j rho : Ival) (dat : RData) (neg : Bool) (w tol : Int) :
    Nat → Int → Int → Option Int
  | depth, lo, hi =>
    match leafAttemptShared j rho dat neg w tol (depth == 0) lo hi with
    | some x => some x
    | none =>
      match depth with
      | 0 => none
      | d + 1 =>
        match coverShared j rho dat neg w tol d lo ((lo + hi) / 2),
            coverShared j rho dat neg w tol d ((lo + hi) / 2) hi with
        | some x, some y => some (x + y)
        | _, _ => none

theorem coverShared_eq (j rho : Ival) (dat : RData) (neg : Bool) (w tol : Int)
    (depth : Nat) (lo hi : Int) :
    coverShared j rho dat neg w tol depth lo hi = cover j rho dat neg w tol depth lo hi := by
  induction depth generalizing lo hi with
  | zero =>
      simp only [coverShared, cover, leafAttemptShared_eq]
      rfl
  | succ depth ih =>
      simp only [coverShared, cover, leafAttemptShared_eq, ih]
      rfl

end Grothe.UpperChaos.HardyArcEval

/-- info: 'Grothe.UpperChaos.HardyArcEval.coverShared_eq' depends on axioms: [propext, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.HardyArcEval.coverShared_eq
