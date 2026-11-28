import Grothe.LowerAnalytic.QuinticSmallAmplitude
import Grothe.LowerAnalytic.SparseSteinBound

/-!
# Reusing the identity-tail row certificates for the degree-five witness

Scaling the certified identity-tail payoff by the ratio of the cubic weights
cancels both cubic projections on the same phase pair. This retains the signed
quintic energy and the first-chaos penalty of the half-difference.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic

open Grothe.Lower

noncomputable section

/-- The cubic terms cancel exactly for every phase pair, before applying any caps. -/
theorem quinticPayoff_eq_scaled_hat (n : ℕ) (f g : L2G n) :
    quinticPayoff n (39 / 50) (779 / 10000) f g =
      1209 / 1250 * VhatOf n (191 / 250) (47 / 2000) f g +
      41 / 1250 * (tOf n f g ^ 2 - ‖PkOf n f g‖ ^ 2) + 611 / 13125 * ‖kOf n f g‖ ^ 2 +
      779 / 10000 * (‖(H32 n).starProjection (hOf n f g)‖ ^ 2 -
        ‖(H32 n).starProjection (kOf n f g)‖ ^ 2) := by
  rw [quinticPayoff, VOf_zero, VhatOf, epsHat, nuHat]
  ring

/-- An identity-tail witness cap gives a degree-five cap with the residual
cost measured on the actual pair. The cubic sector energies are unrestricted. -/
theorem quinticPayoff_le_of_tailWitnessCap {n : ℕ} {c : ℝ}
    (hcaps : WitnessCap n (191 / 250) (47 / 2000) ((1 - 47 / 2000) * c + 47 / 2000)) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n))) :
    quinticPayoff n (39 / 50) (779 / 10000) f g ≤
      1209 / 1250 * c +
      41 / 1250 * (tOf n f g ^ 2 - ‖PkOf n f g‖ ^ 2) + 611 / 13125 * ‖kOf n f g‖ ^ 2 +
      779 / 10000 * (‖(H32 n).starProjection (hOf n f g)‖ ^ 2 -
        ‖(H32 n).starProjection (kOf n f g)‖ ^ 2) := by
  have hc := hcaps f hf g hg
  have hv : VOf n (191 / 250) (47 / 2000) f g ≤ _ := (Complex.re_le_norm _).trans hc
  rw [VOf_eq_hat n _ (by norm_num) hf hg] at hv
  rw [quinticPayoff_eq_scaled_hat]
  linarith only [hv]

/-- At every physical amplitude, half-difference energy at most `1/50` and signed
quintic energy at most `1/25` pay for the target 1.4023 with its reserve. -/
theorem quinticPayoff_le_of_small_tail_cost {n : ℕ}
    (hcaps : WitnessCap n (191 / 250) (47 / 2000)
      ((1 - 47 / 2000) * (SparseEnvelope.cap : ℝ) + 47 / 2000)) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n)))
    (hk : ‖kOf n f g‖ ^ 2 ≤ 1 / 50)
    (h5 : ‖(H32 n).starProjection (hOf n f g)‖ ^ 2 -
      ‖(H32 n).starProjection (kOf n f g)‖ ^ 2 ≤ 1 / 25) :
    quinticPayoff n (39 / 50) (779 / 10000) f g ≤ 10000 / 14023 - 1 / 100000 := by
  have h := quinticPayoff_le_of_tailWitnessCap hcaps hf hg
  have ht := pow_le_pow_left₀ (show 0 ≤ tOf n f g from norm_nonneg _) (tOf_le_sqrt_pi n hf hg) 2
  rw [div_pow, Real.sq_sqrt Real.pi_pos.le] at ht
  norm_num [SparseEnvelope.cap] at h
  linarith only [h, ht, Real.pi_lt_d2, hk, h5, sq_nonneg ‖PkOf n f g‖]

/-- The production node-cap interface suffices for the all-amplitude box. Its
witness has the original tail weight and its quantitative cost is paid above. -/
theorem quinticPayoff_le_of_small_tail_cost_of_nodeCaps {n : ℕ} (hn : 2 ≤ n)
    (hcaps : TailNodeCaps (nuHat (47 / 2000))) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n)))
    (hk : ‖kOf n f g‖ ^ 2 ≤ 1 / 50)
    (h5 : ‖(H32 n).starProjection (hOf n f g)‖ ^ 2 -
      ‖(H32 n).starProjection (kOf n f g)‖ ^ 2 ≤ 1 / 25) :
    quinticPayoff n (39 / 50) (779 / 10000) f g ≤ 10000 / 14023 - 1 / 100000 :=
  quinticPayoff_le_of_small_tail_cost
    (witnessCap_of_circular_profile (@SparseStein.profile) hcaps n hn) hf hg hk h5

end
end Grothe.LowerAnalytic
