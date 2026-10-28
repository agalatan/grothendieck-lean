import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic.Ring
import Lean.Util.CollectAxioms
import Lean.Elab.Command

open scoped BigOperators
/-! Exact row-major rectangular integer square sums are the fold of the same
actual array. The size equality is the only premise; no numerical source,
copied witness, parser, or native computation is used. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.ThirdFoldRectangle

theorem range_rectangle (m n : ℕ) (f : ℕ → ℤ) :
    (∑ c ∈ Finset.range m, ∑ d ∈ Finset.range n, f (c * n + d)) =
      ∑ k ∈ Finset.range (m * n), f k := by
  induction m with
  | zero => simp
  | succ m ih =>
    rw [Finset.sum_range_succ, ih, Nat.succ_mul, Finset.sum_range_add]

theorem list_fold_start (xs : List ℤ) (z : ℤ) :
    xs.foldl (fun a x => a + x ^ 2) z = z + xs.foldl (fun a x => a + x ^ 2) 0 := by
  induction xs generalizing z with
  | nil => simp
  | cons x xs ih =>
    simp only [List.foldl_cons, zero_add]
    rw [ih (z + x ^ 2), ih (x ^ 2)]
    ring

theorem list_range_fold (xs : List ℤ) :
    (∑ k ∈ Finset.range xs.length, (xs[k]?.getD 0) ^ 2) =
      xs.foldl (fun a x => a + x ^ 2) 0 := by
  induction xs with
  | nil => simp
  | cons x xs ih =>
    rw [List.length_cons, Finset.sum_range_succ']
    simp only [List.getElem?_cons_zero, Option.getD_some, List.getElem?_cons_succ]
    rw [ih]
    simp only [List.foldl_cons, zero_add]
    rw [list_fold_start xs (x ^ 2)]
    ring

theorem array_range_fold (xs : Array ℤ) :
    (∑ k ∈ Finset.range xs.size, (xs[k]?.getD 0) ^ 2) =
      xs.foldl (fun a x => a + x ^ 2) 0 := by
  have h := list_range_fold xs.toList
  simpa only [Array.length_toList, Array.getElem?_toList, Array.foldl_toList] using h

theorem grade_rectangle_fold (xs : Array ℤ) (m n : ℕ) (hsize : xs.size = m * n) :
    (∑ c ∈ Finset.range m, ∑ d ∈ Finset.range n, (xs[c * n + d]?.getD 0) ^ 2) =
      xs.foldl (fun a x => a + x ^ 2) 0 := by
  have h := range_rectangle m n (fun k => (xs[k]?.getD 0) ^ 2)
  rw [← hsize] at h
  exact h.trans (array_range_fold xs)
open Lean Elab Command
run_cmd do
  let target := ``grade_rectangle_fold
  let axioms ← Lean.collectAxioms target
  logInfo m!"Audit {target}: {axioms}"
  for ax in axioms do
    unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
      throwError m!"{target} has forbidden axiom {ax}"
end Grothe.UpperChaos.ThirdFoldRectangle
