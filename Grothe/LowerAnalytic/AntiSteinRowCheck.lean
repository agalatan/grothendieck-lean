import Grothe.LowerAnalytic.RadiusRowCheck

/-!
# Computable pure-integer Bernstein checker for antiholomorphic Stein row certificates

This lightweight module generalizes `Grothe/LowerAnalytic/RadiusRowCheck.lean` from the cubic
first moment `E √U` to the convex fibre potentials `Ψ(σ √U)` of the lower-bound rows, using
exact node caps `CapsHold Ψ nodes smax` and the certified cubic radius bound `E √U ≤ 93/100`.

It has no heavy analysis imports so that generated certificate modules can check `checkAntiNode`
and `checkAntiRow` via proof-producing kernel reduction (`decide +kernel`) with minimal startup
overhead and zero `native_decide` axioms.

Analytic soundness (`antiRow_sound`) is proved in `Grothe/LowerAnalytic/AntiSteinRowSound.lean`.
-/

namespace Grothe.LowerAnalytic

/-! ### Exact rational Bernstein checks via pure-integer scaling -/

/-- `D^d * p(x / D) = ∑_{k=0}^d (p_k * D^{d-k}) x^k`. -/
def pScalePow (D : Int) (d : ℕ) (p : List Int) : List Int :=
  (List.range (d + 1)).map fun k => p.getD k 0 * D ^ (d - k)

/-- Auto-bisecting pure-integer Bernstein positivity check (at most `depth` halvings). -/
def bernAutoOK : ℕ → List Int → Bool
  | 0, b => b.all (fun x => decide (0 ≤ x))
  | depth + 1, b =>
    b.all (fun x => decide (0 ≤ x)) ||
      let (bl, br) := dcSplit b
      bernAutoOK depth bl && bernAutoOK depth br

/-- Verify `0 ≤ evalInt p R` for all `R ∈ [lo, hi]` (exact rational endpoints `lo < hi`). -/
def segRatOK (d : ℕ) (lo hi : ℚ) (p : List Int) (depth : ℕ := 12) : Bool :=
  decide (lo < hi) && pTrimOK d p &&
    let D : ℕ := Nat.lcm lo.den hi.den
    let a : Int := (lo * (D : ℚ)).num
    let w : Int := ((hi - lo) * (D : ℚ)).num
    let ps := pScalePow (D : Int) d p
    bernAutoOK depth (toBernSeg ps d a w)

/-- Verify `0 ≤ evalInt p R` for all `R ∈ [lo, ∞)` via `R = lo + 10 t / (1 - t)`. -/
def rayRatOK (d : ℕ) (lo : ℚ) (p : List Int) (depth : ℕ := 12) : Bool :=
  pTrimOK d p &&
    let D : ℕ := lo.den
    let a : Int := (lo * (D : ℚ)).num
    let ps := pScalePow (D : Int) d p
    bernAutoOK depth (toBernRay ps d a (10 * (D : Int)))

/-! ### Piecewise-linear upper envelope of `Ψ(σ r)` from node caps -/

/-- One affine upper-bound segment `α + β r` for `Ψ(σ r)` on `[lo, hi]` (or `[lo, ∞)` when
`hi? = none`). -/
structure LinPiece where
  lo : ℚ
  hi? : Option ℚ
  alpha : ℚ
  beta : ℚ
  deriving DecidableEq, Repr

/-- Check that `nodes` is nonempty, starts at `0`, and has strictly increasing abscissae. -/
def nodesStrictOK : List (ℚ × ℚ) → Bool
  | [] => false
  | [_] => true
  | (x0, _) :: (x1, y1) :: rest => decide (x0 < x1) && nodesStrictOK ((x1, y1) :: rest)

def nodesOK (nodes : List (ℚ × ℚ)) : Bool :=
  match nodes with
  | (0, _) :: _ => nodesStrictOK nodes
  | _ => false

/-- Linear-time sublist check `sub ⊆ full` (for thinned node tables). -/
def isSublistQ : List (ℚ × ℚ) → List (ℚ × ℚ) → Bool
  | [], _ => true
  | _ :: _, [] => false
  | a :: as, b :: bs => if a == b then isSublistQ as bs else isSublistQ (a :: as) bs

/-- Build the piecewise-linear upper-bound segments of `Ψ(σ r)` from sorted node caps. -/
def mkLinPieces (sigma smax : ℚ) : List (ℚ × ℚ) → List LinPiece
  | [] => []
  | [(x, y)] => [⟨x / sigma, none, y - smax * x, smax * sigma⟩]
  | (x0, y0) :: (x1, y1) :: rest =>
    let sl := (y1 - y0) / (x1 - x0)
    ⟨x0 / sigma, some (x1 / sigma), y0 - sl * x0, sl * sigma⟩ ::
      mkLinPieces sigma smax ((x1, y1) :: rest)

/-! ### Pointwise `AntiStein` bank entry (general even grid denominator `gridDen`) -/

/-- One pointwise `AntiStein` majorant at scale `sigma` with knot grid `e_i = knots[i] / gridDen`.
Arrays are scaled by `arrScale = 2^36`; `mu`, `slope`, `sigmaAt` by `muScale = 2^50`;
`lam`, `l3` by `lamScale = 2^62`. -/
structure AntiNode where
  sigma : ℚ
  gridDen : ℕ
  knots : List ℕ
  phi1 : List Int
  phi2 : List Int
  xi2 : List Int
  xi1 : List Int
  xia : List Int
  th2 : List Int
  th4 : List Int
  lam0 : Int
  lam1 : Int
  lam2 : Int
  l3s : Int
  l3a : Int
  l3b : Int
  mu1 : Int
  mu2 : Int
  mu3 : Int
  mu4 : Int
  mu5 : Int
  slope1 : Int
  slope2 : Int
  sigmaAt : Int
  deriving DecidableEq, Repr

/-- Integer polynomial `W_den * Fv(w / M^2)` in `w = R^2 = M^2 v` on a single spline cell,
for any positive even `M = an.gridDen`. -/
def pieceFvWGen (an : AntiNode) (mAll m1 m2 m3 m4 m5 : Int) (tail : Bool) (k0 k1 : ℕ)
    (p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2 : Int) : List Int :=
  let M : Int := (an.gridDen : Int)
  let M2 : Int := M * M
  let M4 : Int := M2 * M2
  let M6 : Int := M4 * M2
  let U0 : Int := (k0 : Int) * (k0 : Int)
  let U1 : Int := if tail then U0 else (k1 : Int) * (k1 : Int)
  let du : Int := if tail then 1 else U1 - U0
  let mkP (a0 a1 : Int) : List Int := if tail then [a0] else [a0 * U1 - a1 * U0, a1 - a0]
  let ph1 := pAdd (pScale (M2 * rMA) (mkP p1a p1b)) [0, an.slope1 * du]
  let ph2 := pAdd (pScale (M2 * rMA) (mkP p2a p2b)) [0, an.slope2 * du]
  let mkG (g : Int) (ph : List Int) : List Int :=
    let c0 := ph.getD 0 0
    let c1 := ph.getD 1 0
    [du * g - 2 * c0 * U0 - c1 * U0 * U0, 2 * c0, c1]
  let G1 := mkG g1 ph1
  let G2 := mkG g2 ph2
  let T2 := pScale (2 * M2 * rMA) (mkP t2a t2b)
  let T4 := pScale (2 * M2 * rMA) (mkP t4a t4b)
  let T3 := pSub (pSub (pAdd (pScale (2 * M2 * rMA) (mkP x1a x1b)) ph2) T2) T4
  let T1 := pSub (pAdd (pAdd (pScale (2 * M2 * rMA) (mkP x2a x2b)) (pScale 2 ph1)) T2) T3
  let T5 := pSub
    (pAdd
      (pSub (pAdd (pShift 1 (pScale (4 * M2 * rMA) (mkP xaa xab))) (pShift 1 (pScale 4 ph1)))
        (pScale 2 G1))
      (pSub (pShift 1 (pScale 2 ph2)) G2))
    [0, 0, 4 * du * an.sigmaAt]
  let du2M := du * du * mAll
  let L3 := an.l3s + an.l3a + an.l3b
  let lamW := [M6 * an.lam0 * du2M, M4 * an.lam1 * du2M, M2 * an.lam2 * du2M, L3 * du2M]
  let GW := pScale ((M2 / 2) * rLM * du * mAll) (pAdd G1 G2)
  let linC := pAdd (pAdd T1 T2) (pAdd (pScale 3 T3) (pScale 2 T4))
  let linW := pScale ((M4 / 2) * rLM * du * mAll) linC
  let sqW := pAdd
    (pAdd (pScale (256 * M2 * m1) (pMul T1 T1)) (pScale (256 * M2 * m2) (pMul T2 T2)))
    (pAdd (pScale (256 * M2 * m3) (pMul T3 T3)) (pScale (256 * M2 * m4) (pMul T4 T4)))
  let brW := pSub (pSub (pAdd lamW GW) linW) sqW
  pSub (pShift 2 brW) (pScale (64 * M2 * m5) (pMul T5 T5))

/-- Check `P_cell(R) / W_den ≥ α + β (R / M)` (when `first = true`) or
`P_cell(R) / (W_den * R^4) ≥ α + β (R / M)` (when `first = false`) on `R ∈ [M * rLo, M * rHi]`
(or `[M * rLo, ∞)` when `rHi? = none`). -/
def subAffineCellOK (first : Bool) (M : ℕ) (Wden : Int) (Pcell : List Int)
    (rLo : ℚ) (rHi? : Option ℚ) (alpha beta : ℚ) : Bool :=
  let qDen : ℕ := Nat.lcm alpha.den beta.den
  let pAl : Int := (alpha * (qDen : ℚ)).num
  let pBe : Int := (beta * (qDen : ℚ)).num
  let Mi : Int := (M : Int)
  let Mq : ℚ := (M : ℚ)
  let lhs := pScale ((qDen : Int) * Mi) Pcell
  if first then
    match rHi? with
    | none => false
    | some rHi =>
      let rhs : List Int := [pAl * Mi * Wden, pBe * Wden]
      segRatOK 6 (Mq * rLo) (Mq * rHi) (pSub lhs rhs)
  else
    let rhs : List Int := [0, 0, 0, 0, pAl * Mi * Wden, pBe * Wden]
    let poly := pSub lhs rhs
    match rHi? with
    | none => rayRatOK 10 (Mq * rLo) poly
    | some rHi => segRatOK 10 (Mq * rLo) (Mq * rHi) poly

/-- Advance through `lps` covering `[rLo, rHi]` (finite spline cell), returning the remaining
`LinPiece` list starting at or before `rHi` on success, or `none` on failure. -/
def sweepFiniteCell (first : Bool) (M : ℕ) (Wden : Int) (Pcell : List Int)
    (rLo rHi : ℚ) : List LinPiece → Option (List LinPiece)
  | [] => none
  | lp :: rest =>
    match lp.hi? with
    | none =>
      if decide (lp.lo ≤ rLo) && subAffineCellOK first M Wden Pcell rLo (some rHi) lp.alpha lp.beta then
        some (lp :: rest)
      else none
    | some lpHi =>
      if decide (lpHi ≤ rLo) then
        sweepFiniteCell first M Wden Pcell rLo rHi rest
      else if decide (lp.lo ≤ rLo) then
        if decide (rHi ≤ lpHi) then
          if subAffineCellOK first M Wden Pcell rLo (some rHi) lp.alpha lp.beta then
            some (if lpHi == rHi then rest else lp :: rest)
          else none
        else
          if subAffineCellOK first M Wden Pcell rLo (some lpHi) lp.alpha lp.beta then
            sweepFiniteCell first M Wden Pcell lpHi rHi rest
          else none
      else none

/-- Advance through `lps` covering `[rLo, ∞)` (tail spline cell). -/
def sweepTailCell (M : ℕ) (Wden : Int) (Pcell : List Int) (rLo : ℚ) : List LinPiece → Bool
  | [] => false
  | lp :: rest =>
    match lp.hi? with
    | none =>
      decide (lp.lo ≤ rLo) && subAffineCellOK false M Wden Pcell rLo none lp.alpha lp.beta
    | some lpHi =>
      if decide (lpHi ≤ rLo) then
        sweepTailCell M Wden Pcell rLo rest
      else
        decide (lp.lo ≤ rLo) &&
          subAffineCellOK false M Wden Pcell rLo (some lpHi) lp.alpha lp.beta &&
          sweepTailCell M Wden Pcell lpHi rest

/-- Lockstep traversal of spline knots and `LinPiece` envelope segments. -/
def checkAntiPiecesAux (an : AntiNode) (mAll m1 m2 m3 m4 m5 : Int) :
    Bool → Int → Int → List ℕ → List Int → List Int → List Int → List Int → List Int →
    List Int → List Int → List LinPiece → Bool
  | first, g1, g2, [kK], [p1], [p2], [x2], [x1], [xa], [t2], [t4], lps =>
    let M : Int := (an.gridDen : Int)
    let M2 : Int := M * M
    let M6 : Int := M2 * M2 * M2
    let FvW := pieceFvWGen an mAll m1 m2 m3 m4 m5 true kK kK
      p1 p1 p2 p2 x2 x2 x1 x1 xa xa t2 t2 t4 t4 g1 g2
    let Wden := M6 * lamScale * mAll
    !first && coneAtOK x2 x1 xa &&
      sweepTailCell an.gridDen Wden (pInSq FvW) ((kK : ℚ) / (an.gridDen : ℚ)) lps
  | first, g1, g2, k0 :: k1 :: ks, p1a :: p1b :: p1s, p2a :: p2b :: p2s,
      x2a :: x2b :: x2s, x1a :: x1b :: x1s, xaa :: xab :: xas,
      t2a :: t2b :: t2s, t4a :: t4b :: t4s, lps =>
    let M : Int := (an.gridDen : Int)
    let M2 : Int := M * M
    let M6 : Int := M2 * M2 * M2
    let U0 : Int := (k0 : Int) * (k0 : Int)
    let U1 : Int := (k1 : Int) * (k1 : Int)
    let du : Int := U1 - U0
    let FvW := pieceFvWGen an mAll m1 m2 m3 m4 m5 false k0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2
    let Wden := M6 * lamScale * du * du * mAll
    let rLo : ℚ := (k0 : ℚ) / (an.gridDen : ℚ)
    let rHi : ℚ := (k1 : ℚ) / (an.gridDen : ℚ)
    if decide (k0 < k1) && coneAtOK x2a x1a xaa &&
        (!first || (FvW.getD 0 0 == 0 && FvW.getD 1 0 == 0)) then
      let Pcell := if first then pInSq (FvW.drop 2) else pInSq FvW
      match sweepFiniteCell first an.gridDen Wden Pcell rLo rHi lps with
      | none => false
      | some lps' =>
        let g1' := g1 + M2 * rMA * (p1a + p1b) * du + an.slope1 * (U1 * U1 - U0 * U0)
        let g2' := g2 + M2 * rMA * (p2a + p2b) * du + an.slope2 * (U1 * U1 - U0 * U0)
        checkAntiPiecesAux an mAll m1 m2 m3 m4 m5 false g1' g2'
          (k1 :: ks) (p1b :: p1s) (p2b :: p2s) (x2b :: x2s) (x1b :: x1s)
          (xab :: xas) (t2b :: t2s) (t4b :: t4s) lps'
    else false
  | _, _, _, _, _, _, _, _, _, _, _, _ => false

/-- Complete pointwise check of an `AntiNode` against sorted node caps `nodes` and tail slope `smax`. -/
def checkAntiNode (nodes : List (ℚ × ℚ)) (smax : ℚ) (an : AntiNode) : Bool :=
  let headOK := decide (0 < an.gridDen) && (an.gridDen % 2 == 0) && decide (0 < an.sigma) &&
    nodesOK nodes &&
    decide (0 < an.mu1) && decide (0 < an.mu2) && decide (0 < an.mu3) &&
    decide (0 < an.mu4) && decide (0 < an.mu5) &&
    decide (0 ≤ an.l3s) && decide (0 ≤ an.l3a) && decide (0 ≤ an.l3b) &&
    decide (0 < an.l3s + an.l3a + an.l3b)
  let m1 := an.mu2 * an.mu3 * an.mu4 * an.mu5
  let m2 := an.mu1 * an.mu3 * an.mu4 * an.mu5
  let m3 := an.mu1 * an.mu2 * an.mu4 * an.mu5
  let m4 := an.mu1 * an.mu2 * an.mu3 * an.mu5
  let m5 := an.mu1 * an.mu2 * an.mu3 * an.mu4
  let mAll := an.mu1 * m1
  match an.knots with
  | 0 :: _ =>
    headOK &&
      checkAntiPiecesAux an mAll m1 m2 m3 m4 m5 true 0 0
        an.knots an.phi1 an.phi2 an.xi2 an.xi1 an.xia an.th2 an.th4
        (mkLinPieces an.sigma smax nodes)
  | _ => false

/-! ### Pure polynomial majorant checker (for `.quad` and `.moment` nodes) -/

/-- Common denominator of a rational list. -/
def ratListDen (p : List ℚ) : ℕ :=
  p.foldr (fun q acc => Nat.lcm q.den acc) 1

/-- Check `∑ coeffs[k] r^k ≥ Ψ(σ r)` for all `r ≥ 0` (degree `d ≤ 6`). -/
def checkPolyMajAux (d : ℕ) (Dp : ℕ) (Pint : List Int) : List LinPiece → Bool
  | [] => true
  | lp :: rest =>
    let qDen : ℕ := Nat.lcm lp.alpha.den lp.beta.den
    let pAl : Int := (lp.alpha * (qDen : ℚ)).num
    let pBe : Int := (lp.beta * (qDen : ℚ)).num
    let poly := pSub (pScale (qDen : Int) Pint) [pAl * (Dp : Int), pBe * (Dp : Int)]
    let ok := match lp.hi? with
      | none => rayRatOK d lp.lo poly
      | some hi => segRatOK d lp.lo hi poly
    ok && checkPolyMajAux d Dp Pint rest

def checkPolyMajorant (sigma : ℚ) (nodes : List (ℚ × ℚ)) (smax : ℚ) (coeffs : List ℚ) : Bool :=
  decide (0 < sigma) && nodesOK nodes &&
    let d := coeffs.length - 1
    let Dp := ratListDen coeffs
    let Pint := coeffs.map fun q => (q * (Dp : ℚ)).num
    checkPolyMajAux d Dp Pint (mkLinPieces sigma smax nodes)

/-! ### `(C3)`: Endpoint bound check for `AntiNode` and row assembly -/

def antiDLin (an : AntiNode) : Lin5 :=
  let sM : ℚ := (muScale : ℚ)
  let m1 : ℚ := (an.mu1 : ℚ) / sM
  let m2 : ℚ := (an.mu2 : ℚ) / sM
  let m3 : ℚ := (an.mu3 : ℚ) / sM
  let m4 : ℚ := (an.mu4 : ℚ) / sM
  let m5 : ℚ := (an.mu5 : ℚ) / sM
  let sig : ℚ := (an.sigmaAt : ℚ) / sM
  ⟨16 * m1 + 16 * m2 + 80 * m3 + 32 * m4,
   4 * m1 + 20 * m2 + 20 * m3 + 16 * m4,
   16 * m2 + 16 * m3 + 16 * m4 + 32 * m5 + 32 * sig,
   96 * m3 + 48 * m4 + 24 * m5 + 48 * sig,
   32 * m3 + 16 * m4⟩

def antiDJ (an : AntiNode) (alA alB : ℚ) : Lin5 :=
  let sL : ℚ := (lamScale : ℚ)
  let la : ℚ := (an.l3a : ℚ) / sL
  let lb : ℚ := (an.l3b : ℚ) / sL
  Lin5.add
    (Lin5.smul la (Lin5.add (Lin5.smul (150 * alA) s0Form)
      (Lin5.smul (198 + 150 / alA) h0Form)))
    (Lin5.smul lb (Lin5.add (Lin5.smul (135 / 2 * alB) s0Form)
      (Lin5.smul (11781 / 32 + 135 / (2 * alB)) h0Form)))

/-- Endpoint bound check `(C3)` at `s` against `val` (`bound ≤ val`). -/
def checkAntiEndpoint (an : AntiNode) (s : ℚ) (par? : Option EndPar) (val : ℚ) : Bool :=
  let sL : ℚ := (lamScale : ℚ)
  let l0 : ℚ := (an.lam0 : ℚ) / sL
  let l1 : ℚ := (an.lam1 : ℚ) / sL
  let l2 : ℚ := (an.lam2 : ℚ) / sL
  let l3s : ℚ := (an.l3s : ℚ) / sL
  let l3a : ℚ := (an.l3a : ℚ) / sL
  let l3b : ℚ := (an.l3b : ℚ) / sL
  if s == 0 then
    decide (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b) ≤ val)
  else if decide (0 < s) then
    match par? with
    | none => false
    | some pd =>
      decide (0 < pd.alphaA) && decide (0 < pd.alphaB) &&
        decide (0 < pd.sqrtUb) && decide (s ≤ pd.sqrtUb * pd.sqrtUb) &&
        pd.cuts.all cutTermOK &&
        let obj := Lin5.add (antiDLin an) (Lin5.smul pd.sqrtUb (antiDJ an pd.alphaA pd.alphaB))
        let resid0 := Lin5.sub obj (Lin5.smul pd.eta sForm)
        let resid := pd.cuts.foldl
          (fun acc c => Lin5.add acc (Lin5.smul c.weight (cutLin5 c.kind c.theta))) resid0
        let L := pd.eta + posPartQ resid.cn * (1 / 32) + posPartQ resid.ch * (1 / 8)
          + posPartQ resid.cb * (1 / 32) + posPartQ resid.cy * (1 / 96)
          + posPartQ resid.cz * (3 / 64)
        let bound := l0 + l1 + l2 * (2 + s)
          + l3s * (6 + 9 * s + radiusC6 * s * pd.sqrtUb)
          + (l3a + l3b) * (6 + 9 * s) + s * L
        decide (bound ≤ val)
  else
    false

/-- Lightweight scalar header of an `AntiNode` (all fields needed for `checkAntiEndpoint`,
decoupled from the knot arrays so the cell-assembly checker imports no knot arrays). -/
structure AntiNodeSummary where
  sigma : ℚ
  lam0 : Int
  lam1 : Int
  lam2 : Int
  l3s : Int
  l3a : Int
  l3b : Int
  mu1 : Int
  mu2 : Int
  mu3 : Int
  mu4 : Int
  mu5 : Int
  sigmaAt : Int
  deriving DecidableEq, Repr

def AntiNode.summary (an : AntiNode) : AntiNodeSummary :=
  ⟨an.sigma, an.lam0, an.lam1, an.lam2, an.l3s, an.l3a, an.l3b,
    an.mu1, an.mu2, an.mu3, an.mu4, an.mu5, an.sigmaAt⟩

def sumDLin (an : AntiNodeSummary) : Lin5 :=
  let sM : ℚ := (muScale : ℚ)
  let m1 : ℚ := (an.mu1 : ℚ) / sM
  let m2 : ℚ := (an.mu2 : ℚ) / sM
  let m3 : ℚ := (an.mu3 : ℚ) / sM
  let m4 : ℚ := (an.mu4 : ℚ) / sM
  let m5 : ℚ := (an.mu5 : ℚ) / sM
  let sig : ℚ := (an.sigmaAt : ℚ) / sM
  ⟨16 * m1 + 16 * m2 + 80 * m3 + 32 * m4,
   4 * m1 + 20 * m2 + 20 * m3 + 16 * m4,
   16 * m2 + 16 * m3 + 16 * m4 + 32 * m5 + 32 * sig,
   96 * m3 + 48 * m4 + 24 * m5 + 48 * sig,
   32 * m3 + 16 * m4⟩

def sumDJ (an : AntiNodeSummary) (alA alB : ℚ) : Lin5 :=
  let sL : ℚ := (lamScale : ℚ)
  let la : ℚ := (an.l3a : ℚ) / sL
  let lb : ℚ := (an.l3b : ℚ) / sL
  Lin5.add
    (Lin5.smul la (Lin5.add (Lin5.smul (150 * alA) s0Form)
      (Lin5.smul (198 + 150 / alA) h0Form)))
    (Lin5.smul lb (Lin5.add (Lin5.smul (135 / 2 * alB) s0Form)
      (Lin5.smul (11781 / 32 + 135 / (2 * alB)) h0Form)))

def checkSumEndpoint (an : AntiNodeSummary) (s : ℚ) (par? : Option EndPar) (val : ℚ) : Bool :=
  let sL : ℚ := (lamScale : ℚ)
  let l0 : ℚ := (an.lam0 : ℚ) / sL
  let l1 : ℚ := (an.lam1 : ℚ) / sL
  let l2 : ℚ := (an.lam2 : ℚ) / sL
  let l3s : ℚ := (an.l3s : ℚ) / sL
  let l3a : ℚ := (an.l3a : ℚ) / sL
  let l3b : ℚ := (an.l3b : ℚ) / sL
  if s == 0 then
    decide (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b) ≤ val)
  else if decide (0 < s) then
    match par? with
    | none => false
    | some pd =>
      decide (0 < pd.alphaA) && decide (0 < pd.alphaB) &&
        decide (0 < pd.sqrtUb) && decide (s ≤ pd.sqrtUb * pd.sqrtUb) &&
        pd.cuts.all cutTermOK &&
        let obj := Lin5.add (sumDLin an) (Lin5.smul pd.sqrtUb (sumDJ an pd.alphaA pd.alphaB))
        let resid0 := Lin5.sub obj (Lin5.smul pd.eta sForm)
        let resid := pd.cuts.foldl
          (fun acc c => Lin5.add acc (Lin5.smul c.weight (cutLin5 c.kind c.theta))) resid0
        let L := pd.eta + posPartQ resid.cn * (1 / 32) + posPartQ resid.ch * (1 / 8)
          + posPartQ resid.cb * (1 / 32) + posPartQ resid.cy * (1 / 96)
          + posPartQ resid.cz * (3 / 64)
        let bound := l0 + l1 + l2 * (2 + s)
          + l3s * (6 + 9 * s + radiusC6 * s * pd.sqrtUb)
          + (l3a + l3b) * (6 + 9 * s) + s * L
        decide (bound ≤ val)
  else
    false

/-- One `s`-independent quadratic majorant `a0 + a1 r + a2 r² ≥ Ψ(σ r)` (stored once in a bank
and reused across every `s`-cell). -/
structure QuadNode where
  sigma : ℚ
  a0 : ℚ
  a1 : ℚ
  a2 : ℚ
  deriving DecidableEq, Repr

def QuadNode.val (q : QuadNode) : ℚ := q.a0 + q.a1 * (93 / 100) + q.a2

def checkQuadNode (nodes : List (ℚ × ℚ)) (smax : ℚ) (q : QuadNode) : Bool :=
  decide (0 ≤ q.a1) && checkPolyMajorant q.sigma nodes smax [q.a0, q.a1, q.a2]

/-- A `σ`-node inside an `s`-cell of a tightened row certificate. -/
inductive RowSigmaNode where
  | zero
  | quad (idx : ℕ) (sigma val : ℚ)
  | moment (sigma a0 a1 a2 a4 a6 sbLo sbHi : ℚ)
  | anti (idx : ℕ) (sigma val : ℚ) (parLo : Option EndPar) (parHi : EndPar)
  deriving DecidableEq, Repr

def RowSigmaNode.sigma : RowSigmaNode → ℚ
  | .zero => 0
  | .quad _ s _ => s
  | .moment s _ _ _ _ _ _ _ => s
  | .anti _ s _ _ _ => s

def RowSigmaNode.val (c0 sLo sHi : ℚ) : RowSigmaNode → ℚ
  | .zero => c0
  | .quad _ _ v => v
  | .moment _ a0 a1 a2 a4 a6 sbLo sbHi =>
    let ev (s sb : ℚ) := a0 + a1 * (93 / 100) + a2 + a4 * (2 + s) + a6 * (6 + 9 * s + radiusC6 * s * sb)
    max (ev sLo sbLo) (ev sHi sbHi)
  | .anti _ _ v _ _ => v

/-- Exact maximum of the chord through `(s0, v0)`, `(s1, v1)` minus `D σ²` on `[s0, s1]`. -/
def quadValQ (c0 c1 c2 t : ℚ) : ℚ := c0 + c1 * t + c2 * t ^ 2

def quadMaxQ (c0 c1 c2 a b : ℚ) : ℚ :=
  let e := max (quadValQ c0 c1 c2 a) (quadValQ c0 c1 c2 b)
  if c2 < 0 then
    let v := -c1 / (2 * c2)
    if a ≤ v ∧ v ≤ b then max e (quadValQ c0 c1 c2 v) else e
  else e

def chordMaxQ (v0 v1 D s0 s1 : ℚ) : ℚ :=
  let m := (v1 - v0) / (s1 - s0)
  quadMaxQ (v0 - m * s0) m (-D) s0 s1

/-- Check one `RowSigmaNode` on `[sLo, sHi]` against `nodes`, `smax`, pre-verified `quadBank`,
and pre-verified `bankSums`. -/
def checkSigmaNode (nodes : List (ℚ × ℚ)) (smax sLo sHi : ℚ)
    (quadBank : List QuadNode) (bankSums : List AntiNodeSummary) : RowSigmaNode → Bool
  | .zero => nodesOK nodes
  | .quad idx σ val =>
    match quadBank[idx]? with
    | none => false
    | some q => (q.sigma == σ) && decide (q.val ≤ val)
  | .moment σ a0 a1 a2 a4 a6 sbLo sbHi =>
    decide (0 ≤ a1) && decide (0 ≤ a6) &&
      decide (0 ≤ sbLo) && decide (sLo ≤ sbLo * sbLo) &&
      decide (0 ≤ sbHi) && decide (sHi ≤ sbHi * sbHi) &&
      checkPolyMajorant σ nodes smax [a0, a1, a2, 0, a4, 0, a6]
  | .anti idx σ val parLo parHi =>
    match bankSums[idx]? with
    | none => false
    | some an =>
      (an.sigma == σ) && checkSumEndpoint an sLo parLo val && checkSumEndpoint an sHi (some parHi) val

/-- Check consecutive chords of `ns` cover `[0, stop]` with every chord `≤ cap`. -/
def checkSigmaChain (c0 sLo sHi kap cap stop : ℚ) : List RowSigmaNode → Bool
  | [] => false
  | [n] => decide (stop ≤ n.sigma)
  | a :: b :: rest =>
    decide (a.sigma < b.sigma) &&
      decide (chordMaxQ (a.val c0 sLo sHi) (b.val c0 sLo sHi) kap a.sigma b.sigma ≤ cap) &&
      checkSigmaChain c0 sLo sHi kap cap stop (b :: rest)

/-- One `s`-cell covering `[sLo, sHi]` with its `σ`-node chain. -/
structure AntiSCell where
  sLo : ℚ
  sHi : ℚ
  snodes : List RowSigmaNode
  deriving DecidableEq, Repr

/-- Check one `s`-cell `[sLo, sHi]` covering `σ ∈ [0, stop]`. -/
def checkAntiSCell (nodes : List (ℚ × ℚ)) (smax kap cap stop : ℚ)
    (quadBank : List QuadNode) (bankSums : List AntiNodeSummary) (c : AntiSCell) : Bool :=
  let c0 := (nodes.headD (0, 0)).2
  decide (0 ≤ c.sLo) && decide (c.sLo < c.sHi) &&
    match c.snodes with
    | .zero :: _ =>
      checkSigmaChain c0 c.sLo c.sHi kap cap stop c.snodes &&
        c.snodes.all (checkSigmaNode nodes smax c.sLo c.sHi quadBank bankSums)
    | _ => false

/-- Check that `s`-cells form a contiguous chain covering `[0, 42]`. -/
def checkSCellChain : ℚ → ℚ → List AntiSCell → Bool
  | _, _, [] => false
  | prev, stop, [c] => (c.sLo == prev) && decide (stop ≤ c.sHi)
  | prev, stop, c1 :: c2 :: rest => (c1.sLo == prev) && checkSCellChain c1.sHi stop (c2 :: rest)

/-- Check all `s`-cells covering `s ∈ [0, 42]` and `σ ∈ [0, stop]` given pre-verified quad and
`AntiStein` banks. -/
def checkAntiCells (nodes : List (ℚ × ℚ)) (smax kap cap stop : ℚ)
    (quadBank : List QuadNode) (bankSums : List AntiNodeSummary) (cells : List AntiSCell) : Bool :=
  nodesOK nodes && quadBank.all (checkQuadNode nodes smax) && checkSCellChain 0 42 cells &&
    cells.all (checkAntiSCell nodes smax kap cap stop quadBank bankSums)

end Grothe.LowerAnalytic
