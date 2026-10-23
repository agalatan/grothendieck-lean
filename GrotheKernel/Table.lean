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
rows are processed sequentially (single-threaded native code).

The table itself is stored as strings of exact dyadic rationals, one per row (`parseRow`).
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

/-! ### Interval rows -/

/-- An interval table row: the `m` index and its `(n, E[n,m])` entries. -/
abbrev RowI := Nat × List (Nat × Ival)

/-- The thin interval rows of an exact table. -/
def tabI (rows : List RowQ) : List RowI :=
  rows.map fun r => (r.1, r.2.map fun e => (e.1, ofRatI e.2))

/-! ### Truncated composition -/

/-- Multiplication by `P`, truncated to `K` coefficients. -/
def mulT (K : Nat) (P L : List Ival) : List Ival := (convI P L).take K

/-- `[L, f L, …, f^[n-1] L]`. -/
def iterL (f : List Ival → List Ival) : Nat → List Ival → List (List Ival)
  | 0, _ => []
  | n + 1, L => L :: iterL f n (f L)

/-- The powers `P^0, …, P^N`, each truncated to `K` coefficients. -/
def powsT (K : Nat) (P : List Ival) (N : Nat) : List (List Ival) :=
  iterL (mulT K P) (N + 1) [ofRatI 1]

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

/-- **The first `K` coefficients of `B`** ; `NZ`, `MW` bound the indices `n`,
`m` of the table. -/
def bivarT (K : Nat) (tab : List RowI) (P Q : List Ival) (NZ MW : Nat) : List Ival :=
  let powP := powsT K P NZ
  let powQ := powsT K Q MW
  sumL (tab.map fun r => rowTermT K powP powQ r)

/-- All indices of the table satisfy `n + 3m ≤ N`. -/
def tabWithin (N : Nat) (rows : List RowQ) : Bool :=
  rows.all fun r => decide (3 * r.1 ≤ N) && r.2.all fun e => e.1 + 3 * r.1 ≤ N

/-- Scaled upper bound for the head `Σ_{j < (N+1)/2} |B_j − c·δ_{j0}|` of the residual of the
kernel of the exact table `rows`, with `P`, `Q` given by the coefficient lists `pl`, `ql`. -/
def headInt (N : Nat) (rows : List RowQ) (pl ql : List Rat) (c : Rat) : Int :=
  absSum (addL (bivarT ((N + 1) / 2) (tabI rows) (pl.map ofRatI) (ql.map ofRatI) N (N / 3))
    [negI (ofRatI c)])

/-- **The head check**: the table has indices `n + 3m ≤ N`, and the head of the residual of its
kernel is at most `cap`. -/
def headOK (N : Nat) (rows : List RowQ) (pl ql : List Rat) (c cap : Rat) : Bool :=
  tabWithin N rows && decide (headInt N rows pl ql c ≤ ofRatLo cap)

end GrotheKernel
