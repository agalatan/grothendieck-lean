import Grothe.UpperSix.Haagerup.GammaDagger
import Grothe.UpperSixExact.Result
import Grothe.UpperBivar.Bound

/-! # The upper bound for the complex Grothendieck constant

The multi-channel bivariate transfer gives a factor of `10^27 / 711969765819834623238463058` for
each finite complex matrix. The rounded bound is `1.404554025`. The certificate combines the
established `UpperSixExact` channels with twelve additional preprocessors on the already-certified
smoothed cell (`tcellRows`), phase (`haagMuList`), and reflected tiger (`tigMuList`) maps,
including higher-degree bivariate second-coordinate polynomials `Q(X)` (`Grothe/UpperBivar/`).
-/

set_option warningAsError true

namespace Grothe.UpperBivar

/-- Admissibility at the exact multi-channel transfer endpoint, for every finite complex matrix. -/
theorem bound : Statement.IsBound ((10 : ℝ) ^ 27 / 711969765819834623238463058) :=
  Haagerup.UpperBivar.isBound

/-- The multi-channel bound rounded upward to nine decimal places. -/
theorem constant_le : Statement.complexGrothendieckConstant ≤ 1404554025 / 1000000000 := by
  have h : Statement.complexGrothendieckConstant ≤ (10 : ℝ) ^ 27 / 711969765819834623238463058 :=
    csInf_le Haagerup.Statement.bounds_bddBelow bound
  exact h.trans (by norm_num)

/-- The multi-channel bound also implies the strict comparison with Haagerup's proposed value. -/
theorem constant_lt_inv_gammaDagger :
    Statement.complexGrothendieckConstant < 1 / Haagerup.Statement.gammaDagger := by
  refine constant_le.trans_lt ?_
  rw [lt_div_iff₀ Haagerup.gammaDagger_pos]
  calc (1404554025 / 1000000000 : ℝ) * Haagerup.Statement.gammaDagger
      < (1404554025 / 1000000000 : ℝ) * (711958683 / 1000000000) := by
        gcongr; exact Haagerup.gammaDagger_bounds.2
    _ < 1 := by norm_num

end Grothe.UpperBivar
