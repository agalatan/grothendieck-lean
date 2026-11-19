import Grothe.UpperSix.HaagerupKernel.Basic

set_option warningAsError true

/-!
# Truncated bivariate kernel composition (Mathlib-free, precompiled)

Encloses the first `K` coefficients of

  `B(X) = ∑_m X^{⌊m/2⌋} · Q(X)^m · (∑_n E[n,m] · X^{⌊n/2⌋} · P(X)^n)`

for an interval energy table `tab : List RowI` supported on odd `n + m`.

Agent-ID: gemini-21d5
-/

namespace HaagerupKernel

/-- An interval energy table row: `(m, [(n, I_{n,m}), …])`. -/
abbrev RowI := Nat × List (Nat × Ival)

/-- Multiplication by `P`, truncated to `K` coefficients. -/
def mulT (K : Nat) (P L : List Ival) : List Ival := (convI P L).take K

/-- `[L, f L, …, f^[n-1] L]`. -/
def iterL (f : List Ival → List Ival) : Nat → List Ival → List (List Ival)
  | 0, _ => []
  | n + 1, L => L :: iterL f n (f L)

/-- Truncated powers `P^0, …, P^N` (each of length at most `K`). -/
def powsT (K : Nat) (P : List Ival) (N : Nat) : List (List Ival) :=
  iterL (mulT K P) (N + 1) [ofRatI 1]

/-- Prepend `k` zeros: multiplication by `X^k`. -/
def shiftX (k : Nat) (L : List Ival) : List Ival := List.replicate k zeroI ++ L

/-- First `K` coefficients of `∑_{(n, I) ∈ row} I · X^{⌊n/2⌋} · P^n`. -/
def rowSumT (K : Nat) (powP : List (List Ival)) : List (Nat × Ival) → List Ival
  | [] => []
  | (n, I) :: rest =>
    addL (shiftX (n / 2) (((powP.getD n []).take (K - n / 2)).map (mulI I))) (rowSumT K powP rest)

/-- First `K` coefficients of `X^{⌊m/2⌋} · Q^m · rowSum`. -/
def rowTermT (K : Nat) (powP powQ : List (List Ival)) (r : RowI) : List Ival :=
  (shiftX (r.1 / 2) (convI (powQ.getD r.1 []) (rowSumT K powP r.2))).take K

/-- Sum of a list of interval coefficient lists. -/
def sumL : List (List Ival) → List Ival
  | [] => []
  | L :: rest => addL L (sumL rest)

/-- First `K` interval coefficients of `B(X)` for an interval table `tab` with `n ≤ NZ`, `m ≤ MW`. -/
def bivarT (K : Nat) (tab : List RowI) (P Q : List Ival) (NZ MW : Nat) : List Ival :=
  let powP := powsT K P NZ
  let powQ := powsT K Q MW
  sumL (tab.map fun r => rowTermT K powP powQ r)

/-- Check that every entry `(n, _)` in row `m` satisfies `n + 3 m ≤ N` and `n + m` is odd. -/
def tabWithinI (N : Nat) (rows : List RowI) : Bool :=
  rows.all fun r =>
    decide (3 * r.1 ≤ N) && r.2.all fun e => decide (e.1 + 3 * r.1 ≤ N ∧ (e.1 + r.1) % 2 == 1)

end HaagerupKernel
