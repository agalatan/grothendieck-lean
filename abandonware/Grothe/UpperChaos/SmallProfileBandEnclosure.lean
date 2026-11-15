import Grothe.UpperChaos.SmallProfileMesh
import Grothe.UpperChaos.ChargeBandEnclosure
import Grothe.UpperChaos.RetainedMeshReality

/-!
# Rational band certificates for the concrete retained mesh

The actual seven-strip source and its exact coefficient identities connect
finite rational coefficient enclosures to the original Gaussian band error.
The common source reserve is added once, after the finite energy calculation.

Agent-ID: codex-2ca4
-/

open MeasureTheory
open scoped InnerProductSpace

namespace Grothe.UpperChaos.SmallProfileMesh
noncomputable section

theorem chargeOne_source (j : ℕ) : ChargeOne (source j) :=
  chargeOne_profileIntervalL2 ((Finset.range 7).filter selected)
    cut (fun k => cut (k + 1)) j

/-- The numerical premise encloses the complete normalized mesh coefficients. -/
theorem norm_source_band_sq_le_enclosure (B : Set Idx2)
    [DecidablePred (· ∈ B)] (j N M : ℕ) (c : ℕ → ℕ → ℕ → ℚ)
    (center radius : GradedIdx N → ℚ)
    (hdegree : ∀ i ∈ B, (bideg i).1 + (bideg i).2 < 2 * N)
    (hcoeff : ∀ i : GradedIdx N, gradedIdx i ∈ B →
      ‖retainedReciprocalMeshValue i j cut 7 selected - (center i : ℂ)‖ ≤
        (radius i : ℝ)) :
    ‖projOn B (source j - gradedHermite M c)‖ ^ 2 ≤
      (bandEnclosureEnergyQ B N M c center radius : ℝ) := by
  apply norm_projOn_sub_graded_sq_le_enclosure B (source j) (chargeOne_source j)
    N M c center radius hdegree
  intro i hi
  rw [inner_source_eq_reciprocalMesh]
  exact hcoeff i hi

/-- A rational finite-energy check transfers to the original source, with
the unchanged shared reserve charged once for the entire band. -/
theorem norm_band_error_le_enclosure (B : Set Idx2)
    [DecidablePred (· ∈ B)] (j N M : ℕ) (c : ℕ → ℕ → ℕ → ℚ)
    (center radius : GradedIdx N → ℚ) (δ : ℚ) (hδ : 0 ≤ δ)
    (hdegree : ∀ i ∈ B, (bideg i).1 + (bideg i).2 < 2 * N)
    (hcoeff : ∀ i : GradedIdx N, gradedIdx i ∈ B →
      ‖retainedReciprocalMeshValue i j cut 7 selected - (center i : ℂ)‖ ≤
        (radius i : ℝ))
    (henergy : bandEnclosureEnergyQ B N M c center radius ≤ δ ^ 2) :
    ‖projOn B ((chargeFn_hpow phiBound j).memLp.toLp (hpow j) - gradedHermite M c)‖ ≤
      (5 / 10 ^ 15 : ℝ) + (δ : ℝ) := by
  apply norm_band_error_le_shared_approx B _ (source j) (gradedHermite M c)
    _ (δ : ℝ) (norm_hpow_sub_source_lt j).le
  have henergyR : (bandEnclosureEnergyQ B N M c center radius : ℝ) ≤ (δ : ℝ) ^ 2 := by
    exact_mod_cast henergy
  have hδR : (0 : ℝ) ≤ (δ : ℝ) := by exact_mod_cast hδ
  exact (sq_le_sq₀ (norm_nonneg _) hδR).mp
    ((norm_source_band_sq_le_enclosure B j N M c center radius hdegree hcoeff).trans henergyR)

/-- Real coefficient intervals suffice: reality of the complete normalized
mesh supplies the full complex norm enclosure without an extra assumption. -/
theorem norm_band_error_le_real_enclosure (B : Set Idx2)
    [DecidablePred (· ∈ B)] (j N M : ℕ) (c : ℕ → ℕ → ℕ → ℚ)
    (center radius : GradedIdx N → ℚ) (δ : ℚ) (hδ : 0 ≤ δ)
    (hdegree : ∀ i ∈ B, (bideg i).1 + (bideg i).2 < 2 * N)
    (hcoeff : ∀ i : GradedIdx N, gradedIdx i ∈ B →
      |(retainedReciprocalMeshValue i j cut 7 selected).re - (center i : ℝ)| ≤
        (radius i : ℝ))
    (henergy : bandEnclosureEnergyQ B N M c center radius ≤ δ ^ 2) :
    ‖projOn B ((chargeFn_hpow phiBound j).memLp.toLp (hpow j) - gradedHermite M c)‖ ≤
      (5 / 10 ^ 15 : ℝ) + (δ : ℝ) := by
  refine norm_band_error_le_enclosure B j N M c center radius δ hδ hdegree ?_ henergy
  intro i hi
  rw [RetainedMeshReality.norm_retainedReciprocalMeshValue_sub_rat]
  exact hcoeff i hi

/-- Use an original band cap directly: the rational energy check reserves
the common source error before squaring, so the stated cap is not relaxed. -/
theorem norm_band_error_le_cap (B : Set Idx2)
    [DecidablePred (· ∈ B)] (j N M : ℕ) (c : ℕ → ℕ → ℕ → ℚ)
    (center radius : GradedIdx N → ℚ) (cap : ℚ) (hcap : 5 / 10 ^ 15 ≤ cap)
    (hdegree : ∀ i ∈ B, (bideg i).1 + (bideg i).2 < 2 * N)
    (hcoeff : ∀ i : GradedIdx N, gradedIdx i ∈ B →
      |(retainedReciprocalMeshValue i j cut 7 selected).re - (center i : ℝ)| ≤
        (radius i : ℝ))
    (henergy : bandEnclosureEnergyQ B N M c center radius ≤ (cap - 5 / 10 ^ 15) ^ 2) :
    ‖projOn B ((chargeFn_hpow phiBound j).memLp.toLp (hpow j) - gradedHermite M c)‖ ≤
      (cap : ℝ) := by
  have h := norm_band_error_le_real_enclosure B j N M c center radius
    (cap - 5 / 10 ^ 15) (sub_nonneg.mpr hcap) hdegree hcoeff henergy
  push_cast at h
  linarith

end
end Grothe.UpperChaos.SmallProfileMesh
