import Mathlib.Analysis.InnerProductSpace.LinearMap
import Mathlib.Topology.Algebra.InfiniteSum.Real
import Mathlib.Tactic.Module
import Grothe.Upper.BandComparison

/-!
# Phase errors and transport of response certificates

Two geometries must be kept separate. Phase alignment has a modulus-weighted
quadratic cost, while a coordinate symmetry preserves a kernel only when the
downstream operator is transported with it. The latter condition matters for
the anisotropic two-coordinate preprocessors.

The countable energy comparison below prices the entire omitted spectrum.
It is an abstract certificate; identifying a Gaussian symmetry and supplying
an integration enclosure remain application work.
-/

namespace Grothe.Upper.ResponseGeometry

open Finset

set_option maxHeartbeats 1000000

noncomputable section

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]

/-- The exact disk-valued support defect, including the radial slack. -/
theorem support_defect (u v : H) (hu : ‖u‖ = 1) (a : ℝ) :
    a - inner ℝ (a • u) v =
      a / 2 * (‖u - v‖ ^ 2 + 1 - ‖v‖ ^ 2) := by
  rw [real_inner_smul_left, norm_sub_sq_real, hu]
  ring

/-- Normalization has a weighted quadratic cost even at a phase zero. -/
theorem normalized_distance (u v : H) (hu : ‖u‖ = 1) (hv : ‖v‖ = 1)
    (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) :
    a ^ 2 * ‖u - v‖ ^ 2 ≤ 4 * ‖a • u - b • v‖ ^ 2 := by
  have hrev : |a-b| ≤ ‖a • u - b • v‖ := by
    simpa [norm_smul, Real.norm_eq_abs, abs_of_nonneg ha, abs_of_nonneg hb, hu, hv]
      using abs_norm_sub_norm_le (a • u) (b • v)
  have he : a • (u-v) = (a • u-b • v)+(b-a) • v := by module
  have ht : a * ‖u-v‖ ≤ 2 * ‖a • u-b • v‖ := by
    calc
      a * ‖u-v‖ = ‖a • (u-v)‖ := by
        rw [norm_smul, Real.norm_eq_abs, abs_of_nonneg ha]
      _ ≤ ‖a • u-b • v‖+‖(b-a) • v‖ := he ▸ norm_add_le _ _
      _ = ‖a • u-b • v‖+|a-b| := by
        rw [norm_smul, Real.norm_eq_abs, hv, mul_one, abs_sub_comm]
      _ ≤ 2 * ‖a • u-b • v‖ := by linarith
  nlinarith [mul_nonneg ha (norm_nonneg (u-v)), norm_nonneg (a • u-b • v)]

/-- A support loss can be bounded quadratically without dividing by a small modulus. -/
theorem weighted_support_loss (u v : H) (hu : ‖u‖ = 1) (hv : ‖v‖ = 1)
    (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) :
    a * (a-inner ℝ (a • u) v) ≤ 2 * ‖a • u-b • v‖ ^ 2 := by
  have hd := normalized_distance u v hu hv a b ha hb
  rw [support_defect u v hu a, hv]
  nlinarith

/-- Conjugating the response and the correlation operator together preserves the kernel.
Rotating only the response does not satisfy this hypothesis in general. -/
theorem kernel_transport (U : H ≃ₗᵢ[ℝ] H) (A B : H →ₗ[ℝ] H)
    (h : ∀ z, B (U z) = U (A z)) (x y : H) :
    inner ℝ (U x) (B (U y)) = inner ℝ x (A y) := by
  rw [h, U.inner_map_map]

/-- The same intertwining condition preserves each measured block energy. -/
theorem energy_transport (U : H ≃ₗᵢ[ℝ] H) (P Q : H →ₗ[ℝ] H)
    (h : ∀ z, Q (U z) = U (P z)) (x : H) :
    ‖Q (U x)‖ ^ 2 = ‖P x‖ ^ 2 := by
  rw [h, U.norm_map]

/-- Compare full blocks after aligning the anchor by a genuine common symmetry.
The Bessel hypothesis is for the transported blocks, not their old labels. -/
theorem finite_energy_comparison {ι : Type*} (S : Finset ι)
    (U : H ≃ₗᵢ[ℝ] H) (P Q : ι → H →ₗ[ℝ] H)
    (htrans : ∀ i z, Q i (U z) = U (P i z))
    (hbessel : ∀ z, ∑ i ∈ S, ‖Q i z‖ ^ 2 ≤ ‖z‖ ^ 2)
    (x y : H) (e : ℝ) (he : 0 ≤ e) (hd : ‖y-U x‖ ≤ e) :
    ∑ i ∈ S, |‖Q i y‖ ^ 2-‖P i x‖ ^ 2| ≤ 2*‖x‖*e+e^2 := by
  classical
  have henergy : ∀ i, ‖Q i (U x)‖ ^ 2 = ‖P i x‖ ^ 2 :=
    fun i => energy_transport U (P i) (Q i) (htrans i) x
  have hx : ∑ i ∈ S, ‖Q i (U x)‖ ^ 2 ≤ ‖x‖ ^ 2 := by
    simpa only [U.norm_map] using hbessel (U x)
  have herr : ∑ i ∈ S, ‖Q i y-Q i (U x)‖ ^ 2 ≤ e^2 := by
    calc
      _ = ∑ i ∈ S, ‖Q i (y-U x)‖ ^ 2 := by simp only [map_sub]
      _ ≤ ‖y-U x‖ ^ 2 := hbessel _
      _ ≤ e^2 := pow_le_pow_left₀ (norm_nonneg _) hd 2
  simpa only [henergy, Finset.sum_singleton, mul_assoc] using
    BandComparison.compare S {()} (fun i => Q i (U x)) (fun i => Q i y)
      (fun _ i => Q i y - Q i (U x)) (fun _ => S) (fun _ => ‖x‖) (fun _ => e) (e ^ 2)
      (by simp) (by intro _ _ _ hi hni; exact (hni hi).elim) (by simp [norm_nonneg]) (by simpa using he)
      (by simpa using hx) (by simpa using herr) herr

/-- The aligned comparison includes the entire infinite tail; no cutoff is assumed. -/
theorem full_energy_comparison {ι : Type*}
    (U : H ≃ₗᵢ[ℝ] H) (P Q : ι → H →ₗ[ℝ] H)
    (htrans : ∀ i z, Q i (U z) = U (P i z))
    (hbessel : ∀ (S : Finset ι) z, ∑ i ∈ S, ‖Q i z‖ ^ 2 ≤ ‖z‖ ^ 2)
    (x y : H) (e : ℝ) (he : 0 ≤ e) (hd : ‖y-U x‖ ≤ e) :
    ∑' i, |‖Q i y‖ ^ 2-‖P i x‖ ^ 2| ≤ 2*‖x‖*e+e^2 := by
  apply Real.tsum_le_of_sum_le (fun i => abs_nonneg _)
  intro S
  exact finite_energy_comparison S U P Q htrans (hbessel S) x y e he hd

/-- In particular, a pure orbit motion has exactly zero full-spectrum price. -/
theorem orbit_energy_zero {ι : Type*}
    (U : H ≃ₗᵢ[ℝ] H) (P Q : ι → H →ₗ[ℝ] H)
    (htrans : ∀ i z, Q i (U z) = U (P i z)) (x : H) :
    ∑' i, |‖Q i (U x)‖ ^ 2-‖P i x‖ ^ 2| = 0 := by
  simp_rw [energy_transport U _ _ (htrans _) x, sub_self, abs_zero, tsum_zero]

/-- Polarization keeps the same increment and midpoint, rather than bounding
two response tails separately. Complex Hilbert spaces may be viewed as real. -/
theorem energy_difference (x y : H) :
    ‖y‖ ^ 2 - ‖x‖ ^ 2 = inner ℝ (y-x) (y+x) := by
  simp only [inner_sub_left, inner_add_right, real_inner_self_eq_norm_sq,
    real_inner_comm y x]
  ring

/-- A finite collection of energy differences is bounded by the product of
the increment and midpoint energy radii. No Gram eigenvalue repair is needed. -/
theorem finite_polarized_comparison {ι : Type*} (S : Finset ι)
    (x y : ι → H) (A B : ℝ) (hA : 0 ≤ A) (hB : 0 ≤ B)
    (ha : ∑ i ∈ S, ‖y i-x i‖^2 ≤ A^2)
    (hb : ∑ i ∈ S, ‖y i+x i‖^2 ≤ B^2) :
    ∑ i ∈ S, |‖y i‖^2-‖x i‖^2| ≤ A*B := by
  calc
    _ = ∑ i ∈ S, |inner ℝ (y i-x i) (y i+x i)| := by
      simp_rw [energy_difference]
    _ ≤ ∑ i ∈ S, ‖y i-x i‖*‖y i+x i‖ :=
      sum_le_sum fun i _ => abs_real_inner_le_norm _ _
    _ ≤ A*B := BandComparison.band_cross (V := fun _ : ι => H)
      S (fun i => y i-x i) (fun i => y i+x i) hA hB ha hb

/-- Positive approximation-error integrals suffice to price the entire
omitted spectrum. The approximating polynomials vanish in the measured
blocks; their coefficients need not be exact projections of the responses. -/
theorem tail_of_approximants {ι : Type*} (P : ι → H →ₗ[ℝ] H)
    (hbessel : ∀ (S : Finset ι) z, ∑ i ∈ S, ‖P i z‖^2 ≤ ‖z‖^2)
    (x y p q : H) (hp : ∀ i, P i p = 0) (hq : ∀ i, P i q = 0)
    (A B : ℝ) (hA : 0 ≤ A) (hB : 0 ≤ B)
    (ha : ‖(y-x)-p‖ ≤ A) (hb : ‖(y+x)-q‖ ≤ B) :
    ∑' i, |‖P i y‖^2-‖P i x‖^2| ≤ A*B := by
  apply Real.tsum_le_of_sum_le (fun i => abs_nonneg _)
  intro S
  apply finite_polarized_comparison S (fun i => P i x) (fun i => P i y) A B hA hB
  · calc
      _ = ∑ i ∈ S, ‖P i ((y-x)-p)‖^2 := by simp only [map_sub, hp, sub_zero]
      _ ≤ ‖(y-x)-p‖^2 := hbessel S _
      _ ≤ A^2 := pow_le_pow_left₀ (norm_nonneg _) ha 2
  · calc
      _ = ∑ i ∈ S, ‖P i ((y+x)-q)‖^2 := by
        simp only [map_sub, map_add, hq, sub_zero]
      _ ≤ ‖(y+x)-q‖^2 := hbessel S _
      _ ≤ B^2 := pow_le_pow_left₀ (norm_nonneg _) hb 2

/-- Scalar form of the two-by-two Gram trace-norm formula for one response
increment. It avoids subtracting the two large terms `4*b^2`. -/
theorem polarized_gram_identity (a b c : ℝ) :
    (2*b+c)^2+4*(a*c-b^2) = c*(4*a+4*b+c) := by ring

end
end Grothe.Upper.ResponseGeometry
