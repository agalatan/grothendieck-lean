import Grothe.UpperChaos.ConditionalMomentReflection

/-!
# Charge identity for actual conditional Gaussian moments

The finite shifted-moment charge identity is lifted through the existing
absolute Laplace/Fubini theorem. The complete residual is one polynomial,
so its integrability is discharged before expanding the final integral.
No numerical seed, coefficient enclosure or parameter transport is asserted.

Agent-ID: codex-aa04. Refs #21.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic

namespace Grothe.UpperChaos.ConditionalMomentCharge

open ConditionalMomentReflection

noncomputable section

/-- At the physical conditional shift, the finite moment functional satisfies
the charge identity. The scalar subtraction is in `ℂ`, not in `ℕ`. -/
theorem moment_polynomial_charge (β m A : ℝ) (hβ : 0 < β)
    (hm : (m : ℂ) = (A : ℂ) * (β : ℂ)⁻¹ - (A : ℂ)) (P : CPoly) :
    (A : ℂ) *
        (moment β m ((C (A : ℂ) + X 0) * A1 P) -
          moment β m ((C (A : ℂ) + X 0) * A0 P)) =
      moment β m ((C (A : ℂ) + X 0) *
        (P + A0 (pderiv 0 P) - A1 (pderiv 1 P))) := by
  simp only [add_mul, mul_add, mul_sub, map_add, map_sub, moment_C_mul,
    moment_X0_mul β m hβ, moment_A0 β m hβ, moment_A1 β m hβ,
    pderiv1_A0, pderiv1_A1, pderiv_comm, hm]
  ring

private theorem A0_pderiv0_H (p q : ℕ) :
    A0 (pderiv 0 (H p q)) = p • H p q := by
  cases p with
  | zero => simp [pderiv0_H_zero, A0]
  | succ p =>
      rw [pderiv0_H_succ, A0_smul, ← H_succ_left]

private theorem A1_pderiv1_H (p q : ℕ) :
    A1 (pderiv 1 (H p q)) = q • H p q := by
  cases q with
  | zero => simp [pderiv1_H_zero, A1]
  | succ q =>
      rw [pderiv1_H_succ, A1_smul, ← H_succ_right]

private theorem hermite_charge_polynomial (p q : ℕ) :
    H p q + A0 (pderiv 0 (H p q)) - A1 (pderiv 1 (H p q)) =
      C ((p : ℂ) + 1 - (q : ℂ)) * H p q := by
  rw [A0_pderiv0_H, A1_pderiv1_H]
  simp only [nsmul_eq_mul, map_sub, map_add, map_natCast, map_one]
  ring

/-- Unnormalized Hermite specialization of the finite moment identity.
For outgoing coefficient indices `(c,d)`, substitute `(p,q) = (d,c)`. -/
theorem moment_H_charge (β m A : ℝ) (hβ : 0 < β)
    (hm : (m : ℂ) = (A : ℂ) * (β : ℂ)⁻¹ - (A : ℂ)) (p q : ℕ) :
    (A : ℂ) *
        (moment β m ((C (A : ℂ) + X 0) * H p (q + 1)) -
          moment β m ((C (A : ℂ) + X 0) * H (p + 1) q)) =
      ((p : ℂ) + 1 - (q : ℂ)) *
        moment β m ((C (A : ℂ) + X 0) * H p q) := by
  calc
    _ = moment β m ((C (A : ℂ) + X 0) *
        (H p q + A0 (pderiv 0 (H p q)) - A1 (pderiv 1 (H p q)))) := by
      simpa only [H_succ_right, H_succ_left] using
        moment_polynomial_charge β m A hβ hm (H p q)
    _ = moment β m (C ((p : ℂ) + 1 - (q : ℂ)) *
        ((C (A : ℂ) + X 0) * H p q)) := by
      rw [hermite_charge_polynomial]
      exact congrArg (moment β m) (by ring)
    _ = _ := moment_C_mul β m _ _

/-- One polynomial carries the entire residual, so its Laplace lift requires
no separate interchange of an improper integral with a subtraction. -/
private def chargeDefect (A : ℝ) (p q : ℕ) : CPoly :=
  C (A : ℂ) * (H p (q + 1) - H (p + 1) q) -
    C ((p : ℂ) + 1 - (q : ℂ)) * H p q

private theorem moment_chargeDefect (A t : ℝ) (ht : 0 < t) (p q : ℕ) :
    moment (1 + t) (-(t / (1 + t)) * A)
      ((C (A : ℂ) + X 0) * chargeDefect A p q) = 0 := by
  have hβ : 0 < 1 + t := by linarith
  have hβC : 1 + (t : ℂ) ≠ 0 := by exact_mod_cast hβ.ne'
  have hm : ((-(t / (1 + t)) * A : ℝ) : ℂ) =
      (A : ℂ) * ((1 + t : ℝ) : ℂ)⁻¹ - (A : ℂ) := by
    push_cast
    field_simp [hβC]
    ring
  have hpoly : (C (A : ℂ) + X 0) * chargeDefect A p q =
      C (A : ℂ) * ((C (A : ℂ) + X 0) * H p (q + 1)) -
      C (A : ℂ) * ((C (A : ℂ) + X 0) * H (p + 1) q) -
      C ((p : ℂ) + 1 - (q : ℂ)) * ((C (A : ℂ) + X 0) * H p q) := by
    unfold chargeDefect
    ring
  rw [hpoly]
  simp only [map_sub, moment_C_mul]
  rw [← mul_sub, moment_H_charge (1 + t) (-(t / (1 + t)) * A) A hβ hm,
    sub_self]

private theorem integral_chargeDefect (A : ℝ) (p q : ℕ) :
    (∫ w, ev w (chargeDefect A p q) * Haag.ph ((A : ℂ) + w) ∂gaussC) = 0 := by
  have hf : Measurable (fun w : ℂ => (A : ℂ) + w) := by fun_prop
  rw [Haag.integral_mul_ph_eq_phaseLaplace gaussC
    (continuous_ev (chargeDefect A p q)).measurable hf
    (integrable_ev (chargeDefect A p q))]
  have hz : (∫ t : ℝ in Set.Ioi 0,
      ∫ w, ev w (chargeDefect A p q) *
        Haag.phaseLaplaceKernel ((A : ℂ) + w) t ∂gaussC) = 0 := by
    calc
      _ = ∫ _t : ℝ in Set.Ioi 0, (0 : ℂ) := by
        apply setIntegral_congr_fun measurableSet_Ioi
        intro t ht
        rw [integral_phaseLaplace_eq_moment _ A t ht,
          moment_chargeDefect A t ht p q, mul_zero]
      _ = 0 := by simp
  rw [hz, mul_zero]

private theorem integrable_ev_mul_phase (A : ℝ) (P : CPoly) :
    Integrable (fun w => ev w P * Haag.ph ((A : ℂ) + w)) gaussC := by
  have hf : Measurable (fun w : ℂ => (A : ℂ) + w) := by fun_prop
  apply (integrable_ev P).mul_bdd
    (Haag.measurable_ph.comp hf).aestronglyMeasurable
  exact Filter.Eventually.of_forall (fun w => Haag.norm_ph_le ((A : ℂ) + w))

private def phaseMoment (A : ℝ) : CPoly →ₗ[ℂ] ℂ where
  toFun P := ∫ w, ev w P * Haag.ph ((A : ℂ) + w) ∂gaussC
  map_add' P Q := by
    simp_rw [ev, map_add, add_mul]
    exact integral_add (integrable_ev_mul_phase A P) (integrable_ev_mul_phase A Q)
  map_smul' c P := by
    simp_rw [ev, smul_eval, RingHom.id_apply, smul_eq_mul, mul_assoc]
    exact integral_const_mul c _

private theorem phaseMoment_C_mul (A : ℝ) (c : ℂ) (P : CPoly) :
    phaseMoment A (C c * P) = c * phaseMoment A P := by
  rw [C_mul', map_smul, smul_eq_mul]

/-- Actual Gaussian phase charge identity, valid at every real shift, including
zero. It follows from one absolutely integrable Laplace/Fubini lift of the
charge-defect polynomial, not differentiation of the singular phase. -/
theorem integral_phase_H_charge (A : ℝ) (p q : ℕ) :
    (A : ℂ) *
        ((∫ w, ev w (H p (q + 1)) * Haag.ph ((A : ℂ) + w) ∂gaussC) -
          ∫ w, ev w (H (p + 1) q) * Haag.ph ((A : ℂ) + w) ∂gaussC) =
      ((p : ℂ) + 1 - (q : ℂ)) *
        ∫ w, ev w (H p q) * Haag.ph ((A : ℂ) + w) ∂gaussC := by
  have hz : phaseMoment A (chargeDefect A p q) = 0 := integral_chargeDefect A p q
  simp only [chargeDefect, map_sub, phaseMoment_C_mul] at hz
  exact sub_eq_zero.mp hz

end
end Grothe.UpperChaos.ConditionalMomentCharge

/-- info: 'Grothe.UpperChaos.ConditionalMomentCharge.integral_phase_H_charge' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalMomentCharge.integral_phase_H_charge
