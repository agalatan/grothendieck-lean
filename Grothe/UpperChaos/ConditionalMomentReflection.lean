import Grothe.UpperChaos.ShiftedMomentRecurrence
import Grothe.UpperChaos.ConditionalGaussianPolynomial
import Grothe.UpperChaos.HermiteConjugation
import Grothe.Haagerup.PhaseLaplaceFubini
import Mathlib.LinearAlgebra.Finsupp.LinearCombination

/-!
# Reflection of conditional complex Hermite moments

The finite moment identity is connected to actual Gaussian phase integrals.

The reflection is established for each positive Laplace parameter. Its finite
algebra uses the actual shifted damped moments, including their inverse-rate
mass. The final theorem applies the existing absolute Fubini theorem to obtain
an equality of actual phase integrals. No special-function formula is assumed.

The polynomial swap below only renames variables. It does not conjugate
coefficients, so its moment invariance holds for every complex polynomial.

Agent-ID: codex-7c2e
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.ConditionalMomentReflection

noncomputable section

/-- Finite shifted Gaussian expectation, with the original mass `β⁻¹`. -/
def moment (β m : ℝ) : CPoly →ₗ[ℂ] ℂ :=
  (Finsupp.linearCombination ℂ
    (fun s : Fin 2 →₀ ℕ => shiftedDampedMoment β (m : ℂ) (s 0) (s 1))).comp
      (AddMonoidAlgebra.coeffLinearEquiv ℂ).toLinearMap

theorem moment_apply (β m : ℝ) (P : CPoly) :
    moment β m P = ∑ s ∈ P.support,
      P.coeff s * shiftedDampedMoment β (m : ℂ) (s 0) (s 1) := by
  change P.coeff.sum (fun s c => c • shiftedDampedMoment β (m : ℂ) (s 0) (s 1)) = _
  simp only [MvPolynomial.sum_def, smul_eq_mul]

theorem moment_monomial (β m : ℝ) (s : Fin 2 →₀ ℕ) (c : ℂ) :
    moment β m (monomial s c) = c * shiftedDampedMoment β (m : ℂ) (s 0) (s 1) := by
  change Finsupp.linearCombination ℂ _ (Finsupp.single s c) = _
  simp only [Finsupp.linearCombination_single, smul_eq_mul]

theorem moment_C_mul (β m : ℝ) (c : ℂ) (P : CPoly) :
    moment β m (C c * P) = c * moment β m P := by
  rw [C_mul', map_smul, smul_eq_mul]

/-- Real shifts make the two exponents interchangeable. -/
theorem shiftedDampedMoment_real_swap (β m : ℝ) (p q : ℕ) :
    shiftedDampedMoment β (m : ℂ) p q =
      shiftedDampedMoment β (m : ℂ) q p := by
  unfold shiftedDampedMoment
  rw [Nat.min_comm q p]
  apply Finset.sum_congr rfl
  intro k hk
  simp only [Complex.conj_ofReal]
  ring

theorem shiftedDampedMoment_real_succ_right (β m : ℝ) (hβ : 0 < β) (p q : ℕ) :
    shiftedDampedMoment β (m : ℂ) p (q + 1) =
      (m : ℂ) * shiftedDampedMoment β (m : ℂ) p q +
        ((p : ℂ) / (β : ℂ)) * shiftedDampedMoment β (m : ℂ) (p - 1) q := by
  rw [shiftedDampedMoment_real_swap β m p (q + 1),
    shiftedDampedMoment_succ_left β (m : ℂ) q p hβ,
    shiftedDampedMoment_real_swap β m q p,
    shiftedDampedMoment_real_swap β m q (p - 1)]

/-- The first finite Stein identity is the existing mixed-moment recurrence. -/
theorem moment_X0_mul (β m : ℝ) (hβ : 0 < β) (P : CPoly) :
    moment β m (X 0 * P) = (m : ℂ) * moment β m P +
      (β : ℂ)⁻¹ * moment β m (pderiv 1 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
      rw [X, monomial_mul_monomial, one_mul, pderiv_monomial]
      simp only [moment_monomial]
      have e0 : ((Finsupp.single 0 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 =
          s 0 + 1 := by simp [add_comm]
      have e1 : ((Finsupp.single 0 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 =
          s 1 := by simp
      have f0 : ((s - Finsupp.single 1 1 : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 =
          s 0 := by simp
      have f1 : ((s - Finsupp.single 1 1 : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 =
          s 1 - 1 := by simp
      rw [e0, e1, f0, f1, shiftedDampedMoment_succ_left β (m : ℂ) _ _ hβ]
      ring
  | add P Q hP hQ =>
      simp only [mul_add, map_add, hP, hQ]
      ring

/-- Real-shift symmetry gives the second finite Stein identity. -/
theorem moment_X1_mul (β m : ℝ) (hβ : 0 < β) (P : CPoly) :
    moment β m (X 1 * P) = (m : ℂ) * moment β m P +
      (β : ℂ)⁻¹ * moment β m (pderiv 0 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
      rw [X, monomial_mul_monomial, one_mul, pderiv_monomial]
      simp only [moment_monomial]
      have e0 : ((Finsupp.single 1 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 =
          s 0 := by simp
      have e1 : ((Finsupp.single 1 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 =
          s 1 + 1 := by simp [add_comm]
      have f0 : ((s - Finsupp.single 0 1 : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 =
          s 0 - 1 := by simp
      have f1 : ((s - Finsupp.single 0 1 : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 =
          s 1 := by simp
      rw [e0, e1, f0, f1, shiftedDampedMoment_real_succ_right β m hβ]
      ring
  | add P Q hP hQ =>
      simp only [mul_add, map_add, hP, hQ]
      ring

theorem moment_A0 (β m : ℝ) (hβ : 0 < β) (P : CPoly) :
    moment β m (A0 P) = (m : ℂ) * moment β m P +
      ((β : ℂ)⁻¹ - 1) * moment β m (pderiv 1 P) := by
  rw [A0, map_sub, moment_X0_mul β m hβ]
  ring

theorem moment_A1 (β m : ℝ) (hβ : 0 < β) (P : CPoly) :
    moment β m (A1 P) = (m : ℂ) * moment β m P +
      ((β : ℂ)⁻¹ - 1) * moment β m (pderiv 0 P) := by
  rw [A1, map_sub, moment_X1_mul β m hβ]
  ring

/-- Rename the two variables without conjugating any coefficient. -/
def swap : CPoly →ₐ[ℂ] CPoly := rename (Equiv.swap (0 : Fin 2) 1)

theorem swap_X (i : Fin 2) : swap (X i) = X (Equiv.swap (0 : Fin 2) 1 i) := by
  simp [swap]

theorem swap_C (c : ℂ) : swap (C c) = C c := by simp [swap]

theorem pderiv_swap (i : Fin 2) (P : CPoly) :
    pderiv i (swap P) = swap (pderiv (Equiv.swap (0 : Fin 2) 1 i) P) := by
  have h := pderiv_rename (Equiv.swap (0 : Fin 2) 1).injective
    (Equiv.swap (0 : Fin 2) 1 i) P
  simpa [swap] using h

theorem swap_A0 (P : CPoly) : swap (A0 P) = A1 (swap P) := by
  have hd : swap (pderiv 1 P) = pderiv 0 (swap P) := by
    simpa using (pderiv_swap (0 : Fin 2) P).symm
  simp [A0, A1, swap_X, hd]

theorem swap_A1 (P : CPoly) : swap (A1 P) = A0 (swap P) := by
  have hd : swap (pderiv 0 P) = pderiv 1 (swap P) := by
    simpa using (pderiv_swap (1 : Fin 2) P).symm
  simp [A0, A1, swap_X, hd]

theorem swap_H (p q : ℕ) : swap (H p q) = H q p := by
  induction p with
  | zero =>
      induction q with
      | zero => simp [H_zero_zero]
      | succ q ih => rw [H_zero_succ, swap_A1, ih, H_succ_left]
  | succ p ih => rw [H_succ_left, swap_A0, ih, H_succ_right]

theorem moment_swap (β m : ℝ) (P : CPoly) : moment β m (swap P) = moment β m P := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
      change moment β m (rename (Equiv.swap (0 : Fin 2) 1) (monomial s c)) = _
      rw [rename_monomial, moment_monomial, moment_monomial]
      simp only [Finsupp.mapDomain_equiv_apply, Equiv.symm_swap,
        Equiv.swap_apply_left, Equiv.swap_apply_right]
      rw [shiftedDampedMoment_real_swap]
  | add P Q hP hQ => simp only [map_add, hP, hQ]

/-- The exact algebraic defect before imposing the conditional Gaussian shift. -/
theorem moment_ward_identity (β m A : ℝ) (hβ : 0 < β) (P : CPoly) :
    moment β m ((C (A : ℂ) + X 0) * A1 P) -
        moment β m ((C (A : ℂ) + X 1) * A0 P) =
      ((A : ℂ) * (β : ℂ)⁻¹ - (A : ℂ) - (m : ℂ)) *
        (moment β m (pderiv 0 P) - moment β m (pderiv 1 P)) := by
  simp only [add_mul, map_add, moment_C_mul, moment_X0_mul β m hβ,
    moment_X1_mul β m hβ, moment_A0 β m hβ, moment_A1 β m hβ,
    pderiv1_A1, pderiv0_A0, pderiv_comm]
  ring

/-- The real conditional Gaussian shift makes the Ward defect vanish. -/
theorem moment_phase_creation_reflection (β m A : ℝ) (hβ : 0 < β)
    (hm : (m : ℂ) = (A : ℂ) * (β : ℂ)⁻¹ - (A : ℂ)) (P : CPoly) :
    moment β m ((C (A : ℂ) + X 0) * A1 P) =
      moment β m ((C (A : ℂ) + X 0) * A1 (swap P)) := by
  have hz : (A : ℂ) * (β : ℂ)⁻¹ - (A : ℂ) - (m : ℂ) = 0 := by rw [hm]; ring
  have hw := moment_ward_identity β m A hβ P
  rw [hz, zero_mul] at hw
  calc
    _ = moment β m ((C (A : ℂ) + X 1) * A0 P) := sub_eq_zero.mp hw
    _ = moment β m (swap ((C (A : ℂ) + X 1) * A0 P)) :=
      (moment_swap β m _).symm
    _ = _ := by
      simp only [map_mul, map_add, swap_C, swap_X, swap_A0, Equiv.swap_apply_right]

/-- Reflection of unnormalized Hermite insertions at each positive Laplace parameter. -/
theorem moment_H_reflection (A t : ℝ) (ht : 0 < t) (p q : ℕ) :
    moment (1 + t) (-(t / (1 + t)) * A)
        ((C (A : ℂ) + X 0) * H p (q + 1)) =
      moment (1 + t) (-(t / (1 + t)) * A)
        ((C (A : ℂ) + X 0) * H q (p + 1)) := by
  have hβ : 0 < 1 + t := by linarith
  have hβC : 1 + (t : ℂ) ≠ 0 := by exact_mod_cast hβ.ne'
  have hm : ((-(t / (1 + t)) * A : ℝ) : ℂ) =
      (A : ℂ) * ((1 + t : ℝ) : ℂ)⁻¹ - (A : ℂ) := by
    push_cast
    field_simp [hβC]
    ring
  simpa only [H_succ_right, swap_H] using
    moment_phase_creation_reflection (1 + t) (-(t / (1 + t)) * A) A hβ hm (H p q)

/-- The affine finite sum in the proved Gaussian integral is this moment functional. -/
theorem moment_phase_eq_sum (β m A : ℝ) (P : CPoly) :
    moment β m ((C (A : ℂ) + X 0) * P) =
      ∑ s ∈ P.support, P.coeff s *
        ((A : ℂ) * shiftedDampedMoment β (m : ℂ) (s 0) (s 1) +
          shiftedDampedMoment β (m : ℂ) (s 0 + 1) (s 1)) := by
  classical
  conv_lhs => rw [P.as_sum]
  simp only [Finset.mul_sum, map_sum]
  apply Finset.sum_congr rfl
  intro s hs
  rw [add_mul, map_add, moment_C_mul, moment_monomial,
    X, monomial_mul_monomial, one_mul, moment_monomial]
  have e0 : ((Finsupp.single 0 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 =
      s 0 + 1 := by simp [add_comm]
  have e1 : ((Finsupp.single 0 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 =
      s 1 := by simp
  rw [e0, e1]
  ring

/-- The finite moment functional is tied to the actual conditional kernel integral. -/
theorem integral_phaseLaplace_eq_moment (P : CPoly) (A t : ℝ) (ht : 0 < t) :
    (∫ w, ev w P * Haag.phaseLaplaceKernel ((A : ℂ) + w) t ∂gaussC) =
      ((t ^ (-(1 / 2 : ℝ)) * Real.exp (-(t * Complex.normSq (A : ℂ) / (1 + t))) : ℝ) : ℂ) *
        moment (1 + t) (-(t / (1 + t)) * A) ((C (A : ℂ) + X 0) * P) := by
  rw [moment_phase_eq_sum]
  simpa only [one_pow, one_mul, sub_self, neg_zero, zero_mul, Real.exp_zero,
    Complex.ofReal_one, mul_one, Complex.ofReal_neg, Complex.ofReal_mul] using
    integral_affine_phaseLaplace_polynomial P 1 1 t (A : ℂ) (by norm_num) ht

/-- Pointwise-in-parameter reflection of actual conditional Gaussian kernel integrals. -/
theorem integral_phaseLaplace_H_reflection (A t : ℝ) (ht : 0 < t) (p q : ℕ) :
    (∫ w, ev w (H p (q + 1)) * Haag.phaseLaplaceKernel ((A : ℂ) + w) t ∂gaussC) =
      ∫ w, ev w (H q (p + 1)) * Haag.phaseLaplaceKernel ((A : ℂ) + w) t ∂gaussC := by
  rw [integral_phaseLaplace_eq_moment _ A t ht,
    integral_phaseLaplace_eq_moment _ A t ht, moment_H_reflection A t ht p q]

/-- Reflection for the actual phase integrals, before the known Hermite normalizers.
For the canonical coefficient use `conj_ev_H_swap` and put `(p,q)=(d,c-1)`.
The remaining normalization factor is `sqrt(c/(d+1))`. -/
theorem integral_phase_H_reflection (A : ℝ) (p q : ℕ) :
    (∫ w, ev w (H p (q + 1)) * Haag.ph ((A : ℂ) + w) ∂gaussC) =
      ∫ w, ev w (H q (p + 1)) * Haag.ph ((A : ℂ) + w) ∂gaussC := by
  have hf : Measurable (fun w : ℂ => (A : ℂ) + w) := by fun_prop
  rw [Haag.integral_mul_ph_eq_phaseLaplace gaussC
    (continuous_ev (H p (q + 1))).measurable hf (integrable_ev (H p (q + 1))),
    Haag.integral_mul_ph_eq_phaseLaplace gaussC
      (continuous_ev (H q (p + 1))).measurable hf (integrable_ev (H q (p + 1)))]
  congr 1
  apply setIntegral_congr_fun measurableSet_Ioi
  intro t ht
  exact integral_phaseLaplace_H_reflection A t ht p q

end
end Grothe.UpperChaos.ConditionalMomentReflection

/-- info: 'Grothe.UpperChaos.ConditionalMomentReflection.integral_phase_H_reflection' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalMomentReflection.integral_phase_H_reflection
