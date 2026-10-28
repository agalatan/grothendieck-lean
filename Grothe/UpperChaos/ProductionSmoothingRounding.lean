import Grothe.UpperChaos.FixedChaosRoundedEntries

/-! Concrete scalar rounding for every production symmetric-power matrix.
Agent-ID: codex-7c2e -/

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

open scoped Matrix Matrix.Norms.Frobenius

def smoothingScalarDen : ℕ := 1000000000000000000000000
def smoothingU : ℕ := 990987078608458638622543
def smoothingV : ℕ := 29500621630600679093812
def smoothingW : ℕ := 903440112391457239941125
def smoothingEntryScale : ℕ := 10000000000000000000000
def smoothingRelativeErrorQ : ℚ := 1 / 10000000000000000000000

def smoothingLowerUQ : ℚ := (smoothingU : ℚ) / smoothingScalarDen
def smoothingLowerVQ : ℚ := (smoothingV : ℚ) / smoothingScalarDen
def smoothingLowerWQ : ℚ := (smoothingW : ℚ) / smoothingScalarDen

private theorem lower_scalar_relative (l L H ε : ℚ) (x : ℝ)
    (hε : ε ≤ 1) (hl : 0 ≤ l ∧ l ≤ L ∧ (1 - ε) * H ≤ l)
    (hx : (L : ℝ) ≤ x ∧ x ≤ (H : ℝ)) :
    0 ≤ (l : ℝ) ∧ (1 - (ε : ℝ)) * x ≤ l ∧ (l : ℝ) ≤ x := by
  have hl0 : (0 : ℝ) ≤ l := by exact_mod_cast hl.1
  have hll : (l : ℝ) ≤ L := by exact_mod_cast hl.2.1
  have hlh : (1 - (ε : ℝ)) * (H : ℝ) ≤ l := by exact_mod_cast hl.2.2
  have he : (ε : ℝ) ≤ 1 := by exact_mod_cast hε
  exact ⟨hl0, (mul_le_mul_of_nonneg_left hx.2 (by linarith)).trans hlh,
    hll.trans hx.1⟩

/-- The three rounded scalars lie below the production matrix and lose at
most 10^-22 relatively, proved from rational square-root enclosures. -/
theorem smoothing_lower_scalars_relative :
    (0 ≤ (smoothingLowerUQ : ℝ) ∧
      (1 - (smoothingRelativeErrorQ : ℝ)) * m00 ≤ smoothingLowerUQ ∧
      (smoothingLowerUQ : ℝ) ≤ m00) ∧
    (0 ≤ (smoothingLowerVQ : ℝ) ∧
      (1 - (smoothingRelativeErrorQ : ℝ)) * m01 ≤ smoothingLowerVQ ∧
      (smoothingLowerVQ : ℝ) ≤ m01) ∧
    (0 ≤ (smoothingLowerWQ : ℝ) ∧
      (1 - (smoothingRelativeErrorQ : ℝ)) * m11 ≤ smoothingLowerWQ ∧
      (smoothingLowerWQ : ℝ) ≤ m11) := by
  obtain ⟨h0, h1, h2⟩ := production_matrix_interval
  have he : smoothingRelativeErrorQ ≤ 1 := by norm_num [smoothingRelativeErrorQ]
  refine ⟨lower_scalar_relative _ _ _ _ _ he ?_ h0.2,
    lower_scalar_relative _ _ _ _ _ he ?_ h1.2,
    lower_scalar_relative _ _ _ _ _ he ?_ h2.2⟩
  all_goals norm_num [smoothingLowerUQ, smoothingLowerVQ, smoothingLowerWQ,
    smoothingScalarDen, smoothingU, smoothingV, smoothingW, smoothingRelativeErrorQ,
    m00LoQ, m00HiQ, m01LoQ, m01HiQ, m11LoQ, m11HiQ,
    projectionQ, sqrtEtaLoQ, sqrtEtaHiQ, Grothe.Upper.bQ]

/-- A computable rational matrix at every degree, using only integers and
one square-root floor for each entry. -/
def productionSavedEntryQ (n : ℕ) (c e : Fin (n + 1)) : ℚ :=
  savedEntryQ smoothingU smoothingV smoothingW smoothingScalarDen smoothingEntryScale n c e

noncomputable section

def productionSavedMatrix (n : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ :=
  fun c e => (productionSavedEntryQ n c e : ℝ)

/-- The entry error is proved uniformly, without a computed interval premise. -/
theorem production_saved_entry_error (n : ℕ) (c e : Fin (n + 1)) :
    ‖symmetricEntry n c e - productionSavedMatrix n c e‖ ≤
      (n + 1 : ℝ) / 10000000000000000000000 := by
  obtain ⟨hu, hv, hw⟩ := smoothing_lower_scalars_relative
  simp only [smoothingLowerUQ, smoothingLowerVQ, smoothingLowerWQ, Rat.cast_div,
    Rat.cast_natCast] at hu hv hw
  have h := symmetricEntry_savedEntryQ_error smoothingU smoothingV smoothingW
    smoothingScalarDen smoothingEntryScale (by norm_num [smoothingScalarDen])
    (by norm_num [smoothingEntryScale]) (smoothingRelativeErrorQ : ℝ)
    (by norm_num [smoothingRelativeErrorQ]) (by norm_num [smoothingRelativeErrorQ])
    hu hv hw n c e
  change ‖symmetricEntry n c e - productionSavedMatrix n c e‖ ≤ _ at h
  convert h using 1
  norm_num [smoothingRelativeErrorQ, smoothingEntryScale]
  ring

/-- For every grade that can enter the degree-501 energy head, the complete
two-sided matrix rounding costs at most 4*10^-15 times the input grade norm. -/
theorem production_grade_error (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (q : Fin N)
    (hq : q.val ≤ 250) :
    ‖actualGradeMatrix N a q -
      (productionSavedMatrix (q.val + 1) * gradeCoefficientMatrix q a) *
        (productionSavedMatrix q.val)ᵀ‖ ≤
      (4 / 1000000000000000 : ℝ) * ‖gradeCoefficientMatrix q a‖ := by
  have hqr : (q.val : ℝ) ≤ 250 := by exact_mod_cast hq
  have hl (c e : Fin (q.val + 2)) :
      ‖symmetricEntry (q.val + 1) c e - productionSavedMatrix (q.val + 1) c e‖ ≤
        (252 / 10000000000000000000000 : ℝ) := by
    apply (production_saved_entry_error (q.val + 1) c e).trans
    push_cast
    linarith
  have hr (c e : Fin (q.val + 1)) :
      ‖symmetricEntry q.val c e - productionSavedMatrix q.val c e‖ ≤
        (252 / 10000000000000000000000 : ℝ) := by
    apply (production_saved_entry_error q.val c e).trans
    linarith
  have h := actualGradeMatrix_error_of_entries N a q
    (productionSavedMatrix (q.val + 1)) (productionSavedMatrix q.val)
    (252 / 10000000000000000000000) (252 / 10000000000000000000000)
    (by norm_num) (by norm_num) hl hr
  apply h.trans
  apply mul_le_mul_of_nonneg_right _ (norm_nonneg _)
  calc
    _ ≤ (252 : ℝ) * 251 *
        (252 / 10000000000000000000000 + 252 / 10000000000000000000000 +
          (252 / 10000000000000000000000) * (252 / 10000000000000000000000)) := by
      gcongr <;> linarith
    _ ≤ _ := by norm_num

end

end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.smoothing_lower_scalars_relative' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.smoothing_lower_scalars_relative

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.production_grade_error' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.production_grade_error
