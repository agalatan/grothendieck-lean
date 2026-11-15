import Grothe.UpperChaos.Q0RawWickTerms
import Grothe.UpperChaos.ProfileRootSound

/-!
# Finite-sum presentation of source-derived raw Wick terms

This is the list-to-Finset conversion needed before comparing the source-derived
rational entries with the analytic per-term Wick sum. It makes no claim that
the raw entries already equal that Wick sum. Agent-ID: codex-8c4d.
-/

namespace Grothe.UpperChaos.Q0RawWickFiniteSums

open Grothe.UpperChaos.Q0RawWickTerms
open Grothe.UpperChaos.ProfileRootScreen

noncomputable section

/-- Sum a mapped flat list by first summing each inner list. -/
theorem sum_map_flatMap {α γ : Type*} (xs : List α) (f : α → List γ) (g : γ → ℝ) :
    ((xs.flatMap f).map g).sum = (xs.map fun x => ((f x).map g).sum).sum := by
  induction xs with
  | nil => simp
  | cons x xs ih => simp [List.flatMap_cons, List.map_append, List.sum_append, ih]

/-- Real evaluation of one source-derived rational raw entry. -/
def rawEntryValue (t : (ℕ × ℕ × ℕ) × ℚ) (S Z V : ℝ) : ℝ :=
  (t.2 : ℝ) * S ^ t.1.1 * Z ^ t.1.2.1 * V ^ t.1.2.2

/-- The source-derived list for one phase term evaluates to the corresponding
explicit nested finite sum over the binomial and Wick indices. -/
theorem Ssum_rawWickEntriesOfTerm (a b c : ℕ) (d : ℚ) (S Z V : ℝ) :
    Ssum (rawWickEntriesOfTerm ((a, b, c), d)) S Z V =
      ∑ k ∈ Finset.range (c + 1),
        ∑ j ∈ Finset.range ((2 * b + c + 2) / 2 + 1),
          rawEntryValue (rawWickEntry a b c d k j) S Z V := by
  change (((List.range (c + 1)).flatMap fun k =>
      (List.range ((2 * b + c + 2) / 2 + 1)).map fun j =>
        rawWickEntry a b c d k j).map fun t => rawEntryValue t S Z V).sum = _
  rw [sum_map_flatMap]
  simp only [List.map_map, Function.comp_def]
  rw [list_range_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [list_range_sum]

end
end Grothe.UpperChaos.Q0RawWickFiniteSums
