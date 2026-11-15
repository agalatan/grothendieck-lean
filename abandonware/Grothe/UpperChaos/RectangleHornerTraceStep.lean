import Grothe.UpperChaos.RectangleHornerTrace

/-!
Compose one checked Horner step without re-evaluating its arithmetic.

The conclusion retains the `Trace.check` head. Generated applications can match
it directly against a concrete trace node, instead of unfolding the complete
recursive Boolean check to match an `And` introduction.

Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.RectangleHornerTrace

open RectangleModelCheck

theorem Trace.check_cons (argument a : Model) (inputs : List Model)
    (product result : Model) (mulBudget addBudget : ℚ) (tail : Trace)
    (ht : tail.check argument inputs = true)
    (hm : mulOK tail.output argument product mulBudget = true)
    (ha : addOK product a result addBudget = true) :
    (Trace.cons product result mulBudget addBudget tail).check argument (a :: inputs) = true := by
  exact Bool.and_eq_true_iff.mpr ⟨ht, Bool.and_eq_true_iff.mpr ⟨hm, ha⟩⟩

end Grothe.UpperChaos.RectangleHornerTrace
