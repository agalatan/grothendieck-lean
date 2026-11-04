import Grothe.UpperChaos.Q0OrdinalCoverage

/-! Convert a complete row ordinal ledger sum to a finite-indexed sum.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0OrdinalSum

/-- A range list and the corresponding finite type sum the same function. -/
theorem range_sum (f : ℕ → ℝ) (n : ℕ) :
    ((List.range n).map f).sum = ∑ i : Fin n, f i.val := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [List.range_succ, List.map_append, List.sum_append]
    simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero]
    rw [Fin.sum_univ_castSucc]
    simpa only [Fin.val_castSucc, Fin.val_last] using congrArg (fun x => x + f n) ih

/-- When row ordinals enumerate an initial range, the ledger sum can be
reindexed by the finite ordinal type without changing multiplicity. -/
theorem rows_sum {α : Type*} (index : α → ℕ) (rows : List α) (n : ℕ)
    (h : rows.map index = List.range' 0 n) (f : ℕ → ℝ) :
    (rows.map (fun r => f (index r))).sum = ∑ i : Fin n, f i.val := by
  have hm : rows.map (fun r => f (index r)) = (List.range' 0 n).map f := by
    simpa only [List.map_map, Function.comp_def] using congrArg (List.map f) h
  rw [hm, ← List.range_eq_range']
  exact range_sum f n


/-- A finite equivalence reindexes the ledger sum without changing terms. -/
theorem rows_sum_equiv {α β : Type*} [Fintype β] (index : α → ℕ)
    (rows : List α) (n : ℕ) (h : rows.map index = List.range' 0 n)
    (e : Fin n ≃ β) (f : ℕ → ℝ) (g : β → ℝ)
    (hfg : ∀ i, f i.val = g (e i)) :
    (rows.map (fun r => f (index r))).sum = ∑ b : β, g b := by
  calc
    _ = ∑ i : Fin n, f i.val := rows_sum index rows n h f
    _ = ∑ i : Fin n, g (e i) := by
      apply Finset.sum_congr rfl
      intro i _
      exact hfg i
    _ = ∑ b : β, g b := e.sum_comp g

end Grothe.UpperChaos.Q0OrdinalSum
