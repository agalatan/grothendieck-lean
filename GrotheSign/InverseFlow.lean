import GrotheSign.InverseSeries

/-!
# Transporting the actual inverse-flow derivative into inverse coordinates

The forward-coefficient convolution is rewritten using the two proved Lagrange identities.
There is no assumption about the signs of the forward or inverse coefficients.

Agent-ID: codex-1a87. Refs #365.
-/

namespace GrotheSign

open Finset PowerSeries

/-- The actual inverse-flow convolution, expressed entirely in its inverse profile. -/
theorem inverse_flow_convolution (F : PowerSeries ℝ) (hF : constantCoeff F ≠ 0)
    (L : ℕ → ℝ) (k : ℕ) :
    -(∑ i ∈ range (k + 1), L i * coeff i F * coeff (k - i) (F⁻¹ ^ (2 * k + 2))) =
      -((k : ℝ) + 1) * ∑ i ∈ range (k + 1),
        L i / ((2 * (i : ℝ) + 1) * ((i : ℝ) + 1)) *
          coeff i ((1 - inverseProfile F)⁻¹ ^ (2 * i + 1)) *
          coeff (k - i) ((1 - inverseProfile F) ^ (2 * i + 2)) := by
  simp only [← inverseRadial_eq_one_sub_inverseProfile]
  rw [← Finset.sum_neg_distrib, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i hi
  have hik : i ≤ k := Nat.le_of_lt_succ (Finset.mem_range.mp hi)
  have h2 : 2 * (i : ℝ) + 1 ≠ 0 := ne_of_gt (by positivity)
  have h1 : (i : ℝ) + 1 ≠ 0 := ne_of_gt (by positivity)
  have ha : coeff i F = coeff i ((inverseRadial F)⁻¹ ^ (2 * i + 1)) /
      (2 * (i : ℝ) + 1) := by
    apply (eq_div_iff h2).mpr
    simpa only [mul_comm] using forward_coeff_eq_inverse_power F hF i
  have hb : coeff (k - i) (F⁻¹ ^ (2 * k + 2)) =
      ((k : ℝ) + 1) * coeff (k - i) (inverseRadial F ^ (2 * i + 2)) /
        ((i : ℝ) + 1) := by
    apply (eq_div_iff h1).mpr
    simpa only [mul_comm] using inverse_power_coeff_transport F hF k i hik
  rw [ha, hb]
  field_simp

end GrotheSign
