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

/-- Smoothing matrix `M` of `hardyData`, Mathlib-free. -/
def gtSmoothingM : SR :=
  ⟨addI (ofRatI smoothingPu) (mulI smoothingSqrt (ofRatI (1 - smoothingPu))),
   subI (ofRatI (smoothingPu * smoothingB))
     (mulI smoothingSqrt (ofRatI (smoothingPu * smoothingB))),
   addI (ofRatI (smoothingPu * smoothingB ^ 2))
     (mulI smoothingSqrt (ofRatI (1 - smoothingPu * smoothingB ^ 2)))⟩

/-- Identity matrix `I₂` for unsmoothed channels. -/
def identityM : SR := ⟨intI 1, zeroI, intI 1⟩

/-- `RData` for a smoothed `GT` channel `(pl, ql)` sharing the smoothing matrix of `hardyData`. -/
def gtRData (pl ql : List ℚ) : RData :=
  ⟨gtSmoothingM.a, gtSmoothingM.b, gtSmoothingM.c, pl.map ofRatI, ql.map ofRatI⟩

/-- `RData` for an unsmoothed (`M = I₂`) channel `(pl, ql)` (e.g., `tiger` or `phase`). -/
def unsmoothedRData (pl ql : List ℚ) : RData :=
  ⟨identityM.a, identityM.b, identityM.c, pl.map ofRatI, ql.map ofRatI⟩

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

/-- Strip trailing zeros from a polynomial coefficient list without changing the polynomial. -/
def trimQ : List ℚ → List ℚ
  | [] => []
  | a :: rest =>
    match trimQ rest with
    | [] => if a == 0 then [] else [a]
    | r => a :: r

/-- Helper computing `∑_{j ≥ 0} (2 (k + j) + 1) |c_j| ρ^{2 (k + j)}`. -/
def lipBoundAux (rho2 : ℚ) (k : Nat) (rpow : ℚ) : List ℚ → ℚ
  | [] => 0
  | c :: cs =>
    let ac := if c < 0 then -c else c
    ((2 * k + 1 : Nat) : ℚ) * ac * rpow + lipBoundAux rho2 (k + 1) (rpow * rho2) cs

/-- Exact rational Lipschitz constant for `t ↦ t · P(t²)` on `|t| ≤ rho`. -/
def lipBoundQ (p : List ℚ) (rho : ℚ) : ℚ :=
  lipBoundAux (rho * rho) 0 1 p

/-- Enlarge a complex box by `±rad / D` in both real and imaginary coordinates. -/
def bloatC (z : CI) (rad : Int) : CI :=
  ⟨⟨z.re.lo - rad, z.re.hi + rad⟩, ⟨z.im.lo - rad, z.im.hi + rad⟩⟩

/-- Real-interval scalar multiple of a complex interval. -/
def mulR (a : Ival) (z : CI) : CI := ⟨mulI a z.re, mulI a z.im⟩

/-- Build `M diag(p, q) M` from precomputed products of the entries of `M`. -/
def combineM (m00sq m01sq m0001 m0111 m11sq : Ival) (p q : CI) : SC :=
  ⟨CI.add (mulR m00sq p) (mulR m01sq q),
   CI.add (mulR m0001 p) (mulR m0111 q),
   CI.add (mulR m01sq p) (mulR m11sq q)⟩

/-- Trace `tr(A B)` of two symmetric 2×2 matrices. -/
def trSym2 (A B : SR) : Ival :=
  addI (addI (mulI A.a B.a) (mulI (intI 2) (mulI A.b B.b))) (mulI A.c B.c)

/-- Cancellation-free upper bound of `1 / denominator R j` using
`det(Z) det(T + jI) = det(G₊) det(G₋) + (j/2)(det(G₊) tr(G₋) + det(G₋) tr(G₊)) + j² det(Z)` and
`det(Z) det(T + 2E + jI) = det(Z) det(Ar) + tr(adj(Ar) Ci adj(Z) Ci) + det(Ci)²`. -/
def fastGaussVal (j : Ival) (R : SC) : Option Int :=
  let ip := invIm R false
  let im := invIm R true
  let np := CI.normSq ip.2
  let nm := CI.normSq im.2
  let rp := SC.re ip.1
  let rm := SC.re im.1
  let gp := SR.add rp (negjI j)
  let gm := SR.add rm (negjI j)
  let dgp := gp.det
  let dgm := gm.det
  if !(posI np && posI nm && posI gp.a && posI dgp && posI gm.a && posI dgm) then none
  else
    let ar := SR.smul half (SR.add rp rm)
    let z := SR.smul half (SR.add gp gm)
    let dz := z.det
    if !(posI dz && posI z.a) then none
    else
      let trgp := addI gp.a gp.c
      let trgm := addI gm.a gm.c
      let trT_dz := mulI half (addI (mulI dgp trgm) (mulI dgm trgp))
      let j2 := mulI j j
      let p1 := addI (addI (mulI dgp dgm) (mulI j trT_dz)) (mulI j2 dz)
      let ci := SR.smul half (SR.add (SC.im ip.1) (SR.smul (negI (intI 1)) (SC.im im.1)))
      let ciDet := ci.det
      let p2 := addI (addI (mulI dz ar.det) (trSym2 ar.adj (SR.sand ci z.adj))) (mulI ciDet ciDet)
      let bigDen := mulI (mulI (mulI (intI 16) j2) (mulI np nm)) (mulI p1 p2)
      if posI p1 && posI p2 && posI bigDen then
        some (mulI dz (invPosI bigDen)).hi
      else none

/-- Simultaneous midpoint and Lipschitz arc enclosure on `[lo, hi] / D ⊆ [0, 1]`. -/
def leafFast (j rho : Ival) (m00sq m01sq m0001 m0111 m11sq : Ival) (P Q : List Ival)
    (lipP lipQ w tol : Int) (last : Bool) (lo hi : Int) : Option Int :=
  let mid := (lo + hi) / 2
  if hi - lo ≤ w && posI (addI (intI 1) (mulI ⟨mid, mid⟩ ⟨mid, mid⟩)) then
    let t0 := circleBox rho false ⟨mid, mid⟩
    let t2 := CI.mul t0 t0
    let p0 := CI.mul t0 (CI.horner t2 P)
    let q0 := CI.mul t0 (CI.horner t2 Q)
    let dtheta := max (arcLenUp lo mid) (arcLenUp mid hi)
    let dt := shUp (rho.hi * dtheta)
    let rBox := combineM m00sq m01sq m0001 m0111 m11sq
      (bloatC p0 (shUp (lipP * dt))) (bloatC q0 (shUp (lipQ * dt)))
    match fastGaussVal j rBox with
    | some v =>
      if last then some (shUp (v * arcLenUp lo hi))
      else
        let rMid := combineM m00sq m01sq m0001 m0111 m11sq p0 q0
        let tight := match fastGaussVal j rMid with
          | some vm => decide ((v - vm) * (hi - lo) ≤ tol)
          | none => false
        if tight then some (shUp (v * arcLenUp lo hi)) else none
    | none => none
  else none

/-- Adaptive quarter-circle bisection returning the scaled integral upper bound on `[lo, hi] / D`. -/
def coverFast (j rho : Ival) (m00sq m01sq m0001 m0111 m11sq : Ival) (P Q : List Ival)
    (lipP lipQ w tol : Int) : Nat → Int → Int → Option Int
  | depth, lo, hi =>
    match leafFast j rho m00sq m01sq m0001 m0111 m11sq P Q lipP lipQ w tol (depth == 0) lo hi with
    | some x => some x
    | none =>
      match depth with
      | 0 => none
      | d + 1 =>
        let mid := (lo + hi) / 2
        match coverFast j rho m00sq m01sq m0001 m0111 m11sq P Q lipP lipQ w tol d lo mid,
              coverFast j rho m00sq m01sq m0001 m0111 m11sq P Q lipP lipQ w tol d mid hi with
        | some x, some y => some (x + y)
        | _, _ => none

/-- Quarter-circle `I ± Re R ≻ 0` check on `|t| = regionRQ`, extended to the full open ball by
symmetry and the maximum modulus principle. -/
def tubeQuarterOK (M : SR) (pl ql : List ℚ) (regionRQ : ℚ) (depth : Nat) : Bool :=
  let dat : RData := ⟨M.a, M.b, M.c, (trimQ pl).map ofRatI, (trimQ ql).map ofRatI⟩
  tubeCover (ofRatI regionRQ) dat false depth 0 D

end Grothe.UpperReplacement.CircleCheck
