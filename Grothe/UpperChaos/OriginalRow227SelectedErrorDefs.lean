import Grothe.UpperChaos.OriginalRow227ErrorBoundary
import Grothe.UpperChaos.ConditionalNodeIndices
import Grothe.UpperChaos.Q0ConditionalPairRankCheck
import Mathlib.Data.Finset.Card
import Mathlib.Data.List.Nodup

/-!
Generated selected-error certificate. Regenerate with tools/gen_row227_full_certificate.py.
Shared list, ordinal and append-sum APIs for bounded blocks.
All records come from committed certificate.json.gz; hashes are provenance only.
No actual vector/error bound follows until checkpoint and payload bindings are proved.
Agent-ID: codex-aa04. Refs #293, #21.
-/

open scoped BigOperators

namespace Grothe.UpperChaos.OriginalRow227SelectedError.Data

open OriginalRow227ErrorBoundary


def entryKey (e : ErrorEntry) : ℕ × ℕ := (e.c, e.d)

/-- The ordinal of `(c,d)` in the original selected order: d first, then c. -/
def keyOrdinal (p : ℕ × ℕ) : ℕ := p.2 * (p.2 + 3) / 2 + p.1

def entryOrdinal (e : ErrorEntry) : ℕ := keyOrdinal (entryKey e)

/-- Finite index and representation guards. Payload lookup and true
coefficient enclosure are separate obligations. -/
def entryValid (e : ErrorEntry) : Bool :=
  decide (e.d ≤ 250 ∧ e.c ≤ e.d + 1 ∧
    e.rank = Q0ConditionalPairRankCheck.rank e.c e.d ∧
    e.word < 2 ^ 64 ∧ 1 ≤ Q0SourceExceptionCenters.exponent e.word ∧
    Q0SourceExceptionCenters.exponent e.word ≤ 1023 ∧ 0 ≤ e.radius)

theorem entryValid_mem_modes (e : ErrorEntry) (h : entryValid e = true) :
    entryKey e ∈ ConditionalNodeIndices.modes := by
  have hv : e.d ≤ 250 ∧ e.c ≤ e.d + 1 ∧
      e.rank = Q0ConditionalPairRankCheck.rank e.c e.d ∧
      e.word < 2 ^ 64 ∧ 1 ≤ Q0SourceExceptionCenters.exponent e.word ∧
      Q0SourceExceptionCenters.exponent e.word ≤ 1023 ∧ 0 ≤ e.radius :=
    of_decide_eq_true h
  exact (ConditionalNodeIndices.mem_modes e.c e.d).mpr ⟨hv.1, hv.2.1⟩

/-- Append arithmetic is symbolic in the lists. Its final premise is a
single addition of the two separately checked integer totals. -/
theorem sum_map_append_eq (xs ys : List ErrorEntry) (f : ErrorEntry → ℤ)
    (a b total : ℤ) (hx : (xs.map f).sum = a) (hy : (ys.map f).sum = b)
    (hadd : a + b = total) : ((xs ++ ys).map f).sum = total := by
  rw [List.map_append, List.sum_append, hx, hy]
  exact hadd

/-- Adjacent ordinal ranges compose without computing either list. -/
theorem ordinals_append {xs ys : List ErrorEntry} {first leftCount rightCount : ℕ}
    (hx : xs.map entryOrdinal = List.range' first leftCount)
    (hy : ys.map entryOrdinal = List.range' (first + leftCount) rightCount) :
    (xs ++ ys).map entryOrdinal = List.range' first (leftCount + rightCount) := by
  rw [List.map_append, hx, hy]
  exact (List.range'_append_1 (s := first) (m := leftCount) (n := rightCount)).symm



open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227SelectedError.Data.entryValid_mem_modes,
      ``Grothe.UpperChaos.OriginalRow227SelectedError.Data.sum_map_append_eq,
      ``Grothe.UpperChaos.OriginalRow227SelectedError.Data.ordinals_append] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227SelectedError.Data
