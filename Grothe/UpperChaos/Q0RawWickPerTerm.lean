import Grothe.UpperChaos.Q0RawWickFiniteSums
import Grothe.UpperChaos.Q0RealTermPowers

/-!
# Per-term semantic bridge for the raw q0 Wick entries

This compares the real shifted-Wick expression for one source phase term
against evaluation of its source-derived rational trivariate entries. It does
not use a generated coefficient bank, and it does not perform a numerical
check or an integral bound. Agent-ID: codex-8c4d.
-/

namespace Grothe.UpperChaos.Q0RawWickPerTerm

open Grothe.UpperChaos.Q0RawWickTerms
open Grothe.UpperChaos.Q0RawWickFiniteSums
open Grothe.UpperChaos.Q0RealPhaseTerm
open Grothe.UpperChaos.Q0RealPhaseSourceSum
open Grothe.UpperChaos.Q0RealTermPowers
open Grothe.UpperChaos.Q0CommonMomentSum

noncomputable section

/-- The raw trivariate entries derived from one phase monomial evaluate to
its real shifted-Wick source term at `s = r²`, `Z = β⁻¹` and `V = v`.
The identity uses totalized inverses and remains valid at zero rate or shift. -/
theorem realPhaseSourceTerm_eq_rawWickSsum (β r v : ℝ)
    (a b c : ℕ) (d : ℚ) :
    realPhaseSourceTerm β (-(v * r)) r ((a, b, c), d) =
      Ssum (rawWickEntriesOfTerm ((a, b, c), d)) (r ^ 2) β⁻¹ v := by
  rw [Ssum_rawWickEntriesOfTerm]
  simp only [realPhaseSourceTerm]
  apply Finset.sum_congr rfl
  intro k hk
  have hk_le : k ≤ c := by
    have h := Finset.mem_range.mp hk
    omega
  have hpq : (b + k) + (b + (c - k)) = 2 * b + c := by omega
  rw [realImSqMoment_commonSum]
  simp only [hpq, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  have hj_le : 2 * j ≤ 2 * b + c + 2 := by
    have h := Finset.mem_range.mp hj
    omega
  let n : ℕ := 2 * b + c + 2 - 2 * j
  have hpower := phase_shift_power_to_radial a b c j d r v k hk_le hj_le
  change realPhaseMonomialCoeff a c k d r * (-(v * r)) ^ n =
    (d : ℝ) * (1 / 2 : ℝ) ^ c * (c.choose k : ℝ) *
      (-v) ^ n * (r ^ 2) ^ (a + b + c + 1 - j) at hpower
  have htwo : (1 / 2 : ℝ) ^ c = 1 / (2 : ℝ) ^ c := by
    rw [div_pow]
    simp
  have hsign : (-v) ^ n = (-1 : ℝ) ^ n * v ^ n := by
    rw [← neg_one_mul v, mul_pow]
  change realPhaseMonomialCoeff a c k d r *
      (imSqBinomialFactor (b + k) (b + (c - k)) j * (-(v * r)) ^ n *
        (j.factorial : ℝ) / β ^ (j + 1) / 4) =
      rawEntryValue (rawWickEntry a b c d k j) (r ^ 2) β⁻¹ v
  have hgroup : realPhaseMonomialCoeff a c k d r *
      (imSqBinomialFactor (b + k) (b + (c - k)) j * (-(v * r)) ^ n *
        (j.factorial : ℝ) / β ^ (j + 1) / 4) =
      (realPhaseMonomialCoeff a c k d r * (-(v * r)) ^ n) *
        imSqBinomialFactor (b + k) (b + (c - k)) j *
          (j.factorial : ℝ) / β ^ (j + 1) / 4 := by ring
  rw [hgroup, hpower, htwo, hsign]
  simp only [rawEntryValue, rawWickEntry]
  push_cast
  rw [imSqBinomialFactorQ_cast]
  simp only [div_eq_mul_inv, mul_inv_rev, inv_pow]
  ring

end
end Grothe.UpperChaos.Q0RawWickPerTerm
