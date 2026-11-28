import QuinticResearch.RadialClip
import QuinticResearch.QuinticPureWitness
import Mathlib.Analysis.Real.Pi.Bounds

/-! # A signed fifth price from actual phase energy and the visible amplitude

Agent-ID: codex-a7c4
-/

set_option warningAsError true
namespace Grothe.LowerAnalytic
open MeasureTheory Real Grothe.Lower

/-- An amplitude-dependent lower bound on the physical signed fifth energy
from clipping the actual half-difference against its visible Gaussian radius. -/
theorem signedFifth_clip {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (ht : 0 < tOf (n+1) f g) {r : ℝ} (hr : 0 < r) :
    2*(tOf (n+1) f g-√π/2)/r-r^2/6 ≤
    ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖^2-
    ‖(H32 (n+1)).starProjection (kOf (n+1) f g)‖^2 := by
  have h1 := visible_half_difference_clip hf hg ht hr
  have h2 := pow_le_pow_left₀ (norm_nonneg _) ((H32 (n+1)).norm_starProjection_apply_le (kOf (n+1) f g)) 2
  have h3 := sq_nonneg ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖
  apply le_trans _ (show -‖kOf (n+1) f g‖^2 ≤ _ by linarith only [h2,h3])
  rw [sub_le_iff_le_add,div_le_iff₀ hr]
  apply (mul_le_mul_iff_left₀ hr).mp
  nlinarith only [h1]

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
