import GrotheQuadKernel.Profile
import GrotheQuadKernel.Seed
import Grothe.Upper.Data
import Grothe.UpperChaos.Q0GaussAddressScan

/-!
# The executable checker of the per-panel ellipse bounds (part (Q) of `hQuad`)

For each panel `p = [l, h]` of order `n` the plan gives `ρ > 1`, the number `m` of real-centred
disks covering the closed Bernstein ellipse `E_ρ` (`QuadEllipseGeom.exists_disk_cover`), their
common radius `R` and the Mehler parameter `τ`.  On each disk `D(x_j, R)` the checker encloses,
in the floating dyadic intervals of `GrotheQuadKernel.Basic` (outward rounding):

* the Taylor coefficients `t_k(x_j)` of the scaled profile `v̂ = π^{1/4} vprof` (a polynomial of
  degree 11 with the coefficients `chatI k`), the deviation `e = Σ_{k≥1} |t_k| R^k`, and checks
  that `v̂` keeps the sign `ε` of the panel with `|v̂| ≥ |t_0| − e > 0` on the disk;
* `|Ã|² = |z| √π / (κ² |v̂|²)` (upper and lower), the angle defect `κ' = (1 + R/x)/(1 − e/|t_0|)² − 1`
  of `Ã²` and from it `β² = (Im Ã)² ≤ |Ã|² κ'²/2` and `θ = |Ã|²/Re Ã² ≤ 1/√(1 − κ'²)`;
* the two conditional bounds `Υ_Y = (Σ_r shiftTerm 501 (β + δ) r)²` (truncated with the ratio
  test, `TaylorShift.tsum_shiftTerm_le`) and `Υ_K = θ Σ_{m ≤ 501} m! T_m (θ²/|Ã|²)^m`;
* the Mehler factor `τ^{−501} (1−τ²)⁻¹ exp(2τ x²/(1+τ) + 2τ η²/(1−τ))` with `x² ≤ (|z| + Re z)/2`,
  `η² ≤ (|z| − Re z)/2`, and `exp(−2 Re z)`;
and returns `M_j² = e^{−2(x_j − R)} · Mehler · min(Υ_Y, Υ_K)`.  The panel error is
`4 (h − l) M ρ^{−2n} / (1 − ρ⁻¹)` with `M² = max_j M_j²` (`GaussRemainderEllipse`).

The soundness of every step is proved in `QuadEllipseSound.lean`; the native fact is in
`QuadEllipseFacts*.lean`.

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.EllCheck

open GrotheQuad

/-- The working precision (mantissa bits). -/
def P : Nat := 200

/-- A rational as an interval. -/
def qI (q : ℚ) : Ival := ratI P q.num q.den

/-- `√β_j`, `β_j = (2j)!/(4^j (j!)²)`: `nrmHalf j = π^{1/4} √β_j`. -/
def sqrtBetaI (j : Nat) : Ival :=
  sqrtI P (divN P (4 ^ j * (factNat j) ^ 2) (ofNat P (factNat (2 * j))))

/-- The contribution of `L_j^{(−1/2)}` to the coefficient of `s^k` of `v̂ = π^{1/4} vprof`. -/
def chatTerm (k j : Nat) : Ival :=
  if k ≤ j then
    let b := binHalfRat j k
    let t := divI P (divN P (factNat k) (mulI P (qI (Grothe.Upper.profileQ.getD j 0))
      (ratI P b.1 b.2))) (sqrtBetaI j)
    if k % 2 == 1 then negI t else t
  else zeroI

/-- The coefficient of `s^k` of `v̂`. -/
def chatI (k : Nat) : Ival := sumRangeI P 12 (chatTerm k)

/-- The twelve coefficients, computed once. -/
def chatArr : Array Ival := (Array.range 12).map chatI

/-- The Taylor coefficient `t_k(x) = Σ_i C(i+k, k) ĉ_{i+k} x^i`. -/
def taylorI (x : Ival) (k : Nat) : Ival :=
  sumRangeI P (12 - k) fun i =>
    mulI P (mulN P (natChoose (i + k) k) (chatArr.getD (i + k) zeroI)) (powI P x i)

/-- The deviation majorant `Σ_{1 ≤ k ≤ 11} |t_k(x)| R^k`. -/
def devI (x R : Ival) : Ival :=
  sumRangeI P 11 fun k => mulI P (absUpper (taylorI x (k + 1))) (powI P R (k + 1))

/-- `e^y` enclosure for a point interval `y ≥ 0`, via `e^{y/2^k}` and `k` squarings. -/
def expSq (k : Nat) (y : Ival) : Ival :=
  (List.range k).foldl (fun a _ => sqI P a) (expPosI P 24 ⟨y.lo, y.hi, y.e - k⟩)

/-- An upper bound for `e^y` on `y ∈ a` (from the upper end of `a`), or `none`. -/
def expUp (a : Ival) : Option Ival :=
  let h : Ival := ⟨a.hi, a.hi, a.e⟩
  if a.hi ≥ 0 then
    let u := expSq 10 h
    if expPosValid P 24 ⟨h.lo, h.hi, h.e - 10⟩ then some u else none
  else
    let u := expSq 10 (negI h)
    if expPosValid P 24 ⟨-h.hi, -h.lo, h.e - 10⟩ ∧ isPos u then some (invI P u) else none

/-- The off-axis series `Σ_{r<R} t_r + 2 t_R` with `t_{r+1} = t_r · t √(2(502+r))/(r+1)`, stopped at
the first `R` with `8 t² (502 + R) < (R + 1)²` (ratio `≤ 1/2`); `none` after `fuel` steps. -/
def ySeries (t : Ival) : Nat → Nat → Ival → Ival → Option Ival
  | 0, _, _, _ => none
  | fuel + 1, r, term, acc =>
    if isPos (subI P (ofNat P ((r + 1) ^ 2)) (mulN P (8 * (502 + r)) (sqI P t))) then
      some (addI P acc (mulN P 2 term))
    else
      ySeries t fuel (r + 1)
        (divN P (r + 1) (mulI P (mulI P term t) (sqrtI P (ofNat P (2 * (502 + r))))))
        (addI P acc term)

/-- `a^n` by binary powering. -/
def powB (a : Ival) : Nat → Ival
  | 0 => ofInt P 1
  | n + 1 =>
    let h := powB a ((n + 1) / 2)
    if (n + 1) % 2 == 0 then sqI P h else mulI P (sqI P h) a
decreasing_by all_goals omega

/-- `T_m = Σ_{c ≤ m} C(m,c) (1 + c/m)^{2(m−c+1)}` (`T_0 = 1`). -/
def tmI (m : Nat) : Ival :=
  if m == 0 then ofInt P 1 else
  sumRangeI P (m + 1) fun c =>
    mulN P (natChoose m c) (powB (ratI P ((m + c : Nat) : Int) m) (2 * (m - c + 1)))

/-- `G_m = m! T_m`, `m ≤ 501`. -/
def gList : List Ival := (List.range 502).map fun m => mulN P (factNat m) (tmI m)

/-- `Σ_m G_m x^m` by Horner over a coefficient list. -/
def horner (g : List Ival) (x : Ival) : Ival :=
  g.foldr (fun gm acc => addI P gm (mulI P x acc)) zeroI

/-- `π`, `√π`, `κ² = 1 + a²`. -/
def piE : Ival := piMachinI P (P / 3 + 20)
def sqrtPiE : Ival := sqrtI P piE
def kappa2 : Ival := addI P (ofInt P 1) (sqI P (qI Grothe.Upper.aQ))

/-- The plan of one panel. -/
structure Plan where
  rho : ℚ
  m : Nat
  R : ℚ
  tau : ℚ
  deriving Repr, Inhabited

/-- The geometric data of a panel and plan: centre, half-width, the ellipse's half-axes. -/
def halfAxes (lo hi : ℚ) (pl : Plan) : ℚ × ℚ :=
  ((hi - lo) / 2 * ((pl.rho + pl.rho⁻¹) / 2), (hi - lo) / 2 * ((pl.rho - pl.rho⁻¹) / 2))

/-- The centre of the `j`-th disk. -/
def diskCentre (lo hi : ℚ) (pl : Plan) (j : Nat) : ℚ :=
  (lo + hi) / 2 - (halfAxes lo hi pl).1 + 2 * (halfAxes lo hi pl).1 / pl.m * (j + 1 / 2)

/-- The geometric validity of a plan: `ρ > 1`, `m ≥ 1`, `R ≥ 0`, `(A/m)² + B² ≤ R²`, `0 < τ < 1`. -/
def planGeomOK (lo hi : ℚ) (pl : Plan) : Bool :=
  decide (1 < pl.rho) && decide (1 ≤ pl.m) && decide (0 ≤ pl.R) &&
    decide (((halfAxes lo hi pl).1 / pl.m) ^ 2 + (halfAxes lo hi pl).2 ^ 2 ≤ pl.R ^ 2) &&
    decide (0 < pl.tau) && decide (pl.tau < 1) && decide (lo < hi)

/-- The `δ` of the off-axis base point (`2^{−40}`). -/
def deltaI : Ival := ⟨1, 1, -40⟩

/-- **The bound `M_j²` on one disk** (`none` if a check fails).  `pos` is the panel sign
(`true`: `vprof > 0`). -/
def diskM2 (g : List Ival) (pos : Bool) (x R tau : ℚ) : Option Ival :=
  let xI := qI x
  let RI := qI R
  let t0 := taylorI xI 0
  let e := devI xI RI
  let at0 := if pos then t0 else negI t0
  let vlo := subI P at0 e
  let vhi := addI P at0 e
  if !(isPos vlo) then none else
  -- `|z| ≤ |x| + R`, `|z| ≥ max(0, |x| − R)`
  let zhi := qI (|x| + R)
  let zlo := qI (max 0 (|x| - R))
  let k2 := kappa2
  let a2hi := divI P (mulI P zhi sqrtPiE) (mulI P k2 (sqI P vlo))
  let a2lo := divI P (mulI P zlo sqrtPiE) (mulI P k2 (sqI P vhi))
  -- the angle defect (only for `x > R`)
  let defect : Option Ival :=
    if decide (R < x) then
      let r1 := qI (R / x)
      let r2 := divI P e at0
      let om := subI P (ofInt P 1) r2
      if !(isPos om) then none else
      let kp := subI P (divI P (addI P (ofInt P 1) r1) (sqI P om)) (ofInt P 1)
      if isPos (subI P (ofInt P 1) kp) ∧ isPos (addI P (ofInt P 1) kp) then some kp else none
    else none
  let b2hi := match defect with
    | some kp => divN P 2 (mulI P a2hi (sqI P kp))
    | none => a2hi
  let tI := addI P (sqrtI P (absUpper b2hi)) deltaI
  let upsY := (ySeries tI 6000 0 (ofInt P 1) zeroI).map (fun y => sqI P y)
  let upsK : Option Ival := match defect with
    | some kp =>
      let c2 := sqrtI P (subI P (ofInt P 1) (sqI P kp))
      if isPos c2 ∧ isPos a2lo then
        let th := invI P c2
        some (mulI P th (horner g (divI P (sqI P th) a2lo)))
      else none
    | none => none
  let ups : Option Ival := match upsY, upsK with
    | some y, some k => some (if isPos (subI P y k) then k else y)
    | some y, none => some y
    | none, some k => some k
    | none, none => none
  match ups with
  | none => none
  | some u =>
    -- Mehler
    let tI' := qI tau
    let x2hi := qI ((|x| + R + x + R) / 2)
    let y2hi := if decide (R < x) then qI (R ^ 2 / (2 * (x - R))) else qI ((|x| + R - (x - R)) / 2)
    let expo := addI P (divI P (mulN P 2 (mulI P tI' x2hi)) (addI P (ofInt P 1) tI'))
      (divI P (mulN P 2 (mulI P tI' y2hi)) (subI P (ofInt P 1) tI'))
    let pre := divI P (powB (invI P tI') 501) (subI P (ofInt P 1) (sqI P tI'))
    match expUp expo, expUp (qI (-2 * (x - R))) with
    | some e1, some e2 => some (mulI P e2 (mulI P (mulI P pre e1) u))
    | _, _ => none

/-- The sum of the disk bounds of a panel (an upper bound of their maximum). -/
def panelM2 (g : List Ival) (pos : Bool) (lo hi : ℚ) (pl : Plan) : Option Ival :=
  (List.range pl.m).foldl (fun acc j =>
    match acc, diskM2 g pos (diskCentre lo hi pl j) pl.R pl.tau with
    | some a, some b => some (addI P a b)
    | _, _ => none) (some zeroI)

/-- **The error bound of one panel**: `4 (h − l) M ρ^{−2n} / (1 − ρ⁻¹)` (`none` if a check fails). -/
def panelErr (g : List Ival) (p : Grothe.UpperChaos.Q0GaussAddress.Panel) (pl : Plan) :
    Option Ival :=
  if !(planGeomOK p.lo p.hi pl) then none else
  let t0 := taylorI (qI ((p.lo + p.hi) / 2)) 0
  let pos := isPos t0
  if !(pos || isNeg t0) then none else
  match panelM2 g pos p.lo p.hi pl with
  | none => none
  | some m2 =>
    let M := sqrtI P (absUpper m2)
    let rhoInv := qI pl.rho⁻¹
    some (divI P (mulI P (qI (4 * (p.hi - p.lo))) (mulI P M (powB rhoInv (2 * p.order))))
      (subI P (ofInt P 1) rhoInv))

/-- The sum of the panel errors over a list of (panel, plan) pairs. -/
def errSum (g : List Ival) (pps : List (Grothe.UpperChaos.Q0GaussAddress.Panel × Plan)) :
    Option Ival :=
  pps.foldl (fun acc pp =>
    match acc, panelErr g pp.1 pp.2 with
    | some a, some b => some (addI P a b)
    | _, _ => none) (some zeroI)

/-- **The check of a shard**: the errors of the panels `[i₀, i₀ + len)` with their plans sum to at
most `budget`. -/
def shardOK (plans : List Plan) (i₀ len : Nat) (budget : ℚ) : Bool :=
  let pps := ((Grothe.UpperChaos.Q0GaussAddressScan.sourcePanels.drop i₀).take len).zip
    ((plans.drop i₀).take len)
  let g := gList
  pps.length == len &&
    match errSum g pps with
    | some s => isPos (subI P (qI budget) s)
    | none => false

end Grothe.UpperQuad.EllCheck
