import Mathlib.Data.Rat.Defs
import Mathlib.Data.Nat.Choose.Basic

/-!
# Computable integer-Bernstein checker for the sharp cubic radius certificate

This lightweight module has no heavy analysis imports so that each of the 23 row certificate
modules (`Grothe/LowerAnalytic/RadiusRows/Row00.lean`..`Row22.lean`) can verify `checkRadiusRow`
via proof-producing kernel reduction (`decide +kernel`) with minimal startup overhead.

The analytic soundness theorem `radiusRow_sound` is proved in `Grothe/LowerAnalytic/RadiusCheck.lean`.
-/

namespace Grothe.LowerAnalytic

/-! ### Fixed dyadic scales and constants -/

/-- Scale `2^36` for the piecewise-linear knot arrays (`phi1, phi2, xi2, xi1, xia, th2, th4`). -/
def arrScale : Int := 68719476736

/-- Scale `2^50` for `mu`, `slope` and `sigma`. -/
def muScale : Int := 1125899906842624

/-- Scale `2^62` for `lam` and `l3`. -/
def lamScale : Int := 4611686018427387904

/-- Ratio `muScale / arrScale = 2^14`. -/
def rMA : Int := 16384

/-- Ratio `lamScale / muScale = 2^12`. -/
def rLM : Int := 4096

/-- Sixth-moment constant `C₆ = 4045313/100000` (definitionally equal to `Grothe.Lower.C6`). -/
def radiusC6 : ℚ := 4045313 / 100000

/-! ### Pure-integer univariate polynomial operations -/

def pAdd : List Int → List Int → List Int
  | [], q => q
  | p, [] => p
  | a :: p, b :: q => (a + b) :: pAdd p q

def pSub : List Int → List Int → List Int
  | [], q => q.map (- ·)
  | p, [] => p
  | a :: p, b :: q => (a - b) :: pSub p q

def pScale (c : Int) (p : List Int) : List Int :=
  p.map (c * ·)

def pMul : List Int → List Int → List Int
  | [], _ => []
  | a :: p, q => pAdd (pScale a q) (0 :: pMul p q)

def pShift : ℕ → List Int → List Int
  | 0, p => p
  | k + 1, p => 0 :: pShift k p

def pInSq : List Int → List Int
  | [] => []
  | [a] => [a]
  | a :: b :: p => a :: 0 :: pInSq (b :: p)

/-- Check that all coefficients past degree `d` vanish. -/
def pTrimOK (d : ℕ) (p : List Int) : Bool :=
  (p.drop (d + 1)).all (· == 0)

/-- Horner composition `p(a + w t)` truncated to degree `d`. -/
def pAffineAux (p : List Int) (a w : Int) : ℕ → List Int → List Int
  | 0, acc => acc
  | j + 1, acc => pAffineAux p a w j (pAdd (pMul acc [a, w]) [p.getD j 0])

def pAffine (p : List Int) (d : ℕ) (a w : Int) : List Int :=
  pAffineAux p a w (d + 1) []

/-! ### Exact integer Bernstein conversion and de Casteljau subdivision -/

/-- Binary subdivision tree for 1D Bernstein positivity checks. -/
inductive Cover1 where
  | leaf
  | split (l r : Cover1)
  deriving DecidableEq, Repr

/-- `lcm_{k ≤ d} C(d, k)`. -/
def lcmChoose (d : ℕ) : ℕ :=
  (List.range (d + 1)).foldl (fun acc j => Nat.lcm acc (d.choose j)) 1

/-- Scaled integer Bernstein coefficients of `p(a + w t)` on `t ∈ [0, 1]` (scale `lcmChoose d`). -/
def toBernSeg (p : List Int) (d : ℕ) (a w : Int) : List Int :=
  let q := pAffine p d a w
  let M := lcmChoose d
  (List.range (d + 1)).map fun m =>
    (List.range (m + 1)).foldl (fun acc k =>
      acc + q.getD k 0 * ((m.choose k * (M / d.choose k) : ℕ) : Int)) 0

/-- Scaled integer Bernstein coefficients of `(1 - t)^d p(a + w t / (1 - t))` on `t ∈ [0, 1)`. -/
def toBernRay (p : List Int) (d : ℕ) (a w : Int) : List Int :=
  let q := pAffine p d a w
  let M := lcmChoose d
  (List.range (d + 1)).map fun k =>
    q.getD k 0 * ((M / d.choose k : ℕ) : Int)

/-- One unscaled de Casteljau sum step `b_i ↦ b_i + b_{i+1}`. -/
def dcStep : List Int → List Int
  | x :: y :: rest => (x + y) :: dcStep (y :: rest)
  | _ => []

/-- Build left and right half Bernstein vectors (scaled by `2^d`) in one pass. -/
def dcSplitAux : ℕ → List Int → List Int → List Int × List Int
  | 0, [x], rAcc => ([x], x :: rAcc)
  | 0, _, rAcc => ([], rAcc)
  | k + 1, cur, rAcc =>
    let h := cur.headD 0
    let t := cur.getLastD 0
    let sh : Int := (2 : Int) ^ (k + 1)
    let (ls, rs) := dcSplitAux k (dcStep cur) ((t * sh) :: rAcc)
    ((h * sh) :: ls, rs)

def dcSplit (b : List Int) : List Int × List Int :=
  match b with
  | [] => ([], [])
  | _ :: _ => dcSplitAux (b.length - 1) b []

/-- Verify that every leaf of `cov` has all nonnegative Bernstein coefficients. -/
def bernCoverOK : Cover1 → List Int → Bool
  | .leaf, b => b.all (fun x => decide (0 ≤ x))
  | .split l r, b =>
    let (bl, br) := dcSplit b
    bernCoverOK l bl && bernCoverOK r br

/-- Verify `0 ≤ evalInt p R` on `R ∈ [a, b]`. -/
def segOK (d a b : ℕ) (cov : Cover1) (p : List Int) : Bool :=
  pTrimOK d p && bernCoverOK cov (toBernSeg p d (a : Int) ((b : Int) - (a : Int)))

/-- Verify `0 ≤ evalInt p R` on `R ∈ [a, ∞)` via `R = a + 10 t / (1 - t)`. -/
def rayOK (d a : ℕ) (cov : Cover1) (p : List Int) : Bool :=
  pTrimOK d p && bernCoverOK cov (toBernRay p d (a : Int) 10)

/-! ### Row certificate data structure -/

/-- The twelve valid linear cuts on the five Gram contraction scalars `(n, h, b, y, z)`. -/
inductive CutKind where
  | n | h | b | y | z | bn | yz | h0 | m | c1 | c2p | c2m
  deriving DecidableEq, Repr

/-- One dual cut term `(kind, theta, weight)` in an endpoint certificate. -/
structure CutTerm where
  kind : CutKind
  theta : ℚ
  weight : ℚ
  deriving DecidableEq, Repr

/-- Dual certificate at a positive endpoint `s > 0`. -/
structure EndPar where
  alphaA : ℚ
  alphaB : ℚ
  sqrtUb : ℚ
  eta : ℚ
  cuts : List CutTerm
  deriving DecidableEq, Repr

/-- One row of the sharp cubic radius certificate (`cert_N_final`).
Knots are stored as `K_i : ℕ` representing `e_i = K_i / 10`; knot arrays are scaled by
`arrScale = 2^36`; `mu`, `slope`, `sigma` by `muScale = 2^50`; `lam`, `l3` by `lamScale = 2^62`. -/
structure RadiusRow where
  sLo : ℚ
  sHi : ℚ
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
  sigma : Int
  parLo : Option EndPar
  parHi : EndPar
  covers : List Cover1

/-! ### `(C1)` and `(C2)`: Cone check and piecewise polynomial check -/

/-- Pointwise dual-cone membership `(xi2, xi1, xia) ∈ C*`. -/
def coneAtOK (xi2 xi1 xia : Int) : Bool :=
  decide (0 ≤ xi2) && decide (0 ≤ xi1) && decide (xia * xia ≤ 4 * xi1 * xi2)

/-- Integer polynomial `W_den * Fv(w / 100)` in `w = R² = 100 v` on a single cell. -/
def pieceFvW (r : RadiusRow) (mAll m1 m2 m3 m4 m5 : Int) (tail : Bool) (k0 k1 : ℕ)
    (p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2 : Int) : List Int :=
  let U0 : Int := (k0 : Int) * (k0 : Int)
  let U1 : Int := if tail then U0 else (k1 : Int) * (k1 : Int)
  let du : Int := if tail then 1 else U1 - U0
  let mkP (a0 a1 : Int) : List Int := if tail then [a0] else [a0 * U1 - a1 * U0, a1 - a0]
  let ph1 := pAdd (pScale (100 * rMA) (mkP p1a p1b)) [0, r.slope1 * du]
  let ph2 := pAdd (pScale (100 * rMA) (mkP p2a p2b)) [0, r.slope2 * du]
  let mkG (g : Int) (ph : List Int) : List Int :=
    let c0 := ph.getD 0 0
    let c1 := ph.getD 1 0
    [du * g - 2 * c0 * U0 - c1 * U0 * U0, 2 * c0, c1]
  let G1 := mkG g1 ph1
  let G2 := mkG g2 ph2
  let T2 := pScale (200 * rMA) (mkP t2a t2b)
  let T4 := pScale (200 * rMA) (mkP t4a t4b)
  let T3 := pSub (pSub (pAdd (pScale (200 * rMA) (mkP x1a x1b)) ph2) T2) T4
  let T1 := pSub (pAdd (pAdd (pScale (200 * rMA) (mkP x2a x2b)) (pScale 2 ph1)) T2) T3
  let T5 := pSub
    (pAdd
      (pSub (pAdd (pShift 1 (pScale (400 * rMA) (mkP xaa xab))) (pShift 1 (pScale 4 ph1)))
        (pScale 2 G1))
      (pSub (pShift 1 (pScale 2 ph2)) G2))
    [0, 0, 4 * du * r.sigma]
  let du2M := du * du * mAll
  let L3 := r.l3s + r.l3a + r.l3b
  let lamW := [1000000 * r.lam0 * du2M, 10000 * r.lam1 * du2M, 100 * r.lam2 * du2M, L3 * du2M]
  let GW := pScale (50 * rLM * du * mAll) (pAdd G1 G2)
  let linC := pAdd (pAdd T1 T2) (pAdd (pScale 3 T3) (pScale 2 T4))
  let linW := pScale (5000 * rLM * du * mAll) linC
  let sqW := pAdd
    (pAdd (pScale (25600 * m1) (pMul T1 T1)) (pScale (25600 * m2) (pMul T2 T2)))
    (pAdd (pScale (25600 * m3) (pMul T3 T3)) (pScale (25600 * m4) (pMul T4 T4)))
  let brW := pSub (pSub (pAdd lamW GW) linW) sqW
  pSub (pShift 2 brW) (pScale (6400 * m5) (pMul T5 T5))

/-- Verify one cell (first segment, interior segment, or infinite tail). -/
def checkOneCell (r : RadiusRow) (mAll m1 m2 m3 m4 m5 : Int) (first tail : Bool) (k0 k1 : ℕ)
    (p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2 : Int)
    (cov : Cover1) : Bool :=
  let U0 : Int := (k0 : Int) * (k0 : Int)
  let du : Int := if tail then 1 else (k1 : Int) * (k1 : Int) - U0
  let du2M := du * du * mAll
  let FvW := pieceFvW r mAll m1 m2 m3 m4 m5 tail k0 k1
    p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2
  if first then
    (FvW.getD 0 0 == 0) && (FvW.getD 1 0 == 0) &&
      segOK 6 k0 k1 cov (pSub (pInSq (FvW.drop 2)) [0, 100000 * lamScale * du2M])
  else
    let pr := pSub (pInSq FvW) [0, 0, 0, 0, 0, 100000 * lamScale * du2M]
    if tail then rayOK 10 k0 cov pr else segOK 10 k0 k1 cov pr

/-- Lockstep traversal of all knots, verifying strict monotonicity, `(C1)` at every knot,
and `(C2)` on every segment and the tail. -/
def checkPiecesAux (r : RadiusRow) (mAll m1 m2 m3 m4 m5 : Int) :
    Bool → Int → Int → List ℕ → List Int → List Int → List Int → List Int → List Int →
    List Int → List Int → List Cover1 → Bool
  | first, g1, g2, [kK], [p1], [p2], [x2], [x1], [xa], [t2], [t4], [cov] =>
    !first && coneAtOK x2 x1 xa &&
      checkOneCell r mAll m1 m2 m3 m4 m5 false true kK kK
        p1 p1 p2 p2 x2 x2 x1 x1 xa xa t2 t2 t4 t4 g1 g2 cov
  | first, g1, g2, k0 :: k1 :: ks, p1a :: p1b :: p1s, p2a :: p2b :: p2s,
      x2a :: x2b :: x2s, x1a :: x1b :: x1s, xaa :: xab :: xas,
      t2a :: t2b :: t2s, t4a :: t4b :: t4s, cov :: covs =>
    decide (k0 < k1) && coneAtOK x2a x1a xaa &&
      checkOneCell r mAll m1 m2 m3 m4 m5 first false k0 k1
        p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2 cov &&
      let U0 : Int := (k0 : Int) * (k0 : Int)
      let U1 : Int := (k1 : Int) * (k1 : Int)
      let du : Int := U1 - U0
      let g1' := g1 + 100 * rMA * (p1a + p1b) * du + r.slope1 * (U1 * U1 - U0 * U0)
      let g2' := g2 + 100 * rMA * (p2a + p2b) * du + r.slope2 * (U1 * U1 - U0 * U0)
      checkPiecesAux r mAll m1 m2 m3 m4 m5 false g1' g2'
        (k1 :: ks) (p1b :: p1s) (p2b :: p2s) (x2b :: x2s) (x1b :: x1s)
        (xab :: xas) (t2b :: t2s) (t4b :: t4s) covs
  | _, _, _, _, _, _, _, _, _, _, _, _ => false

/-- Verify parameter signs, `knots[0] = 0`, `(C1)` and `(C2)` across all pieces. -/
def checkPieces (r : RadiusRow) : Bool :=
  let signOK := decide (0 < r.mu1) && decide (0 < r.mu2) && decide (0 < r.mu3) &&
    decide (0 < r.mu4) && decide (0 < r.mu5) &&
    decide (0 ≤ r.l3s) && decide (0 ≤ r.l3a) && decide (0 ≤ r.l3b) &&
    decide (0 < r.l3s + r.l3a + r.l3b)
  let m1 := r.mu2 * r.mu3 * r.mu4 * r.mu5
  let m2 := r.mu1 * r.mu3 * r.mu4 * r.mu5
  let m3 := r.mu1 * r.mu2 * r.mu4 * r.mu5
  let m4 := r.mu1 * r.mu2 * r.mu3 * r.mu5
  let m5 := r.mu1 * r.mu2 * r.mu3 * r.mu4
  let mAll := r.mu1 * m1
  match r.knots with
  | 0 :: _ =>
    signOK && checkPiecesAux r mAll m1 m2 m3 m4 m5 true 0 0
      r.knots r.phi1 r.phi2 r.xi2 r.xi1 r.xia r.th2 r.th4 r.covers
  | _ => false

/-! ### `(C3)`: Linear forms in `(n, h, b, y, z)` and endpoint weak-duality check -/

/-- A linear form `c₁ n + c₂ h + c₃ b + c₄ y + c₅ z`. -/
structure Lin5 where
  cn : ℚ
  ch : ℚ
  cb : ℚ
  cy : ℚ
  cz : ℚ
  deriving DecidableEq, Repr

def Lin5.add (u v : Lin5) : Lin5 :=
  ⟨u.cn + v.cn, u.ch + v.ch, u.cb + v.cb, u.cy + v.cy, u.cz + v.cz⟩

def Lin5.sub (u v : Lin5) : Lin5 :=
  ⟨u.cn - v.cn, u.ch - v.ch, u.cb - v.cb, u.cy - v.cy, u.cz - v.cz⟩

def Lin5.smul (k : ℚ) (u : Lin5) : Lin5 :=
  ⟨k * u.cn, k * u.ch, k * u.cb, k * u.cy, k * u.cz⟩

def sForm : Lin5 := ⟨32, 8, 32, 96, 0⟩
def s0Form : Lin5 := ⟨8, 2, 8, 0, 8⟩
def h0Form : Lin5 := ⟨8 / 3, 2 / 3, 8 / 3, 24, -16 / 3⟩
def mForm : Lin5 := ⟨1, 0, 1, 3, -1⟩
def tForm : Lin5 := ⟨0, 0, 0, 3, -1⟩

/-- The valid cut linear form corresponding to `(kind, theta)`. -/
def cutLin5 (kind : CutKind) (theta : ℚ) : Lin5 :=
  match kind with
  | .n => ⟨1, 0, 0, 0, 0⟩
  | .h => ⟨0, 1, 0, 0, 0⟩
  | .b => ⟨0, 0, 1, 0, 0⟩
  | .y => ⟨0, 0, 0, 1, 0⟩
  | .z => ⟨0, 0, 0, 0, 1⟩
  | .bn => ⟨1, 0, -1, 0, 0⟩
  | .yz => ⟨0, 0, 0, -1, 1⟩
  | .h0 => h0Form
  | .m => mForm
  | .c1 => ⟨theta, 1 / theta, 0, 0, -2⟩
  | .c2p => Lin5.sub (Lin5.add ⟨0, theta, 0, 0, 0⟩ (Lin5.smul (1 / theta) mForm))
      (Lin5.smul 2 tForm)
  | .c2m => Lin5.add (Lin5.add ⟨0, theta, 0, 0, 0⟩ (Lin5.smul (1 / theta) mForm))
      (Lin5.smul 2 tForm)

def cutTermOK (c : CutTerm) : Bool :=
  decide (0 ≤ c.weight) &&
    match c.kind with
    | .c1 | .c2p | .c2m => decide (0 < c.theta)
    | _ => true

def posPartQ (x : ℚ) : ℚ := if 0 ≤ x then x else 0

/-- Linear budget form `d_lin` of the five variances and `sigma * E[V ρ]`. -/
def rowDLin (r : RadiusRow) : Lin5 :=
  let sM : ℚ := (muScale : ℚ)
  let m1 : ℚ := (r.mu1 : ℚ) / sM
  let m2 : ℚ := (r.mu2 : ℚ) / sM
  let m3 : ℚ := (r.mu3 : ℚ) / sM
  let m4 : ℚ := (r.mu4 : ℚ) / sM
  let m5 : ℚ := (r.mu5 : ℚ) / sM
  let sig : ℚ := (r.sigma : ℚ) / sM
  ⟨16 * m1 + 16 * m2 + 80 * m3 + 32 * m4,
   4 * m1 + 20 * m2 + 20 * m3 + 16 * m4,
   16 * m2 + 16 * m3 + 16 * m4 + 32 * m5 + 32 * sig,
   96 * m3 + 48 * m4 + 24 * m5 + 48 * sig,
   32 * m3 + 16 * m4⟩

/-- Joint sixth-moment linear form `d_J(α_a, α_b)`. -/
def rowDJ (r : RadiusRow) (alA alB : ℚ) : Lin5 :=
  let sL : ℚ := (lamScale : ℚ)
  let la : ℚ := (r.l3a : ℚ) / sL
  let lb : ℚ := (r.l3b : ℚ) / sL
  Lin5.add
    (Lin5.smul la (Lin5.add (Lin5.smul (150 * alA) s0Form)
      (Lin5.smul (198 + 150 / alA) h0Form)))
    (Lin5.smul lb (Lin5.add (Lin5.smul (135 / 2 * alB) s0Form)
      (Lin5.smul (11781 / 32 + 135 / (2 * alB)) h0Form)))

/-- Endpoint bound check `(C3)` at `s` against `target`. -/
def checkEndpoint (r : RadiusRow) (s : ℚ) (par? : Option EndPar) (target : ℚ) : Bool :=
  let sL : ℚ := (lamScale : ℚ)
  let l0 : ℚ := (r.lam0 : ℚ) / sL
  let l1 : ℚ := (r.lam1 : ℚ) / sL
  let l2 : ℚ := (r.lam2 : ℚ) / sL
  let l3s : ℚ := (r.l3s : ℚ) / sL
  let l3a : ℚ := (r.l3a : ℚ) / sL
  let l3b : ℚ := (r.l3b : ℚ) / sL
  if s == 0 then
    decide (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b) < target)
  else if decide (0 < s) then
    match par? with
    | none => false
    | some pd =>
      decide (0 < pd.alphaA) && decide (0 < pd.alphaB) &&
        decide (0 < pd.sqrtUb) && decide (s ≤ pd.sqrtUb * pd.sqrtUb) &&
        pd.cuts.all cutTermOK &&
        let obj := Lin5.add (rowDLin r) (Lin5.smul pd.sqrtUb (rowDJ r pd.alphaA pd.alphaB))
        let resid0 := Lin5.sub obj (Lin5.smul pd.eta sForm)
        let resid := pd.cuts.foldl
          (fun acc c => Lin5.add acc (Lin5.smul c.weight (cutLin5 c.kind c.theta))) resid0
        let L := pd.eta + posPartQ resid.cn * (1 / 32) + posPartQ resid.ch * (1 / 8)
          + posPartQ resid.cb * (1 / 32) + posPartQ resid.cy * (1 / 96)
          + posPartQ resid.cz * (3 / 64)
        let bound := l0 + l1 + l2 * (2 + s)
          + l3s * (6 + 9 * s + radiusC6 * s * pd.sqrtUb)
          + (l3a + l3b) * (6 + 9 * s) + s * L
        decide (bound < target)
  else
    false

/-- Complete row check: interval validity, `(C1)`, `(C2)`, and `(C3)` at both endpoints. -/
def checkRadiusRow (r : RadiusRow) (target : ℚ) : Bool :=
  decide (0 ≤ r.sLo) && decide (r.sLo < r.sHi) &&
    checkPieces r &&
    checkEndpoint r r.sLo r.parLo target &&
    checkEndpoint r r.sHi (some r.parHi) target

end Grothe.LowerAnalytic
