import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
import Mathlib.Tactic

/-!
# Finite reindexing and factorial normalization for inverse flows

The coefficient support of a zero-constant series removes all terms above the total degree.
This lets a rectangular pair of power indices be grouped by their sum.

Agent-ID: codex-1a87. Refs #365.
-/

namespace GrotheSign

open Finset PowerSeries

/-- A rectangular sum supported below total degree `k` can be grouped by the sum of its indices. -/
theorem sum_rectangle_eq_triangle {A : Type*} [AddCommMonoid A] (k : ℕ) (f : ℕ → ℕ → A)
    (hf : ∀ q r, k < q + r → f q r = 0) :
    (∑ q ∈ range (k + 1), ∑ r ∈ range (k + 1), f q r) =
      ∑ m ∈ range (k + 1), ∑ q ∈ range (m + 1), f q (m - q) := by
  let S := ((range (k + 1)).product (range (k + 1))).filter (fun p ↦ p.1 + p.2 ≤ k)
  let T := (range (k + 1)).sigma (fun m ↦ range (m + 1))
  let toTriangle : ℕ × ℕ → Σ _ : ℕ, ℕ := fun p ↦ ⟨p.1 + p.2, p.1⟩
  let toRectangle : (Σ _ : ℕ, ℕ) → ℕ × ℕ := fun x ↦ (x.2, x.1 - x.2)
  have hforward (p : ℕ × ℕ) (hp : p ∈ S) : toTriangle p ∈ T := by
    have hsum : p.1 + p.2 ≤ k := (Finset.mem_filter.mp hp).2
    exact Finset.mem_sigma.mpr ⟨Finset.mem_range.mpr (by dsimp [toTriangle]; omega),
      Finset.mem_range.mpr (by dsimp [toTriangle]; omega)⟩
  have hbackward (x : Σ _ : ℕ, ℕ) (hx : x ∈ T) : toRectangle x ∈ S := by
    obtain ⟨hm, hq⟩ := Finset.mem_sigma.mp hx
    have hmk := Finset.mem_range.mp hm
    have hqm := Finset.mem_range.mp hq
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_product.mpr ⟨Finset.mem_range.mpr ?_, Finset.mem_range.mpr ?_⟩, ?_⟩
    all_goals dsimp [toRectangle]; omega
  calc
    _ = ∑ p ∈ (range (k + 1)).product (range (k + 1)), f p.1 p.2 := by
      exact (Finset.sum_product (range (k + 1)) (range (k + 1))
        (fun p : ℕ × ℕ ↦ f p.1 p.2)).symm
    _ = ∑ p ∈ S, f p.1 p.2 := by
      symm
      apply Finset.sum_subset (Finset.filter_subset _ _)
      intro p hp hpS
      have hgt : k < p.1 + p.2 := by
        simpa only [S, Finset.mem_filter, hp, true_and, not_le] using hpS
      exact hf p.1 p.2 hgt
    _ = ∑ x ∈ T, f x.2 (x.1 - x.2) := by
      apply Finset.sum_nbij' toTriangle toRectangle hforward hbackward
      · intro p _
        simp [toTriangle, toRectangle]
      · intro x hx
        have hle : x.2 ≤ x.1 := by
          have := (Finset.mem_sigma.mp hx).2
          simpa only [Finset.mem_range, Nat.lt_succ_iff] using this
        simp only [toTriangle, toRectangle, Nat.add_sub_of_le hle]
      · intro p _
        simp [toTriangle]
    _ = _ := by rw [Finset.sum_sigma]

/-- Dividing the subset count by the total factorial gives the two power-series factorials. -/
theorem choose_div_factorial (m q : ℕ) (hqm : q ≤ m) :
    (m.choose q : ℝ) / m.factorial =
      1 / ((q.factorial : ℝ) * (m - q).factorial) := by
  have hm : (m.factorial : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.factorial_ne_zero m)
  have hq : (q.factorial : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.factorial_ne_zero q)
  have hmq : ((m - q).factorial : ℝ) ≠ 0 :=
    Nat.cast_ne_zero.mpr (Nat.factorial_ne_zero (m - q))
  have h : (m.choose q : ℝ) * q.factorial * (m - q).factorial = m.factorial := by
    exact_mod_cast Nat.choose_mul_factorial_mul_factorial hqm
  field_simp
  simpa [mul_assoc] using h

section Coefficients

variable {R : Type*} [CommRing R]

/-- A power of a zero-constant series has no coefficients below its exponent. -/
theorem coeff_pow_eq_zero_of_lt (P : R⟦X⟧) (hP : constantCoeff P = 0)
    (n q : ℕ) (hnq : n < q) : coeff n (P ^ q) = 0 := by
  obtain ⟨Q, rfl⟩ := PowerSeries.X_dvd_iff.mpr hP
  rw [mul_pow, coeff_X_pow_mul']
  simp [hnq.not_ge]

/-- A coefficient expansion can be extended to any larger finite power cutoff. -/
theorem sum_coeff_pow_extend (P : R⟦X⟧) (hP : constantCoeff P = 0) (a : ℕ → R)
    (n k : ℕ) (hnk : n ≤ k) :
    (∑ q ∈ range (n + 1), a q * coeff n (P ^ q)) =
      ∑ q ∈ range (k + 1), a q * coeff n (P ^ q) := by
  apply Finset.sum_subset (Finset.range_mono (Nat.succ_le_succ hnk))
  intro q _ hqn
  have hnq : n < q := by
    simp only [Finset.mem_range] at hqn
    omega
  rw [coeff_pow_eq_zero_of_lt P hP n q hnq, mul_zero]

/-- A convolution of two powers vanishes when the sum of their exponents exceeds the degree. -/
theorem coeff_pow_mul_coeff_pow_eq_zero (P : R⟦X⟧) (hP : constantCoeff P = 0)
    (k i q r : ℕ) (hik : i ≤ k) (hk : k < q + r) :
    coeff i (P ^ q) * coeff (k - i) (P ^ r) = 0 := by
  by_cases hiq : i < q
  · rw [coeff_pow_eq_zero_of_lt P hP i q hiq, zero_mul]
  · rw [coeff_pow_eq_zero_of_lt P hP (k - i) r (by omega), mul_zero]

end Coefficients

end GrotheSign
