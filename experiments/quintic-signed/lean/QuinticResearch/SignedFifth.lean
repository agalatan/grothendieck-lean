import QuinticResearch.QuinticVisiblePhase
import QuinticResearch.QuinticPhaseStability

set_option warningAsError true

/-! Signed fifth-chaos perturbations. Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic

open MeasureTheory Real Grothe.Lower

/-- Lower bound on the signed projected energy in terms of the displacement
from a reference phase and the squared half-difference. -/
theorem projection_difference_lower {n : ℕ} (P : Submodule ℂ (L2G n)) [P.HasOrthogonalProjection]
    (h k p : L2G n) {b : ℝ} (hb : 1 ≤ b) :
    b/(1+b)*‖P.starProjection p‖^2 - b*(‖h-p‖^2+‖k‖^2) ≤
      ‖P.starProjection h‖^2-‖P.starProjection k‖^2 := by
  have hu : ‖P.starProjection p‖ ≤ ‖P.starProjection h‖ + ‖h-p‖ := by
    have hle := norm_sub_le (P.starProjection h) (P.starProjection (h-p))
    rw [← map_sub,sub_sub_cancel] at hle
    exact hle.trans (add_le_add_right (P.norm_starProjection_apply_le _) _)
  have hs := pow_le_pow_left₀ (norm_nonneg _) hu 2
  have hk := pow_le_pow_left₀ (norm_nonneg _) (P.norm_starProjection_apply_le k) 2
  have hb₀ : 0 ≤ b := by linarith
  have h1 : 0 < 1+b := by linarith
  rw [sub_le_iff_le_add,div_mul_eq_mul_div,div_le_iff₀ h1]
  have hsub : 0 ≤ b*‖k‖^2-‖P.starProjection k‖^2 :=
    sub_nonneg.mpr (hk.trans (by nlinarith only [mul_nonneg (sub_nonneg.mpr hb) (sq_nonneg ‖k‖)]))
  nlinarith only [mul_nonneg hb₀ (sub_nonneg.mpr hs),sq_nonneg (‖P.starProjection h‖-b*‖h-p‖),
    mul_nonneg h1.le hsub]

/-- The signed fifth projection is positive for the entire upper amplitude interval,
independently of the scalar node caps and of the remote-sector shape. -/
theorem signed_fifth_high {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    {r b : ℝ} (hr : 0 < r) (hb : 1 ≤ b) (ht : 0 < tOf (n+1) f g) :
    b/(1+b)*(3*π/256)-b*(2*(√π/2-tOf (n+1) f g)/r+4*r^2/3) ≤
      ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖^2 -
      ‖(H32 (n+1)).starProjection (kOf (n+1) f g)‖^2 := by
  let p := unitPhaseL (visibleDirection (n+1) f g)
  have hs := visible_phase_stability hf hg ht hr
  have hp := normSq_H32_unitPhaseL (Nat.succ_pos _) (visibleDirection_mem (n+1) f g)
    (norm_visibleDirection_of_pos ht)
  have h := projection_difference_lower (H32 (n+1)) (hOf (n+1) f g) (kOf (n+1) f g) p hb
  dsimp only [p] at h
  rw [hp] at h
  apply le_trans _ h
  apply sub_le_sub_left (mul_le_mul_of_nonneg_left ?_ (by linarith)) _
  apply (mul_le_mul_iff_left₀ hr).mp
  simp only [add_mul,div_mul_cancel₀ _ hr.ne']
  nlinarith only [hs]


private theorem mu_le : √π/2 ≤ (886227:ℝ)/1000000 := by
  rw [div_le_iff₀ (by norm_num), Real.sqrt_le_left (by norm_num)]
  linarith only [Real.pi_lt_d6]

/-- A negative fifth multiplier earns a signed discount throughout the upper active amplitude cell. -/
theorem signed_fifth_at_least_17 {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (ht : (885868:ℝ)/1000000 ≤ tOf (n+1) f g) :
    (17:ℝ)/10000 ≤ ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖^2 -
      ‖(H32 (n+1)).starProjection (kOf (n+1) f g)‖^2 := by
  have hh := signed_fifth_high hf hg (r:=13/200) (b:=1) (by norm_num) (by norm_num) (by linarith)
  linarith only [hh, mu_le, Real.pi_gt_d6, ht]

/-- Accommodate the smaller Gaussian phase error at the active high-amplitude test point. -/
theorem signed_fifth_at_least_154 {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (ht : (886176:ℝ)/1000000 ≤ tOf (n+1) f g) :
    (154:ℝ)/10000 ≤ ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖^2 -
      ‖(H32 (n+1)).starProjection (kOf (n+1) f g)‖^2 := by
  have hh := signed_fifth_high hf hg (r:=17/500) (b:=2) (by norm_num) (by norm_num) (by linarith)
  linarith only [hh, mu_le, Real.pi_gt_d6, ht]

end Grothe.LowerAnalytic
