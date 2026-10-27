import Grothe.UpperChaos.KernelStability
import Grothe.UpperChaos.BandProj
import Grothe.Upper.Final
import Grothe.UpperChaos.PhiBound
import Grothe.UpperChaos.ConcreteTaylorUpper

/-!
# Selected chaos-energy accuracy from an L² approximant

The approximation and table agreement remain explicit inputs. A full-space version is already in KernelStability; the projected
version below does not require controlling omitted chaos modes.
-/

open MeasureTheory Finset Grothe.Upper

namespace Grothe.UpperChaos

noncomputable section

/-- An L² approximation and a separate table enclosure compose to the
required finite bidegree energy discrepancy, without a mode-count factor. -/
theorem selectedEnergy_close_of_l2_approx (S : Finset (ℕ × ℕ))
    (X Y : Lp ℂ 2 mu2) (T : ℕ × ℕ → ℝ) (B δ ε τ : ℝ)
    (hB : ‖Y‖ ≤ B) (hd : ‖X - Y‖ ≤ δ)
    (htable : (∑ p ∈ S, |energy Y p - T p|) ≤ ε)
    (harith : (2 * B + δ) * δ + ε ≤ τ) :
    (∑ p ∈ S, |energy X p - T p|) ≤ τ := by
  have hδ : 0 ≤ δ := (norm_nonneg (X - Y)).trans hd
  have hB0 : 0 ≤ B := (norm_nonneg Y).trans hB
  have hX : ‖X‖ ≤ δ + B := by
    have ht := norm_add_le (X - Y) Y
    simp only [sub_add_cancel] at ht
    linarith
  have hsum : ‖X‖ + ‖Y‖ ≤ 2 * B + δ := by linarith
  have hcmp : (‖X‖ + ‖Y‖) * ‖X - Y‖ ≤ (2 * B + δ) * δ :=
    mul_le_mul hsum hd (norm_nonneg _) (by linarith)
  have henergy := (sum_abs_energy_sub_le Y X S).trans hcmp
  calc
    _ ≤ ∑ p ∈ S, (|energy X p - energy Y p| +
        |energy Y p - T p|) := by
      apply sum_le_sum
      intro p _hp
      have he : energy X p - T p =
          (energy X p - energy Y p) + (energy Y p - T p) := by ring
      rw [he]
      exact abs_add_le _ _
    _ = (∑ p ∈ S, |energy X p - energy Y p|) +
        ∑ p ∈ S, |energy Y p - T p| := sum_add_distrib
    _ ≤ (2 * B + δ) * δ + ε := add_le_add henergy htable
    _ ≤ _ := harith

/-- The orthogonal projection includes every Hermite mode in the selected
bidegrees, even when the selected set has a non-rectangular shape. -/
def energyHeadModes (S : Finset (ℕ × ℕ)) : Set Idx2 :=
  {i | bideg i ∈ S}

theorem energy_headProjection (S : Finset (ℕ × ℕ))
    (F : Lp ℂ 2 mu2) (p : ℕ × ℕ) (hp : p ∈ S) :
    energy (projOn (energyHeadModes S) F) p = energy F p := by
  classical
  unfold energy
  refine tsum_congr fun i => ?_
  have hi : bideg i.1 = p := by simpa only [Set.mem_preimage, Set.mem_singleton_iff] using i.2
  have hm : i.1 ∈ energyHeadModes S := by simpa only [energyHeadModes, Set.mem_setOf_eq, hi] using hp
  rw [inner_projOn, if_pos hm]

/-- A certificate for the selected projection suffices: the physical response
may have uncontrolled energy outside S. The table comparison concerns only
S and remains a separate explicit requirement. -/
theorem selectedEnergy_close_of_projected_l2_approx (S : Finset (ℕ × ℕ))
    (X Y : Lp ℂ 2 mu2) (T : ℕ × ℕ → ℝ) (B δ ε τ : ℝ)
    (hB : ‖projOn (energyHeadModes S) Y‖ ≤ B)
    (hd : ‖projOn (energyHeadModes S) (X - Y)‖ ≤ δ)
    (htable : (∑ p ∈ S, |energy Y p - T p|) ≤ ε)
    (harith : (2 * B + δ) * δ + ε ≤ τ) :
    (∑ p ∈ S, |energy X p - T p|) ≤ τ := by
  classical
  have hd' : ‖projOn (energyHeadModes S) X - projOn (energyHeadModes S) Y‖ ≤ δ := by
    simpa only [map_sub] using hd
  have ht' : (∑ p ∈ S, |energy (projOn (energyHeadModes S) Y) p -
      T p|) ≤ ε := by
    have he : (∑ p ∈ S, |energy (projOn (energyHeadModes S) Y) p -
        T p|) = ∑ p ∈ S, |energy Y p - T p| := by
      apply sum_congr rfl
      intro p hp
      rw [energy_headProjection S Y p hp]
    rw [he]
    exact htable
  have h := selectedEnergy_close_of_l2_approx S (projOn (energyHeadModes S) X)
    (projOn (energyHeadModes S) Y) T B δ ε τ hB hd' ht' harith
  have he : (∑ p ∈ S, |energy (projOn (energyHeadModes S) X) p -
      T p|) = ∑ p ∈ S, |energy X p - T p| := by
    apply sum_congr rfl
    intro p hp
    rw [energy_headProjection S X p hp]
  rwa [he] at h


/-- For the concrete #21 response, only a selected-mode approximation and its
agreement with the stored table are needed. These are explicit hypotheses;
this theorem does not certify the approximant itself. -/
theorem concrete_energy_close_five_e_minus_seven
    (Y : Lp ℂ 2 mu2)
    (hB : ‖projOn (energyHeadModes (headIdx 501)) Y‖ ≤ 1)
    (hd : ‖projOn (energyHeadModes (headIdx 501))
      (((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) - Y)‖ ≤ (3 / 20000000 : ℝ))
    (htable : (∑ p ∈ headIdx 501, |energy Y p - (energyTable p : ℝ)|) ≤
      (3 / 20000000 : ℝ)) :
    (∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)|) ≤
      (1 / 2000000 : ℝ) := by
  apply selectedEnergy_close_of_projected_l2_approx (headIdx 501)
    ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn))
    Y (fun p => (energyTable p : ℝ)) 1 (3 / 20000000) (3 / 20000000)
    (1 / 2000000) hB hd htable
  norm_num

end
end Grothe.UpperChaos
