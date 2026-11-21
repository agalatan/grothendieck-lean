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
  if !(posI np && posI nm) then none else
  let gp := SR.add (SC.re ip.1) (negjI j)
  let gm := SR.add (SC.re im.1) (negjI j)
  let z := SR.smul half (SR.add gp gm)
  if !z.PD then none else
  let zi := SR.smul (invPosI z.det) z.adj
  let t := (GR.mul (GR.mul (GR.ofSR gm) (GR.ofSR zi)) (GR.ofSR gp)).toSR
  if !t.PD then none else
  let cr := SR.smul half (SR.add gp (SR.smul (negI (intI 1)) gm))
  let ci := SR.smul half
    (SR.add (SC.im ip.1) (SR.smul (negI (intI 1)) (SC.im im.1)))
  let e := SR.smul half (SR.add (SR.sand cr zi) (SR.sand ci zi))
  let ji : SR := ⟨j, zeroI, j⟩
  let den := mulI (mulI (mulI (mulI (intI 16) (mulI j j)) (mulI np nm)) z.det)
    (mulI (SR.add t ji).det (SR.add (SR.add t (SR.smul (intI 2) e)) ji).det)
  if posI den then
    let v := (invPosI den).hi
    if decide (D ≤ (mulI ⟨v, v⟩ den).lo) then some v else none
  else none

/-- Sharing the intermediate matrices and early-exiting on failed gates preserves the spec. -/
theorem gaussVal_eq_spec (j : Ival) (R : SC) :
    gaussVal j R =
      (let den := gaussianDen j R
       if posI den then
         let v := (invPosI den).hi
         if gaussianBoxOK j R ⟨v, v⟩ then some v else none
       else none) := by
  change (if !(posI (CI.normSq (invIm R false).2) && posI (CI.normSq (invIm R true).2)) then none
    else if !(zOf j R).PD then none
    else if !(tOf j R).PD then none
    else if posI (gaussianDen j R) then
      let v := (invPosI (gaussianDen j R)).hi
      if decide (D ≤ (mulI ⟨v, v⟩ (gaussianDen j R)).lo) then some v else none
    else none) =
    (if posI (gaussianDen j R) then
      let v := (invPosI (gaussianDen j R)).hi
      if gaussianBoxOK j R ⟨v, v⟩ then some v else none
    else none)
  unfold gaussianBoxOK
  cases posI (CI.normSq (invIm R false).2) <;>
    cases posI (CI.normSq (invIm R true).2) <;>
    cases (zOf j R).PD <;>
    cases (tOf j R).PD <;>
    cases posI (gaussianDen j R) <;> rfl

/-- Thin midpoint interval `[(lo + hi) / 2D, (lo + hi) / 2D]`. -/
def midI (a : Ival) : Ival :=
  let m := (a.lo + a.hi) / 2
  ⟨m, m⟩

/-- Thin midpoint of a complex interval. -/
def midCI (z : CI) : CI := ⟨midI z.re, midI z.im⟩

/-- Value at `x0` and divided-difference slope `S(x, x0)` for `P(x) = P(x0) + (x - x0) S(x, x0)`. -/
def hornerSlope (x x0 : CI) : List Ival → CI × CI
  | [] => (CI.ofR zeroI, CI.ofR zeroI)
  | c :: cs =>
    let vs := hornerSlope x x0 cs
    (CI.add (CI.ofR c) (CI.mul x0 vs.1), CI.add vs.1 (CI.mul x vs.2))

/-- Centered evaluation of `t P(t²)` around `t0 = midCI t`:
`t P(t²) = t0 P(t0²) + (t - t0) (P(t0²) + t (t + t0) S(t², t0²))`. -/
def oddHornerCenter (t t0 t2 t02 dt tsum : CI) (cs : List Ival) : CI :=
  let vs := hornerSlope t2 t02 cs
  CI.add (CI.mul t0 vs.1) (CI.mul dt (CI.add vs.1 (CI.mul t (CI.mul tsum vs.2))))

/-- Centered box evaluation of `R(t) = M diag(t P(t²), t Q(t²)) M`. -/
def RboxCenter (dat : RData) (t : CI) : SC :=
  let t0 := midCI t
  let t2 := CI.mul t t
  let t02 := CI.mul t0 t0
  let dt := CI.sub t t0
  let tsum := CI.add t t0
  let p := oddHornerCenter t t0 t2 t02 dt tsum dat.P
  let q := oddHornerCenter t t0 t2 t02 dt tsum dat.Q
  let m00 := CI.ofR dat.m00
  let m01 := CI.ofR dat.m01
  let m11 := CI.ofR dat.m11
  ⟨CI.add (CI.mul (CI.mul m00 m00) p) (CI.mul (CI.mul m01 m01) q),
   CI.add (CI.mul (CI.mul m00 m01) p) (CI.mul (CI.mul m01 m11) q),
   CI.add (CI.mul (CI.mul m01 m01) p) (CI.mul (CI.mul m11 m11) q)⟩

/-- Try accepting `[lo, hi] / D` as one Riemann-sum leaf; bisect unless tight or at max depth. -/
def leafGauss (j rho : Ival) (dat : RData) (neg : Bool) (w tol : Int) (last : Bool)
    (lo hi : Int) : Option Int :=
  if hi - lo ≤ w && posI (addI (intI 1) (mulI ⟨lo, hi⟩ ⟨lo, hi⟩)) then
    match gaussVal j (RboxCenter dat (circleBox rho neg ⟨lo, hi⟩)) with
    | some v =>
      let mid := (lo + hi) / 2
      let tight := match gaussVal j (Rbox dat (circleBox rho neg ⟨mid, mid⟩)) with
        | some vm => decide ((v - vm) * (hi - lo) ≤ tol * (D / 8192))
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

/-- Drop trailing exact-zero intervals; Horner evaluation is unchanged. -/
def trimZeros : List Ival → List Ival
  | [] => []
  | x :: xs =>
    let tail := trimZeros xs
    if tail.isEmpty && (x.lo == 0 && x.hi == 0) then [] else x :: tail

/-- Strip trailing zeros from both preprocessor coefficient lists. -/
def trimRData (dat : RData) : RData :=
  ⟨dat.m00, dat.m01, dat.m11, trimZeros dat.P, trimZeros dat.Q⟩

private theorem mulI_zero_right (a : Ival) : mulI a zeroI = zeroI := by
  have hmin : min (0 : Int) 0 = 0 := rfl
  have hmax : max (0 : Int) 0 = 0 := rfl
  simp only [mulI, zeroI, Int.mul_zero, hmin, hmax]
  rfl

private theorem ci_mul_zero_right (x : CI) : CI.mul x (CI.ofR zeroI) = CI.ofR zeroI := by
  simp only [CI.mul, CI.ofR, mulI_zero_right]
  rfl

theorem horner_trimZeros (x : CI) : ∀ l : List Ival, CI.horner x (trimZeros l) = CI.horner x l
  | [] => rfl
  | c :: cs => by
    have ih := horner_trimZeros x cs
    simp only [trimZeros]
    split
    · next h =>
      simp only [Bool.and_eq_true, List.isEmpty_iff, beq_iff_eq] at h
      obtain ⟨hemp, hc0, hc1⟩ := h
      have hc : c = zeroI := by cases c; simp_all [zeroI]
      simp only [hc, CI.horner, ← ih, hemp, ci_mul_zero_right]
      rfl
    · simp only [CI.horner, ih]

theorem hornerSlope_trimZeros (x x0 : CI) :
    ∀ l : List Ival, hornerSlope x x0 (trimZeros l) = hornerSlope x x0 l
  | [] => rfl
  | c :: cs => by
    have ih := hornerSlope_trimZeros x x0 cs
    simp only [trimZeros]
    split
    · next h =>
      simp only [Bool.and_eq_true, List.isEmpty_iff, beq_iff_eq] at h
      obtain ⟨hemp, hc0, hc1⟩ := h
      have hc : c = zeroI := by cases c; simp_all [zeroI]
      simp only [hc, hornerSlope, ← ih, hemp, ci_mul_zero_right]
      rfl
    · simp only [hornerSlope, ih]

@[simp] theorem oddHornerCenter_trimZeros (t t0 t2 t02 dt tsum : CI) (l : List Ival) :
    oddHornerCenter t t0 t2 t02 dt tsum (trimZeros l) =
      oddHornerCenter t t0 t2 t02 dt tsum l := by
  simp only [oddHornerCenter, hornerSlope_trimZeros]

@[simp] theorem RboxCenter_trimRData (dat : RData) (t : CI) :
    RboxCenter (trimRData dat) t = RboxCenter dat t := by
  simp only [RboxCenter, trimRData, oddHornerCenter_trimZeros]

@[simp] theorem Rbox_trimRData (dat : RData) (t : CI) : Rbox (trimRData dat) t = Rbox dat t := by
  simp only [Rbox, trimRData, horner_trimZeros]

@[simp] theorem leafGauss_trimRData (j rho : Ival) (dat : RData) (neg : Bool) (w tol : Int)
    (last : Bool) (lo hi : Int) :
    leafGauss j rho (trimRData dat) neg w tol last lo hi =
      leafGauss j rho dat neg w tol last lo hi := by
  simp only [leafGauss, RboxCenter_trimRData, Rbox_trimRData]

@[simp] theorem coverGauss_trimRData (j rho : Ival) (dat : RData) (neg : Bool) (w tol : Int) :
    ∀ (depth : Nat) (lo hi : Int),
      coverGauss j rho (trimRData dat) neg w tol depth lo hi =
        coverGauss j rho dat neg w tol depth lo hi
  | 0, lo, hi => by simp only [coverGauss, leafGauss_trimRData]
  | d + 1, lo, hi => by
    simp only [coverGauss, leafGauss_trimRData, coverGauss_trimRData j rho dat neg w tol d]

@[simp] theorem tubeCover_trimRData (rho : Ival) (dat : RData) (neg : Bool) :
    ∀ (depth : Nat) (lo hi : Int),
      tubeCover rho (trimRData dat) neg depth lo hi = tubeCover rho dat neg depth lo hi
  | 0, lo, hi => by simp only [tubeCover, Rbox_trimRData]
  | d + 1, lo, hi => by
    simp only [tubeCover, Rbox_trimRData, tubeCover_trimRData rho dat neg d]

/-- 1D circle `I ± Re R ≻ 0` cover on `|t| = regionRQ` (certifies `KerPos` on `|t| < regionRQ`). -/
def regionOK (dat : RData) (regionRQ : ℚ) : Bool :=
  let rho := ofRatI regionRQ
  let td := trimRData dat
  tubeCover rho td false 20 (-D) 0 &&
    tubeCover rho td false 20 0 D &&
    tubeCover rho td true 20 (-D) 0 &&
    tubeCover rho td true 20 0 D

end Grothe.UpperReplacement.CircleCheck
