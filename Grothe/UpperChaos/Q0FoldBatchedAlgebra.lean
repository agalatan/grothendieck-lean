import GrotheKernel.PhiCheck
import Mathlib.Data.List.Basic

/-! Algebra for batched literal checks. The batch generator must prove the
list decomposition and link each group's concrete inputs and outputs.

Agent-ID: codex-8c4d
-/
namespace Grothe.UpperChaos.Q0FoldBatchedAlgebra
open GrotheKernel

private theorem zip_assoc {α : Type} (op : α → α → α)
    (h : ∀ a b c, op (op a b) c = op a (op b c))
    (a b c : List α) :
    zipAddG op (zipAddG op a b) c = zipAddG op a (zipAddG op b c) := by
  induction a generalizing b c with
  | nil => simp [zipAddG]
  | cons x xs ih =>
    cases b with
    | nil => simp [zipAddG]
    | cons y ys =>
      cases c with
      | nil => simp [zipAddG]
      | cons z zs => simp [zipAddG, h, ih]

theorem add3_assoc (a b c : List (List (List Int))) :
    add3 (add3 a b) c = add3 a (add3 b c) := by
  apply zip_assoc
  intro x y z
  apply zip_assoc
  intro p q r
  apply zip_assoc
  exact Int.add_assoc

theorem foldr_add3_acc (xs : List (List (List (List Int))))
    (acc : List (List (List Int))) :
    xs.foldr add3 acc = add3 (xs.foldr add3 []) acc := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
    simp only [List.foldr_cons, ih, add3_assoc]

theorem foldr_flatten_batched (groups : List (List (List (List (List Int))))) :
    groups.flatten.foldr add3 [] =
      (groups.map (fun g => g.foldr add3 [])).foldr add3 [] := by
  induction groups with
  | nil => rfl
  | cons g gs ih =>
    simp only [List.flatten_cons, List.foldr_append, List.map_cons, List.foldr_cons]
    rw [foldr_add3_acc, ih]

end Grothe.UpperChaos.Q0FoldBatchedAlgebra
