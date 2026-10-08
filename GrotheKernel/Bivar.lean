import GrotheKernel.Basic

/-!
# Bivariate (two-coordinate) kernel composition

A two-coordinate rounding has the radial kernel
`K(t) = Σ_{n,m} μ[n,m] · ρ(t)^n · σ(t)^m` with `ρ(t) = t·P(t²)`, `σ(t) = t·Q(t²)` and a table `μ`
supported on `n + m` odd.  Writing `X = t²`, `ρ^n σ^m = t · X^{⌊n/2⌋ + ⌊m/2⌋} · P^n · Q^m`, so the
radial coefficient sequence of `K` is the coefficient list of the polynomial

  `B(X) = Σ_m X^{⌊m/2⌋} · Q^m · (Σ_n μ[n,m] · X^{⌊n/2⌋} · P^n)`.

The table is given row by row (`(m, [(n, μ[n,m]), …])`).  Everything is computed *without*
truncation (the lists are the full finite polynomials), so that the discarded part beyond the
retained length is just `absSumFrom`.  The rows are processed in parallel tasks.
-/

namespace GrotheKernel

/-- An interval table row: the `m` index and its `(n, μ[n,m])` entries. -/
abbrev RowI := Nat × List (Nat × Ival)

/-- The powers `P^0, …, P^N` as interval lists (full, untruncated). -/
def powsI (P : List Ival) : Nat → List (List Ival)
  | 0 => [[ofRatI 1]]
  | N + 1 =>
    let prev := powsI P N
    prev ++ [convI P (prev.getLastD [])]

/-- `k` leading zero coefficients: multiplication by `X^k`. -/
def shiftX (k : Nat) (L : List Ival) : List Ival := List.replicate k zeroI ++ L

/-- `Σ_{(n, I) ∈ row} I · X^{⌊n/2⌋} · P^n`, with `powP` the list of powers of `P`. -/
def rowSumI (powP : List (List Ival)) : List (Nat × Ival) → List Ival
  | [] => []
  | (n, I) :: rest => addL (shiftX (n / 2) ((powP.getD n []).map (mulI I))) (rowSumI powP rest)

/-- The contribution of one row: `X^{⌊m/2⌋} · Q^m · rowSum`. -/
def rowTermI (powP powQ : List (List Ival)) (r : RowI) : List Ival :=
  shiftX (r.1 / 2) (convI (powQ.getD r.1 []) (rowSumI powP r.2))

/-- Sum of a list of interval coefficient lists. -/
def sumL : List (List Ival) → List Ival
  | [] => []
  | L :: rest => addL L (sumL rest)

/-- **The full finite polynomial `B`** of a two-coordinate branch (rows in parallel). -/
def bivarFull (tab : List RowI) (P Q : List Ival) (NZ MW : Nat) : List Ival :=
  let powP := powsI P NZ
  let powQ := powsI Q MW
  sumL ((tab.map fun r => Task.spawn fun _ => rowTermI powP powQ r).map Task.get)

/-- The sequential version (same value; used by the soundness proof). -/
def bivarFullSeq (tab : List RowI) (P Q : List Ival) (NZ MW : Nat) : List Ival :=
  sumL (tab.map (rowTermI (powsI P NZ) (powsI Q MW)))

/-- The retained column (`K` coefficients) and the scaled bound of the discarded coefficients. -/
def bivarCol (tab : List RowI) (P Q : List Ival) (NZ MW K : Nat) : List Ival × Int :=
  let B := bivarFull tab P Q NZ MW
  (B.take K, absSumFrom K B)

end GrotheKernel
