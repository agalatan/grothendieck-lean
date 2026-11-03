import Grothe.UpperChaos.Rounder
import Grothe.UpperChaos.HermiteBasis

/-!
# Conditional Hermite coefficients of the actual base phase

At a fixed squared radial coordinate, the second Gaussian coordinate is
still integrated against the actual production phase. Its Hermite
coefficients form one coupled vector, so Bessel applies before any
entrywise aggregation. Node locations, quadrature weights and their mass
are separate certification obligations. Agent-ID: codex-aa04.
-/

open MeasureTheory Finset Grothe.LowerAnalytic
open scoped InnerProductSpace ComplexConjugate

namespace Grothe.UpperChaos.F0ConditionalNode

noncomputable section

/-- Actual production base phase at a fixed radial node. -/
def phaseSlice (s : ℝ) (w : ℂ) : ℂ := F0 ((Real.sqrt s : ℂ), w)

/-- At nonnegative nodes this is the frozen production profile at that node. -/
theorem phaseSlice_eq (s : ℝ) (hs : 0 ≤ s) (w : ℂ) :
    phaseSlice s w = Haag.ph ((Real.sqrt s : ℂ) +
      ((Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof s : ℝ) : ℂ) * w) := by
  simp [phaseSlice, F0, abs_of_nonneg (Real.sqrt_nonneg s), Real.sq_sqrt hs]

theorem measurable_phaseSlice (s : ℝ) : Measurable (phaseSlice s) := by
  unfold phaseSlice
  exact measurable_F0.comp (measurable_const.prodMk measurable_id)

theorem norm_phaseSlice_le_one (s : ℝ) (w : ℂ) : ‖phaseSlice s w‖ ≤ 1 := by
  exact Grothe.Haag.norm_ph_le _

theorem phaseSlice_memLp (s : ℝ) : MemLp (phaseSlice s) 2 gaussC :=
  MemLp.of_bound (measurable_phaseSlice s).aestronglyMeasurable 1
    (Filter.Eventually.of_forall (norm_phaseSlice_le_one s))

def phaseSliceLp (s : ℝ) : Lp ℂ 2 gaussC := (phaseSlice_memLp s).toLp (phaseSlice s)

theorem norm_phaseSliceLp_le_one (s : ℝ) : ‖phaseSliceLp s‖ ≤ 1 := by
  have ha : ∀ᵐ w ∂gaussC, ‖phaseSliceLp s w‖ ≤ 1 := by
    filter_upwards [(phaseSlice_memLp s).coeFn_toLp] with w hw
    change ‖((phaseSlice_memLp s).toLp (phaseSlice s)) w‖ ≤ 1
    rw [hw]
    exact norm_phaseSlice_le_one s w
  have h := Lp.norm_le_of_ae_bound (f := phaseSliceLp s) (by norm_num : (0 : ℝ) ≤ 1) ha
  simpa [measureUnivNNReal] using h

/-- Actual conditional coefficient in the normalized complex Hermite basis. -/
def coefficient (s : ℝ) (i : ℕ × ℕ) : ℂ := ⟪hvec i, phaseSliceLp s⟫_ℂ

/-- This is the actual conditional Gaussian integral, not a stored table entry. -/
theorem coefficient_eq_integral (s : ℝ) (i : ℕ × ℕ) :
    coefficient s i = ∫ w, conj (hfun i w) * phaseSlice s w ∂gaussC := by
  exact inner_toLp (memLp_hfun i) (phaseSlice_memLp s)

theorem sum_sq_coefficient_le_one (s : ℝ) (modes : Finset (ℕ × ℕ)) :
    ∑ i ∈ modes, ‖coefficient s i‖ ^ 2 ≤ 1 := by
  calc
    _ ≤ ‖phaseSliceLp s‖ ^ 2 := orthonormal_hvec.sum_inner_products_le (phaseSliceLp s)
    _ ≤ 1 := by nlinarith [norm_phaseSliceLp_le_one s, norm_nonneg (phaseSliceLp s)]

/-- Any nonnegative node weights preserve the coupled coefficient bound.
The caller must still certify the actual quadrature nodes and their total mass. -/
theorem weighted_sum_sq_le_mass {ι : Type*} (nodes : Finset ι)
    (s w : ι → ℝ) (modes : ι → Finset (ℕ × ℕ))
    (hw : ∀ i ∈ nodes, 0 ≤ w i) :
    ∑ i ∈ nodes, w i * (∑ j ∈ modes i, ‖coefficient (s i) j‖ ^ 2) ≤
      ∑ i ∈ nodes, w i := by
  apply Finset.sum_le_sum
  intro i hi
  simpa only [mul_one] using
    mul_le_mul_of_nonneg_left (sum_sq_coefficient_le_one (s i) (modes i)) (hw i hi)

end
end Grothe.UpperChaos.F0ConditionalNode
