import Grothe.Upper.Kernel.Table

set_option warningAsError true

/-!
# Mathlib-free Fejér–Riesz SOS, 1024-bit Laguerre table, and Hermite overlap kernels

Pure `Init` + `Grothe.Upper.Kernel.Table` module (precompiled to native C):
1. Compact 5-char base-64 ASCII decoder for `36 × 64 × 64` integer Fourier tables;
2. Exact integer Fejér–Riesz Sum-of-Squares unit-disk checker `sosAllOK` (`SH = 24`, `CAP = 2⁴⁸`);
3. Square-root-free, `π`-free, `Γ`-free 1024-bit integer-interval Laguerre cell integral table
   `lagTable1024` (`s_i = 9 i² / 1024`, `i ≤ 64`, `a ≤ 18`, `n ≤ 250`);
4. Shared midpoint-radius mode-overlap evaluator `modeOverlapsAt`, feeding both:
   * `computeTigMu` / `tigMuCheck` (`251` radial moments for `f_tig`), and
   * `computeSmoothedRows` / `smoothedRowsCheck` (`headIdx 501` bivariate energy table `List RowI`
     for the smoothed `64 × 64 × 36` cell rounding map, with zero square roots).

Agent-ID: gemini-21d5
-/

namespace Grothe.Upper.Kernel.Cell

@[inline] def decByte64 (b : UInt8) : Nat :=
  let r := b.toNat
  if r > 92 then r - 49 else r - 48

/-- Decode one signed 26-bit integer `x ∈ [-2²⁵, 2²⁵)` from 5 safe ASCII chars. -/
@[inline] def decodeInt26 (ba : ByteArray) (off : Nat) : Int :=
  let b0 := decByte64 (ba.get! off)
  let b1 := decByte64 (ba.get! (off + 1))
  let b2 := decByte64 (ba.get! (off + 2))
  let b3 := decByte64 (ba.get! (off + 3))
  let b4 := decByte64 (ba.get! (off + 4))
  let u := b0 + (b1 <<< 6) + (b2 <<< 12) + (b3 <<< 18) + (b4 <<< 24)
  (Int.ofNat u) - 33554432

/-- Decode one `64 × 64 = 4096` cell slice from a 20480-byte ASCII string. -/
def decodeSlice4096 (s : String) : Array Int :=
  let ba := s.toUTF8
  Array.ofFn fun (idx : Fin 4096) => decodeInt26 ba (5 * idx.val)

/-- Decode all 36 Fourier mode slices (`147,456` signed integers). -/
def decodeTable36 (ss : List String) : Array Int :=
  ss.foldl (fun acc s => acc ++ decodeSlice4096 s) (Array.mkEmpty (36 * 4096))

/-- Read entry `(k, cell)` (`k < 36`, `cell = 64 * i + j < 4096`). -/
@[inline] def getCoeff (arr : Array Int) (k cell : Nat) : Int :=
  arr.getD (k * 4096 + cell) 0

/-- Structural sum `∑_{k=0}^{n-1} f k` for transparent induction proofs. -/
def sumInt : Nat → (Nat → Int) → Int
  | 0, _ => 0
  | n + 1, f => sumInt n f + f n

/-- Max `|f k|` over `k < n`. -/
def maxAbsInt : Nat → (Nat → Int) → Int
  | 0, _ => 0
  | n + 1, f => max (maxAbsInt n f) (Int.ofNat (f n).natAbs)

/-- Zero-skipping integer product (`= g * b`, avoids GMP calls on zero entries in banded sums). -/
@[inline] def mulSkipZero (g b : Int) : Int :=
  if g == 0 then 0 else g * b

/-! ### 1. Exact Fejér–Riesz Sum-of-Squares unit-disk check (`SH = 24`, `CAP = 2⁴⁸`) -/

def sosCap : Int := (2 : Int) ^ 48

def sosCellTot (creArr cimArr qreArr qimArr : Array Int) (cell : Nat) : Int :=
  let cr := fun k => getCoeff creArr k cell
  let ci := fun k => getCoeff cimArr k cell
  let qr := fun k => getCoeff qreArr k cell
  let qi := fun k => getCoeff qimArr k cell
  let e0 := sumInt 36 fun k =>
    cr k * cr k + ci k * ci k + qr k * qr k + qi k * qi k
  let tail := sumInt 35 fun m0 =>
    let m := m0 + 1
    let re_m := sumInt (36 - m) fun d =>
      cr (d + m) * cr d + ci (d + m) * ci d + qr (d + m) * qr d + qi (d + m) * qi d
    let im_m := sumInt (36 - m) fun d =>
      ci (d + m) * cr d - cr (d + m) * ci d + qi (d + m) * qr d - qr (d + m) * qi d
    2 * (Int.ofNat re_m.natAbs + Int.ofNat im_m.natAbs)
  e0 + tail

def sosAllOK (creArr cimArr qreArr qimArr : Array Int) : Bool :=
  (List.range 4096).all fun cell =>
    decide (sosCellTot creArr cimArr qreArr qimArr cell ≤ sosCap)

/-! ### 2. 1024-bit integer-interval Laguerre cell integrals (`s_i = 9 i² / 1024`) -/

def kLag : Nat := 1024
def dLag : Int := (2 : Int) ^ 1024

@[inline] def ivAddL (a b : Int × Int) : Int × Int := (a.1 + b.1, a.2 + b.2)
@[inline] def ivSubL (a b : Int × Int) : Int × Int := (a.1 - b.2, a.2 - b.1)
@[inline] def ivMulIntL (a : Int × Int) (c : Int) : Int × Int :=
  if 0 ≤ c then (a.1 * c, a.2 * c) else (a.2 * c, a.1 * c)
@[inline] def ivDivPosL (a : Int × Int) (d : Int) : Int × Int :=
  (a.1 / d, -((-a.2) / d))

/-- Shift interval `iv` down by `sh > 0` and extract `(width ≤ 2, midpoint)`. -/
@[inline] def toMid (iv : Int × Int) (sh : Int) : Bool × Int :=
  let bp := ivDivPosL iv sh
  (decide (bp.2 - bp.1 ≤ 2), (bp.1 + bp.2) / 2)

/-- Taylor loop `k = 1 .. mMax` accumulating `∑_{k=0}^{mMax} s^k / k!` at scale `dLag`. -/
def expPosLoop (sNum : Int) : Nat → Nat → (Int × Int) → (Int × Int) → (Int × Int) × (Int × Int)
  | 0, _, term, acc => (term, acc)
  | rem + 1, k, term, acc =>
    let den := Int.ofNat (1024 * k)
    let term' := ivDivPosL (term.1 * sNum, term.2 * sNum) den
    expPosLoop sNum rem (k + 1) term' (ivAddL acc term')

/-- Rigorous 1024-bit interval enclosure of `exp(-9 i² / 1024)` for `i ≤ 64`. -/
def expNegS (i : Nat) : Int × Int :=
  if i == 0 then (dLag, dLag)
  else
    let sNum := Int.ofNat (9 * i * i)
    let (termLast, acc) := expPosLoop sNum 480 1 (dLag, dLag) (dLag, dLag)
    let remHi := 2 * (-((-termLast.2 * sNum) / Int.ofNat (1024 * 481)))
    let accHi := acc.2 + remHi
    ((dLag * dLag) / accHi, -((-(dLag * dLag)) / acc.1))

def expNegSArr : Array (Int × Int) :=
  Array.ofFn fun (i : Fin 65) => expNegS i.val

/-- Lower incomplete gamma series loop `k = 1 .. 480` for `(F0[i], bdy0[i])`. -/
def gamSeriesLoop (sNum9 : Int) (a : Nat) :
    Nat → Nat → (Int × Int) → (Int × Int) → (Int × Int) × (Int × Int)
  | 0, _, t, s => (t, s)
  | rem + 1, k, t, s =>
    let den := Int.ofNat (512 * (a + 2 + 2 * k))
    let t' := ivDivPosL (t.1 * sNum9, t.2 * sNum9) den
    gamSeriesLoop sNum9 a rem (k + 1) t' (ivAddL s t')

/-- Compute `(F0[i], bdy0[i])` at `s_i = 9 i² / 1024`, `r_i = 3 i / 32`. -/
def f0AndBdy0 (expArr : Array (Int × Int)) (a i : Nat) : (Int × Int) × (Int × Int) :=
  if i == 0 then ((0, 0), (0, 0))
  else
    let rPowNum := Int.ofNat ((3 * i) ^ (a + 2))
    let rPowDen := (2 : Int) ^ (5 * (a + 2))
    let e := expArr.getD i (0, 0)
    let pref := ivDivPosL (e.1 * rPowNum, e.2 * rPowNum) rPowDen
    let t0 := ivDivPosL (pref.1 * 2, pref.2 * 2) (Int.ofNat (a + 2))
    let sNum9 := Int.ofNat (9 * i * i)
    let (tLast, sAcc) := gamSeriesLoop sNum9 a 480 1 t0 t0
    let rem := 2 * (-((-tLast.2 * sNum9) / Int.ofNat (512 * (a + 2 + 2 * 481))))
    ((sAcc.1, sAcc.2 + rem), pref)

/-- Step `n → n + 1` of the Laguerre cell integral and boundary recurrences (`n = 0 .. nMax - 1`). -/
def lagRecLoop (a : Nat) :
    Nat → Nat → Array (Int × Int) → Array (Int × Int) → Array (Int × Int) →
    Array (Array (Int × Int)) → Array (Array (Int × Int))
  | 0, _, _, _, _, acc => acc
  | rem + 1, n, jc, bdym1, bdy0, acc =>
    let jn : Array (Int × Int) := Array.ofFn fun (idx : Fin 64) =>
      let i := idx.val
      let t1 := ivMulIntL (jc.getD i (0, 0)) (-(Int.ofNat (2 * n + a)))
      let t2 := ivMulIntL (ivSubL (bdy0.getD (i + 1) (0, 0)) (bdy0.getD i (0, 0))) (-2)
      ivDivPosL (ivAddL t1 t2) (Int.ofNat (2 * (n + 1)))
    let bdyNext : Array (Int × Int) := Array.ofFn fun (idx : Fin 65) =>
      let i := idx.val
      if i == 0 then (0, 0)
      else
        let numS : Int := Int.ofNat (9 * i * i) - Int.ofNat (1024 * (2 * n + 1 + a))
        let p1 := ivDivPosL (ivMulIntL (bdy0.getD i (0, 0)) numS) 1024
        let p2 := ivMulIntL (bdym1.getD i (0, 0)) (-(Int.ofNat (n + a)))
        ivDivPosL (ivAddL p1 p2) (Int.ofNat (n + 1))
    lagRecLoop a rem (n + 1) jn bdy0 bdyNext (acc.push jn)

/-- Full 1024-bit Laguerre cell table `I_tilde[a][n][i]` for `a ∈ 0..18`, `n ∈ 0..250`, `i ∈ 0..63`. -/
def lagTable1024 : Array (Array (Array (Int × Int))) :=
  let expArr := expNegSArr
  Array.ofFn fun (aIdx : Fin 19) =>
    let a := aIdx.val
    let fb := Array.ofFn fun (iIdx : Fin 65) => f0AndBdy0 expArr a iIdx.val
    let j0 := Array.ofFn fun (iIdx : Fin 64) =>
      ivSubL (fb.getD (iIdx.val + 1) ((0, 0), (0, 0))).1 (fb.getD iIdx.val ((0, 0), (0, 0))).1
    let bdy0 := Array.ofFn fun (iIdx : Fin 65) => (fb.getD iIdx.val ((0, 0), (0, 0))).2
    let bdym1 := Array.replicate 65 (0, 0)
    lagRecLoop a 250 0 j0 bdym1 bdy0 #[j0]

/-! ### 3. Combinatorial & `bCoeff` tables and shared `modeOverlapsAt` -/

/-- Rising factorial `∏_{r=1}^a (n + r) = (n + a)! / n!`. -/
def risingFact (n : Nat) : Nat → Nat
  | 0 => 1
  | r + 1 => risingFact n r * (n + r + 1)

/-- Square an integer interval `[lo, hi]`. -/
@[inline] def sqIntIval (lo hi : Int) : Int × Int :=
  let sLo := if 0 ≤ lo then lo * lo else if hi ≤ 0 then hi * hi else 0
  let sHi := max (lo * lo) (hi * hi)
  (sLo, sHi)

/-- Structural interval sum `∑_{k=0}^{n-1} f k`. -/
def sumIval : Nat → (Nat → Ival) → Ival
  | 0, _ => zeroI
  | n + 1, f => addI (sumIval n f) (f n)

/-- Next row of Pascal's triangle (`prev` has length `d`, output has length `d + 1`). -/
def binomNextRow (prev : Array Nat) : Array Nat :=
  let d := prev.size
  Array.ofFn fun (j : Fin (d + 1)) =>
    if j.val == 0 then 1
    else if j.val == d then 1
    else prev.getD (j.val - 1) 0 + prev.getD j.val 0

def binomRowsLoop : Nat → Array Nat → Array (Array Nat) → Array (Array Nat)
  | 0, _, acc => acc
  | rem + 1, cur, acc =>
    let nxt := binomNextRow cur
    binomRowsLoop rem nxt (acc.push nxt)

/-- Exact binomial table `binomArr251[n][k] = n.choose k` for `0 ≤ k ≤ n ≤ 251`. -/
def binomArr251 : Array (Array Nat) :=
  binomRowsLoop 251 #[1] #[#[1]]

@[inline] def getBinom (tbl : Array (Array Nat)) (n k : Nat) : Nat :=
  (tbl.getD n #[]).getD k 0

/-- Shared midpoint-radius evaluator for `modeOverlap(idxM, n1, n2)`:
divides `lagTable1024` by `shLag` and divides the `(creArr, cimArr)` bilinear product by `shDot`. -/
def modeOverlapsAt (shLag shDot : Int) (creArr cimArr : Array Int)
    (tbl : Array (Array (Array (Int × Int)))) :
    Bool × Array (Array (Array ((Int × Int) × (Int × Int)))) :=
  let mAndOk : Array (Array (Bool × Array Int × Int)) :=
    Array.ofFn fun (aIdx : Fin 19) =>
      let ta := tbl.getD aIdx.val #[]
      Array.ofFn fun (nIdx : Fin 251) =>
        let row := ta.getD nIdx.val #[]
        let mRow : Array (Bool × Int) := Array.ofFn fun (iIdx : Fin 64) =>
          toMid (row.getD iIdx.val (0, 0)) shLag
        let okRow := (List.range 64).all fun i => (mRow.getD i (false, 0)).1
        let ints := Array.ofFn fun (iIdx : Fin 64) => (mRow.getD iIdx.val (false, 0)).2
        let sAbs := sumInt 64 fun i => Int.ofNat (ints.getD i 0).natAbs
        (okRow, ints, sAbs)
  let widthOK := (List.range 19).all fun a =>
    (List.range 251).all fun n => ((mAndOk.getD a #[]).getD n (false, #[], 0)).1
  let out : Array (Array (Array ((Int × Int) × (Int × Int)))) :=
    Array.ofFn fun (mIdx : Fin 36) =>
      let idxM := mIdx.val
      let mSigned : Int := Int.ofNat idxM - 17
      let a := mSigned.natAbs
      let b := (1 - mSigned).natAbs
      let k0 := (a + b - 1) / 2
      let nr := 250 - k0
      let maRows := mAndOk.getD a #[]
      let mbRows := mAndOk.getD b #[]
      let gRe : Array (Array Int) := Array.ofFn fun (n1Idx : Fin (nr + 1)) =>
        let ma := (maRows.getD n1Idx.val (false, #[], 0)).2.1
        Array.ofFn fun (jIdx : Fin 64) =>
          let j := jIdx.val
          sumInt 64 fun i => ma.getD i 0 * getCoeff creArr idxM (64 * i + j)
      let gIm : Array (Array Int) := Array.ofFn fun (n1Idx : Fin (nr + 1)) =>
        let ma := (maRows.getD n1Idx.val (false, #[], 0)).2.1
        Array.ofFn fun (jIdx : Fin 64) =>
          let j := jIdx.val
          sumInt 64 fun i => ma.getD i 0 * getCoeff cimArr idxM (64 * i + j)
      let sumCre := sumInt 4096 fun cell => Int.ofNat (getCoeff creArr idxM cell).natAbs
      let sumCim := sumInt 4096 fun cell => Int.ofNat (getCoeff cimArr idxM cell).natAbs
      let maxCre := maxAbsInt 4096 fun cell => getCoeff creArr idxM cell
      let maxCim := maxAbsInt 4096 fun cell => getCoeff cimArr idxM cell
      Array.ofFn fun (n1Idx : Fin (nr + 1)) =>
        let n1 := n1Idx.val
        let sma := (maRows.getD n1 (false, #[], 0)).2.2
        let grRow := gRe.getD n1 #[]
        let giRow := gIm.getD n1 #[]
        Array.ofFn fun (n2Idx : Fin (nr + 1 - n1)) =>
          let n2 := n2Idx.val
          let smb := (mbRows.getD n2 (false, #[], 0)).2.2
          let mb := (mbRows.getD n2 (false, #[], 0)).2.1
          let pre := sumInt 64 fun j => grRow.getD j 0 * mb.getD j 0
          let pim := sumInt 64 fun j => giRow.getD j 0 * mb.getD j 0
          let errRe := maxCre * (64 * sma + 64 * smb) + sumCre
          let errIm := maxCim * (64 * sma + 64 * smb) + sumCim
          (ivDivPosL (pre - errRe, pre + errRe) shDot,
           ivDivPosL (pim - errIm, pim + errIm) shDot)
  (widthOK, out)

/-! ### 4. 192-bit `computeTigMu` & `tigMuCheck` for `f_tig` -/

def sh832 : Int := (2 : Int) ^ 832
def sh216 : Int := (2 : Int) ^ 216
def sh256 : Int := (2 : Int) ^ 256

def computeTigMu (creArr cimArr : Array Int) : Bool × List Ival :=
  let (widthOK, ov) := modeOverlapsAt sh832 sh216 creArr cimArr lagTable1024
  let muList := List.ofFn fun (kkIdx : Fin 251) =>
    let kk := kkIdx.val
    sumIval 36 fun idxM =>
      let mSigned : Int := Int.ofNat idxM - 17
      let a := mSigned.natAbs
      let b := (1 - mSigned).natAbs
      let k0 := (a + b - 1) / 2
      let evenM : Bool := decide (mSigned % 2 == 0)
      if kk < k0 then zeroI
      else
        let mArr := ov.getD idxM #[]
        sumIval (kk - k0 + 1) fun n1 =>
          let n2 := kk - k0 - n1
          let (reIv, imIv) := (mArr.getD n1 #[]).getD n2 ((0, 0), (0, 0))
          let sr := sqIntIval reIv.1 reIv.2
          let si := sqIntIval imIv.1 imIv.2
          let na := Int.ofNat (risingFact n1 a)
          let nb := Int.ofNat (risingFact n2 b)
          let vIv := ivDivPosL (sr.1 + si.1, sr.2 + si.2) (sh256 * na * nb)
          if evenM then ⟨vIv.1, vIv.2⟩ else ⟨-vIv.2, -vIv.1⟩
  (widthOK, muList)

def tigMuCheck (creArr cimArr : Array Int) (expected : List Ival) : Bool :=
  let res := computeTigMu creArr cimArr
  res.1 && ivalListEq res.2 expected

theorem tigMuCheck_iff (creArr cimArr : Array Int) (expected : List Ival) :
    tigMuCheck creArr cimArr expected = true ↔ computeTigMu creArr cimArr = (true, expected) := by
  unfold tigMuCheck
  cases computeTigMu creArr cimArr with
  | mk b l =>
    simp only [Bool.and_eq_true, ivalListEq_iff, Prod.mk.injEq]

/-! ### 5. Square-root-free `computeSmoothedRows` & `smoothedRowsCheck` for `smoothMap` -/

def sh48 : Int := (2 : Int) ^ 48
def sh416 : Int := (2 : Int) ^ 416
def sh448 : Int := (2 : Int) ^ 448
def sh512 : Int := (2 : Int) ^ 512
def sh624 : Int := (2 : Int) ^ 624
def sh680 : Int := (2 : Int) ^ 680

/-- One recurrence step `(c0N * prev[j-1] + c1N * prev[j]) / denM` for `bCoeff` at scale `dLag`. -/
def bStepRow (c0N c1N denM : Int) (prev : Array (Int × Int)) : Array (Int × Int) :=
  let d := prev.size - 1
  Array.ofFn fun (jIdx : Fin (d + 2)) =>
    let j := jIdx.val
    let t0 := if j == 0 then (0, 0) else ivMulIntL (prev.getD (j - 1) (0, 0)) c0N
    let t1 := if d < j then (0, 0) else ivMulIntL (prev.getD j (0, 0)) c1N
    ivDivPosL (ivAddL t0 t1) denM

def bRowsLoop (c0N c1N denM : Int) :
    Nat → Array (Int × Int) → Array (Array (Int × Int)) → Array (Array (Int × Int))
  | 0, _, acc => acc
  | rem + 1, cur, acc =>
    let nxt := bStepRow c0N c1N denM cur
    bRowsLoop c0N c1N denM rem nxt (acc.push nxt)

/-- 1024-bit enclosure table `bTable1024[b][a][j]` for `bCoeff (u0N/denM) (u1N/denM) (v0N/denM) (v1N/denM) a b j`
covering `b ≤ 167`, `a ≤ 251 - b`, `j ≤ a + b`. -/
def bTable1024 (u0N u1N v0N v1N denM : Int) : Array (Array (Array (Int × Int))) :=
  let row0s := bRowsLoop v0N v1N denM 167 #[(dLag, dLag)] #[#[(dLag, dLag)]]
  Array.ofFn fun (bIdx : Fin 168) =>
    let b := bIdx.val
    let base := row0s.getD b #[]
    bRowsLoop u0N u1N denM (251 - b) base #[base]

/-- Extract `(allWidthOK, rows512, rows400)` where each entry is `(midRow, sumAbs)` for `bTable1024`. -/
def extractBMids (bt : Array (Array (Array (Int × Int)))) :
    Bool × Array (Array (Array Int × Int)) × Array (Array (Array Int × Int)) :=
  let p512 : Array (Array (Bool × Array Int × Int)) :=
    Array.ofFn fun (bIdx : Fin 168) =>
      let b := bIdx.val
      let tb := bt.getD b #[]
      Array.ofFn fun (aIdx : Fin (252 - b)) =>
        let a := aIdx.val
        let d := a + b
        let row := tb.getD a #[]
        let mr := Array.ofFn fun (jIdx : Fin (d + 1)) => toMid (row.getD jIdx.val (0, 0)) sh512
        let ok := (List.range (d + 1)).all fun j => (mr.getD j (false, 0)).1
        let ints := Array.ofFn fun (jIdx : Fin (d + 1)) => (mr.getD jIdx.val (false, 0)).2
        let sa := sumInt (d + 1) fun j => Int.ofNat (ints.getD j 0).natAbs
        (ok, ints, sa)
  let p400 : Array (Array (Bool × Array Int × Int)) :=
    Array.ofFn fun (bIdx : Fin 168) =>
      let b := bIdx.val
      let tb := bt.getD b #[]
      Array.ofFn fun (aIdx : Fin (252 - b)) =>
        let a := aIdx.val
        let d := a + b
        let row := tb.getD a #[]
        let mr := Array.ofFn fun (jIdx : Fin (d + 1)) => toMid (row.getD jIdx.val (0, 0)) sh624
        let ok := (List.range (d + 1)).all fun j => (mr.getD j (false, 0)).1
        let ints := Array.ofFn fun (jIdx : Fin (d + 1)) => (mr.getD jIdx.val (false, 0)).2
        let sa := sumInt (d + 1) fun j => Int.ofNat (ints.getD j 0).natAbs
        (ok, ints, sa)
  let ok512 := (List.range 168).all fun b =>
    (List.range (252 - b)).all fun a => ((p512.getD b #[]).getD a (false, #[], 0)).1
  let ok400 := (List.range 168).all fun b =>
    (List.range (252 - b)).all fun a => ((p400.getD b #[]).getD a (false, #[], 0)).1
  let m512 := Array.ofFn fun (bIdx : Fin 168) =>
    let b := bIdx.val
    Array.ofFn fun (aIdx : Fin (252 - b)) =>
      ((p512.getD b #[]).getD aIdx.val (false, #[], 0)).2
  let m400 := Array.ofFn fun (bIdx : Fin 168) =>
    let b := bIdx.val
    Array.ofFn fun (aIdx : Fin (252 - b)) =>
      ((p400.getD b #[]).getD aIdx.val (false, #[], 0)).2
  (ok512 && ok400, m512, m400)

/-- Look up `(gRe512, gIm512)` at `(k, j₁, j₂)` (`0` outside Fourier band `[-17, 18]`). -/
@[inline] def gLookup704 (gMid : Array (Array (Array (Int × Int)))) (k j1 j2 : Nat) : Int × Int :=
  let mSigned : Int := Int.ofNat j1 - Int.ofNat j2
  if decide (-17 ≤ mSigned ∧ mSigned ≤ 18) then
    let idxM := (mSigned + 17).toNat
    let n1 := min j1 j2
    let n2 := min (k + 1 - j1) (k - j2)
    ((gMid.getD idxM #[]).getD n1 #[]).getD n2 (0, 0)
  else (0, 0)

/-- Compute `(allOK, rows)` enclosing `energy (toLp (smoothMap ct st se ce fTCell))` on `headIdx 501`. -/
def computeSmoothedRows (creArr cimArr : Array Int) (cn sn chyp se _ce ehyp : Nat) :
    Bool × List RowI :=
  let binom := binomArr251
  let (lagOK, ov560) := modeOverlapsAt sh416 sh680 creArr cimArr lagTable1024
  -- Scale `modeOverlap / (choose(n1+n2, n1) * risingFact(n1+n2, k0))` to `2^512` midpoints:
  let gAndOk : Array (Array (Array (Bool × Int × Int))) :=
    Array.ofFn fun (mIdx : Fin 36) =>
      let idxM := mIdx.val
      let mSigned : Int := Int.ofNat idxM - 17
      let a := mSigned.natAbs
      let b := (1 - mSigned).natAbs
      let k0 := (a + b - 1) / 2
      let nr := 250 - k0
      let ovM := ov560.getD idxM #[]
      Array.ofFn fun (n1Idx : Fin (nr + 1)) =>
        let n1 := n1Idx.val
        let ovN1 := ovM.getD n1 #[]
        Array.ofFn fun (n2Idx : Fin (nr + 1 - n1)) =>
          let n2 := n2Idx.val
          let (reIv, imIv) := ovN1.getD n2 ((0, 0), (0, 0))
          let denG : Int :=
            Int.ofNat (getBinom binom (n1 + n2) n1 * risingFact (n1 + n2) k0)
          let mr := toMid reIv (denG * sh48)
          let mi := toMid imIv (denG * sh48)
          (mr.1 && mi.1, mr.2, mi.2)
  let gOK := (List.range 36).all fun idxM =>
    let mSigned : Int := Int.ofNat idxM - 17
    let k0 := (mSigned.natAbs + (1 - mSigned).natAbs - 1) / 2
    let nr := 250 - k0
    (List.range (nr + 1)).all fun n1 =>
      (List.range (nr + 1 - n1)).all fun n2 =>
        (((gAndOk.getD idxM #[]).getD n1 #[]).getD n2 (false, 0, 0)).1
  let gMid : Array (Array (Array (Int × Int))) :=
    Array.ofFn fun (mIdx : Fin 36) =>
      let idxM := mIdx.val
      let mSigned : Int := Int.ofNat idxM - 17
      let k0 := (mSigned.natAbs + (1 - mSigned).natAbs - 1) / 2
      let nr := 250 - k0
      Array.ofFn fun (n1Idx : Fin (nr + 1)) =>
        let n1 := n1Idx.val
        Array.ofFn fun (n2Idx : Fin (nr + 1 - n1)) =>
          (((gAndOk.getD idxM #[]).getD n1 #[]).getD n2Idx.val (false, 0, 0)).2
  -- Build `bTable1024` and extract `2^512` & `2^400` midpoints:
  let denM : Int := Int.ofNat (ehyp * chyp)
  let u0N : Int := Int.ofNat (ehyp * cn)
  let u1N : Int := -(Int.ofNat (se * sn))
  let v0N : Int := Int.ofNat (ehyp * sn)
  let v1N : Int := Int.ofNat (se * cn)
  let (bOK, bMid512, bMid400) := extractBMids (bTable1024 u0N u1N v0N v1N denM)
  -- For each `k ∈ 0..250`, compute inner product `T1[q2][j1]` at `2^400` for `q2 ≤ min 167 (250 - k)`:
  let kData : Array (Bool × Array (Array Int × Int) × Array (Array Int × Int)) :=
    Array.ofFn fun (kIdx : Fin 251) =>
      let k := kIdx.val
      let maxD2 := min 167 (250 - k)
      let sgRe : Array Int := Array.ofFn fun (j1Idx : Fin (k + 2)) =>
        sumInt (k + 1) fun j2 => Int.ofNat (gLookup704 gMid k j1Idx.val j2).1.natAbs
      let sgIm : Array Int := Array.ofFn fun (j1Idx : Fin (k + 2)) =>
        sumInt (k + 1) fun j2 => Int.ofNat (gLookup704 gMid k j1Idx.val j2).2.natAbs
      let rowsQ2 : Array (Bool × (Array Int × Int) × (Array Int × Int)) :=
        Array.ofFn fun (q2Idx : Fin (maxD2 + 1)) =>
          let q2 := q2Idx.val
          let q1 := k - q2
          let (b2Row, sb2) := (bMid512.getD q2 #[]).getD q1 (#[], 0)
          let t1Cells : Array (Bool × Int × Int) := Array.ofFn fun (j1Idx : Fin (k + 2)) =>
            let j1 := j1Idx.val
            let dotRe := sumInt (k + 1) fun j2 =>
              mulSkipZero (gLookup704 gMid k j1 j2).1 (b2Row.getD j2 0)
            let dotIm := sumInt (k + 1) fun j2 =>
              mulSkipZero (gLookup704 gMid k j1 j2).2 (b2Row.getD j2 0)
            let errRe := sgRe.getD j1 0 + sb2 + Int.ofNat (k + 1)
            let errIm := sgIm.getD j1 0 + sb2 + Int.ofNat (k + 1)
            let mr := toMid (dotRe - errRe, dotRe + errRe) sh624
            let mi := toMid (dotIm - errIm, dotIm + errIm) sh624
            (mr.1 && mi.1, mr.2, mi.2)
          let okQ2 := (List.range (k + 2)).all fun j1 => (t1Cells.getD j1 (false, 0, 0)).1
          let rArr := Array.ofFn fun (j1Idx : Fin (k + 2)) => (t1Cells.getD j1Idx.val (false, 0, 0)).2.1
          let iArr := Array.ofFn fun (j1Idx : Fin (k + 2)) => (t1Cells.getD j1Idx.val (false, 0, 0)).2.2
          let srAbs := sumInt (k + 2) fun j1 => Int.ofNat (rArr.getD j1 0).natAbs
          let siAbs := sumInt (k + 2) fun j1 => Int.ofNat (iArr.getD j1 0).natAbs
          (okQ2, (rArr, srAbs), (iArr, siAbs))
      let okK := (List.range (maxD2 + 1)).all fun q2 =>
        (rowsQ2.getD q2 (false, (#[], 0), (#[], 0))).1
      let reQ2 := Array.ofFn fun (q2Idx : Fin (maxD2 + 1)) =>
        (rowsQ2.getD q2Idx.val (false, (#[], 0), (#[], 0))).2.1
      let imQ2 := Array.ofFn fun (q2Idx : Fin (maxD2 + 1)) =>
        (rowsQ2.getD q2Idx.val (false, (#[], 0), (#[], 0))).2.2
      (okK, reQ2, imQ2)
  let t1OK := (List.range 251).all fun k => (kData.getD k (false, #[], #[])).1
  -- Assemble `List RowI` on `headIdx 501` (`d2 ∈ 0..167`, `d1 = (1 - d2 % 2) + 2 * t ≤ 501 - 3 * d2`):
  let rows : List RowI := List.ofFn fun (mIdx : Fin 168) =>
    let d2 := mIdx.val
    let nStart := 1 - d2 % 2
    let nCount := (501 - 3 * d2 - nStart) / 2 + 1
    let es : List (Nat × Ival) := List.ofFn fun (tIdx : Fin nCount) =>
      let d1 := nStart + 2 * tIdx.val
      let k := (d1 + d2 - 1) / 2
      let (_, reQ2, imQ2) := kData.getD k (false, #[], #[])
      let iv := sumIval (d2 + 1) fun p2 =>
        let q2 := d2 - p2
        if decide (p2 ≤ k + 1 ∧ q2 ≤ k) then
          let p1 := k + 1 - p2
          let q1 := k - q2
          let (b1Row, sb1) := (bMid400.getD p2 #[]).getD p1 (#[], 0)
          let (t1Re, stRe) := reQ2.getD q2 (#[], 0)
          let (t1Im, stIm) := imQ2.getD q2 (#[], 0)
          let dotRe := sumInt (k + 2) fun j1 => b1Row.getD j1 0 * t1Re.getD j1 0
          let dotIm := sumInt (k + 2) fun j1 => b1Row.getD j1 0 * t1Im.getD j1 0
          let errRe := sb1 + stRe + Int.ofNat (k + 2)
          let errIm := sb1 + stIm + Int.ofNat (k + 2)
          let cRe := ivDivPosL (dotRe - errRe, dotRe + errRe) sh512
          let cIm := ivDivPosL (dotIm - errIm, dotIm + errIm) sh512
          let sr := sqIntIval cRe.1 cRe.2
          let si := sqIntIval cIm.1 cIm.2
          let binomProd : Int :=
            Int.ofNat (getBinom binom (k + 1) p1 * getBinom binom k q1)
          let numLo := (sr.1 + si.1) * binomProd
          let numHi := (sr.2 + si.2) * binomProd
          let vIv := ivDivPosL (numLo, numHi) (Int.ofNat (k + 1) * sh448)
          ⟨vIv.1, vIv.2⟩
        else zeroI
      (d1, iv)
    (d2, es)
  (decide (0 < ehyp * chyp) && lagOK && gOK && bOK && t1OK, rows)

/-- Structural equality on `List (Nat × Ival)`. -/
def pairIvalListEq : List (Nat × Ival) → List (Nat × Ival) → Bool
  | [], [] => true
  | (n1, a) :: l, (n2, b) :: m =>
    decide (n1 = n2 ∧ a.lo = b.lo ∧ a.hi = b.hi) && pairIvalListEq l m
  | _, _ => false

theorem pairIvalListEq_iff : ∀ l m : List (Nat × Ival), pairIvalListEq l m = true ↔ l = m
  | [], [] => by simp [pairIvalListEq]
  | [], _ :: _ => by simp [pairIvalListEq]
  | _ :: _, [] => by simp [pairIvalListEq]
  | (n1, ⟨alo, ahi⟩) :: l, (n2, ⟨blo, bhi⟩) :: m => by
    simp only [pairIvalListEq, Bool.and_eq_true, decide_eq_true_eq, List.cons.injEq,
      Prod.mk.injEq, Ival.mk.injEq, and_assoc]
    rw [pairIvalListEq_iff l m]

/-- Structural equality on `List RowI`. -/
def rowListEq : List RowI → List RowI → Bool
  | [], [] => true
  | (m1, r1) :: l, (m2, r2) :: m =>
    decide (m1 = m2) && pairIvalListEq r1 r2 && rowListEq l m
  | _, _ => false

theorem rowListEq_iff : ∀ l m : List RowI, rowListEq l m = true ↔ l = m
  | [], [] => by simp [rowListEq]
  | [], _ :: _ => by simp [rowListEq]
  | _ :: _, [] => by simp [rowListEq]
  | (m1, r1) :: l, (m2, r2) :: m => by
    simp only [rowListEq, Bool.and_eq_true, decide_eq_true_eq, pairIvalListEq_iff,
      List.cons.injEq, Prod.mk.injEq, and_assoc]
    rw [rowListEq_iff l m]

def smoothedRowsCheck (creArr cimArr : Array Int) (cn sn chyp se ce ehyp : Nat)
    (expected : List RowI) : Bool :=
  let res := computeSmoothedRows creArr cimArr cn sn chyp se ce ehyp
  res.1 && rowListEq res.2 expected

theorem smoothedRowsCheck_iff (creArr cimArr : Array Int) (cn sn chyp se ce ehyp : Nat)
    (expected : List RowI) :
    smoothedRowsCheck creArr cimArr cn sn chyp se ce ehyp expected = true ↔
      computeSmoothedRows creArr cimArr cn sn chyp se ce ehyp = (true, expected) := by
  unfold smoothedRowsCheck
  cases computeSmoothedRows creArr cimArr cn sn chyp se ce ehyp with
  | mk b l =>
    simp only [Bool.and_eq_true, rowListEq_iff, Prod.mk.injEq]

end Grothe.Upper.Kernel.Cell
