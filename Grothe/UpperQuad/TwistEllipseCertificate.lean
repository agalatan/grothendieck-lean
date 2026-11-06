import Grothe.UpperQuad.TwistEllipseCheck

/-!
# Finite certificates for twisted ellipse majorants

A certificate records an exact disk plan, a common squared norm cap, and a panel error cap.
The checker recomputes the interval majorant on every covering disk and checks the Gauss error
expression from the common cap. Source panel indices and lengths are checked before lookup.

The Boolean acceptance defined here still needs the arithmetic and analytic soundness layers.
It is not itself a proof of a bound on the twisted integrand.

Agent-ID: codex-40e8. Refs #343, #334.
-/

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad

/-- An exact plan and its rational squared-norm and quadrature-error caps. -/
structure Certificate where
  plan : Plan
  massCap : ℚ
  errorCap : ℚ
  deriving Repr, Inhabited

/-- Recompute the maximum disk expression, validating all plan and profile guards. -/
def checkedMass (g : Power) (p : Grothe.UpperChaos.Q0GaussAddress.Panel) (pl : Plan) :
    Option Ival := do
  EllCheck.guard' EllCheck.chatOK
  EllCheck.guard' (EllCheck.planGeomOK p.lo p.hi pl.geometry)
  let t0 := EllCheck.taylorI (EllCheck.qI ((p.lo + p.hi) / 2)) 0
  let pos := isPos t0
  EllCheck.guard' (pos || isNeg t0)
  let coeffs ← columnCoeffs g
  panelM2 g coeffs pos p.lo p.hi pl

/-- The Gauss error expression evaluated from a rational common squared-norm cap. -/
def cappedError (p : Grothe.UpperChaos.Q0GaussAddress.Panel) (c : Certificate) :
    Option Ival := do
  EllCheck.guard' (decide (0 ≤ c.massCap))
  let amplitude := sqrtI EllCheck.P (EllCheck.qI c.massCap)
  let rhoInv := EllCheck.qI c.plan.geometry.rho⁻¹
  EllCheck.dv
    (mulI EllCheck.P (EllCheck.qI (4 * (p.hi - p.lo)))
      (mulI EllCheck.P amplitude (EllCheck.powB rhoInv (2 * p.order))))
    (subI EllCheck.P (ofInt EllCheck.P 1) rhoInv)

/-- Acceptance requires both the common mass cap and its computed error cap. -/
def certificateOK (g : Power) (p : Grothe.UpperChaos.Q0GaussAddress.Panel)
    (c : Certificate) : Bool :=
  decide (0 ≤ c.errorCap) &&
  match checkedMass g p c.plan, cappedError p c with
  | some mass, some err => decide (upperQ mass ≤ c.massCap) && decide (upperQ err ≤ c.errorCap)
  | _, _ => false

/-- Check one half-open range of actual source-panel indices. No truncated zip is used. -/
def shardOK (g : Power) (first stop : Nat) (cs : Array Certificate) : Bool :=
  let panels := Grothe.UpperChaos.Q0GaussAddressScan.sourcePanels.toArray
  decide (first ≤ stop) && decide (stop ≤ panels.size) && decide (cs.size = panels.size) &&
    (List.range (stop - first)).all fun k ↦
      certificateOK g (panels[first + k]!) (cs[first + k]!)

/-- The exact sum of the nonnegative panel error caps; acceptance checks their signs. -/
def totalCap (cs : Array Certificate) : ℚ :=
  (cs.toList.map fun c ↦ c.errorCap).sum

/-- Check the complete source length and exact total cap against a supplied panel budget.
Every per-panel predicate still has to be supplied by the range facts. -/
def totalOK (cs : Array Certificate) (budget : ℚ) : Bool :=
  decide (cs.size = Grothe.UpperChaos.Q0GaussAddressScan.sourcePanels.length) &&
    decide (totalCap cs ≤ budget)

end Grothe.UpperQuad.TwistEllCheck
