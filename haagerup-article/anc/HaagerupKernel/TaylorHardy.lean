import HaagerupKernel.Basic

set_option warningAsError true

/-!
# Fast 64-bit degree-2 Taylor-model contour & disk checkers (Mathlib-free)

Provides kernel-reducible (`decide +kernel`) checkers for the six-channel Hardy contour proofs:
1. Degree-2 Taylor models `TM2` at fixed-point scale `D64 = 2^64` on `u ∈ [-1, 1]`, using raw
   constructor-level integer arithmetic and a residual-certified `tmInvPos` with zero ULP casework;
2. First-quadrant boundary-circle disk positivity checker `regQ1OK` checking `I ± Re(R(t)) ≻ 0` on
   `|t| = regR`, `s ∈ [0, 1]` (implying `KerPos` on the full open disk `|t| < regR` by the
   maximum principle);
3. First-quadrant Simpson-quadrature Hardy circle-mean checkers:
   * `meanQ1SmoothedOK` (full `2 × 2` symmetric channels `0, 1, 5`),
   * `meanQ1PhaseOK` (singularity-free 1D scalar `R = diag(r, 0)`, channel `2`),
   * `meanQ1AntiOK` (singularity-free 1D diagonal `R = diag(-r, r)`, channels `3, 4`).

Agent-ID: gemini-1aa9
-/

namespace HaagerupKernel.TaylorHardy

open HaagerupKernel

/-! ### 1. Raw 64-bit fixed-point primitives -/

def D64N : Nat := 18446744073709551616
def D64 : Int := 18446744073709551616
def D64SqN : Nat := 340282366920938463463374607431768211456

@[inline] def iAdd (a b : Int) : Int := Int.add a b
@[inline] def iSub (a b : Int) : Int := Int.sub a b
@[inline] def iMul (a b : Int) : Int := Int.mul a b
@[inline] def iNeg (a : Int) : Int := Int.neg a

@[inline] def iAbs (a : Int) : Nat :=
  match a with
  | Int.ofNat n => n
  | Int.negSucc n => Nat.succ n

@[inline] def iPos (a : Int) : Bool :=
  match a with
  | Int.ofNat (Nat.succ _) => true
  | _ => false

@[inline] def iLe (a b : Int) : Bool :=
  match Int.sub b a with
  | Int.ofNat _ => true
  | Int.negSucc _ => false

/-- Floor division by `D64 = 2^64` (equals `Int.ediv x D64`). -/
@[inline] def fDown (x : Int) : Int :=
  match x with
  | Int.ofNat n => Int.ofNat (Nat.div n 18446744073709551616)
  | Int.negSucc n => Int.negSucc (Nat.div n 18446744073709551616)

/-- Ceiling division of `n : Nat` by `D64 = 2^64`. -/
@[inline] def fUpNat (n : Nat) : Nat :=
  match n with
  | 0 => 0
  | Nat.succ m => Nat.succ (Nat.div m 18446744073709551616)

/-- Ceiling division of `n : Nat` by `d : Nat` (`d > 0`). -/
@[inline] def divUpNat (n d : Nat) : Nat :=
  match n with
  | 0 => 0
  | Nat.succ m => Nat.succ (Nat.div m d)

/-- Floor division by `2` (equals `Int.ediv x 2`). -/
@[inline] def iHalfDown (x : Int) : Int :=
  match x with
  | Int.ofNat n => Int.ofNat (Nat.div n 2)
  | Int.negSucc n => Int.negSucc (Nat.div n 2)

/-- Floor of `q * D64`. -/
def ofRatDown64 (q : Rat) : Int := Rat.floor (q * (D64 : Rat))

/-! ### 2. Degree-2 Taylor models `TM2` on `u ∈ [-1, 1]` -/

/-- Degree-2 Taylor model `c + d u + q u² ± r` (all scaled by `D64 = 2^64`) on `u ∈ [-1, 1]`. -/
structure TM2 where
  c : Int
  d : Int
  q : Int
  r : Nat

@[inline] def tmExact (x : Int) : TM2 := ⟨x, 0, 0, 0⟩
@[inline] def tmZero : TM2 := ⟨0, 0, 0, 0⟩
@[inline] def tmOne : TM2 := ⟨D64, 0, 0, 0⟩

/-- Constant rational enclosed in `TM2` with `≤ 1` ULP radius. -/
def ofRatTM (q : Rat) : TM2 := ⟨ofRatDown64 q, 0, 0, 1⟩

@[inline] def tmAdd (a b : TM2) : TM2 :=
  ⟨iAdd a.c b.c, iAdd a.d b.d, iAdd a.q b.q, Nat.add a.r b.r⟩

@[inline] def tmSub (a b : TM2) : TM2 :=
  ⟨iSub a.c b.c, iSub a.d b.d, iSub a.q b.q, Nat.add a.r b.r⟩

@[inline] def tmNeg (a : TM2) : TM2 :=
  ⟨iNeg a.c, iNeg a.d, iNeg a.q, a.r⟩

@[inline] def tmDouble (a : TM2) : TM2 :=
  ⟨iAdd a.c a.c, iAdd a.d a.d, iAdd a.q a.q, Nat.add a.r a.r⟩

@[inline] def tmHalf (a : TM2) : TM2 :=
  ⟨iHalfDown a.c, iHalfDown a.d, iHalfDown a.q, Nat.add (Nat.div (Nat.add a.r 1) 2) 2⟩

@[inline] def tmMul (a b : TM2) : TM2 :=
  let c := fDown (iMul a.c b.c)
  let d := fDown (iAdd (iMul a.c b.d) (iMul a.d b.c))
  let q := fDown (iAdd (iAdd (iMul a.c b.q) (iMul a.d b.d)) (iMul a.q b.c))
  let b1 := Nat.add (Nat.add (iAbs a.c) (iAbs a.d)) (iAbs a.q)
  let b2 := Nat.add (Nat.add (iAbs b.c) (iAbs b.d)) (iAbs b.q)
  let t3 := iAbs (iAdd (iMul a.d b.q) (iMul a.q b.d))
  let t4 := Nat.mul (iAbs a.q) (iAbs b.q)
  let tr := Nat.add (Nat.add t3 t4)
    (Nat.add (Nat.add (Nat.mul a.r b2) (Nat.mul b.r b1)) (Nat.mul a.r b.r))
  ⟨c, d, q, Nat.add (fUpNat tr) 3⟩

@[inline] def tmLo (a : TM2) : Int :=
  iSub a.c (Int.ofNat (Nat.add (Nat.add (iAbs a.d) (iAbs a.q)) a.r))

@[inline] def tmAbsHi (a : TM2) : Nat :=
  Nat.add (Nat.add (Nat.add (iAbs a.c) (iAbs a.d)) (iAbs a.q)) a.r

/-- Residual-certified reciprocal `1 / a` on `u ∈ [-1, 1]` when `tmLo a > 0`.
The quadratic approximation `p` is validated directly via `res = 1 - a * p`, giving
`|1/f(u) - p(u)| = |1 - f(u) p(u)| / f(u) ≤ tmAbsHi res / tmLo a`. -/
@[inline] def tmInvPos (a : TM2) : Option TM2 :=
  let mN := Nat.add (Nat.add (iAbs a.d) (iAbs a.q)) a.r
  let lo := iSub a.c (Int.ofNat mN)
  match a.c, lo with
  | Int.ofNat cN, Int.ofNat (Nat.succ loM) =>
    let loN := Nat.succ loM
    let icN := Nat.div D64SqN cN
    let ic := Int.ofNat icN
    let ic2 := fDown (iMul ic ic)
    let d2 := fDown (iMul (iNeg a.d) ic2)
    let d2c := fDown (iMul (fDown (iMul a.d a.d)) ic)
    let q2 := fDown (iMul (iSub d2c a.q) ic2)
    let p : TM2 := ⟨ic, d2, q2, 0⟩
    let res := tmSub tmOne (tmMul a p)
    let ah := tmAbsHi res
    let rem := divUpNat (Nat.mul ah D64N) loN
    some ⟨ic, d2, q2, rem⟩
  | _, _ => none

/-! ### 3. Complex & symmetric `2 × 2` Taylor models -/

structure TMC where
  re : TM2
  im : TM2

@[inline] def tmcOfR (a : TM2) : TMC := ⟨a, tmZero⟩
@[inline] def tmcOne : TMC := ⟨tmOne, tmZero⟩
@[inline] def tmcAdd (z w : TMC) : TMC := ⟨tmAdd z.re w.re, tmAdd z.im w.im⟩
@[inline] def tmcSub (z w : TMC) : TMC := ⟨tmSub z.re w.re, tmSub z.im w.im⟩
@[inline] def tmcNeg (z : TMC) : TMC := ⟨tmNeg z.re, tmNeg z.im⟩
@[inline] def tmcMul (z w : TMC) : TMC :=
  ⟨tmSub (tmMul z.re w.re) (tmMul z.im w.im), tmAdd (tmMul z.re w.im) (tmMul z.im w.re)⟩
@[inline] def tmcNormSq (z : TMC) : TM2 := tmAdd (tmMul z.re z.re) (tmMul z.im z.im)

/-- Horner evaluation `c₀ + x (c₁ + x (…))` for real-coefficient polynomial `cs`. -/
def tmcHorner (x : TMC) : List TM2 → TMC
  | [] => ⟨tmZero, tmZero⟩
  | c :: cs => tmcAdd (tmcOfR c) (tmcMul x (tmcHorner x cs))

/-- Real symmetric `2 × 2` Taylor model. -/
structure SRT where
  a : TM2
  b : TM2
  c : TM2

/-- Complex symmetric `2 × 2` Taylor model. -/
structure SCT where
  a : TMC
  b : TMC
  c : TMC

@[inline] def srtDet (S : SRT) : TM2 := tmSub (tmMul S.a S.c) (tmMul S.b S.b)
@[inline] def srtPD (S : SRT) : Bool := iPos (tmLo S.a) && iPos (tmLo (srtDet S))

/-- Pre-converted smoothed covariance parameters `(m00², m01², m00 m01, m01 m11, m11², P, Q)`. -/
structure SmoothedTMData where
  c00 : TM2
  c01sq : TM2
  c0001 : TM2
  c0111 : TM2
  c11 : TM2
  P : List TM2
  Q : List TM2

def mkSmoothedTMData (ctQ stQ seQ : Rat) (pl ql : List Rat) : SmoothedTMData :=
  let m00 := ctQ * ctQ + seQ * stQ * stQ
  let m01 := ctQ * stQ * (1 - seQ)
  let m11 := stQ * stQ + seQ * ctQ * ctQ
  { c00 := ofRatTM (m00 * m00)
    c01sq := ofRatTM (m01 * m01)
    c0001 := ofRatTM (m00 * m01)
    c0111 := ofRatTM (m01 * m11)
    c11 := ofRatTM (m11 * m11)
    P := pl.map ofRatTM
    Q := ql.map ofRatTM }

/-- Evaluate `R(t) = M diag(t P(t²), t Q(t²)) M` on a `TMC`. -/
def evalRSmoothed (dat : SmoothedTMData) (t : TMC) : SCT :=
  let t2 := tmcMul t t
  let p := tmcMul t (tmcHorner t2 dat.P)
  let q := tmcMul t (tmcHorner t2 dat.Q)
  let lc := fun (a b : TM2) =>
    (⟨tmAdd (tmMul a p.re) (tmMul b q.re), tmAdd (tmMul a p.im) (tmMul b q.im)⟩ : TMC)
  ⟨lc dat.c00 dat.c01sq, lc dat.c0001 dat.c0111, lc dat.c01sq dat.c11⟩

/-- Evaluate `t P(t²)` on a `TMC`. -/
def evalOddPoly (P : List TM2) (t : TMC) : TMC :=
  let t2 := tmcMul t t
  tmcMul t (tmcHorner t2 P)

/-- Half-angle circle chart `t(s) = rho ((1 - s²) + 2 i s) / (1 + s²)` and `1 + s²` on
`s = (sm + h u) / D64`, `u ∈ [-1, 1]`. -/
@[inline] def circleTM (rho : TM2) (sm h : Int) : Option (TMC × TM2) :=
  let s : TM2 := ⟨sm, h, 0, 0⟩
  let s2 := tmMul s s
  let onePs2 := tmAdd tmOne s2
  match tmInvPos onePs2 with
  | none => none
  | some di =>
    let x := tmMul (tmMul rho (tmSub tmOne s2)) di
    let y := tmMul (tmMul rho (tmDouble s)) di
    some (⟨x, y⟩, onePs2)

/-! ### 4. First-quadrant boundary positivity (`I ± Re(R(t)) ≻ 0` on `|t| = r`) -/

/-- Check `I - Re(R) ≻ 0` and `I + Re(R) ≻ 0` for a `2 × 2` symmetric `SCT`. -/
def reContractive2x2 (R : SCT) : Bool :=
  let ma := tmSub tmOne R.a.re
  let mc := tmSub tmOne R.c.re
  let pa := tmAdd tmOne R.a.re
  let pc := tmAdd tmOne R.c.re
  let b2 := tmMul R.b.re R.b.re
  iPos (tmLo ma) && iPos (tmLo (tmSub (tmMul ma mc) b2)) &&
    iPos (tmLo pa) && iPos (tmLo (tmSub (tmMul pa pc) b2))

/-- Check `|Re(r)| < 1` (equivalently `I ± Re(diag(r, 0)) ≻ 0` and `I ± Re(diag(-r, r)) ≻ 0`). -/
def reContractive1D (r : TMC) : Bool :=
  iPos (tmLo (tmSub tmOne r.re)) && iPos (tmLo (tmAdd tmOne r.re))

/-- Walk a dyadic partition `steps` of `[0, 1]` with denominator `M = 2^k` (`unit = D64 / (2 * M)`),
testing `leafOK sm h` on every subinterval `[pos / M, (pos + w) / M]`. -/
def checkPartBool (unit : Nat) (leafOK : Int → Int → Bool) : Nat → List Nat → Bool
  | _, [] => true
  | pos, w :: rest =>
    let sm := Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit)
    let h := Int.ofNat (Nat.mul w unit)
    leafOK sm h && checkPartBool unit leafOK (Nat.add pos w) rest

def sumNatList : List Nat → Nat
  | [] => 0
  | w :: rest => Nat.add w (sumNatList rest)

/-- Check `I ± Re(R(t)) ≻ 0` on the Q1 arc `|t| = regRQ`, `s ∈ [0, 1]` for a smoothed channel. -/
def regQ1SmoothedOK (ctQ stQ seQ : Rat) (pl ql : List Rat) (regRQ : Rat)
    (k : Nat) (steps : List Nat) : Bool :=
  let M := Nat.pow 2 k
  let unit := Nat.div D64N (Nat.mul 2 M)
  let dat := mkSmoothedTMData ctQ stQ seQ pl ql
  let rTM := ofRatTM regRQ
  decide (k ≤ 63) && decide (sumNatList steps = M) &&
    checkPartBool unit (fun sm h =>
      match circleTM rTM sm h with
      | none => false
      | some (t, _) => reContractive2x2 (evalRSmoothed dat t)) 0 steps

/-- Check `|Re(t P(t²))| < 1` on the Q1 arc `|t| = regRQ`, `s ∈ [0, 1]` for a 1D/antisymmetric channel. -/
def regQ1DiagOK (pl : List Rat) (regRQ : Rat) (k : Nat) (steps : List Nat) : Bool :=
  let M := Nat.pow 2 k
  let unit := Nat.div D64N (Nat.mul 2 M)
  let P := pl.map ofRatTM
  let rTM := ofRatTM regRQ
  decide (k ≤ 63) && decide (sumNatList steps = M) &&
    checkPartBool unit (fun sm h =>
      match circleTM rTM sm h with
      | none => false
      | some (t, _) => reContractive1D (evalOddPoly P t)) 0 steps

/-! ### 5. First-quadrant TM-2 Simpson quadrature for Hardy circle mean -/

/-- `(I - σ R)⁻¹` and `|det(I - σ R)|²` in `TM2`. -/
def invImTM (R : SCT) (neg : Bool) : Option (SCT × TM2) :=
  let (a, b, c) := if neg then (tmcNeg R.a, tmcNeg R.b, tmcNeg R.c) else (R.a, R.b, R.c)
  let m00 := tmcSub tmcOne a
  let m01 := tmcNeg b
  let m11 := tmcSub tmcOne c
  let d := tmcSub (tmcMul m00 m11) (tmcMul m01 m01)
  let nd := tmcNormSq d
  match tmInvPos nd with
  | none => none
  | some ndi =>
    let di : TMC := ⟨tmMul d.re ndi, tmNeg (tmMul d.im ndi)⟩
    some (⟨tmcMul m11 di, tmcNeg (tmcMul m01 di), tmcMul m00 di⟩, nd)

/-- Full `2 × 2` Gaussian Schur denominator `gaussDenominator R j` in `TM2`, certifying `Z.PD` and `T.PD`. -/
def gauss2x2DenTM (R : SCT) (j j16sq : TM2) : Option TM2 :=
  match invImTM R false, invImTM R true with
  | some (ip, np), some (im, nm) =>
    let gpa := tmSub ip.a.re j; let gpb := ip.b.re; let gpc := tmSub ip.c.re j
    let gma := tmSub im.a.re j; let gmb := im.b.re; let gmc := tmSub im.c.re j
    let za := tmHalf (tmAdd gpa gma)
    let zb := tmHalf (tmAdd gpb gmb)
    let zc := tmHalf (tmAdd gpc gmc)
    let zdet := tmSub (tmMul za zc) (tmMul zb zb)
    if !(iPos (tmLo za) && iPos (tmLo zdet)) then none
    else
      match tmInvPos zdet with
      | none => none
      | some zdi =>
        let zia := tmMul zc zdi; let zib := tmNeg (tmMul zb zdi); let zic := tmMul za zdi
        let m00 := tmAdd (tmMul gma zia) (tmMul gmb zib)
        let m01 := tmAdd (tmMul gma zib) (tmMul gmb zic)
        let m10 := tmAdd (tmMul gmb zia) (tmMul gmc zib)
        let m11 := tmAdd (tmMul gmb zib) (tmMul gmc zic)
        let ta := tmAdd (tmMul m00 gpa) (tmMul m01 gpb)
        let tb := tmAdd (tmMul m00 gpb) (tmMul m01 gpc)
        let tc := tmAdd (tmMul m10 gpb) (tmMul m11 gpc)
        let tdet := tmSub (tmMul ta tc) (tmMul tb tb)
        if !(iPos (tmLo ta) && iPos (tmLo tdet)) then none
        else
          let cia := tmHalf (tmSub ip.a.im im.a.im)
          let cib := tmHalf (tmSub ip.b.im im.b.im)
          let cic := tmHalf (tmSub ip.c.im im.c.im)
          let cia2 := tmMul cia cia
          let cib2 := tmMul cib cib
          let cic2 := tmMul cic cic
          let ciab := tmMul cia cib
          let cibc := tmMul cib cic
          let sa := tmAdd (tmAdd (tmMul zia cia2) (tmDouble (tmMul zib ciab))) (tmMul zic cib2)
          let sb := tmAdd (tmAdd (tmMul zia ciab) (tmMul zib (tmAdd (tmMul cia cic) cib2))) (tmMul zic cibc)
          let sc := tmAdd (tmAdd (tmMul zia cib2) (tmDouble (tmMul zib cibc))) (tmMul zic cic2)
          -- `T + 2 E = Z + C_i Z⁻¹ C_i` (zero subtractive cancellation)
          let tea := tmAdd (tmAdd za sa) j
          let teb := tmAdd zb sb
          let tec := tmAdd (tmAdd zc sc) j
          let tja := tmAdd ta j
          let tjc := tmAdd tc j
          let dtj := tmSub (tmMul tja tjc) (tmMul tb tb)
          let dtej := tmSub (tmMul tea tec) (tmMul teb teb)
          if !(iPos (tmLo dtj) && iPos (tmLo dtej)) then none
          else
            some (tmMul (tmMul (tmMul j16sq (tmMul np nm)) zdet) (tmMul dtj dtej))
  | _, _ => none

/-- Singularity-free 1D coordinate factor `((1 - j - w) * (1 + y² - j u)) / (1 - j (u + 4 x² w))`
where `u = 1 - x² + y²` and `w = y² / u`, certifying the 1D `Z > 0` and `T > 0` gates. -/
def gauss1DFactorTM (r : TMC) (j omj om2j j2 : TM2) : Option TM2 :=
  let x2 := tmMul r.re r.re
  let y2 := tmMul r.im r.im
  let u := tmAdd (tmSub tmOne x2) y2
  match tmInvPos u with
  | none => none
  | some ui =>
    let w := tmMul y2 ui
    let sTerm := tmAdd u (tmDouble (tmDouble (tmMul x2 w)))
    let denom := tmSub tmOne (tmMul j sTerm)
    match tmInvPos denom with
    | none => none
    | some deni =>
      let tGate := tmAdd (tmSub om2j w) (tmMul j2 sTerm)
      let num1 := tmSub omj w
      let num2 := tmSub (tmAdd tmOne y2) (tmMul j u)
      if iPos (tmLo tGate) && iPos (tmLo num1) && iPos (tmLo num2) then
        some (tmMul (tmMul num1 num2) deni)
      else none

/-- Accumulate `∑ w * (3 * c + q + 3 * r)` across `steps` for integrand `1 / ((1 + s²) * den(s))`. -/
def sumSimpsonPart (unit : Nat) (leafInv : Int → Int → Option TM2) :
    Nat → List Nat → Int → Option Int
  | _, [], acc => some acc
  | pos, w :: rest, acc =>
    let sm := Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit)
    let h := Int.ofNat (Nat.mul w unit)
    match leafInv sm h with
    | none => none
    | some inv =>
      let c3 := iAdd (iAdd inv.c inv.c) inv.c
      let r3 := Int.ofNat (Nat.add (Nat.add inv.r inv.r) inv.r)
      let term := iMul (Int.ofNat w) (iAdd (iAdd c3 inv.q) r3)
      sumSimpsonPart unit leafInv (Nat.add pos w) rest (iAdd acc term)

/-- Rational lower bound for `π` (`Real.pi_gt_d20`). -/
def piLo20Q : Rat := (314159265358979323846 : Int) / ((10 : Int) ^ 20)

/-- Certify `(2π)⁻¹ ∫₀^{2π} ‖HholPair‖² ≤ budgetQ` via Q1 TM-2 Simpson quadrature for a smoothed channel. -/
def meanQ1SmoothedOK (ctQ stQ seQ : Rat) (pl ql : List Rat) (rhoQ jQ budgetQ : Rat)
    (k : Nat) (steps : List Nat) : Bool :=
  let M := Nat.pow 2 k
  let unit := Nat.div D64N (Nat.mul 2 M)
  let dat := mkSmoothedTMData ctQ stQ seQ pl ql
  let rhoTM := ofRatTM rhoQ
  let jTM := ofRatTM jQ
  let j16sq := ofRatTM (16 * jQ * jQ)
  let cap := iMul (Int.ofNat (Nat.mul 3 M)) (ofRatDown64 (piLo20Q * budgetQ))
  if !(decide (k ≤ 63) && decide (sumNatList steps = M)) then false
  else
    match sumSimpsonPart unit (fun sm h =>
      match circleTM rhoTM sm h with
      | none => none
      | some (t, onePs2) =>
        match gauss2x2DenTM (evalRSmoothed dat t) jTM j16sq with
        | none => none
        | some den => tmInvPos (tmMul onePs2 den)) 0 steps 0 with
    | none => false
    | some acc => iLe (iMul 4 acc) cap

/-- Certify `(2π)⁻¹ ∫₀^{2π} ‖HholPair‖² ≤ budgetQ` via Q1 TM-2 Simpson quadrature for the 1D phase channel `R = diag(r, 0)`. -/
def meanQ1PhaseOK (pl : List Rat) (rhoQ jQ budgetQ : Rat) (k : Nat) (steps : List Nat) : Bool :=
  let M := Nat.pow 2 k
  let unit := Nat.div D64N (Nat.mul 2 M)
  let P := pl.map ofRatTM
  let rhoTM := ofRatTM rhoQ
  let jTM := ofRatTM jQ
  let omjTM := ofRatTM (1 - jQ)
  let om2jTM := ofRatTM (1 - 2 * jQ)
  let j2TM := ofRatTM (jQ * jQ)
  let j16omj := ofRatTM (16 * jQ * jQ * (1 - jQ))
  let cap := iMul (Int.ofNat (Nat.mul 3 M)) (ofRatDown64 (piLo20Q * budgetQ))
  if !(decide (k ≤ 63) && decide (sumNatList steps = M)) then false
  else
    match sumSimpsonPart unit (fun sm h =>
      match circleTM rhoTM sm h with
      | none => none
      | some (t, onePs2) =>
        match gauss1DFactorTM (evalOddPoly P t) jTM omjTM om2jTM j2TM with
        | none => none
        | some f => tmInvPos (tmMul onePs2 (tmMul j16omj f))) 0 steps 0 with
    | none => false
    | some acc => iLe (iMul 4 acc) cap

/-- Certify `(2π)⁻¹ ∫₀^{2π} ‖HholPair‖² ≤ budgetQ` via Q1 TM-2 Simpson quadrature for an antisymmetric channel `R = diag(-r, r)`. -/
def meanQ1AntiOK (rl : List Rat) (rhoQ jQ budgetQ : Rat) (k : Nat) (steps : List Nat) : Bool :=
  let M := Nat.pow 2 k
  let unit := Nat.div D64N (Nat.mul 2 M)
  let R := rl.map ofRatTM
  let rhoTM := ofRatTM rhoQ
  let jTM := ofRatTM jQ
  let omjTM := ofRatTM (1 - jQ)
  let om2jTM := ofRatTM (1 - 2 * jQ)
  let j2TM := ofRatTM (jQ * jQ)
  let j16sq := ofRatTM (16 * jQ * jQ)
  let cap := iMul (Int.ofNat (Nat.mul 3 M)) (ofRatDown64 (piLo20Q * budgetQ))
  if !(decide (k ≤ 63) && decide (sumNatList steps = M)) then false
  else
    match sumSimpsonPart unit (fun sm h =>
      match circleTM rhoTM sm h with
      | none => none
      | some (t, onePs2) =>
        match gauss1DFactorTM (evalOddPoly R t) jTM omjTM om2jTM j2TM with
        | none => none
        | some f => tmInvPos (tmMul onePs2 (tmMul j16sq (tmMul f f)))) 0 steps 0 with
    | none => false
    | some acc => iLe (iMul 4 acc) cap

end HaagerupKernel.TaylorHardy
