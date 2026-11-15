import GrotheKernel.PhiCheck

/-!
# Common denominators of concatenated source lists

The general fold lemma separates an initial LCM accumulator from the LCM of
a list. The source-list result then follows from `List.foldl_append`.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.CommonDenAppend

/-- An arbitrary initial LCM accumulator combines with the fold from one. -/
theorem foldl_lcm_seed {α : Type} (den : α → Nat) (xs : List α) (seed : Nat) :
    xs.foldl (fun acc x => Nat.lcm acc (den x)) seed =
      Nat.lcm seed (xs.foldl (fun acc x => Nat.lcm acc (den x)) 1) := by
  induction xs generalizing seed with
  | nil => simp
  | cons x xs ih =>
      simp only [List.foldl_cons, Nat.lcm_one_left]
      rw [ih (Nat.lcm seed (den x)), ih (den x), Nat.lcm_assoc]

/-- The common denominator of concatenated source-format lists is the LCM
of their separately computed common denominators. -/
theorem commonDen_append (xs ys : List ((Nat × Nat × Nat) × Rat)) :
    GrotheKernel.commonDen (xs ++ ys) =
      Nat.lcm (GrotheKernel.commonDen xs) (GrotheKernel.commonDen ys) := by
  unfold GrotheKernel.commonDen
  rw [List.foldl_append, foldl_lcm_seed]

end Grothe.UpperChaos.CommonDenAppend
