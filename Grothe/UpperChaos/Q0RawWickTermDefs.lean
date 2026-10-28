import Grothe.UpperChaos.PhaseTermsDefs
import Mathlib.Data.Nat.Choose.Basic

/-! Lightweight source-derived rational q0 Wick term definitions.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0RawWickTerms

/-- The signed Wick binomial factor, defined over the rationals. -/
def imSqBinomialFactorQ (p q j : ℕ) : ℚ :=
  2 * ((p + 1).choose j : ℚ) * ((q + 1).choose j : ℚ) -
    ((p + 2).choose j : ℚ) * (q.choose j : ℚ) -
      (p.choose j : ℚ) * ((q + 2).choose j : ℚ)

/-- One source-derived trivariate term. The variables represent `s`, `β⁻¹`,
and `κt/β`; the sign from the real shift is included in the coefficient. -/
def rawWickEntry (a b c : ℕ) (d : ℚ) (k j : ℕ) : (ℕ × ℕ × ℕ) × ℚ :=
  let p := b + k
  let q := b + (c - k)
  let n := 2 * b + c + 2 - 2 * j
  ((a + b + c + 1 - j, j + 1, n),
    d * (c.choose k : ℚ) * imSqBinomialFactorQ p q j * (j.factorial : ℚ) *
      (-1 : ℚ) ^ n / (4 * (2 : ℚ) ^ c))

/-- Expand one source-format phase term into the ungrouped rational entries. -/
def rawWickEntriesOfTerm (t : (ℕ × ℕ × ℕ) × ℚ) : List ((ℕ × ℕ × ℕ) × ℚ) :=
  (List.range (t.1.2.2 + 1)).flatMap fun k =>
    (List.range ((2 * t.1.2.1 + t.1.2.2 + 2) / 2 + 1)).map fun j =>
      rawWickEntry t.1.1 t.1.2.1 t.1.2.2 t.2 k j

/-- Concatenate ungrouped entries derived from a source-format term list. -/
def rawWickEntries : List ((ℕ × ℕ × ℕ) × ℚ) → List ((ℕ × ℕ × ℕ) × ℚ)
  | [] => []
  | t :: ts => rawWickEntriesOfTerm t ++ rawWickEntries ts

/-- Actual-source candidate terms. This is derived from the Lean phase data,
not from the external compression output. -/
def q0RawWickEntries : List ((ℕ × ℕ × ℕ) × ℚ) :=
  rawWickEntries phaseTerms

end Grothe.UpperChaos.Q0RawWickTerms
