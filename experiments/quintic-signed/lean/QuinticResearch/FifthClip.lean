import QuinticResearch.RadialClip
import QuinticResearch.QuinticPureWitness
import Mathlib.Analysis.Real.Pi.Bounds
import Grothe.LowerAnalytic.Fifth.RadialBounds

/-! A numerical corollary of the signed fifth clipping estimate. Agent-ID: codex-a7c4 -/

set_option warningAsError true

namespace Grothe.LowerAnalytic
open MeasureTheory Real Grothe.Lower

theorem signedFifth_clip_828 {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (ht : 207/250 ≤ tOf (n+1) f g) :
    -(1/4:ℝ) ≤ ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖^2-
    ‖(H32 (n+1)).starProjection (kOf (n+1) f g)‖^2 := by
  apply le_trans _ (signedFifth_clip hf hg (lt_of_lt_of_le (by norm_num) ht) (r := 2/3) (by norm_num))
  have hm : √π ≤ 2*(886227/1000000) := by
    apply Real.sqrt_le_iff.mpr
    constructor
    · norm_num
    · norm_num
      linarith [Real.pi_lt_d6]
  norm_num at hm ht ⊢
  linarith only [hm,ht]

end Grothe.LowerAnalytic
