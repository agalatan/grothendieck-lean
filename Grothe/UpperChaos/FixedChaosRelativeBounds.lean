import Grothe.UpperChaos.FixedChaosSymmetricBounds
import Grothe.UpperChaos.FixedChaosMomentScaling

/-! Relative scalar errors give uniform normalized-entry errors at every
degree, avoiding separate interval certificates for every matrix entry.
Agent-ID: codex-7c2e -/

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries
noncomputable section

def normalizedEntryAt (u v w : ℝ) (n : ℕ) (c e : Fin (n + 1)) : ℝ :=
  nrm (n - c.val) c.val * nrm (n - e.val) e.val *
    matrixMoment2 u v w (n - c.val, c.val) (n - e.val, e.val)

theorem matrixMoment2_bounds {u U v V w W : ℝ}
    (hu : 0 ≤ u ∧ u ≤ U) (hv : 0 ≤ v ∧ v ≤ V) (hw : 0 ≤ w ∧ w ≤ W)
    (p r a c : ℕ) :
    0 ≤ matrixMoment2 u v w (p, r) (a, c) ∧
      matrixMoment2 u v w (p, r) (a, c) ≤ matrixMoment2 U V W (p, r) (a, c) := by
  have h := matrixRecurrence_bounds hu hv hw ((p, 0), (r, 0)) ((a, 0), (c, 0))
  simpa only [matrixRecurrence_eq_matrixMoment2, matrixMoment2, ite_true, mul_one] using h

theorem normalizedEntryAt_bounds {u U v V w W : ℝ}
    (hu : 0 ≤ u ∧ u ≤ U) (hv : 0 ≤ v ∧ v ≤ V) (hw : 0 ≤ w ∧ w ≤ W)
    (n : ℕ) (c e : Fin (n + 1)) :
    0 ≤ normalizedEntryAt u v w n c e ∧
      normalizedEntryAt u v w n c e ≤ normalizedEntryAt U V W n c e := by
  obtain ⟨hn, hle⟩ := matrixMoment2_bounds hu hv hw
    (n - c.val) c.val (n - e.val) e.val
  have hnrm := mul_nonneg (nrm_pos (n - c.val) c.val).le (nrm_pos (n - e.val) e.val).le
  exact ⟨mul_nonneg hnrm hn, mul_le_mul_of_nonneg_left hle hnrm⟩

theorem normalizedEntryAt_scale (t u v w : ℝ) (n : ℕ) (c e : Fin (n + 1)) :
    normalizedEntryAt (t * u) (t * v) (t * w) n c e =
      t ^ n * normalizedEntryAt u v w n c e := by
  unfold normalizedEntryAt
  rw [matrixMoment2_scale, Nat.sub_add_cancel (by omega : c.val ≤ n)]
  ring

/-- Rounding the three scalar entries down by at most a relative epsilon
costs at most n*epsilon in any normalized degree-n entry. -/
theorem normalizedEntryAt_relative_error (u v w ε : ℝ)
    (hε0 : 0 ≤ ε) (hε1 : ε ≤ 1)
    (hu : 0 ≤ u ∧ (1 - ε) * m00 ≤ u ∧ u ≤ m00)
    (hv : 0 ≤ v ∧ (1 - ε) * m01 ≤ v ∧ v ≤ m01)
    (hw : 0 ≤ w ∧ (1 - ε) * m11 ≤ w ∧ w ≤ m11)
    (n : ℕ) (c e : Fin (n + 1)) :
    0 ≤ symmetricEntry n c e - normalizedEntryAt u v w n c e ∧
      symmetricEntry n c e - normalizedEntryAt u v w n c e ≤ (n : ℝ) * ε := by
  have hm0 : 0 ≤ m00 := hu.1.trans hu.2.2
  have hm1 : 0 ≤ m01 := hv.1.trans hv.2.2
  have hm2 : 0 ≤ m11 := hw.1.trans hw.2.2
  have ht : 0 ≤ 1 - ε := sub_nonneg.mpr hε1
  have hlo := normalizedEntryAt_bounds
    ⟨mul_nonneg ht hm0, hu.2.1⟩ ⟨mul_nonneg ht hm1, hv.2.1⟩
    ⟨mul_nonneg ht hm2, hw.2.1⟩ n c e
  rw [normalizedEntryAt_scale] at hlo
  have hhi := normalizedEntryAt_bounds ⟨hu.1, hu.2.2⟩ ⟨hv.1, hv.2.2⟩
    ⟨hw.1, hw.2.2⟩ n c e
  change 0 ≤ normalizedEntryAt u v w n c e ∧
    normalizedEntryAt u v w n c e ≤ symmetricEntry n c e at hhi
  change 0 ≤ (1 - ε) ^ n * symmetricEntry n c e ∧
    (1 - ε) ^ n * symmetricEntry n c e ≤ normalizedEntryAt u v w n c e at hlo
  have hx : symmetricEntry n c e ≤ 1 :=
    (le_abs_self _).trans (by simpa only [Real.norm_eq_abs] using norm_symmetricEntry_le_one n c e)
  have hp : (1 - ε) ^ n ≤ 1 := pow_le_one₀ (n := n) ht (by linarith)
  have hb : 1 - (n : ℝ) * ε ≤ (1 - ε) ^ n := by
    simpa only [mul_neg, ← sub_eq_add_neg] using
      one_add_mul_le_pow (a := -ε) (by linarith : -2 ≤ -ε) n
  have hmul := mul_le_mul_of_nonneg_left hx (sub_nonneg.mpr hp)
  constructor
  · exact sub_nonneg.mpr hhi.2
  · nlinarith only [hlo.2, hmul, hb]

end
end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.normalizedEntryAt_relative_error' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.normalizedEntryAt_relative_error
