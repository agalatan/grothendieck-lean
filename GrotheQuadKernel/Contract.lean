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
scale `2^K` (`K = 256`) and the products are accumulated exactly at scale `2^{2K}`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- The number of charges and the block sides. -/
def numCharges : Nat := 252
def blockSide (k : Nat) : Nat := if k == 0 then 251 else 252 - k

/-- The offset of block `k`. -/
def blockOffset (k : Nat) : Nat := (List.range k).foldl (fun s k' => s + blockSide k' * blockSide k') 0

/-- The offsets of all blocks (index `252` = total size). -/
def blockOffsets : Array Nat := Id.run do
  let mut out : Array Nat := Array.mkEmpty (numCharges + 1)
  let mut s := 0
  for k in [0:numCharges] do
    out := out.push s
    s := s + blockSide k * blockSide k
  out := out.push s
  return out

/-- The total number of raw entries (5,365,627). -/
def rawSize : Nat := blockOffsets.getD numCharges 0

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
      let p1 := a.lo * b.lo
      let p2 := a.lo * b.hi
      let p3 := a.hi * b.lo
      let p4 := a.hi * b.hi
      (min (min p1 p2) (min p3 p4), max (max p1 p2) (max p3 p4))

/-- The node factors `F_{k,j} = ψ_{k,j}(s) e^{−s} W` for all `k < 252`, `j < n_k`, as fixed
intervals (`Array` of rows). -/
def nodeFactors (P : Nat) (s w : Ival) : Array (Array Fx) :=
  let ew := mulI P (expNegI P 400 s) w
  (Array.range numCharges).map fun k =>
    let row := radialRowI P k (blockSide k - 1) s
    row.map fun psi => toFx (mulI P psi ew)

/-- The selected coefficient `I_{c,d}` of block `k`, column `cIdx`, read from the canonical
array of a node with cutoff `D` (pairs beyond the cutoff are omitted: `0`). -/
def selectedCoefficient (D : Nat) (vals : Array Ival) (k cIdx : Nat) : Ival :=
  let c := if k == 0 then cIdx + 1 else cIdx
  let d := c + k - 1
  if c + d ≤ D then vals.getD (canonicalRank 265 c d) zeroI else zeroI

/-- The canonical ranks of the selected columns, per block (precomputed once). -/
def selectedRanks : Array (Array (Nat × Nat)) :=
  (Array.range numCharges).map fun k =>
    (Array.range (blockSide k)).map fun cIdx =>
      let c := if k == 0 then cIdx + 1 else cIdx
      let d := c + k - 1
      (c + d, canonicalRank 265 c d)

/-- Accumulate one node into the raw accumulators (scale `2^{2 KFix}`): for every block `k`,
row `j` and column `cIdx` with `c + d ≤ D`: `acc[k,j,cIdx] += F_{k,j} · I_{c,d}`. -/
def accumulateNode (D : Nat) (vals : Array Ival) (factors : Array (Array Fx))
    (accLo accHi : Array Int) : Array Int × Array Int := Id.run do
  let mut lo := accLo
  let mut hi := accHi
  let ranks := selectedRanks
  let offs := blockOffsets
  for k in [0:numCharges] do
    let n := blockSide k
    let off := offs.getD k 0
    let fr := factors.getD k #[]
    let rk := ranks.getD k #[]
    -- the active columns of this block: selected pairs within the cutoff with a nonzero value
    let cols : Array (Nat × Fx) := Id.run do
      let mut out : Array (Nat × Fx) := #[]
      for cIdx in [0:n] do
        let (deg, r) := rk.getD cIdx (0, 0)
        if deg ≤ D then
          let v := vals.getD r zeroI
          if !(isZero v) then out := out.push (cIdx, toFx v)
      return out
    if cols.isEmpty then continue
    for j in [0:n] do
      let f := fr.getD j default
      if f.lo == 0 && f.hi == 0 then continue
      let base := off + j * n
      for (cIdx, v) in cols do
        let (pl, ph) := mulFx f v
        let idx := base + cIdx
        lo := lo.set! idx (lo.getD idx 0 + pl)
        hi := hi.set! idx (hi.getD idx 0 + ph)
  return (lo, hi)

/-- The sum of squares of the selected (`k ≤ 251`, within the block squares) coefficients, as
a check of Bessel on the selected set. -/
def selectedSumSq (P D : Nat) (vals : Array Ival) : Ival := Id.run do
  let ranks := selectedRanks
  let mut s := zeroI
  for k in [0:numCharges] do
    for (deg, r) in ranks.getD k #[] do
      if deg ≤ D then s := addI P s (sqI P (absUpper (vals.getD r zeroI)))
  return s

end GrotheQuad
