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
* `|Ã|² = |z| √π / (κ² |v̂|²)` (upper and lower), the angle defect
  `κ' = (R/x + r(2 + r))/(1 − r)²`, `r = e/|t_0|`,
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

instance : Inhabited Grothe.UpperChaos.Q0GaussAddress.Panel := ⟨⟨0, 0, 0, 0⟩⟩

/-- The working precision (mantissa bits). -/
def P : Nat := 200

/-- A rational as an interval. -/
def qI (q : ℚ) : Ival := ratI P q.num q.den

/-- Division, only by a decidedly positive enclosure. -/
def dv (a b : Ival) : Option Ival := if isPos b then some (divI P a b) else none

/-- A check as an `Option`. -/
def guard' (b : Bool) : Option Unit := if b then some () else none

/-- `√β_j`, `β_j = (2j)!/(4^j (j!)²)`: `nrmHalf j = π^{1/4} √β_j`. -/
def sqrtBetaI (j : Nat) : Ival :=
  sqrtI P (divN P (4 ^ j * (factNat j) ^ 2) (ofNat P (factNat (2 * j))))

/-- The contribution of `L_j^{(−1/2)}` to the coefficient of `s^k` of `v̂ = π^{1/4} vprof`
(`β_j` enclosures are checked positive by `chatOK`). -/
def chatTerm (k j : Nat) : Ival :=
  if k ≤ j then
    let b := binHalfRat j k
    let t := divI P (divN P (factNat k) (mulI P (qI (Grothe.Upper.profileQ.getD j 0))
      (ratI P b.1 b.2))) (sqrtBetaI j)
    if k % 2 == 1 then negI t else t
  else zeroI

/-- The positivity of the twelve `√β_j` enclosures. -/
def chatOK : Bool := (List.range 12).all fun j => isPos (sqrtBetaI j)

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

/-- The profile on the disk: `(|t₀|, e)` enclosures with the sign `pos`, if `|t₀| > 0` and
`|t₀| − e > 0`. -/
def diskProfile (pos : Bool) (x R : ℚ) : Option (Ival × Ival) :=
  let t0 := taylorI (qI x) 0
  let at0 := if pos then t0 else negI t0
  let e := devI (qI x) (qI R)
  if isPos at0 ∧ isPos (subI P at0 e) then some (at0, e) else none

/-- `|A|² ≤ (|x| + R) √π / (κ² (|t₀| − e)²)`. -/
def a2hiI (x R : ℚ) (at0 e : Ival) : Option Ival :=
  dv (mulI P (qI (|x| + R)) sqrtPiE) (mulI P kappa2 (sqI P (subI P at0 e)))

/-- `|A|² ≥ max(0, |x| − R) √π / (κ² (|t₀| + e)²)`. -/
def a2loI (x R : ℚ) (at0 e : Ival) : Option Ival :=
  dv (mulI P (qI (max 0 (|x| - R))) sqrtPiE) (mulI P kappa2 (sqI P (addI P at0 e)))

/-- The angle defect `κ' = (R/x + r(2 + r))/(1 − r)²`, `r = e/|t₀|`, if `R < x`, `1 − r > 0` and
`κ' < 1`. -/
def defectI (x R : ℚ) (at0 e : Ival) : Option Ival := do
  guard' (decide (R < x))
  let r2 ← dv e at0
  let om := subI P (ofInt P 1) r2
  guard' (isPos om)
  let kp ← dv (addI P (qI (R / x)) (mulI P r2 (addI P (ofInt P 2) r2))) (sqI P om)
  guard' (isPos (subI P (ofInt P 1) kp))
  pure kp

/-- The off-axis majorant squared, from `(Im A)² ≤ b2`. -/
def upsYI (b2 : Ival) : Option Ival := do
  let tI := addI P (sqrtI P (absUpper b2)) deltaI
  guard' (isPos (subI P (ofNat P 400) (sqI P tI)))
  let y ← ySeries tI 6000 0 (ofInt P 1) zeroI
  pure (sqI P y)

/-- The large-`|A|` majorant `θ Σ_m G_m (θ²/a)^m`, `θ = 1/√(1 − κ'²)`. -/
def upsKI (g : List Ival) (kp a2lo : Ival) : Option Ival := do
  let c2 := sqrtI P (subI P (ofInt P 1) (sqI P kp))
  guard' (isPos c2)
  let th := invI P c2
  let xx ← dv (sqI P th) a2lo
  pure (mulI P th (horner g xx))

/-- The Mehler factor `τ^{−501} (1−τ²)⁻¹ exp(2τ X2/(1+τ) + 2τ Y2/(1−τ))`. -/
def mehI (tau x R : ℚ) : Option Ival := do
  let tI := qI tau
  guard' (isPos tI)
  let x2 := qI ((|x| + R + (x + R)) / 2)
  let y2 := if decide (R < x) then qI (R ^ 2 / (2 * (x - R))) else qI ((|x| + R - (x - R)) / 2)
  let e1 ← dv (mulN P 2 (mulI P tI x2)) (addI P (ofInt P 1) tI)
  let e2 ← dv (mulN P 2 (mulI P tI y2)) (subI P (ofInt P 1) tI)
  let ex ← expUp (addI P e1 e2)
  let pre ← dv (powB (invI P tI) 501) (subI P (ofInt P 1) (sqI P tI))
  pure (mulI P pre ex)

/-- The conditional-mass majorant: the minimum of the two bounds where both apply. -/
def upsI (g : List Ival) (x R : ℚ) (at0 e a2hi : Ival) : Option Ival :=
  match defectI x R at0 e with
  | some kp =>
    let y := upsYI (divN P 2 (mulI P a2hi (sqI P kp)))
    let k := (a2loI x R at0 e).bind (upsKI g kp)
    match y, k with
    | some y, some k => some (if isPos (subI P y k) then k else y)
    | some y, none => some y
    | none, some k => some k
    | none, none => none
  | none => upsYI a2hi

/-- **The bound `M_j²` on one disk** (`none` if a check fails). -/
def diskM2 (g : List Ival) (pos : Bool) (x R tau : ℚ) : Option Ival := do
  let (at0, e) ← diskProfile pos x R
  let a2hi ← a2hiI x R at0 e
  let u ← upsI g x R at0 e a2hi
  let m ← mehI tau x R
  let e2 ← expUp (qI (-2 * (x - R)))
  pure (mulI P e2 (mulI P m u))

/-- The sum of the disk bounds of a panel (an upper bound of their maximum). -/
def panelM2 (g : List Ival) (pos : Bool) (lo hi : ℚ) (pl : Plan) : Option Ival :=
  (List.range pl.m).foldl (fun acc j =>
    match acc, diskM2 g pos (diskCentre lo hi pl j) pl.R pl.tau with
    | some a, some b => some (addI P a b)
    | _, _ => none) (some zeroI)

/-- **The error bound of one panel**: `4 (h − l) M ρ^{−2n} / (1 − ρ⁻¹)` (`none` if a check
fails). -/
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
    dv (mulI P (qI (4 * (p.hi - p.lo))) (mulI P M (powB rhoInv (2 * p.order))))
      (subI P (ofInt P 1) rhoInv)

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
  chatOK && pps.length == len &&
    match errSum g pps with
    | some s => isPos (subI P (qI budget) s)
    | none => false

end Grothe.UpperQuad.EllCheck
