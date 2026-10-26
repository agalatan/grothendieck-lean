import Grothe.UpperChaos.EnergyBlock
import Grothe.Upper.BandComparison
import Grothe.Upper.Bivariate

/-!
# Full-spectrum stability of the two-coordinate kernel

Changing an `L²` response changes its entire table of chaos energies by at most
`(‖H‖ + ‖G‖) ‖H - G‖` in `ℓ¹`. Feasible common polynomial preprocessors are
`ℓ¹` contractions, so the same estimate controls every kernel coefficient
together. In particular, two responses of norm at most one cost at most twice
their `L²` distance. No coefficient cutoff or separate tail estimate is used.
The algebraic coefficient estimate needs no charge hypothesis. Its interpretation
as the physical radial kernel uses charge one, as in `Kernel2.lean`.
-/

namespace Grothe.UpperChaos

open MeasureTheory Finset Grothe.Upper

noncomputable section

private lemma abs_norm_sq_sub_le {V : Type*} [NormedAddCommGroup V] (x y : V) :
    |‖y‖ ^ 2 - ‖x‖ ^ 2| ≤ (‖y‖ + ‖x‖) * ‖y - x‖ := by
  calc
    |‖y‖ ^ 2 - ‖x‖ ^ 2| = (‖y‖ + ‖x‖) * |‖y‖ - ‖x‖| := by
      rw [← abs_of_nonneg (add_nonneg (norm_nonneg y) (norm_nonneg x)), ← abs_mul]
      congr 1
      ring
    _ ≤ _ := mul_le_mul_of_nonneg_left (abs_norm_sub_norm_le y x) (by positivity)

/-- The entire chaos-energy table is Lipschitz on bounded subsets of `L²`. -/
theorem sum_abs_energy_sub_le (G H : Lp ℂ 2 mu2) (S : Finset (ℕ × ℕ)) :
    ∑ p ∈ S, |energy H p - energy G p| ≤ (‖H‖ + ‖G‖) * ‖H - G‖ := by
  have hb (F : Lp ℂ 2 mu2) : ∑ p ∈ S, ‖energyBlock F p‖ ^ 2 ≤ ‖F‖ ^ 2 := by
    simpa only [norm_energyBlock_sq] using energy_sum_le_norm_sq F S
  have hc (F : Lp ℂ 2 mu2) :
      ∑ p ∈ S, ‖energyBlock F p‖ * ‖energyBlock (H - G) p‖ ≤ ‖F‖ * ‖H - G‖ :=
    BandComparison.band_cross S (energyBlock F) (energyBlock (H - G))
      (norm_nonneg _) (norm_nonneg _) (hb F) (hb (H - G))
  calc
    _ ≤ ∑ p ∈ S, (‖energyBlock H p‖ + ‖energyBlock G p‖) *
        ‖energyBlock (H - G) p‖ := by
      refine sum_le_sum fun p _ => ?_
      rw [← norm_energyBlock_sq, ← norm_energyBlock_sq, energyBlock_sub]
      exact abs_norm_sq_sub_le _ _
    _ = (∑ p ∈ S, ‖energyBlock H p‖ * ‖energyBlock (H - G) p‖) +
        ∑ p ∈ S, ‖energyBlock G p‖ * ‖energyBlock (H - G) p‖ := by
      simp_rw [add_mul]
      rw [sum_add_distrib]
    _ ≤ ‖H‖ * ‖H - G‖ + ‖G‖ * ‖H - G‖ := add_le_add (hc H) (hc G)
    _ = _ := by ring

/-- The bound covers all bidegrees, including the omitted tail. -/
theorem tsum_abs_energy_sub_le (G H : Lp ℂ 2 mu2) :
    ∑' p, |energy H p - energy G p| ≤ (‖H‖ + ‖G‖) * ‖H - G‖ :=
  Real.tsum_le_of_sum_le (fun _ => abs_nonneg _) (sum_abs_energy_sub_le G H)

/-- The full kernel estimate holds for any fixed common feasible preprocessors. -/
theorem tsum_abs_bivarKernel_energy_sub_le (G H : Lp ℂ 2 mu2)
    (P Q : Polynomial ℝ) (hP : Grothe.l1 P ≤ 1) (hQ : Grothe.l1 Q ≤ 1) :
    ∑' j, |bivarKernel P Q (energy H) j - bivarKernel P Q (energy G) j| ≤
      (‖H‖ + ‖G‖) * ‖H - G‖ := by
  have hd : Summable fun p => |energy H p - energy G p| :=
    ((hasSum_energy_bideg H).summable.sub (hasSum_energy_bideg G).summable).abs
  simp_rw [← bivarKernel_sub P Q hP hQ (energy H) (energy G)
    (summable_abs_energy H) (summable_abs_energy G)]
  exact (tsum_abs_bivarKernel_le P Q hP hQ _ hd).trans (tsum_abs_energy_sub_le G H)

/-- On the unit ball, the complete coefficient error is at most `2e`. -/
theorem tsum_abs_bivarKernel_energy_sub_le_two_mul (G H : Lp ℂ 2 mu2)
    (P Q : Polynomial ℝ) (hP : Grothe.l1 P ≤ 1) (hQ : Grothe.l1 Q ≤ 1)
    (hG : ‖G‖ ≤ 1) (hH : ‖H‖ ≤ 1) {e : ℝ} (he : ‖H - G‖ ≤ e) :
    ∑' j, |bivarKernel P Q (energy H) j - bivarKernel P Q (energy G) j| ≤ 2 * e := by
  refine (tsum_abs_bivarKernel_energy_sub_le G H P Q hP hQ).trans ?_
  exact mul_le_mul (by linarith) he (norm_nonneg _) (by norm_num)

end

end Grothe.UpperChaos
