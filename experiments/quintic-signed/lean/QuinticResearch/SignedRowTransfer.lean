import QuinticResearch.SignedRowProfile
import QuinticResearch.SignedRadial
import Grothe.LowerAnalytic.FirstChaosProfile

/-! # Physical signed payoffs from a scalar certificate on the original identity-tail rows

Agent-ID: codex-a7c4
-/

set_option warningAsError true
namespace Grothe.LowerAnalytic.SignedRowTransfer
open MeasureTheory Grothe.Lower
noncomputable section

theorem fifthFloor_le {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1)))) :
    fifthFloor (tOf (n+1) f g) ≤
      ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖^2-‖(H32 (n+1)).starProjection (kOf (n+1) f g)‖^2 := by
  unfold fifthFloor
  split
  · exact signed_fifth_radial_886176 hf hg ‹_›
  split
  · exact signed_fifth_radial_885868 hf hg ‹_›
  have ha := pow_le_pow_left₀ (norm_nonneg _) ((H32 (n+1)).norm_starProjection_apply_le (kOf (n+1) f g)) 2
  linarith only [ha,sq_nonneg ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖,sq_nonneg ‖hOf (n+1) f g‖,
    normSq_hOf_add_normSq_kOf (n+1) hf hg]

/-- A bound for the original unsigned row and its visible amplitude is enough to price the actual signed operator. -/
theorem signed_payoff_le_profile {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    {w d : ℝ} (hw : 0 ≤ w) (hd : 0 ≤ d) :
    (inner ℂ f (signedFifthWitness (n+1) ((1-w)*(191/250)) ((1-w)*(47/2000)) d g)).re ≤
      profileValue w d (VhatOf (n+1) (191/250) (47/2000) f g) (tOf (n+1) f g) := by
  rw [signedFifth_payoff,FirstChaosProfile.payoff_split,VOf_eq_hat (n+1) _ (by norm_num) hf hg]
  have h := mul_le_mul_of_nonneg_left (fifthFloor_le hf hg) hd
  unfold profileValue
  nlinarith only [h,mul_nonneg hw (sq_nonneg ‖PkOf (n+1) f g‖)]

/-- Use a certified row price on all physical amplitudes in dimensions from two upwards.
The operator and its vector normalization are supplied by the signed finite-matrix transfer. -/
theorem transfer_of_profile {w d B : ℝ} (hw : 0 ≤ w) (hw₁ : w ≤ 1)
    (hd : 0 ≤ d) (hd₁ : d ≤ (1-w)*(47/2000))
    (rows : ∀ n, 1 ≤ n → ∀ f g : L2G (n+1), f ∈ Unimod (stdGaussian ((n+1)+(n+1))) →
      g ∈ Unimod (stdGaussian ((n+1)+(n+1))) →
      profileValue w d (VhatOf (n+1) (191/250) (47/2000) f g) (tOf (n+1) f g) ≤ B) :
    TransferInputsL2 B := by
  apply signedFifth_transfer (e := (1-w)*(191/250)) (ν := (1-w)*(47/2000)) (debit := d)
    (mul_nonneg (sub_nonneg.mpr hw₁) (by norm_num)) hd hd₁ 2
  rintro (_|n) hn f g hf hg
  · omega
  exact (signed_payoff_le_profile hf hg hw hd).trans (rows n (by omega) f g hf hg)

/-- The finite complex Grothendieck lower bound, at the reciprocal of the scalar certificate. -/
theorem endpoint_of_profile {w d B : ℝ} (hw : 0 ≤ w) (hw₁ : w ≤ 1)
    (hd : 0 ≤ d) (hd₁ : d ≤ (1-w)*(47/2000))
    (rows : ∀ n, 1 ≤ n → ∀ f g : L2G (n+1), f ∈ Unimod (stdGaussian ((n+1)+(n+1))) →
      g ∈ Unimod (stdGaussian ((n+1)+(n+1))) →
      profileValue w d (VhatOf (n+1) (191/250) (47/2000) f g) (tOf (n+1) f g) ≤ B)
    (hne : ∃ K, Grothe.Statement.IsBound K) :
    1/B ≤ Grothe.Statement.complexGrothendieckConstant := by
  have tr := transfer_of_profile hw hw₁ hd hd₁ rows
  exact le_csInf hne fun _ hK => transfer_lower tr (Grothe.Statement.isBound_iff.mp hK)

end
end Grothe.LowerAnalytic.SignedRowTransfer
