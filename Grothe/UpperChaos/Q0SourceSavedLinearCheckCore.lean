import Grothe.UpperChaos.Q0SourceSavedLinearModel

/-!
# Exact checker for decoded exceptional-row linear fits

Only rational saved-data quantities enter this check. An accepted row does
not by itself enclose the physical Gaussian profile ratio. Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.Q0SourceSavedLinearCheckCore

open Q0SourceExceptionCenters Q0SourceSavedLinearModel

/-- The fitted parameter and one coupled five-coordinate squared residual. -/
def rowOK (row : Row) : Bool :=
  decide (|fitParameter row| < (1 / 10 ^ 15 : ℚ) ∧
    modelErrorSq row (fitParameter row) < (1 / 10 ^ 31 : ℚ) ^ 2)

theorem rowOK_sound (row : Row) (h : rowOK row = true) :
    |fitParameter row| < (1 / 10 ^ 15 : ℚ) ∧
      modelErrorSq row (fitParameter row) < (1 / 10 ^ 31 : ℚ) ^ 2 :=
  of_decide_eq_true h

end Grothe.UpperChaos.Q0SourceSavedLinearCheckCore
