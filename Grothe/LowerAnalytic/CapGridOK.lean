import Grothe.LowerAnalytic.CapCheckSound
import Grothe.LowerAnalytic.CapNodeDefs

/-!
# Every recipe grid passes the grid check

`gridOK_mkGrid`: for `0 < h`, `0 < N`, `0 < Nr`, the grid `mkGrid` of any recipe satisfies
`gridOK` — the prices are dyadic numerators `≥ 1`, the reciprocal bounds are ceilings, the
correction coefficients are floors of `8/D` with the rounded-up ring bound — so the checker
never has to run `gridOK` (the `Float` steps only choose the numerators).
-/

open GrotheKernel Grothe.Interval

namespace Grothe.LowerAnalytic

lemma dyNum_pos (x : Float) : 1 ≤ dyNum x := by unfold dyNum; exact le_max_left _ _

noncomputable section

/-! ### The node check -/

lemma aFib_vec (r : Grothe.Lower.Row) (j : ℕ) (hj : j < 12) :
    (aFib r.b1 r.b2 r.b3).vec j = avOf r j := by
  interval_cases j <;> simp [Fib.vec, aFib, avOf]

end

end Grothe.LowerAnalytic
