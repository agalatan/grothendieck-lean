import GrotheQuadKernel.Pairs
import GrotheQuadKernel.Gauss
import GrotheQuadKernel.Profile

/-!
# The contraction: raw coefficients from the node values

Layout of the committed raw array (`data/retained-f0/raw_canonical_blocks.npy`, 5,365,627
entries; `handoff/upper-residual/common-head/audit_raw_error_proof.md`): for the primary charge
`k = 0, …, 251` a square block of side `n_k` (`n_0 = 251`, `n_k = 252 − k`), rows indexed by the
primary radial index `j < n_k` and columns by the canonical pair index `cIdx < n_k`
(`c = cIdx + 1, d = c − 1` for `k = 0`; `c = cIdx, d = c + k − 1` for `k ≥ 1`), stored row-major
(`j` outer).  The triangle `j + c + k ≤ 251` (`j + c ≤ 251` for `k = 0`) holds the coefficients
of degree `≤ 501`; the other entries of the square are "extra".

The raw coefficient is `C_{k,j,c} = Σ_i W_i e^{−s_i} ψ_{k,j}(s_i) sign_i^{c+d} I_{c,d}(A_i)`
(`ProductionF0Radial.baseGradedCoefficient_eq_radial`, `RadialLaguerre.conj_primary_laguerre`),
summed over the nodes of the partition.  Node factors and coefficients are exported to the fixed
scale `2^K` (`K = 128`) and the products are accumulated exactly at scale `2^{2K}`.

The accumulator is kept in the block structure itself (`Raw = Array (Array (Array (Int × Int)))`,
indexed `[k][j][cIdx]`), so that every entry is an `Array.ofFn` value with no flat-index decoding
(`Grothe/UpperQuad/ContractSound.lean`); the flat committed layout is only a file format of the
driver `quadrun`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- The number of charges and the block sides. -/
def numCharges : Nat := 252
def blockSide (k : Nat) : Nat := if k == 0 then 251 else 252 - k

/-- The offset of block `k` in the flat committed layout. -/
def blockOffset (k : Nat) : Nat := (List.range k).foldl (fun s k' => s + blockSide k' * blockSide k') 0

/-- The total number of raw entries (5,365,627). -/
def rawSize : Nat := blockOffset numCharges

/-- The fixed scale of the exported node values (`2^{-128}` per factor; the products are
accumulated exactly at scale `2^{256}` and exported at `2^{128}`, far below the `10^{-13}` target). -/
def KFix : Nat := 128

/-- A fixed-point interval at scale `2^KFix`. -/
structure Fx where
  lo : Int
  hi : Int
  deriving Repr, Inhabited

def toFx (a : Ival) : Fx := ⟨toFixedLo KFix a, toFixedHi KFix a⟩

/-- The product of two fixed intervals (scale `2^{2 KFix}`), with the sign cases. -/
def mulFx (a b : Fx) : Int × Int :=
  if a.lo ≥ 0 then
    if b.lo ≥ 0 then (a.lo * b.lo, a.hi * b.hi)
    else if b.hi ≤ 0 then (a.hi * b.lo, a.lo * b.hi)
    else (a.hi * b.lo, a.hi * b.hi)
  else if a.hi ≤ 0 then
    if b.lo ≥ 0 then (a.lo * b.hi, a.hi * b.lo)
    else if b.hi ≤ 0 then (a.hi * b.hi, a.lo * b.lo)
    else (a.lo * b.hi, a.lo * b.lo)
  else
    if b.lo ≥ 0 then (a.lo * b.hi, a.hi * b.hi)
    else if b.hi ≤ 0 then (a.hi * b.lo, a.lo * b.lo)
    else
      (min (min (a.lo * b.lo) (a.lo * b.hi)) (min (a.hi * b.lo) (a.hi * b.hi)),
        max (max (a.lo * b.lo) (a.lo * b.hi)) (max (a.hi * b.lo) (a.hi * b.hi)))

/-- Exact addition of pairs (accumulators at scale `2^{2 KFix}`). -/
def addPair (a b : Int × Int) : Int × Int := (a.1 + b.1, a.2 + b.2)

/-! ### The node factors -/

/-- The node factors `F_{k,j} = ψ_{k,j}(s) e^{−s} W` for all `k < 252`, `j < n_k`, from the common
factor `ew ∋ e^{−s} W`, the Laguerre table `lagTab` of depth `251` (level `k` at index `251 − k`)
and the power table of `√s` (computed once per node). -/
def nodeFactorsFrom (P : Nat) (ew : Ival) (lagTab : Array (Array Ival)) (rPow : Array Ival) :
    Array (Array Fx) :=
  Array.ofFn fun k : Fin numCharges =>
    (radialRowI P k.val (blockSide k.val - 1) (lagTab.getD (251 - k.val) #[]) rPow).map
      fun psi => toFx (mulI P psi ew)

/-- The node factors of the node `s ∈ s`, weight `W ∈ w`. -/
def nodeFactors (P : Nat) (s w : Ival) : Array (Array Fx) :=
  nodeFactorsFrom P (mulI P (expNegI P 400 s) w) (lagTable P 251 (negExpTerms P (negI s) 251))
    (powTable P (sqrtI P s) 251)

/-- The validity flag of the node factors: the exponential's series tail (`s < 402`) and the
positivity of `e^s`'s enclosure (for the reciprocal). -/
def nodeFactorsValid (P : Nat) (s : Ival) : Bool :=
  expPosValid P 400 s && isPos (expPosI P 400 s)

/-! ### The accumulator -/

/-- The canonical pair of block `k`, column `cIdx`: `c = cIdx + 1` for `k = 0` else `cIdx`,
`d = c + k − 1`. -/
def pairOf (k cIdx : Nat) : Nat × Nat :=
  if k == 0 then (cIdx + 1, cIdx) else (cIdx, cIdx + k - 1)

/-- The degree `c + d` and the canonical rank (`dMax = 265`) of the pair of block `k`, column
`cIdx`, for every block (computed once). -/
def selectedRanks : Array (Array (Nat × Nat)) :=
  Array.ofFn fun k : Fin numCharges =>
    Array.ofFn fun cIdx : Fin (blockSide k.val) =>
      ((pairOf k.val cIdx.val).1 + (pairOf k.val cIdx.val).2,
        canonicalRank 265 (pairOf k.val cIdx.val).1 (pairOf k.val cIdx.val).2)

/-- The raw accumulator in the block structure: `acc[k][j][cIdx] = (lo, hi)` at scale `2^{2 KFix}`. -/
abbrev Raw := Array (Array (Array (Int × Int)))

/-- Read an accumulator entry (`(0, 0)` outside the structure). -/
def rawGet (acc : Raw) (k j cIdx : Nat) : Int × Int :=
  ((acc.getD k #[]).getD j #[]).getD cIdx (0, 0)

/-- The zero accumulator. -/
def rawZero : Raw :=
  Array.ofFn fun k : Fin numCharges =>
    Array.ofFn fun _ : Fin (blockSide k.val) =>
      Array.ofFn fun _ : Fin (blockSide k.val) => ((0 : Int), (0 : Int))

/-- The contribution of the node to the column `cIdx` of a row with node factor `F`: `F · I_{c,d}`
(scale `2^{2 KFix}`) when the pair's degree is within the cutoff `D`, else `0` (the omitted pairs
of the cutoff); `ranks` holds the degrees and canonical ranks of the block's columns and `valsFx`
the node's coefficients in canonical order (`canonicalRank 265`). -/
def contributionOf (D : Nat) (valsFx : Array Fx) (F : Fx) (ranks : Array (Nat × Nat)) (cIdx : Nat) :
    Int × Int :=
  if (ranks.getD cIdx (0, 0)).1 ≤ D then mulFx F (valsFx.getD (ranks.getD cIdx (0, 0)).2 default)
  else (0, 0)

/-- The number of columns of the row `(k, j)` inside the degree-501 triangle (grade
`q = j + d ≤ 250` with `d = cIdx + k − 1` for `k ≥ 1` and `d = cIdx` for `k = 0`):
`cIdx < blockSide k − j`.  The columns beyond it are the "extra" entries of the committed squares,
which no statement uses and which the accumulator leaves at `0`. -/
def activeCols (k j : Nat) : Nat := blockSide k - j

/-- The contribution of one node to the entry `(k, j, cIdx)` (`0` outside the triangle). -/
def contributionAt (D : Nat) (valsFx : Array Fx) (factors : Array (Array Fx)) (k j cIdx : Nat) :
    Int × Int :=
  if cIdx < activeCols k j then
    contributionOf D valsFx ((factors.getD k #[]).getD j default) (selectedRanks.getD k #[]) cIdx
  else (0, 0)

/-- One row of side `n` of the accumulator after the node (row-constant data hoisted; the
`act` columns of the triangle are updated, the rest copied). -/
def accumulateRow (D : Nat) (valsFx : Array Fx) (F : Fx) (ranks : Array (Nat × Nat)) (n act : Nat)
    (row : Array (Int × Int)) : Array (Int × Int) :=
  Array.ofFn fun cIdx : Fin n =>
    if cIdx.val < act then addPair (row.getD cIdx.val (0, 0)) (contributionOf D valsFx F ranks cIdx.val)
    else row.getD cIdx.val (0, 0)

/-- Accumulate one node into the raw accumulator (scale `2^{2 KFix}`). -/
def accumulateNode (D : Nat) (valsFx : Array Fx) (factors : Array (Array Fx)) (acc : Raw) : Raw :=
  Array.ofFn fun k : Fin numCharges =>
    Array.ofFn fun j : Fin (blockSide k.val) =>
      accumulateRow D valsFx ((factors.getD k.val #[]).getD j.val default)
        (selectedRanks.getD k.val #[]) (blockSide k.val) (activeCols k.val j.val)
        ((acc.getD k.val #[]).getD j.val #[])

/-- Exact entrywise sum of two accumulators (the merge of node ranges). -/
def rawAdd (a b : Raw) : Raw :=
  Array.ofFn fun k : Fin numCharges =>
    Array.ofFn fun j : Fin (blockSide k.val) =>
      Array.ofFn fun cIdx : Fin (blockSide k.val) =>
        addPair (rawGet a k.val j.val cIdx.val) (rawGet b k.val j.val cIdx.val)

/-- The sum of squares of the selected (`k ≤ 251`, within the block squares) coefficients, as
a check of Bessel on the selected set (diagnostics). -/
def selectedSumSq (P D : Nat) (vals : Array Ival) : Ival := Id.run do
  let ranks := selectedRanks
  let mut s := zeroI
  for k in [0:numCharges] do
    for (deg, r) in ranks.getD k #[] do
      if deg ≤ D then s := addI P s (sqI P (absUpper (vals.getD r zeroI)))
  return s

end GrotheQuad
