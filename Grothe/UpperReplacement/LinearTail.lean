import Grothe.UpperReplacement.LinearTailFacts

set_option warningAsError true

/-!
# First-coefficient contribution to the Hardy budget

Agent-ID: codex-a7c4. The table discrepancy controls the first GT energy.
Parity and the auxiliary polynomial's zero constant term identify the linear
coefficient exactly for every primary polynomial.
-/

namespace Grothe.UpperReplacement.LinearTail

open Finset Polynomial Upper

noncomputable section

theorem first_energy_lower {N : ℕ} (hN : 1 ≤ N) {μ : ℕ × ℕ → ℝ} {ε : ℝ}
    (h : ∑ p ∈ headIdx N, |μ p - (energyTable p : ℝ)| ≤ ε)
    (hε : ε ≤ 1494118 / 10 ^ 12) : (gtFirst : ℝ) ≤ μ (1, 0) := by
  have hp := (mem_headIdx (N := N) (p := (1, 0))).2 hN
  have he : |μ (1, 0) - (energyTable (1, 0) : ℝ)| ≤ ε :=
    (single_le_sum (fun p (_ : p ∈ headIdx N) ↦
      abs_nonneg (μ p - (energyTable p : ℝ))) hp).trans h
  have ht : (718159430018 / 10 ^ 12 : ℝ) ≤ (energyTable (1, 0) : ℝ) := by
    simpa only [Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat] using
      (Rat.cast_le (K := ℝ)).2 first_energy_checked
  simp only [gtFirst, Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat]
  linarith [(abs_le.mp he).1]

/-- Only bidegree `(1,0)` contributes to the linear coefficient. -/
theorem bivar_zero (P Q : ℝ[X]) (hQ : Q.coeff 0 = 0) (μ : ℕ × ℕ → ℝ)
    (hpar : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → μ p = 0) :
    bivarKernel P Q μ 0 = μ (1, 0) * P.coeff 0 := by
  have hidx : headIdx 1 = {(0, 0), (1, 0)} := by decide +kernel
  rw [bivarKernel_eq_head P Q hQ μ hpar (N := 1) (by decide), hidx]
  simp [termOf, shiftOf, hpar (0, 0) (by decide)]

end

end Grothe.UpperReplacement.LinearTail
