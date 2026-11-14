import GrotheSign.BetaFlow
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Topology.Algebra.InfiniteSum.ENNReal

/-!
# Positive resolvent decomposition of the finite harmonic generator

Finite telescoping gives the exact remainder `harmonicGenerator k (c + N)`. Its limit is zero,
so the nonnegative resolvent series is summable and its sum is `harmonicGenerator k c`.
Only pointwise summability for `c > 0` is used; no derivative/limit exchange is involved.

Proof implementation: codex-1a87. Refs #365.
-/

set_option warningAsError true

namespace GrotheSign

open Finset Filter
open scoped Topology

/-- A positive weight times the Euler resolvent `k / (s + k)` at `s = c + q`. -/
noncomputable def betaResolventTerm (k : ℕ) (c : ℝ) (q : ℕ) : ℝ :=
  1 / (c + q) * ((k : ℝ) / (c + q + k))

theorem betaResolventTerm_nonneg (k : ℕ) {c : ℝ} (hc : 0 < c) (q : ℕ) :
    0 ≤ betaResolventTerm k c q := by
  unfold betaResolventTerm
  positivity

theorem betaResolventTerm_pos {k : ℕ} (hk : 0 < k) {c : ℝ} (hc : 0 < c) (q : ℕ) :
    0 < betaResolventTerm k c q := by
  unfold betaResolventTerm
  positivity

/-- An individual resolvent is a difference of adjacent shifted inverse tails. -/
theorem betaResolventTerm_eq_sub (k : ℕ) {c : ℝ} (hc : 0 < c) (q : ℕ) :
    betaResolventTerm k c q = 1 / (c + q) - 1 / (c + q + k) := by
  have hq : c + (q : ℝ) ≠ 0 := ne_of_gt (add_pos_of_pos_of_nonneg hc (Nat.cast_nonneg q))
  have hqk : c + (q : ℝ) + k ≠ 0 :=
    ne_of_gt (add_pos_of_pos_of_nonneg (add_pos_of_pos_of_nonneg hc (Nat.cast_nonneg q))
      (Nat.cast_nonneg k))
  unfold betaResolventTerm
  field_simp [hq, hqk]
  ring

/-- A unit shift of the finite harmonic sum telescopes. This identity holds for all real `c`. -/
theorem harmonicGenerator_sub_shift_one (k : ℕ) (c : ℝ) :
    harmonicGenerator k c - harmonicGenerator k (c + 1) = 1 / c - 1 / (c + k) := by
  calc
    harmonicGenerator k c - harmonicGenerator k (c + 1) =
        ∑ j ∈ Finset.range k, (1 / (c + j) - 1 / (c + (j + 1 : ℕ))) := by
      unfold harmonicGenerator
      rw [← Finset.sum_sub_distrib]
      apply Finset.sum_congr rfl
      intro j _
      rw [Nat.cast_add, Nat.cast_one]
      congr 2
      ring
    _ = 1 / c - 1 / (c + k) := by
      simpa only [Nat.cast_zero, add_zero] using
        Finset.sum_range_sub' (fun j : ℕ ↦ (1 : ℝ) / (c + j)) k

theorem betaResolventTerm_eq_harmonic_sub (k : ℕ) {c : ℝ} (hc : 0 < c) (q : ℕ) :
    betaResolventTerm k c q =
      harmonicGenerator k (c + q) - harmonicGenerator k (c + (q + 1 : ℕ)) := by
  rw [Nat.cast_add, Nat.cast_one, ← add_assoc, harmonicGenerator_sub_shift_one,
    betaResolventTerm_eq_sub k hc q]

/-- Exact finite truncation and remainder for the positive resolvent series. -/
theorem sum_betaResolventTerm (k N : ℕ) {c : ℝ} (hc : 0 < c) :
    (∑ q ∈ Finset.range N, betaResolventTerm k c q) =
      harmonicGenerator k c - harmonicGenerator k (c + N) := by
  simp_rw [betaResolventTerm_eq_harmonic_sub k hc]
  simpa only [Nat.cast_zero, add_zero] using
    Finset.sum_range_sub' (fun q : ℕ ↦ harmonicGenerator k (c + q)) N

/-- The finite harmonic remainder tends to zero under natural shifts. -/
theorem tendsto_harmonicGenerator_natShift (k : ℕ) (c : ℝ) :
    Tendsto (fun N : ℕ ↦ harmonicGenerator k (c + N)) atTop (𝓝 0) := by
  have hi (i : ℕ) : Tendsto (fun N : ℕ ↦ (1 : ℝ) / (c + N + i)) atTop (𝓝 0) := by
    simpa only [one_div, Function.comp_def] using tendsto_inv_atTop_zero.comp
      (tendsto_atTop_add_const_right atTop (i : ℝ)
        (tendsto_atTop_add_const_left atTop c tendsto_natCast_atTop_atTop))
  simpa only [harmonicGenerator, Finset.sum_const_zero] using
    tendsto_finsetSum (Finset.range k) (fun i _ ↦ hi i)

/-- The harmonic generator is the sum of its positive resolvents. -/
theorem hasSum_betaResolventTerm (k : ℕ) {c : ℝ} (hc : 0 < c) :
    HasSum (betaResolventTerm k c) (harmonicGenerator k c) := by
  apply (hasSum_iff_tendsto_nat_of_nonneg (betaResolventTerm_nonneg k hc) _).mpr
  simp_rw [sum_betaResolventTerm k _ hc]
  simpa only [sub_zero] using
    tendsto_const_nhds.sub (tendsto_harmonicGenerator_natShift k c)

theorem summable_betaResolventTerm (k : ℕ) {c : ℝ} (hc : 0 < c) :
    Summable (betaResolventTerm k c) := (hasSum_betaResolventTerm k hc).summable

theorem summable_abs_betaResolventTerm (k : ℕ) {c : ℝ} (hc : 0 < c) :
    Summable (fun q ↦ |betaResolventTerm k c q|) :=
  (summable_betaResolventTerm k hc).abs

/-- The positive resolvent decomposition in the form used to combine coefficient polynomials. -/
theorem harmonicGenerator_eq_tsum_resolvents (k : ℕ) {c : ℝ} (hc : 0 < c) :
    harmonicGenerator k c =
      ∑' q : ℕ, 1 / (c + q) * ((k : ℝ) / (c + q + k)) :=
  (hasSum_betaResolventTerm k hc).tsum_eq.symm

end GrotheSign
