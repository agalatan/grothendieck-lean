import Mathlib.Data.Int.Basic

/-! Generic exact addition of integer array square energies. -/
namespace Grothe.UpperChaos.ArraySquareEnergy

def energy (xs : Array ℤ) : ℤ := xs.foldl (fun acc x => acc + x ^ 2) 0

private theorem list_fold_add (xs : List ℤ) (a : ℤ) :
    xs.foldl (fun acc x => acc + x ^ 2) a =
      a + xs.foldl (fun acc x => acc + x ^ 2) 0 := by
  induction xs generalizing a with
  | nil => simp
  | cons x xs ih =>
    simp only [List.foldl_cons]
    rw [ih (a + x ^ 2), ih (0 + x ^ 2)]
    simp only [Int.zero_add, Int.add_assoc]

theorem fold_add (xs : Array ℤ) (a : ℤ) :
    xs.foldl (fun acc x => acc + x ^ 2) a = a + energy xs := by
  unfold energy
  rw [← Array.foldl_toList, ← Array.foldl_toList]
  exact list_fold_add xs.toList a

theorem energy_append (xs ys : Array ℤ) : energy (xs ++ ys) = energy xs + energy ys := by
  unfold energy
  rw [Array.foldl_append, fold_add]
  rfl
end Grothe.UpperChaos.ArraySquareEnergy
