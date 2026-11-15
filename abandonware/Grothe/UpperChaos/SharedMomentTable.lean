import Mathlib.Basic.Real.Basic

/-!
# Bounded, externally supplied recurrence tables

This file proves an exact identity for any table satisfying its base and
successor equations on a bounded rectangle. It does not assert that a
particular external table satisfies those equations, and it proves no numeric
interval or upper bound.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.SharedMomentTable

/-- A two-index recurrence; the second index in the last argument is
truncated natural subtraction. This definition does not memoize. -/
def recTable {α : Type} (base : ℕ → α) (step : ℕ → α → α → α) : ℕ → ℕ → α
  | 0, q => base q
  | p + 1, q => step q (recTable base step p q) (recTable base step p (q - 1))

/-- A supplied table agrees with the recurrence throughout the requested
rectangle when each required table equation has been proved. The hypotheses
remain explicit, so the table contents are not trusted. -/
theorem eq_recTable_of_bounded_equations {α : Type}
    (base : ℕ → α) (step : ℕ → α → α → α) (table : ℕ → ℕ → α)
    (P Q : ℕ)
    (hbase : ∀ q, q ≤ Q → table 0 q = base q)
    (hstep : ∀ p q, p < P → q ≤ Q →
      table (p + 1) q = step q (table p q) (table p (q - 1)))
    (p q : ℕ) (hp : p ≤ P) (hq : q ≤ Q) :
    table p q = recTable base step p q := by
  induction p generalizing q with
  | zero => exact hbase q hq
  | succ p ih =>
      have hp' : p < P := Nat.lt_of_succ_le hp
      have hprev : p ≤ P := Nat.le_of_lt hp'
      have hqprev : q - 1 ≤ Q := (Nat.sub_le q 1).trans hq
      rw [hstep p q hp' hq, recTable, ih q hprev hq, ih (q - 1) hprev hqprev]

/-- Two supplied functions coincide throughout the rectangle when both obey
identical base and successor equations there. This form connects directly to
an existing recurrence definition without relying on definitional equality
between two recursive functions. -/
theorem eq_of_bounded_equations {α : Type}
    (base : ℕ → α) (step : ℕ → α → α → α) (table target : ℕ → ℕ → α)
    (P Q : ℕ)
    (hbase : ∀ q, q ≤ Q → table 0 q = base q)
    (hstep : ∀ p q, p < P → q ≤ Q →
      table (p + 1) q = step q (table p q) (table p (q - 1)))
    (htargetbase : ∀ q, q ≤ Q → target 0 q = base q)
    (htargetstep : ∀ p q, p < P → q ≤ Q →
      target (p + 1) q = step q (target p q) (target p (q - 1)))
    (p q : ℕ) (hp : p ≤ P) (hq : q ≤ Q) : table p q = target p q := by
  rw [eq_recTable_of_bounded_equations base step table P Q hbase hstep p q hp hq,
    eq_recTable_of_bounded_equations base step target P Q htargetbase htargetstep p q hp hq]

/-- The concrete real moment recurrence from the all-mode Wick evaluator.
The inverse-rate mass `b` is present in the base case. -/
def momentRec (r b v : ℝ) : ℕ → ℕ → ℝ :=
  recTable (fun q => b * (-(v * r)) ^ q)
    (fun q x y => -(v * r) * x + (q : ℝ) * b * y)

/-- Exact reuse of a checked bounded table for the real recurrence. -/
theorem eq_momentRec_of_bounded_equations (r b v : ℝ)
    (table : ℕ → ℕ → ℝ) (P Q : ℕ)
    (hbase : ∀ q, q ≤ Q → table 0 q = b * (-(v * r)) ^ q)
    (hstep : ∀ p q, p < P → q ≤ Q →
      table (p + 1) q = -(v * r) * table p q +
        (q : ℝ) * b * table p (q - 1))
    (p q : ℕ) (hp : p ≤ P) (hq : q ≤ Q) :
    table p q = momentRec r b v p q :=
  eq_recTable_of_bounded_equations _ _ _ P Q hbase hstep p q hp hq

end Grothe.UpperChaos.SharedMomentTable
