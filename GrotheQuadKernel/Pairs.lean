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

The rows are built by `Array.push` recursion over the row index (`zeroRowArr`, `rowsArr`), whose
entries are proved equal to the recursive specifications `zeroRowRec`, `rowRec`
(`Grothe/UpperQuad/PairsSound.lean`, obligations S4 of #303).

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- The canonical pairs with `c + d = m` and `d ≤ dMax`: `c = max(0, m − dMax), …, ⌊(m+1)/2⌋`
(the stored table has `dMax = 265`, hence `c ≤ 266` and `c + d ≤ 531`: 35,777 pairs). -/
def rowRange (dMax m : Nat) : Nat × Nat := (m - dMax, (m + 1) / 2 + 1)

/-- Number of canonical pairs with `c + d = m`, `d ≤ dMax`. -/
def rowCount (dMax m : Nat) : Nat := (rowRange dMax m).2 - (rowRange dMax m).1

/-- The canonical pairs of the level `m`, in increasing `c`. -/
def levelPairs (dMax m : Nat) : List (Nat × Nat) :=
  (List.range (rowCount dMax m)).map fun i => ((rowRange dMax m).1 + i, m - ((rowRange dMax m).1 + i))

/-- The canonical pairs `c ≤ d + 1`, `c + d ≤ D`, `d ≤ dMax` in `(c+d, c)` order. -/
def canonicalPairs (D dMax : Nat) : Array (Nat × Nat) :=
  ((List.range (D + 1)).flatMap fun m => levelPairs dMax m).toArray

/-- Number of canonical pairs with `c + d ≤ D`, `d ≤ dMax`. -/
def pairCount (D dMax : Nat) : Nat := (canonicalPairs D dMax).size

/-- `√n`. -/
def sqrtNatI (P : Nat) (n : Nat) : Ival := sqrtI P (ofNat P n)

/-- The zero-row step `U_{0,d+1} = −A · r_d · U_{0,d} / √(d+1)`. -/
def zeroStep (P : Nat) (aI : Ival) (r u : Ival) (d : Nat) : Ival :=
  divI P (mulI P (mulI P (negI aI) r) u) (sqrtNatI P (d + 1))

/-- The zero row as a pushed array: `zeroRowArr P aI ratios D` has entries `0 … D`. -/
def zeroRowArr (P : Nat) (aI : Ival) (ratios : Array Ival) : Nat → Array Ival
  | 0 => #[ofInt P 1]
  | d + 1 =>
    let prev := zeroRowArr P aI ratios d
    prev.push (zeroStep P aI (ratios.getD d ⟨0, 1, 0⟩) (prev.getD d zeroI) d)

/-- The forward step `U_{c+1,d} = (A √(d+1) · U_{c,d+1} + (d+1−c) · U_{c,d}) / (A √(c+1))`. -/
def forwardStep (P : Nat) (aI : Ival) (c d : Nat) (u_cd u_cd1 : Ival) : Ival :=
  divI P (addI P (mulI P (mulI P aI (sqrtNatI P (d + 1))) u_cd1)
    (mulZ P ((d : Int) + 1 - (c : Int)) u_cd)) (mulI P aI (sqrtNatI P (c + 1)))

/-- The first `d` of row `c`. -/
def rowLo (c : Nat) : Nat := c - 1

/-- Row `c + 1` from row `c` (stored from `rowLo c`), with `d = c, …, D − (c+1)`. -/
def nextRow (P : Nat) (aI : Ival) (D c : Nat) (prev : Array Ival) : Array Ival :=
  Array.ofFn fun i : Fin (D - (c + 1) + 1 - c) =>
    forwardStep P aI c (c + i) (prev.getD (c + i - rowLo c) zeroI) (prev.getD (c + i + 1 - rowLo c) zeroI)

/-- The rows `0 … n` as a pushed array of arrays. -/
def rowsArr (P : Nat) (aI : Ival) (zero : Array Ival) (D : Nat) : Nat → Array (Array Ival)
  | 0 => #[zero]
  | c + 1 =>
    let prev := rowsArr P aI zero D c
    prev.push (nextRow P aI D c (prev.getD c #[]))

/-- Read `U_{c,d}` from the rows. -/
def rowsGet (rows : Array (Array Ival)) (c d : Nat) : Ival :=
  (rows.getD c #[]).getD (d - rowLo c) zeroI

/-- The normalized coefficients of the canonical pairs (`c + d ≤ D`, `d ≤ dMax`) in canonical
order; the recurrence runs over the whole triangle `c + d ≤ D`. -/
def normalizedTriangleI (P : Nat) (aI : Ival) (ratios : Array Ival) (D dMax : Nat) :
    Array Ival :=
  let rows := rowsArr P aI (zeroRowArr P aI ratios D) D ((D + 1) / 2)
  (canonicalPairs D dMax).map fun p => rowsGet rows p.1 p.2

/-- The actual coefficient `sign^{c+d} · S(A) · U_{c,d}`, widened by the transport radius
`(√(c+1) + √(d+1)) · ρ` (`rho ≥ 0`). -/
def actualCoefficient (P : Nat) (scalar : Ival) (negSign : Bool) (rho : Ival) (c d : Nat)
    (u : Ival) : Ival :=
  let v := mulI P scalar u
  let v := if negSign && (c + d) % 2 == 1 then negI v else v
  if isZero rho then v
  else widen P v (mulI P (addI P (sqrtNatI P (c + 1)) (sqrtNatI P (d + 1))) rho)

/-- The actual coefficients `sign^{c+d} · S(A) · U_{c,d}` in canonical order. -/
def canonicalTriangleI (P : Nat) (scalar : Ival) (negSign : Bool) (rho : Ival)
    (aI : Ival) (ratios : Array Ival) (D dMax : Nat) : Array Ival :=
  let pairs := canonicalPairs D dMax
  let u := normalizedTriangleI P aI ratios D dMax
  (Array.range pairs.size).map fun i =>
    actualCoefficient P scalar negSign rho (pairs.getD i (0, 0)).1 (pairs.getD i (0, 0)).2
      (u.getD i zeroI)

/-- The rank of `(c, d)` in canonical order (`d ≤ dMax`). -/
def canonicalRank (dMax c d : Nat) : Nat :=
  (List.range (c + d)).foldl (fun s m => s + rowCount dMax m) 0 + (c - (rowRange dMax (c + d)).1)

/-- The largest width (log₂) over an array of intervals. -/
def maxWidthLog2 (a : Array Ival) : Int :=
  a.foldl (fun m x => max m (widthLog2 x)) (-100000)

end GrotheQuad
