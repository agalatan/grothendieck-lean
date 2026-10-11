import GrotheKernel.Basic

/-!
# Truncated bivariate (two-coordinate) kernel composition

A two-coordinate rounding has the radial kernel
`H(t) = Σ_{n,m} E[n,m] · ρ(t)^n · σ(t)^m` with `ρ(t) = t·P(t²)`, `σ(t) = t·Q(t²)` and a table `E`
supported on `n + m` odd.  Writing `X = t²`, `ρ^n σ^m = t · X^{⌊n/2⌋ + ⌊m/2⌋} · P^n · Q^m`, so the
radial coefficient sequence of `H` is the coefficient sequence of

  `B(X) = Σ_m X^{⌊m/2⌋} · Q^m · (Σ_n E[n,m] · X^{⌊n/2⌋} · P^n)`.

`bivarT K` encloses the first `K` coefficients of `B` for a finite table given row by row
(`(m, [(n, E[n,m]), …])`); every intermediate polynomial is truncated to `K` coefficients.  The
rows are processed in parallel tasks.

The table itself is stored as a string of exact dyadic rationals (`parseTable`).
-/

namespace GrotheKernel

/-! ### The table format -/

/-- An exact table row: the `m` index and its `(n, E[n,m])` entries. -/
abbrev RowQ := Nat × List (Nat × Rat)

/-- `"n,a,k"` is the entry `(n, a / 2^k)`. -/
def parseEntry (s : String) : Nat × Rat :=
  match s.splitOn "," with
  | [n, a, k] => (n.toNat!, (a.toNat! : Rat) / ((2 ^ k.toNat! : Nat) : Rat))
  | _ => (0, 0)

/-- `"m:e;e;…"` is the row `m` with entries `e`. -/
def parseRow (s : String) : RowQ :=
  match s.splitOn ":" with
  | [m, es] => (m.toNat!, (es.splitOn ";").map parseEntry)
  | _ => (0, [])

/-- Rows are separated by `|`. -/
def parseTable (s : String) : List RowQ := (s.splitOn "|").map parseRow

/-! ### Interval rows -/

/-- An interval table row: the `m` index and its `(n, E[n,m])` entries. -/
abbrev RowI := Nat × List (Nat × Ival)

/-- The thin interval rows of an exact table. -/
def tabI (rows : List RowQ) : List RowI :=
  rows.map fun r => (r.1, r.2.map fun e => (e.1, ofRatI e.2))

/-! ### Truncated composition -/

/-- The powers `P^0, …, P^N`, each truncated to `K` coefficients. -/
def powsT (K : Nat) (P : List Ival) : Nat → List (List Ival)
  | 0 => [[ofRatI 1]]
  | N + 1 =>
    let prev := powsT K P N
    prev ++ [(convI P (prev.getLastD [])).take K]

/-- `k` leading zero coefficients: multiplication by `X^k`. -/
def shiftX (k : Nat) (L : List Ival) : List Ival := List.replicate k zeroI ++ L

/-- The first `K` coefficients of `Σ_{(n, I) ∈ row} I · X^{⌊n/2⌋} · P^n`, with `powP` the list of
(truncated) powers of `P`. -/
def rowSumT (K : Nat) (powP : List (List Ival)) : List (Nat × Ival) → List Ival
  | [] => []
  | (n, I) :: rest =>
    addL (shiftX (n / 2) (((powP.getD n []).take (K - n / 2)).map (mulI I))) (rowSumT K powP rest)

/-- The first `K` coefficients of the contribution `X^{⌊m/2⌋} · Q^m · rowSum` of one row. -/
def rowTermT (K : Nat) (powP powQ : List (List Ival)) (r : RowI) : List Ival :=
  (shiftX (r.1 / 2) (convI (powQ.getD r.1 []) (rowSumT K powP r.2))).take K

/-- Sum of a list of interval coefficient lists. -/
def sumL : List (List Ival) → List Ival
  | [] => []
  | L :: rest => addL L (sumL rest)

/-- **The first `K` coefficients of `B`** (rows in parallel); `NZ`, `MW` bound the indices `n`,
`m` of the table. -/
def bivarT (K : Nat) (tab : List RowI) (P Q : List Ival) (NZ MW : Nat) : List Ival :=
  let powP := powsT K P NZ
  let powQ := powsT K Q MW
  sumL ((tab.map fun r => Task.spawn fun _ => rowTermT K powP powQ r).map Task.get)

/-- The sequential version (same value; used by the soundness proof). -/
def bivarTSeq (K : Nat) (tab : List RowI) (P Q : List Ival) (NZ MW : Nat) : List Ival :=
  sumL (tab.map (rowTermT K (powsT K P NZ) (powsT K Q MW)))

/-- Scaled upper bound for `Σ_{j < K} |B_j − c·δ_{j0}|`. -/
def headDev (K : Nat) (tab : List RowI) (P Q : List Ival) (NZ MW : Nat) (c : Ival) : Int :=
  absSumFrom 0 (addL (bivarT K tab P Q NZ MW) [negI c])

/-- All indices of the table satisfy `n + 3m ≤ N`. -/
def tabWithin (N : Nat) (rows : List RowQ) : Bool :=
  rows.all fun r => decide (3 * r.1 ≤ N) && r.2.all fun e => e.1 + 3 * r.1 ≤ N

end GrotheKernel
