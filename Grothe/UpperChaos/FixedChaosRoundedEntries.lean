import Grothe.UpperChaos.FixedChaosRelativeBounds
import Grothe.UpperChaos.RationalSqrtFloor
import Grothe.UpperChaos.FixedChaosMomentScaling

/-! Rational smoothing matrices with a uniform, proved rounding error.
Their integer entries can be evaluated directly; no per-entry interval
certificate is required. Agent-ID: codex-7c2e -/

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- The four factorials in a normalized degree-n matrix entry. -/
def entryFactorial (n : ℕ) (c e : Fin (n + 1)) : ℕ :=
  ((n - c.val).factorial * c.val.factorial) *
    ((n - e.val).factorial * e.val.factorial)

/-- A rational lower rounding of the normalized matrix with scalar entries
`U/D`, `V/D`, `W/D`. -/
def savedEntryQ (U V W D S n : ℕ) (c e : Fin (n + 1)) : ℚ :=
  RationalSqrtFloor.sqrtFloor
    (matrixMomentNumerator U V W (n - c.val) c.val (n - e.val) e.val ^ 2)
    (D ^ (2 * n) * entryFactorial n c e) S

theorem entryFactorial_pos (n : ℕ) (c e : Fin (n + 1)) :
    0 < entryFactorial n c e := by
  unfold entryFactorial
  exact Nat.mul_pos
    (Nat.mul_pos (Nat.factorial_pos _) (Nat.factorial_pos _))
    (Nat.mul_pos (Nat.factorial_pos _) (Nat.factorial_pos _))

noncomputable section

/-- Squaring removes the normalized Hermite factorial square roots, leaving
one integer numerator and one integer denominator. -/
theorem normalizedEntryAt_sq_eq_numerator (U V W D n : ℕ)
    (c e : Fin (n + 1)) :
    normalizedEntryAt ((U : ℝ) / D) ((V : ℝ) / D) ((W : ℝ) / D) n c e ^ 2 =
      ((matrixMomentNumerator U V W (n - c.val) c.val
        (n - e.val) e.val ^ 2 : ℕ) : ℝ) /
        ((D ^ (2 * n) * entryFactorial n c e : ℕ) : ℝ) := by
  have hdeg : n - c.val + c.val = n - e.val + e.val := by omega
  have hn : n - c.val + c.val = n := Nat.sub_add_cancel (by omega)
  have hm : matrixMoment2 ((U : ℝ) / D) ((V : ℝ) / D) ((W : ℝ) / D)
      (n - c.val, c.val) (n - e.val, e.val) =
      (matrixMomentNumerator U V W (n - c.val) c.val
        (n - e.val) e.val : ℝ) / (D : ℝ) ^ n := by
    calc
      _ = matrixMoment2 (U : ℝ) (V : ℝ) (W : ℝ)
          (n - c.val, c.val) (n - e.val, e.val) /
            (D : ℝ) ^ (n - c.val + c.val) := by
        simpa only [div_eq_mul_inv, inv_pow, mul_comm] using
          matrixMoment2_scale ((D : ℝ)⁻¹) (U : ℝ) (V : ℝ) (W : ℝ)
            (n - c.val) c.val (n - e.val) e.val
      _ = _ := by rw [matrixMoment2_natCast U V W _ _ _ _ hdeg, hn]
  have hfac : (0 : ℝ) < entryFactorial n c e := by
    exact_mod_cast entryFactorial_pos n c e
  have hnorm : (nrm (n - c.val) c.val * nrm (n - e.val) e.val) ^ 2 =
      1 / (entryFactorial n c e : ℝ) := by
    apply (eq_div_iff hfac.ne').mpr
    calc
      _ = (nrm (n - c.val) c.val * nrm (n - c.val) c.val *
          (((n - c.val).factorial * c.val.factorial : ℕ) : ℝ)) *
          (nrm (n - e.val) e.val * nrm (n - e.val) e.val *
          (((n - e.val).factorial * e.val.factorial : ℕ) : ℝ)) := by
        simp only [entryFactorial, Nat.cast_mul]
        ring
      _ = 1 := by rw [nrm_sq_mul, nrm_sq_mul, one_mul]
  rw [normalizedEntryAt, hm, mul_pow, hnorm, div_pow]
  push_cast
  rw [show 2 * n = n * 2 by omega, pow_mul]
  simp only [div_eq_mul_inv, mul_inv_rev]
  ring

/-- The saved entry encloses the normalized lower scalar matrix entry with
grid error at most `1/S`, uniformly in the degree and indices. -/
theorem savedEntryQ_bounds (U V W D S n : ℕ) (hD : 0 < D) (hS : 0 < S)
    (c e : Fin (n + 1)) :
    (savedEntryQ U V W D S n c e : ℝ) ≤
        normalizedEntryAt ((U : ℝ) / D) ((V : ℝ) / D) ((W : ℝ) / D) n c e ∧
      normalizedEntryAt ((U : ℝ) / D) ((V : ℝ) / D) ((W : ℝ) / D) n c e ≤
        (savedEntryQ U V W D S n c e : ℝ) + 1 / (S : ℝ) := by
  have hu : (0 : ℝ) ≤ (U : ℝ) / D := by positivity
  have hv : (0 : ℝ) ≤ (V : ℝ) / D := by positivity
  have hw : (0 : ℝ) ≤ (W : ℝ) / D := by positivity
  exact RationalSqrtFloor.sqrtFloor_bounds _ _ _
    (Nat.mul_pos (Nat.pow_pos hD) (entryFactorial_pos n c e)) hS _
    (normalizedEntryAt_bounds ⟨hu, le_rfl⟩ ⟨hv, le_rfl⟩ ⟨hw, le_rfl⟩ n c e).1
    (normalizedEntryAt_sq_eq_numerator U V W D n c e)

theorem savedEntryQ_error (U V W D S n : ℕ) (hD : 0 < D) (hS : 0 < S)
    (c e : Fin (n + 1)) :
    ‖normalizedEntryAt ((U : ℝ) / D) ((V : ℝ) / D) ((W : ℝ) / D) n c e -
      (savedEntryQ U V W D S n c e : ℝ)‖ ≤ 1 / (S : ℝ) := by
  obtain ⟨hlo, hhi⟩ := savedEntryQ_bounds U V W D S n hD hS c e
  rw [Real.norm_eq_abs, abs_of_nonneg (sub_nonneg.mpr hlo)]
  linarith

/-- The actual smoothing entry differs from the computable saved entry by
at most the degree times the relative scalar error, plus one grid step. -/
theorem symmetricEntry_savedEntryQ_error (U V W D S : ℕ) (hD : 0 < D) (hS : 0 < S)
    (ε : ℝ) (hε0 : 0 ≤ ε) (hε1 : ε ≤ 1)
    (hu : 0 ≤ (U : ℝ) / D ∧ (1 - ε) * m00 ≤ (U : ℝ) / D ∧ (U : ℝ) / D ≤ m00)
    (hv : 0 ≤ (V : ℝ) / D ∧ (1 - ε) * m01 ≤ (V : ℝ) / D ∧ (V : ℝ) / D ≤ m01)
    (hw : 0 ≤ (W : ℝ) / D ∧ (1 - ε) * m11 ≤ (W : ℝ) / D ∧ (W : ℝ) / D ≤ m11)
    (n : ℕ) (c e : Fin (n + 1)) :
    ‖symmetricEntry n c e - (savedEntryQ U V W D S n c e : ℝ)‖ ≤
      (n : ℝ) * ε + 1 / (S : ℝ) := by
  obtain ⟨hr0, hr⟩ := normalizedEntryAt_relative_error
    ((U : ℝ) / D) ((V : ℝ) / D) ((W : ℝ) / D) ε hε0 hε1 hu hv hw n c e
  obtain ⟨hlo, hhi⟩ := savedEntryQ_bounds U V W D S n hD hS c e
  have hnonneg : 0 ≤ symmetricEntry n c e - (savedEntryQ U V W D S n c e : ℝ) := by
    linarith
  rw [Real.norm_eq_abs, abs_of_nonneg hnonneg]
  linarith

end
end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.symmetricEntry_savedEntryQ_error' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.symmetricEntry_savedEntryQ_error
