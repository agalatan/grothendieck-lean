import GrotheQuadKernel.Seed

/-!
# The conditional coefficients over the canonical pairs

For a real shift `A > 0` the normalized conditional coefficients `U_{c,d} = I_{c,d}(A)/S(A)`
(`ConditionalSeedNormalization.normalizedCoefficient`) are real and determined by

* `U_{0,0} = 1`,
* the zero row `U_{0,d+1} = −A · r_d · U_{0,d} / √(d+1)` (`normalizedCoefficient_zero_row_step`),
* the forward charge recurrence
  `U_{c+1,d} = (A √(d+1) · U_{c,d+1} + (d+1−c) · U_{c,d}) / (A √(c+1))`
  (`normalizedCoefficient_forward`).

The stored canonical set is `c ≤ d + 1`, `d ≤ dMax = 265` (35,777 pairs), enumerated by
increasing `c + d`, then `c` (`conditional_canonical_pairs.npy`); a node with cutoff `D` retains
the prefix `c + d ≤ D`.  The actual coefficient is `I_{c,d} = S(A) · U_{c,d}`; the stored table
carries `sign(v)^{c+d} I_{c,d}`.

Obligations S4 (reality and enclosure) and S5 (transport, radius `(√(c+1)+√(d+1))·ρ`) of #303.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- The canonical pairs with `c + d = m` and `d ≤ dMax`: `c = max(0, m − dMax), …, ⌊(m+1)/2⌋`. -/
def rowRange (dMax m : Nat) : Nat × Nat := (m - dMax, (m + 1) / 2 + 1)

/-- Number of canonical pairs with `c + d = m`, `d ≤ dMax`. -/
def rowCount (dMax m : Nat) : Nat := let (a, b) := rowRange dMax m; b - a

/-- Number of canonical pairs with `c + d ≤ D`, `d ≤ dMax`. -/
def pairCount (D dMax : Nat) : Nat :=
  (List.range (D + 1)).foldl (fun s m => s + rowCount dMax m) 0

/-- The canonical pairs `c ≤ d + 1`, `c + d ≤ D`, `d ≤ dMax` in `(c+d, c)` order. -/
def canonicalPairs (D dMax : Nat) : Array (Nat × Nat) := Id.run do
  let mut out : Array (Nat × Nat) := Array.mkEmpty (pairCount D dMax)
  for m in [0:D+1] do
    let (a, b) := rowRange dMax m
    for c in [a:b] do
      out := out.push (c, m - c)
  return out

/-- `√n`. -/
def sqrtNatI (P : Nat) (n : Nat) : Ival := sqrtI P (ofNat P n)

/-- The zero row `U_{0,0}, …, U_{0,D}` from the ratios `r_0, …, r_{D-1}` (`ratios.size ≥ D`). -/
def zeroRowI (P : Nat) (aI : Ival) (ratios : Array Ival) (D : Nat) : Array Ival := Id.run do
  let mut row : Array Ival := Array.mkEmpty (D + 1)
  let mut u := ofInt P 1
  row := row.push u
  let negA := negI aI
  for d in [0:D] do
    let r := ratios.getD d ⟨0, 1, 0⟩
    u := divI P (mulI P (mulI P negA r) u) (sqrtNatI P (d + 1))
    row := row.push u
  return row

/-- The rows `U_{c,·}` for `c = 0, …, ⌊(D+1)/2⌋`: row `c` holds `d = dLo c, …, D − c` with
`dLo 0 = 0`, `dLo (c+1) = c`.  Row `c+1` is built from row `c` by the forward recurrence. -/
def triangleRowsI (P : Nat) (aI : Ival) (zero : Array Ival) (D : Nat) : Array (Array Ival) :=
  Id.run do
    let cMax := (D + 1) / 2
    let mut rows : Array (Array Ival) := Array.mkEmpty (cMax + 1)
    rows := rows.push zero
    let mut prev := zero
    let mut prevLo := 0
    for c in [0:cMax] do
      let denom := mulI P aI (sqrtNatI P (c + 1))
      let dHi := D - (c + 1)
      let mut row : Array Ival := Array.mkEmpty (dHi + 1 - c)
      for d in [c:dHi+1] do
        let u_cd := prev.getD (d - prevLo) zeroI
        let u_cd1 := prev.getD (d + 1 - prevLo) zeroI
        let charge : Int := (d : Int) + 1 - (c : Int)
        let num := addI P (mulI P (mulI P aI (sqrtNatI P (d + 1))) u_cd1) (mulZ P charge u_cd)
        row := row.push (divI P num denom)
      rows := rows.push row
      prev := row
      prevLo := c
    return rows

/-- Read `U_{c,d}` from the rows. -/
def rowsGet (rows : Array (Array Ival)) (c d : Nat) : Ival :=
  let lo := if c == 0 then 0 else c - 1
  (rows.getD c #[]).getD (d - lo) zeroI

/-- The normalized coefficients of the canonical pairs (`c + d ≤ D`, `d ≤ dMax`) in canonical
order; the recurrence runs over the whole triangle `c + d ≤ D`. -/
def normalizedTriangleI (P : Nat) (aI : Ival) (ratios : Array Ival) (D dMax : Nat) :
    Array Ival :=
  let rows := triangleRowsI P aI (zeroRowI P aI ratios D) D
  (canonicalPairs D dMax).map fun p => rowsGet rows p.1 p.2

/-- The actual coefficients `sign^{c+d} · S(A) · U_{c,d}` in canonical order, widened by the
transport radius `(√(c+1) + √(d+1)) · ρ` (`rho ≥ 0`). -/
def canonicalTriangleI (P : Nat) (scalar : Ival) (negSign : Bool) (rho : Ival)
    (aI : Ival) (ratios : Array Ival) (D dMax : Nat) : Array Ival :=
  let pairs := canonicalPairs D dMax
  let u := normalizedTriangleI P aI ratios D dMax
  let zeroRho := isZero rho
  (Array.range pairs.size).map fun i =>
    let (c, d) := pairs.getD i (0, 0)
    let v := mulI P scalar (u.getD i zeroI)
    let v := if negSign && (c + d) % 2 == 1 then negI v else v
    if zeroRho then v
    else widen P v (mulI P (addI P (sqrtNatI P (c + 1)) (sqrtNatI P (d + 1))) rho)

/-- The rank of `(c, d)` in canonical order (`d ≤ dMax`). -/
def canonicalRank (dMax c d : Nat) : Nat :=
  (List.range (c + d)).foldl (fun s m => s + rowCount dMax m) 0 + (c - (rowRange dMax (c + d)).1)

/-- The largest width (log₂) over an array of intervals. -/
def maxWidthLog2 (a : Array Ival) : Int :=
  a.foldl (fun m x => max m (widthLog2 x)) (-100000)

end GrotheQuad
