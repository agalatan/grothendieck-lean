import GrotheSign.Basic
import Mathlib.RingTheory.PowerSeries.Binomial
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Tactic.Ring

/-!
# Two expansions of the binomial-weighted affine product

The same formal power series is expanded first by constant versus affine terms, then by constant
versus linear terms. Comparing its coefficients supplies the finite identity in issue #363.
-/

namespace GrotheSign

open Finset PowerSeries

variable {ι : Type*} [DecidableEq ι]

private theorem binomial_product_first (t : Finset ι) (w : ι → ℝ) (a : ℝ) :
    binomialSeries ℝ a * ∏ i ∈ t, (C (w i) * (1 + X) - 1) =
      ∑ u ∈ t.powerset, C ((-1 : ℝ) ^ (t.card - u.card) * ∏ i ∈ u, w i) *
        binomialSeries ℝ (a + u.card) := by
  have hp : (∏ i ∈ t, (C (w i) * (1 + X) - 1) : PowerSeries ℝ) =
      ∑ u ∈ t.powerset, (∏ i ∈ u, C (w i) * (1 + X)) * ∏ i ∈ t \ u, (-1) := by
    simpa only [sub_eq_add_neg] using
      (Finset.prod_add (fun i ↦ (C (w i) * (1 + X) : PowerSeries ℝ)) (fun _ ↦ -1) t)
  rw [hp, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro u hu
  have hu' := Finset.mem_powerset.mp hu
  simp only [Finset.prod_mul_distrib, ← map_prod, Finset.prod_const,
    Finset.card_sdiff_of_subset hu', binomialSeries_add, binomialSeries_nat, map_mul, map_pow,
    map_neg, map_one]
  ring

private theorem binomial_product_second (t : Finset ι) (w : ι → ℝ) (a : ℝ) :
    binomialSeries ℝ a * ∏ i ∈ t, (C (w i) * (1 + X) - 1) =
      ∑ u ∈ t.powerset, C ((∏ i ∈ u, w i) * ∏ i ∈ t \ u, (w i - 1)) *
        (binomialSeries ℝ a * X ^ u.card) := by
  have hf (i : ι) : (C (w i) * (1 + X) - 1 : PowerSeries ℝ) =
      C (w i) * X + C (w i - 1) := by
    simp only [map_sub, map_one]
    ring
  simp_rw [hf]
  rw [Finset.prod_add, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro u hu
  simp only [Finset.prod_mul_distrib, ← map_prod, Finset.prod_const, map_mul]
  ring

/-- Binomial-weighted alternating subsets equal the coefficient expansion of an affine product. -/
theorem sum_choose_card (t : Finset ι) (w : ι → ℝ) (a : ℝ) (r : ℕ) :
    (∑ u ∈ t.powerset, (-1 : ℝ) ^ (t.card - u.card) *
      (∏ i ∈ u, w i) * Ring.choose (a + u.card) r) =
    ∑ u ∈ t.powerset.filter (fun u ↦ u.card ≤ r),
      (∏ i ∈ u, w i) * (∏ i ∈ t \ u, (w i - 1)) * Ring.choose a (r - u.card) := by
  have he := (binomial_product_first t w a).symm.trans (binomial_product_second t w a)
  have hc := congrArg (PowerSeries.coeff r) he
  simp only [map_sum, coeff_C_mul, binomialSeries_coeff, smul_eq_mul, mul_one,
    coeff_mul_X_pow'] at hc
  rw [Finset.sum_filter]
  convert hc using 1
  apply Finset.sum_congr rfl
  intro u hu
  split_ifs <;> simp_all

end GrotheSign
