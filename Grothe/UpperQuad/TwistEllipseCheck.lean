import Grothe.UpperQuad.QuadEllipseCheck
import GrotheQuadExtKernel.TwistNode

/-!
# Executable ellipse majorants for the three twisted powers

This module evaluates the proposed twisted Y and coarse K majorants using outward-rounded
interval arithmetic. It reuses the profile and disk geometry of `EllCheck`, but does not use its
untwisted conditional majorants. The degrees come from the production `twistParams`.

These are executable definitions only. No theorem here identifies their output with a bound on
the actual twisted integrand, supplies its analytic continuation, or certifies a panel plan.

Agent-ID: codex-40e8. Refs #343, #334.
-/

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad

/-- The three production powers, indexed by `0, 1, 2`. -/
abbrev Power := Fin 3

/-- The actual power `j = 1, 2, 3`. -/
def powerNat (g : Power) : Nat := g.val + 1

/-- The production output degree: `181`, `91`, or `51`. -/
def degree (g : Power) : Nat := (twistParams (powerNat g)).Dout

/-- The degree of the phase power in its two complexified variables. -/
def phaseDegree (g : Power) : Nat := 35 * powerNat g

/-- The finite canonical cutoff after applying the phase power. -/
def totalDegree (g : Power) : Nat := degree g + phaseDegree g

/-- The Gaussian rate `λ = 1 + 21j/20`. -/
def lambdaQ (g : Power) : ℚ := 1 + 21 * (powerNat g : ℚ) / 20

/-- Which conditional majorant to evaluate. -/
inductive Mode where
  | y
  | k
  | auto
  deriving Repr, Inhabited, BEq

/-- A disk-cover plan with separate phase Mehler parameters for Y and K. -/
structure Plan where
  geometry : EllCheck.Plan
  etaY : ℚ
  etaK : ℚ
  mode : Mode
  deriving Repr, Inhabited

/-- The exact rational upper endpoint of a dyadic interval. -/
def upperQ (a : Ival) : ℚ :=
  if 0 ≤ a.e then (a.hi * pow2 a.e.toNat : Int)
  else (a.hi : ℚ) / (pow2 (-a.e).toNat : ℚ)

/-- The thin interval consisting of an interval's upper endpoint. -/
def upperI (a : Ival) : Ival := ⟨a.hi, a.hi, a.e⟩

/-- Select the smaller successful upper endpoint; a failed candidate is ineligible. -/
def minResult (a b : Option Ival) : Option Ival :=
  match a, b with
  | some a, some b => some (upperI (if upperQ a ≤ upperQ b then a else b))
  | some a, none => some a
  | none, some b => some b
  | none, none => none

/-- The larger upper endpoint, selected by an exact rational comparison. -/
def maxUpper (a b : Ival) : Ival :=
  upperI (if upperQ a ≤ upperQ b then b else a)

/-- The squared two-variable phase expression
`η⁻ᴺ (1-η)⁻² exp(4j(21/20)S/(1-η))`. -/
def phaseSqI (g : Power) (eta : ℚ) (s : Ival) : Option Ival := do
  EllCheck.guard' (decide (0 < eta) && decide (eta < 1))
  let t := EllCheck.qI eta
  let om := subI EllCheck.P (ofInt EllCheck.P 1) t
  EllCheck.guard' (isPos t && isPos om)
  let exponent ← EllCheck.dv
    (mulI EllCheck.P (EllCheck.qI (4 * (powerNat g : ℚ) * (21 / 20 : ℚ))) s) om
  let ex ← EllCheck.expUp exponent
  let pre ← EllCheck.dv (EllCheck.powB (invI EllCheck.P t) (phaseDegree g))
    (sqI EllCheck.P om)
  pure (mulI EllCheck.P pre ex)

/-- The translation expression squared:
`G_j(Y+B²;η) exp(2B² + 2√(2D)√B²)`. -/
def upsYI (g : Power) (eta : ℚ) (y2 b2 : Ival) : Option Ival := do
  let phase ← phaseSqI g eta (addI EllCheck.P y2 b2)
  let cross := mulI EllCheck.P (sqrtI EllCheck.P (ofNat EllCheck.P (2 * degree g)))
    (sqrtI EllCheck.P (absUpper b2))
  let shift ← EllCheck.expUp (mulN EllCheck.P 2 (addI EllCheck.P b2 cross))
  pure (mulI EllCheck.P phase shift)

/-- The rational integrated-Mehler parameter for a column of total degree `m`. -/
def columnTauQ (g : Power) (m : Nat) : ℚ :=
  (m + 1 : Nat) / (((m + 2 : Nat) : ℚ) * (2 * lambdaQ g - 1))

/-- The rational squared dilation expression
`t_m⁻ᵐ / ((1-t_m)(1-(2λ-1)t_m))`. -/
def columnNormSqQ (g : Power) (m : Nat) : ℚ :=
  let t := columnTauQ g m
  (t⁻¹) ^ m / ((1 - t) * (1 - (2 * lambdaQ g - 1) * t))

/-- The coarse E5 coefficient `B_m = (m+1)√(m! N_m²)`.
The rational denominator guards precede the division in `columnNormSqQ`. -/
def columnCoeffI (g : Power) (m : Nat) : Option Ival := do
  let t := columnTauQ g m
  EllCheck.guard' (decide (0 < t) && decide (t < 1) &&
    decide ((2 * lambdaQ g - 1) * t < 1))
  let n2 := EllCheck.qI (columnNormSqQ g m)
  EllCheck.guard' (isPos n2)
  pure (mulN EllCheck.P (m + 1)
    (sqrtI EllCheck.P (mulN EllCheck.P (factNat m) n2)))

/-- Compute all coefficients through the production cutoff. -/
def makeColumnCoeffs (g : Power) : Option (List Ival) :=
  (List.range (totalDegree g + 1)).mapM (columnCoeffI g)

/-- Cached coefficients for the first power. -/
def columnCoeffs1 : Option (List Ival) := makeColumnCoeffs 0

/-- Cached coefficients for the second power. -/
def columnCoeffs2 : Option (List Ival) := makeColumnCoeffs 1

/-- Cached coefficients for the third power. -/
def columnCoeffs3 : Option (List Ival) := makeColumnCoeffs 2

/-- Select the precomputed coefficient list for the requested power. -/
def columnCoeffs (g : Power) : Option (List Ival) :=
  if g.val == 0 then columnCoeffs1 else if g.val == 1 then columnCoeffs2 else columnCoeffs3

/-- The coarse K expression squared:
`4 G_j(Y;η) Θ (Σ_m B_m (√(8Q²/λ))^m)²`, where `Q² = Θ²/a2lo`.
The defect supplies `Θ = 1/√(1-kp²)`; invalid K domains return `none`. -/
def upsKI (g : Power) (coeffs : List Ival) (eta : ℚ) (y2 kp a2lo : Ival) :
    Option Ival := do
  EllCheck.guard' (coeffs.length == totalDegree g + 1)
  let om := subI EllCheck.P (ofInt EllCheck.P 1) (sqI EllCheck.P kp)
  EllCheck.guard' (isPos om)
  let c := sqrtI EllCheck.P om
  EllCheck.guard' (isPos c)
  let theta := invI EllCheck.P c
  let q2 ← EllCheck.dv (sqI EllCheck.P theta) a2lo
  let arg2 ← EllCheck.dv (mulN EllCheck.P 8 q2) (EllCheck.qI (lambdaQ g))
  let poly := EllCheck.horner coeffs (sqrtI EllCheck.P arg2)
  let phase ← phaseSqI g eta y2
  pure (mulN EllCheck.P 4
    (mulI EllCheck.P phase (mulI EllCheck.P theta (sqI EllCheck.P poly))))

/-- The real-square bound used by the existing disk Mehler expression. -/
def sqrtReSqQ (x R : ℚ) : ℚ := (|x| + R + (x + R)) / 2

/-- A disk bound for the imaginary square root. For positive centers the exact square identity
improves the general norm bound to `R²/(4x)`. -/
def sqrtImSqQ (x R : ℚ) : ℚ :=
  let general := (|x| + R - (x - R)) / 2
  if 0 < x then min general (R ^ 2 / (4 * x)) else general

/-- The rationalized shift-angle bound `Ahi kp² / (2(1+√(1-kp²)))`. -/
def shiftImSqI (a2hi kp : Ival) : Option Ival := do
  let om := subI EllCheck.P (ofInt EllCheck.P 1) (sqI EllCheck.P kp)
  EllCheck.guard' (isPos om)
  let den := mulN EllCheck.P 2
    (addI EllCheck.P (ofInt EllCheck.P 1) (sqrtI EllCheck.P om))
  EllCheck.dv (mulI EllCheck.P a2hi (sqI EllCheck.P kp)) den

/-- The primary Mehler expression, with the production degree `D`:
`t⁻ᴰ/(1-t²) exp(2tX/(1+t) + 2tY/(1-t))`. -/
def mehI (g : Power) (tau x R : ℚ) : Option Ival := do
  EllCheck.guard' (decide (0 < tau) && decide (tau < 1))
  let t := EllCheck.qI tau
  EllCheck.guard' (isPos t)
  let e1 ← EllCheck.dv
    (mulN EllCheck.P 2 (mulI EllCheck.P t (EllCheck.qI (sqrtReSqQ x R))))
    (addI EllCheck.P (ofInt EllCheck.P 1) t)
  let e2 ← EllCheck.dv
    (mulN EllCheck.P 2 (mulI EllCheck.P t (EllCheck.qI (sqrtImSqQ x R))))
    (subI EllCheck.P (ofInt EllCheck.P 1) t)
  let ex ← EllCheck.expUp (addI EllCheck.P e1 e2)
  let pre ← EllCheck.dv (EllCheck.powB (invI EllCheck.P t) (degree g))
    (subI EllCheck.P (ofInt EllCheck.P 1) (sqI EllCheck.P t))
  pure (mulI EllCheck.P pre ex)

/-- The conditional squared expression on one disk. Y falls back to `B² ≤ |A|²`
when the angle-defect check fails; K is then unavailable. -/
def upsI (g : Power) (coeffs : List Ival) (x : ℚ) (pl : Plan)
    (at0 e a2hi : Ival) : Option Ival :=
  let y2 := EllCheck.qI (sqrtImSqQ x pl.geometry.R)
  let kp := EllCheck.defectI x pl.geometry.R at0 e
  let y := fun _ : Unit ↦ do
    let b2 ← match kp with
      | some k => shiftImSqI a2hi k
      | none => some a2hi
    upsYI g pl.etaY y2 b2
  let k := fun _ : Unit ↦ do
    let k ← kp
    let a2lo ← EllCheck.a2loI x pl.geometry.R at0 e
    upsKI g coeffs pl.etaK y2 k a2lo
  match pl.mode with
  | .y => y ()
  | .k => k ()
  | .auto => minResult (y ()) (k ())

/-- Evaluate the full squared radial expression on one real-centred disk. -/
def diskM2 (g : Power) (coeffs : List Ival) (pos : Bool) (x : ℚ) (pl : Plan) :
    Option Ival := do
  let (at0, e) ← EllCheck.diskProfile pos x pl.geometry.R
  let a2hi ← EllCheck.a2hiI x pl.geometry.R at0 e
  let u ← upsI g coeffs x pl at0 e a2hi
  let primary ← mehI g pl.geometry.tau x pl.geometry.R
  let radial ← EllCheck.expUp (EllCheck.qI (-2 * (x - pl.geometry.R)))
  pure (mulI EllCheck.P radial (mulI EllCheck.P primary u))

/-- The maximum of the disk upper endpoints. Every disk must evaluate successfully. -/
def panelM2 (g : Power) (coeffs : List Ival) (pos : Bool) (lo hi : ℚ) (pl : Plan) :
    Option Ival :=
  (List.range pl.geometry.m).foldl (fun acc i ↦
    match acc, diskM2 g coeffs pos (EllCheck.diskCentre lo hi pl.geometry i) pl with
    | some a, some b => some (maxUpper a b)
    | _, _ => none) (some zeroI)

/-- Evaluate `4(hi-lo)√M² ρ⁻²ⁿ/(1-ρ⁻¹)` for a validated disk-cover plan.
The coefficient table is selected internally from the production power. -/
def panelErr (g : Power) (p : Grothe.UpperChaos.Q0GaussAddress.Panel) (pl : Plan) :
    Option Ival := do
  EllCheck.guard' EllCheck.chatOK
  EllCheck.guard' (EllCheck.planGeomOK p.lo p.hi pl.geometry)
  let t0 := EllCheck.taylorI (EllCheck.qI ((p.lo + p.hi) / 2)) 0
  let pos := isPos t0
  EllCheck.guard' (pos || isNeg t0)
  let coeffs ← columnCoeffs g
  let m2 ← panelM2 g coeffs pos p.lo p.hi pl
  let amplitude := sqrtI EllCheck.P (absUpper m2)
  let rhoInv := EllCheck.qI pl.geometry.rho⁻¹
  EllCheck.dv
    (mulI EllCheck.P (EllCheck.qI (4 * (p.hi - p.lo)))
      (mulI EllCheck.P amplitude (EllCheck.powB rhoInv (2 * p.order))))
    (subI EllCheck.P (ofInt EllCheck.P 1) rhoInv)

end Grothe.UpperQuad.TwistEllCheck
