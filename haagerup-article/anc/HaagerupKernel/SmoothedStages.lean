import HaagerupKernel.CellKernel

/-!
# Named stages of the smoothed row checker

The certificate evaluates the original checker in `CellKernel`. These definitions expose the
intermediate arrays to the enclosure proofs. `computeSmoothedRows_factored` checks by reduction
that both descriptions give the same Boolean and interval rows for every input.

-/

set_option warningAsError true
namespace HaagerupKernel.Cell
open HaagerupKernel

abbrev OverlapBox := Array (Array (Array ((Int × Int) × (Int × Int))))
abbrev GammaCells := Array (Array (Array (Bool × Int × Int)))
abbrev GammaMids := Array (Array (Array (Int × Int)))
abbrev MidRow := Array Int × Int
abbrev MidTable := Array (Array MidRow)
abbrev QBlock := Bool × MidRow × MidRow
abbrev KBlock := Bool × Array MidRow × Array MidRow

def gammaCell (binom : Array (Array Nat)) (ov560 : OverlapBox) (idxM n1 n2 : Nat) : Bool × Int × Int :=
  let mSigned := Int.ofNat idxM - 17
  let k0 := (mSigned.natAbs + (1 - mSigned).natAbs - 1) / 2
  let ovN1 := (ov560.getD idxM #[]).getD n1 #[]
  let (reIv, imIv) := ovN1.getD n2 ((0, 0), (0, 0))
  let denG : Int :=
    Int.ofNat (getBinom binom (n1 + n2) n1 * risingFact (n1 + n2) k0)
  let mr := toMid reIv (denG * sh48)
  let mi := toMid imIv (denG * sh48)
  (mr.1 && mi.1, mr.2, mi.2)

def gammaCells (binom : Array (Array Nat)) (ov560 : OverlapBox) : GammaCells :=
  Array.ofFn fun (mIdx : Fin 36) =>
    let idxM := mIdx.val
    let mSigned : Int := Int.ofNat idxM - 17
    let a := mSigned.natAbs
    let b := (1 - mSigned).natAbs
    let k0 := (a + b - 1) / 2
    let nr := 250 - k0
    Array.ofFn fun (n1Idx : Fin (nr + 1)) =>
      let n1 := n1Idx.val
      Array.ofFn fun (n2Idx : Fin (nr + 1 - n1)) =>
        let n2 := n2Idx.val
        gammaCell binom ov560 idxM n1 n2

def gammaOK (gAndOk : GammaCells) : Bool :=
  (List.range 36).all fun idxM =>
    let mSigned : Int := Int.ofNat idxM - 17
    let k0 := (mSigned.natAbs + (1 - mSigned).natAbs - 1) / 2
    let nr := 250 - k0
    (List.range (nr + 1)).all fun n1 =>
      (List.range (nr + 1 - n1)).all fun n2 =>
        (((gAndOk.getD idxM #[]).getD n1 #[]).getD n2 (false, 0, 0)).1

def gammaMids (gAndOk : GammaCells) : GammaMids :=
  Array.ofFn fun (mIdx : Fin 36) =>
    let idxM := mIdx.val
    let mSigned : Int := Int.ofNat idxM - 17
    let k0 := (mSigned.natAbs + (1 - mSigned).natAbs - 1) / 2
    let nr := 250 - k0
    Array.ofFn fun (n1Idx : Fin (nr + 1)) =>
      let n1 := n1Idx.val
      Array.ofFn fun (n2Idx : Fin (nr + 1 - n1)) =>
        (((gAndOk.getD idxM #[]).getD n1 #[]).getD n2Idx.val (false, 0, 0)).2

def dotCells (gMid : GammaMids) (k : Nat) (sgRe sgIm b2Row : Array Int) (sb2 : Int) : Array (Bool × Int × Int) :=
  Array.ofFn fun (j1Idx : Fin (k + 2)) =>
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

def qBlock (gMid : GammaMids) (bMid512 : MidTable) (k q2 : Nat) (sgRe sgIm : Array Int) : QBlock :=
  let q1 := k - q2
  let (b2Row, sb2) := (bMid512.getD q2 #[]).getD q1 (#[], 0)
  let t1Cells := dotCells gMid k sgRe sgIm b2Row sb2
  let okQ2 := (List.range (k + 2)).all fun j1 => (t1Cells.getD j1 (false, 0, 0)).1
  let rArr := Array.ofFn fun (j1Idx : Fin (k + 2)) => (t1Cells.getD j1Idx.val (false, 0, 0)).2.1
  let iArr := Array.ofFn fun (j1Idx : Fin (k + 2)) => (t1Cells.getD j1Idx.val (false, 0, 0)).2.2
  let srAbs := sumInt (k + 2) fun j1 => Int.ofNat (rArr.getD j1 0).natAbs
  let siAbs := sumInt (k + 2) fun j1 => Int.ofNat (iArr.getD j1 0).natAbs
  (okQ2, (rArr, srAbs), (iArr, siAbs))

def kBlock (gMid : GammaMids) (bMid512 : MidTable) (k : Nat) : KBlock :=
  let maxD2 := min 167 (250 - k)
  let sgRe : Array Int := Array.ofFn fun (j1Idx : Fin (k + 2)) =>
    sumInt (k + 1) fun j2 => Int.ofNat (gLookup704 gMid k j1Idx.val j2).1.natAbs
  let sgIm : Array Int := Array.ofFn fun (j1Idx : Fin (k + 2)) =>
    sumInt (k + 1) fun j2 => Int.ofNat (gLookup704 gMid k j1Idx.val j2).2.natAbs
  let rowsQ2 : Array (Bool × (Array Int × Int) × (Array Int × Int)) :=
    Array.ofFn fun (q2Idx : Fin (maxD2 + 1)) =>
      qBlock gMid bMid512 k q2Idx.val sgRe sgIm
  let okK := (List.range (maxD2 + 1)).all fun q2 =>
    (rowsQ2.getD q2 (false, (#[], 0), (#[], 0))).1
  let reQ2 := Array.ofFn fun (q2Idx : Fin (maxD2 + 1)) =>
    (rowsQ2.getD q2Idx.val (false, (#[], 0), (#[], 0))).2.1
  let imQ2 := Array.ofFn fun (q2Idx : Fin (maxD2 + 1)) =>
    (rowsQ2.getD q2Idx.val (false, (#[], 0), (#[], 0))).2.2
  (okK, reQ2, imQ2)

def kBlocks (gMid : GammaMids) (bMid512 : MidTable) : Array KBlock :=
  Array.ofFn fun (k : Fin 251) => kBlock gMid bMid512 k.val

def smoothedTerm (binom : Array (Array Nat)) (bMid400 : MidTable) (reQ2 imQ2 : Array MidRow) (k d2 p2 : Nat) : Ival :=
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

def smoothedRowEntry (binom : Array (Array Nat)) (bMid400 : MidTable) (kData : Array KBlock) (d1 d2 : Nat) : Nat × Ival :=
  let k := (d1 + d2 - 1) / 2
  let (_, reQ2, imQ2) := kData.getD k (false, #[], #[])
  (d1, sumIval (d2 + 1) (smoothedTerm binom bMid400 reQ2 imQ2 k d2))

def smoothedRows (binom : Array (Array Nat)) (bMid400 : MidTable) (kData : Array KBlock) : List RowI :=
  List.ofFn fun (m : Fin 168) =>
    let d2 := m.val
    let start := 1 - d2 % 2
    (d2, List.ofFn fun (t : Fin ((501 - 3 * d2 - start) / 2 + 1)) =>
      smoothedRowEntry binom bMid400 kData (start + 2 * t.val) d2)

/-- Compute `(allOK, rows)` enclosing `energy (toLp (smoothMap ct st se ce fTCell))` on `headIdx 501`. -/
def computeSmoothedFactored (creArr cimArr : Array Int) (cn sn chyp se _ce ehyp : Nat) :
    Bool × List RowI :=
  let binom := binomArr251
  let (lagOK, ov560) := modeOverlapsAt sh416 sh680 creArr cimArr lagTable1024
  let g := gammaCells binom ov560
  let gm := gammaMids g
  let denM : Int := Int.ofNat (ehyp * chyp)
  let u0N : Int := Int.ofNat (ehyp * cn)
  let u1N : Int := -(Int.ofNat (se * sn))
  let v0N : Int := Int.ofNat (ehyp * sn)
  let v1N : Int := Int.ofNat (se * cn)
  let (bOK, bMid512, bMid400) := extractBMids (bTable1024 u0N u1N v0N v1N denM)
  let ks := kBlocks gm bMid512
  let rows := smoothedRows binom bMid400 ks
  let ok := (List.range 251).all fun k => (ks.getD k (false, #[], #[])).1
  (decide (0 < ehyp * chyp) && lagOK && gammaOK g && bOK && ok, rows)

attribute [local irreducible] Array.ofFn List.ofFn List.all List.range sumInt sumIval lagTable1024
  binomArr251 modeOverlapsAt extractBMids bTable1024
set_option maxRecDepth 4096 in
set_option maxHeartbeats 400000 in
theorem computeSmoothedRows_factored (cr ci : Array Int) (cn sn ch se ce eh : Nat) :
    computeSmoothedRows cr ci cn sn ch se ce eh = computeSmoothedFactored cr ci cn sn ch se ce eh := by
  rfl

end HaagerupKernel.Cell
