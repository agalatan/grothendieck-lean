/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import HaagerupKernel.CellKernel

/-!
# Stages of the computation of the energy table of the smoothed map

The function `computeSmoothedRows` of `HaagerupKernel/CellKernel.lean` computes, as one expression, the table of
enclosures of the energies `E_{f_sm}(d₁, d₂)` of Computation 3 (energies of `f_sm`) of the article, by the
algorithm of Appendix A.4 (the energies of `f_sm`). This file gives names to the intermediate arrays of that
algorithm (`gammaCells`, `gammaMids`, `dotCells`, `qBlock`, `kBlocks`, `smoothedTerm`, `smoothedRows`) and
assembles them into `computeSmoothedFactored`. The theorem `computeSmoothedRows_factored` states that the two
functions are equal; it holds by unfolding of definitions. The soundness proofs in `Haagerup/SmoothedMidpoints.lean`,
`Haagerup/SmoothedRows.lean` and `Haagerup/CellOverlap.lean` treat the named stages one at a time.

## Notation

The energies are indexed by `(d₁, d₂)` with `d₁ + d₂ = 2n + 1`; the Lean code calls `n` by the name `k`. The indices
`(k, l)` of the article (`0 ≤ k ≤ n + 1`, `0 ≤ l ≤ n`) are `(j1, j2)`, and `m = j1 - j2` is stored as
`idxM = m + 17 ∈ {0, …, 35}`, with `k0 = (|m| + |1 - m| - 1) / 2`. The multi-index `(a₁, a₂, b₁, b₂)` of the article
is `(p1, p2, q1, q2)`, with `p1 + p2 = n + 1`, `q1 + q2 = n` and `p2 + q2 = d₂`. The rational numbers
`χ(a₁, a₂; k)` of the article are the entries `[a₂][a₁][k]` of `bTable1024` (`Haagerup.bCoeff`), and `g_{k,l}` are
the numbers `t_{k,l} / n!` of Appendix A.4. Every stage carries a Boolean flag, which is `true` if all intervals
of that stage, after division, have length at most `2`, so that their midpoints are within one unit of every point.

-/

set_option warningAsError true

namespace HaagerupKernel.Cell
open HaagerupKernel

/-- The second component of the output of `modeOverlapsAt`: the entry `[idxM][n1][n2]` is a pair of integer intervals
`((reLo, reHi), (imLo, imHi))` enclosing, at scale `2^560`, the real and the imaginary part of the sum
`2^(-24) ∑_{i,j} c_{m+17,i,j} I_{n1,|m|,i} I_{n2,|1-m|,j}` of Appendix A.4 of the article, `m = idxM - 17`. -/
abbrev OverlapBox := Array (Array (Array ((Int × Int) × (Int × Int))))
/-- Array of triples `(ok, re, im)` indexed by `[idxM][n1][n2]`: the midpoints of the real and imaginary parts of
the numbers `g_{k,l}` at scale `2^512`, with the flag of their reduction to midpoints. -/
abbrev GammaCells := Array (Array (Array (Bool × Int × Int)))
/-- Array of the pairs `(re, im)` of midpoints of `GammaCells`, indexed by `[idxM][n1][n2]`. -/
abbrev GammaMids := Array (Array (Array (Int × Int)))
/-- A row of integer midpoints together with the sum of their absolute values. -/
abbrev MidRow := Array Int × Int
/-- A table of rows of midpoints: the entry `[b][a]` is the `MidRow` of the numbers `χ(a, b; j)`, `0 ≤ j ≤ a + b`
(the two tables produced by `extractBMids`, at scales `2^512` and `2^400`). -/
abbrev MidTable := Array (Array MidRow)
/-- The result of `qBlock` for one pair `(n, b₂)`: a flag, and the rows of midpoints of the real and of the imaginary
parts of the inner sums. -/
abbrev QBlock := Bool × MidRow × MidRow
/-- The result of `kBlock` for one `n`: a flag, and the arrays, indexed by `b₂ = q2`, of the rows of midpoints of the
real and of the imaginary parts of the inner sums. -/
abbrev KBlock := Bool × Array MidRow × Array MidRow

/-- Step (2) of Appendix A.4 of the article for one index `(idxM, n1, n2)`: the enclosures of `ov560` (scale `2^560`)
are divided by `2^48 * binom(n1 + n2, n1) * ∏_{r=1}^{k0} (n1 + n2 + r)` and reduced to midpoints at scale `2^512`,
which approximate the real and the imaginary part of `g_{k,l}` (up to the sign convention of the Laguerre
polynomials). The flag is `true` if both reduced intervals have length at most `2`. -/
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

/-- The array of all `gammaCell binom ov560 idxM n1 n2` for `idxM < 36`, `n1 ≤ 250 - k0` and
`n2 ≤ 250 - k0 - n1`. -/
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

/-- `true` if and only if the flags of all entries of `gammaCells` are `true`. -/
def gammaOK (gAndOk : GammaCells) : Bool :=
  (List.range 36).all fun idxM =>
    let mSigned : Int := Int.ofNat idxM - 17
    let k0 := (mSigned.natAbs + (1 - mSigned).natAbs - 1) / 2
    let nr := 250 - k0
    (List.range (nr + 1)).all fun n1 =>
      (List.range (nr + 1 - n1)).all fun n2 =>
        (((gAndOk.getD idxM #[]).getD n1 #[]).getD n2 (false, 0, 0)).1

/-- The midpoints `(re, im)` of `gammaCells`, without the flags. -/
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

/-- Step (3) of Appendix A.4 of the article for one `n = k` and one row `b2Row` of midpoints of `χ(b₁, b₂; ·)` at
scale `2^512` (with `sb2` the sum of their absolute values). For each `j1 ≤ k + 1` the inner sum
`∑_{j2 ≤ k} g_{j1,j2} χ(b₁, b₂; j2)` is computed from the midpoints as an exact integer dot product at scale
`2^1024`, with the error bound `sg[j1] + sb2 + (k + 1)`, where `sgRe`, `sgIm` hold the sums over `j2` of the
absolute values of the midpoints of `g_{j1,j2}`; the enclosure is reduced to a midpoint at scale `2^400`. The entry
`j1` of the result is `(ok, re, im)`. -/
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

/-- The inner sums of `dotCells` for one pair `(n, b₂) = (k, q2)`, with `b₁ = q1 = k - q2`: the conjunction of the
flags, and the rows of midpoints (scale `2^400`) of the real and of the imaginary parts, each with the sum of its
absolute values. -/
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

/-- All `qBlock`s for one `n = k`, that is, for `q2 ≤ min 167 (250 - k)`: the conjunction of their flags and the
arrays of their real and imaginary rows, indexed by `q2`. -/
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

/-- The array of `kBlock gMid bMid512 k` for `k ≤ 250`. -/
def kBlocks (gMid : GammaMids) (bMid512 : MidTable) : Array KBlock :=
  Array.ofFn fun (k : Fin 251) => kBlock gMid bMid512 k.val

/-- Steps (4) and (5) of Appendix A.4 of the article for one multi-index: the enclosure at scale `2^128` of the term
of the energy `E_{f_sm}(d₁, d₂)` with `a₂ = p2`, `b₂ = q2 = d2 - p2`, `a₁ = p1 = k + 1 - p2`, `b₁ = q1 = k - q2`,
where `2 k + 1 = d₁ + d₂`. The outer sum over `j1 ≤ k + 1` of `χ(a₁, a₂; j1)` times the inner sums is computed from
the midpoints at scale `2^400` (`bMid400` and the rows `reQ2`, `imQ2` of a `KBlock`), with the error bound of the
dot product, and divided by `2^512`; the two enclosures are squared and added, multiplied by
`binom(k + 1, a₁) * binom(k, b₁)` and divided by `(k + 1) * 2^448` with outward rounding. The term is `zeroI` if
`p2 > k + 1` or `q2 > k`. -/
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

/-- The entry `(d1, enclosure)` of the energy table: the sum of `smoothedTerm` over `p2 = 0, …, d2`, with
`k = (d1 + d2 - 1) / 2`. It encloses `2^128 * E_{f_sm}(d1, d2)`. -/
def smoothedRowEntry (binom : Array (Array Nat)) (bMid400 : MidTable) (kData : Array KBlock)
    (d1 d2 : Nat) : Nat × Ival :=
  let k := (d1 + d2 - 1) / 2
  let (_, reQ2, imQ2) := kData.getD k (false, #[], #[])
  (d1, sumIval (d2 + 1) (smoothedTerm binom bMid400 reQ2 imQ2 k d2))

/-- The energy table: for `d2 = 0, …, 167` the row `(d2, entries)`, whose entries are `smoothedRowEntry … d1 d2` for
the `d1` with `d1 + d2` odd and `d1 + 3 * d2 ≤ 501`, in increasing order. -/
def smoothedRows (binom : Array (Array Nat)) (bMid400 : MidTable) (kData : Array KBlock) : List RowI :=
  List.ofFn fun (m : Fin 168) =>
    let d2 := m.val
    let start := 1 - d2 % 2
    (d2, List.ofFn fun (t : Fin ((501 - 3 * d2 - start) / 2 + 1)) =>
      smoothedRowEntry binom bMid400 kData (start + 2 * t.val) d2)

/-- The computation of Computation 3 (energies of `f_sm`) of the article in named stages. The arguments are the
real and imaginary parts `creArr`, `cimArr` of the cell table of the cell map and the parameters of the smoothed
map as natural numbers: `c_θ = cn / chyp`, `s_θ = sn / chyp`, `s_η = se / ehyp` (the numerator `_ce` of `c_η` is
not used). The result is `(ok, rows)`: `rows` is the table `smoothedRows`, and `ok` is `true` if and only if
`0 < ehyp * chyp` and no reduction to midpoints failed in any stage. If `ok` is `true`, the intervals of `rows`
enclose the energies `E_{f_sm}(d₁, d₂)` at scale `2^128` (`Haagerup.smoothedRowsCheck_table_sound`). -/
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
/-- The function `computeSmoothedRows` of `CellKernel.lean` and its description by named stages are equal, by
unfolding of definitions. -/
theorem computeSmoothedRows_factored (cr ci : Array Int) (cn sn ch se ce eh : Nat) :
    computeSmoothedRows cr ci cn sn ch se ce eh = computeSmoothedFactored cr ci cn sn ch se ce eh := by
  rfl

end HaagerupKernel.Cell
