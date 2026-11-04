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
  let sPow := powTable P s 251
  let rPow := powTable P (sqrtI P s) 251
  Array.ofFn fun k : Fin numCharges =>
    (radialRowI P k.val (blockSide k.val - 1) sPow rPow).map fun psi => toFx (mulI P psi ew)

/-- The canonical pair of block `k`, column `cIdx`: `c = cIdx + 1` for `k = 0` else `cIdx`,
`d = c + k − 1`. -/
def pairOf (k cIdx : Nat) : Nat × Nat :=
  if k == 0 then (cIdx + 1, cIdx + 1 + k - 1) else (cIdx, cIdx + k - 1)

/-- The canonical ranks and degrees of the selected columns, per block (computed once). -/
def selectedRanks : Array (Array (Nat × Nat)) :=
  Array.ofFn fun k : Fin numCharges =>
    Array.ofFn fun cIdx : Fin (blockSide k.val) =>
      ((pairOf k.val cIdx.val).1 + (pairOf k.val cIdx.val).2,
        canonicalRank 265 (pairOf k.val cIdx.val).1 (pairOf k.val cIdx.val).2)

/-- The block of a flat index: the largest `k` with `blockOffsets[k] ≤ idx`. -/
def blockOf (idx : Nat) : Nat :=
  (List.range numCharges).foldl (fun acc k => if blockOffsets.getD k 0 ≤ idx then k else acc) 0

/-- The block of every flat index (computed once per process). -/
def blockTable : Array Nat := Array.ofFn fun idx : Fin rawSize => blockOf idx.val

/-- `(k, j, cIdx)` of a flat index, from the block table. -/
def entryOf (table : Array Nat) (idx : Nat) : Nat × Nat × Nat :=
  (table.getD idx 0, (idx - blockOffsets.getD (table.getD idx 0) 0) / blockSide (table.getD idx 0),
    (idx - blockOffsets.getD (table.getD idx 0) 0) % blockSide (table.getD idx 0))

/-- The contribution of one node to the flat entry `idx`: `F_{k,j} · I_{c,d}` (scale `2^{2 KFix}`)
when `c + d ≤ D`, else `0` (the omitted pairs of the cutoff). -/
def contribution (D : Nat) (valsFx : Array Fx) (factors : Array (Array Fx)) (table : Array Nat)
    (idx : Nat) : Int × Int :=
  if ((selectedRanks.getD (entryOf table idx).1 #[]).getD (entryOf table idx).2.2 (0, 0)).1 ≤ D then
    mulFx ((factors.getD (entryOf table idx).1 #[]).getD (entryOf table idx).2.1 default)
      (valsFx.getD ((selectedRanks.getD (entryOf table idx).1 #[]).getD (entryOf table idx).2.2 (0, 0)).2
        default)
  else (0, 0)

/-- The contributions of one node to all flat entries (`valsFx` = the node's coefficients as
fixed intervals). -/
def nodeContributions (D : Nat) (valsFx : Array Fx) (factors : Array (Array Fx))
    (table : Array Nat) : Array (Int × Int) :=
  Array.ofFn fun idx : Fin rawSize => contribution D valsFx factors table idx.val

/-- Add precomputed contributions to an accumulator. -/
def accumulateLo (contribs : Array (Int × Int)) (acc : Array Int) : Array Int :=
  Array.ofFn fun idx : Fin rawSize => acc.getD idx.val 0 + (contribs.getD idx.val (0, 0)).1

def accumulateHi (contribs : Array (Int × Int)) (acc : Array Int) : Array Int :=
  Array.ofFn fun idx : Fin rawSize => acc.getD idx.val 0 + (contribs.getD idx.val (0, 0)).2

/-- Accumulate one node into the raw accumulators (scale `2^{2 KFix}`). -/
def accumulateNode (D : Nat) (vals : Array Ival) (factors : Array (Array Fx)) (table : Array Nat)
    (accLo accHi : Array Int) : Array Int × Array Int :=
  let contribs := nodeContributions D (vals.map toFx) factors table
  (accumulateLo contribs accLo, accumulateHi contribs accHi)

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
