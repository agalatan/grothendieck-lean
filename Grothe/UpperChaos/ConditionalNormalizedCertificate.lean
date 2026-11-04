import Grothe.UpperChaos.ConditionalNormalizedTriangle
import Grothe.UpperChaos.ConditionalNormalizedDyadic
import Grothe.UpperChaos.OriginalMomentRatioCertificates

/-!
# Finite LeanCert checkpoints bound actual normalized Gaussian integrals

Certificate infrastructure for the actual row227 selected-vector check.
The local interval operations and triangle induction use the original
proved moment-ratio recurrence.

The certificate verifies roots, backward moment ratios and every signed
forward checkpoint. The final conclusion is about the actual Gaussian
coefficient, not a separate recursive surrogate. The finite triangle has no
independent diagonal input. Numerical data, original-byte decoding and the
joint selected error sum are separate obligations.

Agent-ID: codex-aa04. Refs #293, #21.
-/

open LeanCert.Core

namespace Grothe.UpperChaos.ConditionalNormalizedCertificate

open ConditionalNormalizedTriangle ConditionalNormalizedDyadic

/-- The charge is integer subtraction. The predecessor row is indexed by c. -/
def charge (c d : ℕ) : ℤ := (d : ℤ) + 1 - (c : ℤ)

theorem charge_cast (c d : ℕ) :
    (charge c d : ℝ) = (d : ℝ) + 1 - (c : ℝ) := by
  simp only [charge, Int.cast_sub, Int.cast_add, Int.cast_one, Int.cast_natCast]

/-- All operation guards are finite and separately checkable. Positivity is
checked on denominator intervals, rather than inferred from the true root.
No actual coefficient enclosure occurs in this structure. -/
structure LocalChecks (prec : ℤ) (M : ℕ) (IA : IntervalDyadic)
    (R S : ℕ → IntervalDyadic) (T : ℕ → ℕ → IntervalDyadic) : Prop where
  roots : ∀ n, 0 < n → n < M → sqrtCheck n (S n) = true
  rootPos : ∀ n, 0 < n → n < M → 0 < (S n).lo.toRat
  productPos : ∀ c, c + 1 < M → 0 < (roundedMul prec IA (S (c + 1))).lo.toRat
  base : 0 < M → (integerInterval 1).subset (T 0 0) = true
  zero : ∀ d (hd : d + 1 < M),
    zeroStepOK prec IA (R d) (S (d + 1)) (T 0 d) (T 0 (d + 1))
      (rootPos (d + 1) (by omega) hd) = true
  forward : ∀ c d (_hcd : c + 1 ≤ d + 1) (hsum : c + 1 + d < M),
    forwardStepOK prec (charge c d) IA (S (d + 1)) (S (c + 1))
      (T c (d + 1)) (T c d) (T (c + 1) d)
      (rootPos (c + 1) (by omega) (by omega))
      (productPos c (by omega)) = true

noncomputable section

/-- Actual integral coverage from local operations and proved moment-ratio
membership. The next theorem discharges that membership from a finite check. -/
theorem normalized_mem_of_local {A : ℝ} (hA : 0 < A)
    {prec : ℤ} (hprec : prec ≤ 0) (M : ℕ) (IA : IntervalDyadic)
    (R S : ℕ → IntervalDyadic) (T : ℕ → ℕ → IntervalDyadic)
    (hIA : A ∈ IA) (checks : LocalChecks prec M IA R S T)
    (hR : ∀ d, d + 1 < M → OriginalPositiveMoment.ratio d (A ^ 2) ∈ R d) :
    ∀ c d, c ≤ d + 1 → c + d < M → normalizedReal A c d ∈ T c d := by
  apply predicate_of_local hA M (fun c d u => u ∈ T c d)
  · intro hM
    exact mem_of_subset (checks.base hM) (by simpa using mem_integerInterval 1)
  · intro d hd u hu
    have hs := sqrt_mem_of_check (d + 1) (S (d + 1))
      (checks.roots (d + 1) (by omega) hd)
    simpa only [zeroFactor] using
      zeroStep_mem_of_check hprec (checks.rootPos (d + 1) (by omega) hd)
        hIA (hR d hd) hs hu (checks.zero d hd)
  · intro c d hcd hsum uCur uNext hCur hNext
    have hcM : c + 1 < M := by omega
    have hdM : d + 1 < M := by omega
    have hsc := sqrt_mem_of_check (c + 1) (S (c + 1))
      (checks.roots (c + 1) (by omega) hcM)
    have hsd := sqrt_mem_of_check (d + 1) (S (d + 1))
      (checks.roots (d + 1) (by omega) hdM)
    rw [forwardValue_eq_split hA]
    simpa only [charge_cast] using
      forwardStep_mem_of_check hprec (charge c d)
        (checks.rootPos (c + 1) (by omega) hcM) (checks.productPos c hcM)
        hIA hsd hsc hNext hCur (checks.forward c d hcd hsum)

/-- The complete finite ratio check closes the only actual-ratio premise.
The same true squared shift is used for every ratio and every recurrence.
Every root and local operation is covered by LocalChecks; every coefficient
in the full triangle is the actual normalized integral. -/
theorem normalized_mem_of_certificate {A : ℝ} (hA : 0 < A)
    {prec : ℤ} (hprec : prec ≤ 0) (M H : ℕ) (hMH : M ≤ H)
    (IA : IntervalDyadic) (R S : ℕ → IntervalDyadic)
    (T : ℕ → ℕ → IntervalDyadic) (xlo xhi : ℚ)
    (hIA : A ∈ IA) (hxl : (xlo : ℝ) ≤ A ^ 2) (hxh : A ^ 2 ≤ (xhi : ℝ))
    (ratioCheck : OriginalMomentRatioCertificates.certificateOK H
      (fun n => (R n).lo.toRat) (fun n => (R n).hi.toRat) xlo xhi = true)
    (checks : LocalChecks prec M IA R S T) :
    ∀ c d, c ≤ d + 1 → c + d < M → normalizedReal A c d ∈ T c d := by
  apply normalized_mem_of_local hA hprec M IA R S T hIA checks
  intro d hd
  exact OriginalMomentRatioCertificates.ratio_mem_of_certificate H
    (fun n => (R n).lo.toRat) (fun n => (R n).hi.toRat) xlo xhi
    ratioCheck hxl hxh d (by omega)

/-- Complex actual-integral form, using reality rather than discarding an
imaginary part. Both endpoints are real and the imaginary part equals zero. -/
theorem normalizedCoefficient_mem_of_certificate {A : ℝ} (hA : 0 < A)
    {prec : ℤ} (hprec : prec ≤ 0) (M H : ℕ) (hMH : M ≤ H)
    (IA : IntervalDyadic) (R S : ℕ → IntervalDyadic)
    (T : ℕ → ℕ → IntervalDyadic) (xlo xhi : ℚ)
    (hIA : A ∈ IA) (hxl : (xlo : ℝ) ≤ A ^ 2) (hxh : A ^ 2 ≤ (xhi : ℝ))
    (ratioCheck : OriginalMomentRatioCertificates.certificateOK H
      (fun n => (R n).lo.toRat) (fun n => (R n).hi.toRat) xlo xhi = true)
    (checks : LocalChecks prec M IA R S T)
    (c d : ℕ) (hcd : c ≤ d + 1) (hsum : c + d < M) :
    (ConditionalSeedNormalization.normalizedCoefficient A (c, d)).re ∈ T c d ∧
      (ConditionalSeedNormalization.normalizedCoefficient A (c, d)).im = 0 := by
  rw [normalizedCoefficient_eq_ofReal]
  simp only [Complex.ofReal_re, Complex.ofReal_im, and_true]
  exact normalized_mem_of_certificate hA hprec M H hMH IA R S T xlo xhi
    hIA hxl hxh ratioCheck checks c d hcd hsum

end
end Grothe.UpperChaos.ConditionalNormalizedCertificate

/-- info: 'Grothe.UpperChaos.ConditionalNormalizedCertificate.normalized_mem_of_certificate' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNormalizedCertificate.normalized_mem_of_certificate

/-- info: 'Grothe.UpperChaos.ConditionalNormalizedCertificate.normalizedCoefficient_mem_of_certificate' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNormalizedCertificate.normalizedCoefficient_mem_of_certificate
