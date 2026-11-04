import Grothe.UpperChaos.ConditionalSeedNormalization
import Grothe.UpperChaos.ConditionalSeedReconstructionError
import Mathlib.Analysis.Normed.Lp.PiLp

/-!
# Common-scalar error for actual finite Gaussian coefficient vectors

Certificate infrastructure for the actual row227 selected-vector check.

The argument uses the actual canonical coefficient and positive integral
seed. A finite mode set is represented in complex PiLp 2,
viewed as a real normed space for the one shared seed scalar.

The norm-square identities retain precisely the requested finite modes.
Bessel supplies the actual coefficient vector's unit norm budget internally.
A caller still has to prove its scalar interval, normalized-vector error and
saved-center error. The seed error is charged once against a vector norm;
there is no cardinality factor and no coordinatewise unit-bound replacement.
No numeric transcript, physical-shift transport or finite-to-actual allowance
is asserted verified here. The final endpoint requires the remaining source
and energy obligations.

Agent-ID: codex-aa04. Refs #293, #21.
-/

open scoped BigOperators

namespace Grothe.UpperChaos.ConditionalSeedVectorError

noncomputable section

open F0ConditionalEvaluator ConditionalSeedNormalization

/-- Euclidean coordinates on exactly the finite retained mode set. -/
abbrev ModeVector (modes : Finset (ℕ × ℕ)) := PiLp 2 (fun _ : modes => ℂ)

/-- Restriction of a coefficient function to the finite Euclidean vector. -/
def modeVector (modes : Finset (ℕ × ℕ)) (f : ℕ × ℕ → ℂ) : ModeVector modes :=
  WithLp.toLp 2 (fun i : modes => f i.val)

/-- The Euclidean norm is the joint coefficient-energy sum, not a supremum. -/
theorem norm_modeVector_sq (modes : Finset (ℕ × ℕ)) (f : ℕ × ℕ → ℂ) :
    ‖modeVector modes f‖ ^ 2 = ∑ i ∈ modes, ‖f i‖ ^ 2 := by
  classical
  simpa only [modeVector, PiLp.toLp_apply, Finset.sum_coe_sort] using
    PiLp.norm_sq_eq_of_L2 (fun _ : modes => ℂ) (modeVector modes f)

theorem norm_modeVector_sub_sq (modes : Finset (ℕ × ℕ))
    (f g : ℕ × ℕ → ℂ) :
    ‖modeVector modes f - modeVector modes g‖ ^ 2 =
      ∑ i ∈ modes, ‖f i - g i‖ ^ 2 := by
  classical
  simpa only [PiLp.sub_apply, modeVector, PiLp.toLp_apply, Finset.sum_coe_sort] using
    PiLp.norm_sq_eq_of_L2 (fun _ : modes => ℂ)
      (modeVector modes f - modeVector modes g)

/-- Real scalar multiplication agrees with multiplication by its complex cast. -/
theorem modeVector_real_mul (modes : Finset (ℕ × ℕ)) (t : ℝ)
    (f : ℕ × ℕ → ℂ) :
    modeVector modes (fun i => (t : ℂ) * f i) = t • modeVector modes f := by
  apply PiLp.ext
  intro i
  simp only [modeVector, PiLp.toLp_apply, PiLp.smul_apply, Complex.real_smul]

theorem norm_modeVector_sub_smul_sq (modes : Finset (ℕ × ℕ))
    (f g : ℕ × ℕ → ℂ) (t : ℝ) :
    ‖modeVector modes f - t • modeVector modes g‖ ^ 2 =
      ∑ i ∈ modes, ‖f i - (t : ℂ) * g i‖ ^ 2 := by
  rw [← modeVector_real_mul]
  exact norm_modeVector_sub_sq modes f (fun i => (t : ℂ) * g i)

/-- An explicit nonnegative radius turns a squared-sum certificate into a
norm bound. This also covers the empty mode set without extra hypotheses. -/
theorem norm_modeVector_sub_le_of_sum_sq_le (modes : Finset (ℕ × ℕ))
    (f g : ℕ × ℕ → ℂ) {r : ℝ} (hr : 0 ≤ r)
    (h : (∑ i ∈ modes, ‖f i - g i‖ ^ 2) ≤ r ^ 2) :
    ‖modeVector modes f - modeVector modes g‖ ≤ r := by
  apply (sq_le_sq₀ (norm_nonneg _) hr).1
  rw [norm_modeVector_sub_sq]
  exact h

/-- The actual canonical Gaussian vector has norm at most one by Bessel. -/
theorem norm_actual_modeVector_le_one (A : ℝ) (modes : Finset (ℕ × ℕ)) :
    ‖modeVector modes (canonicalCoefficient A)‖ ≤ 1 := by
  have hs : ‖modeVector modes (canonicalCoefficient A)‖ ^ 2 ≤ (1 : ℝ) ^ 2 := by
    rw [norm_modeVector_sq]
    simpa only [one_pow] using sum_sq_canonicalCoefficient_le_one A modes
  exact (sq_le_sq₀ (norm_nonneg _) zero_le_one).1 hs

/-- Every actual retained coefficient uses the same positive scalar. -/
theorem actual_modeVector_eq_seed_smul {A : ℝ} (hA : 0 < A)
    (modes : Finset (ℕ × ℕ)) :
    modeVector modes (canonicalCoefficient A) =
      seedScalar A • modeVector modes (normalizedCoefficient A) := by
  apply PiLp.ext
  intro i
  simpa only [modeVector, PiLp.toLp_apply, PiLp.smul_apply, Complex.real_smul] using
    canonicalCoefficient_eq_seed_mul hA i.val

/-- Specialization of the single-scalar estimate to actual Gaussian modes.
The normalized error is one coupled sum, supplied by a separate certificate. -/
theorem norm_actual_reconstruction_error_le {A : ℝ} (hA : 0 < A)
    (modes : Finset (ℕ × ℕ)) (uhat : ℕ × ℕ → ℂ)
    {sLo shat eS eU : ℝ}
    (hsLo : 0 < sLo) (hLower : sLo ≤ seedScalar A)
    (hScalarError : |seedScalar A - shat| ≤ eS)
    (heU : 0 ≤ eU)
    (hNormalizedError :
      (∑ i ∈ modes, ‖normalizedCoefficient A i - uhat i‖ ^ 2) ≤ eU ^ 2) :
    ‖modeVector modes (canonicalCoefficient A) - shat • modeVector modes uhat‖ ≤
      eS / sLo + |shat| * eU := by
  exact ConditionalSeedReconstructionError.norm_reconstruction_error_le
    (actual_modeVector_eq_seed_smul hA modes) hsLo hLower
    (norm_actual_modeVector_le_one A modes) hScalarError
    (norm_modeVector_sub_le_of_sum_sq_le modes (normalizedCoefficient A) uhat
      heU hNormalizedError)

/-- Numerical-facing finite error certificate, still about the actual
canonical coefficients. No scalar uncertainty is charged once per mode. -/
theorem sum_sq_actual_reconstruction_error_le {A : ℝ} (hA : 0 < A)
    (modes : Finset (ℕ × ℕ)) (uhat : ℕ × ℕ → ℂ)
    {sLo shat eS eU R : ℝ}
    (hsLo : 0 < sLo) (hLower : sLo ≤ seedScalar A)
    (hScalarError : |seedScalar A - shat| ≤ eS)
    (heU : 0 ≤ eU)
    (hNormalizedError :
      (∑ i ∈ modes, ‖normalizedCoefficient A i - uhat i‖ ^ 2) ≤ eU ^ 2)
    (hBudget : eS / sLo + |shat| * eU ≤ R) :
    (∑ i ∈ modes, ‖canonicalCoefficient A i - (shat : ℂ) * uhat i‖ ^ 2) ≤
      R ^ 2 := by
  have hn := (norm_actual_reconstruction_error_le hA modes uhat hsLo hLower
    hScalarError heU hNormalizedError).trans hBudget
  have hs := (sq_le_sq₀ (norm_nonneg _) ((norm_nonneg _).trans hn)).2 hn
  rw [norm_modeVector_sub_smul_sq] at hs
  exact hs

/-- A separate saved-center radius adds by the Euclidean triangle inequality.
This radius may cover exact dyadic center assembly or rounding, but that
connection and its error still have to be certified by the caller. -/
theorem norm_actual_saved_error_le {A : ℝ} (hA : 0 < A)
    (modes : Finset (ℕ × ℕ)) (uhat saved : ℕ × ℕ → ℂ)
    {sLo shat eS eU eSaved : ℝ}
    (hsLo : 0 < sLo) (hLower : sLo ≤ seedScalar A)
    (hScalarError : |seedScalar A - shat| ≤ eS)
    (heU : 0 ≤ eU)
    (hNormalizedError :
      (∑ i ∈ modes, ‖normalizedCoefficient A i - uhat i‖ ^ 2) ≤ eU ^ 2)
    (heSaved : 0 ≤ eSaved)
    (hSavedError :
      (∑ i ∈ modes, ‖(shat : ℂ) * uhat i - saved i‖ ^ 2) ≤ eSaved ^ 2) :
    ‖modeVector modes (canonicalCoefficient A) - modeVector modes saved‖ ≤
      eS / sLo + |shat| * eU + eSaved := by
  have hsaved : ‖shat • modeVector modes uhat - modeVector modes saved‖ ≤ eSaved := by
    simpa only [modeVector_real_mul] using
      norm_modeVector_sub_le_of_sum_sq_le modes (fun i => (shat : ℂ) * uhat i)
        saved heSaved hSavedError
  calc
    _ ≤ ‖modeVector modes (canonicalCoefficient A) - shat • modeVector modes uhat‖ +
        ‖shat • modeVector modes uhat - modeVector modes saved‖ :=
      norm_sub_le_norm_sub_add_norm_sub _ _ _
    _ ≤ eS / sLo + |shat| * eU + eSaved :=
      add_le_add
        (norm_actual_reconstruction_error_le hA modes uhat hsLo hLower hScalarError
          heU hNormalizedError) hsaved

/-- Final summed-square interface for a saved finite vector. All three
numerical error inputs and their combined radius remain explicit. -/
theorem sum_sq_actual_saved_error_le {A : ℝ} (hA : 0 < A)
    (modes : Finset (ℕ × ℕ)) (uhat saved : ℕ × ℕ → ℂ)
    {sLo shat eS eU eSaved R : ℝ}
    (hsLo : 0 < sLo) (hLower : sLo ≤ seedScalar A)
    (hScalarError : |seedScalar A - shat| ≤ eS)
    (heU : 0 ≤ eU)
    (hNormalizedError :
      (∑ i ∈ modes, ‖normalizedCoefficient A i - uhat i‖ ^ 2) ≤ eU ^ 2)
    (heSaved : 0 ≤ eSaved)
    (hSavedError :
      (∑ i ∈ modes, ‖(shat : ℂ) * uhat i - saved i‖ ^ 2) ≤ eSaved ^ 2)
    (hBudget : eS / sLo + |shat| * eU + eSaved ≤ R) :
    (∑ i ∈ modes, ‖canonicalCoefficient A i - saved i‖ ^ 2) ≤ R ^ 2 := by
  have hn := (norm_actual_saved_error_le hA modes uhat saved hsLo hLower
    hScalarError heU hNormalizedError heSaved hSavedError).trans hBudget
  have hs := (sq_le_sq₀ (norm_nonneg _) ((norm_nonneg _).trans hn)).2 hn
  rw [norm_modeVector_sub_sq] at hs
  exact hs

end
end Grothe.UpperChaos.ConditionalSeedVectorError

/-- info: 'Grothe.UpperChaos.ConditionalSeedVectorError.norm_modeVector_sub_smul_sq' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSeedVectorError.norm_modeVector_sub_smul_sq

/-- info: 'Grothe.UpperChaos.ConditionalSeedVectorError.norm_actual_modeVector_le_one' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSeedVectorError.norm_actual_modeVector_le_one

/-- info: 'Grothe.UpperChaos.ConditionalSeedVectorError.actual_modeVector_eq_seed_smul' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSeedVectorError.actual_modeVector_eq_seed_smul

/-- info: 'Grothe.UpperChaos.ConditionalSeedVectorError.sum_sq_actual_reconstruction_error_le' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSeedVectorError.sum_sq_actual_reconstruction_error_le

/-- info: 'Grothe.UpperChaos.ConditionalSeedVectorError.sum_sq_actual_saved_error_le' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSeedVectorError.sum_sq_actual_saved_error_le
