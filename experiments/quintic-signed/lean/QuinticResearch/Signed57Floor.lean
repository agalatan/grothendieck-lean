import QuinticResearch.FifthClip
import QuinticResearch.SignedRadial

/-! # A global quadratic price for the physical fifth projection

Agent-ID: codex-a7c4
-/
set_option warningAsError true
namespace Grothe.LowerAnalytic
open MeasureTheory Real Grothe.Lower

/-- A single quadratic price applies to every physical amplitude, including zero. -/
theorem signedFifth_quadratic_floor {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1)))) :
    41/20*(tOf (n+1) f g)^2-3371/2000 ≤
      ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖^2-
      ‖(H32 (n+1)).starProjection (kOf (n+1) f g)‖^2 := by
  let t := tOf (n+1) f g
  have ht0 : 0 ≤ t := norm_nonneg _
  by_cases small : t ≤ 578/1000
  · have hsq := (sq_le_sq₀ ht0 (by norm_num : (0:ℝ) ≤ 578/1000)).mpr small
    have hk := pow_le_pow_left₀ (norm_nonneg _)
      ((H32 (n+1)).norm_starProjection_apply_le (kOf (n+1) f g)) 2
    change 41/20*t^2-_ ≤ _
    linarith only [hsq,hk,sq_nonneg ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖,
      sq_nonneg ‖hOf (n+1) f g‖,normSq_hOf_add_normSq_kOf (n+1) hf hg]
  · have hmu : √π ≤ 2*(886227/1000000) := by
      apply Real.sqrt_le_iff.mpr
      constructor
      · norm_num
      · norm_num
        linarith [Real.pi_lt_d6]
    have ht1 : t ≤ 887/1000 := by
      have hp : t ≤ √π/2 := tOf_le_sqrt_pi _ hf hg
      linarith
    apply le_trans _ (signedFifth_clip hf hg (show 0 < t by linarith) (r := 2/3) (by norm_num))
    change 41/20*t^2-3371/2000 ≤ 2*(t-√π/2)/(2/3)-(2/3)^2/6
    nlinarith only [hmu,ht1,le_of_not_ge small,
      mul_nonneg (sub_nonneg.mpr (le_of_not_ge small)) (sub_nonneg.mpr ht1)]
end Grothe.LowerAnalytic
