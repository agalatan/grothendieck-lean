import Grothe.Haagerup.Phase
import Grothe.UpperChaos.Charge
import Grothe.UpperChaos.PhaseMoments
import Grothe.Upper.Haagerup

/-!
# Hermite coefficients of Gaussian phase

The phase-weighted polynomial moment satisfies an algebraic Gaussian integration-by-parts
identity. The Hermite creation identities then give a first-order recurrence for its charge-one
coefficients, whose squared norms follow the defining recurrence of `haagR`.

Only polynomials are differentiated; the phase function is never differentiated at zero.
-/

open MeasureTheory MvPolynomial Grothe.UpperChaos
open Grothe.LowerAnalytic (gaussC integral_rot_gaussC)
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.Haag
noncomputable section

private lemma integrable_phase_pair (P : CPoly) :
    Integrable (fun z => ev z P * conj (ph z)) gaussC :=
  (memLp_ev P).integrable_mul memLp_ph.star

/-- The polynomial moment weighted by the conjugate of Gaussian phase. -/
def phaseMoment : CPoly →ₗ[ℂ] ℂ where
  toFun P := ∫ z, ev z P * conj (ph z) ∂gaussC
  map_add' P Q := by
    simp_rw [ev, map_add, add_mul]
    exact integral_add (integrable_phase_pair P) (integrable_phase_pair Q)
  map_smul' c P := by
    simp_rw [ev, smul_eval, RingHom.id_apply, smul_eq_mul, mul_assoc]
    exact integral_const_mul c _

private lemma phaseMoment_apply (P : CPoly) : phaseMoment P = ∫ z, ev z P * conj (ph z) ∂gaussC := rfl

private lemma phase_monomial (a b : ℕ) :
    ∫ z : ℂ, z ^ a * conj z ^ b * conj (ph z) ∂gaussC =
      if a = b + 1 then (Real.Gamma ((b : ℝ) + 3 / 2) : ℂ) else 0 := by
  have he : (∫ z : ℂ, z ^ a * conj z ^ b * conj (ph z) ∂gaussC) =
      conj (∫ z : ℂ, conj (z ^ a * conj z ^ b) * ph z ∂gaussC) := by
    rw [← integral_conj]
    congr 1
    funext z
    simp
  rw [he]
  by_cases hab : a = b + 1
  · subst a
    simp only [↓reduceIte]
    simp only [ph, integral_conj_monomial_mul_div_norm, Complex.conj_ofReal]
  · simp only [hab, ↓reduceIte]
    obtain ⟨c, hc, hcne⟩ := exists_charge_witness hab
    have hp : ∀ z, ph (c * z) = c * ph z := by
      intro z
      simp only [ph, norm_mul, hc, one_mul]
      ring
    have hr := integral_rot_gaussC c hc (fun z => conj (z ^ a * conj z ^ b) * ph z)
    have hf : ∀ z : ℂ, conj ((c * z) ^ a * conj (c * z) ^ b) * ph (c * z) =
        (conj (c ^ a * conj c ^ b) * c) * (conj (z ^ a * conj z ^ b) * ph z) := by
      intro z
      rw [hp]
      simp only [mul_pow, map_mul, map_pow]
      ring
    simp_rw [hf, integral_const_mul] at hr
    have hz : (conj (c ^ a * conj c ^ b) * c - 1) *
        (∫ z : ℂ, conj (z ^ a * conj z ^ b) * ph z ∂gaussC) = 0 := by
      rw [sub_mul, hr, one_mul, sub_self]
    rw [(mul_eq_zero.mp hz).resolve_left (sub_ne_zero.mpr hcne), map_zero]

private lemma phaseMoment_monomial (s : Fin 2 →₀ ℕ) (c : ℂ) :
    phaseMoment (monomial s c) = c *
      if s 0 = s 1 + 1 then (Real.Gamma ((s 1 : ℝ) + 3 / 2) : ℂ) else 0 := by
  rw [phaseMoment_apply]
  simp_rw [ev_monomial, mul_assoc]
  rw [integral_const_mul]
  congr 1
  simpa only [mul_assoc] using phase_monomial (s 0) (s 1)

/-- An algebraic Gaussian integration-by-parts rule for the phase-weighted moment. -/
lemma phaseMoment_weighted (P : CPoly) :
    phaseMoment ((X 0 * X 1) * P) = phaseMoment (X 0 * pderiv 0 P) + (1 / 2 : ℂ) * phaseMoment P := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [X_mul_pderiv_monomial, map_nsmul, nsmul_eq_mul]
    simp only [phaseMoment_monomial]
    have he : (X 0 * X 1 : CPoly) * monomial s c =
        monomial (Finsupp.single 0 1 + Finsupp.single 1 1 + s) c := by
      simp [X, monomial_mul_monomial]
    rw [he, phaseMoment_monomial]
    have h0 : ((Finsupp.single 0 1 + Finsupp.single 1 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 =
        s 0 + 1 := by simp [add_comm]
    have h1 : ((Finsupp.single 0 1 + Finsupp.single 1 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 =
        s 1 + 1 := by simp [add_comm]
    rw [h0, h1]
    by_cases hs : s 0 = s 1 + 1
    · simp only [hs, ite_true]
      push_cast
      rw [show (s 1 : ℝ) + 1 + 3 / 2 = ((s 1 : ℝ) + 3 / 2) + 1 by ring,
        Real.Gamma_add_one (by positivity)]
      push_cast
      ring
    · simp [hs]
  | add P Q hP hQ =>
    simp only [mul_add, map_add, hP, hQ]
    ring

private lemma H_charge_step (k : ℕ) :
    H (k + 2) (k + 1) = (X 0 * X 1) * H (k + 1) k -
      X 0 * pderiv 0 (H (k + 1) k) - (k + 1) • H (k + 1) k := by
  rw [show k + 2 = (k + 1) + 1 by omega, H_succ_left, A0, pderiv1_H_succ,
    ← A1_H, A1]
  ring

private lemma phaseMoment_charge_step (k : ℕ) :
    phaseMoment (H (k + 2) (k + 1)) = (((-(k : ℝ) - 1 / 2) : ℝ) : ℂ) * phaseMoment (H (k + 1) k) := by
  rw [H_charge_step, map_sub, map_sub, phaseMoment_weighted, map_nsmul, nsmul_eq_mul]
  push_cast
  ring

private lemma phaseMoment_charge_zero : phaseMoment (H 1 0) = (Real.Gamma (3 / 2) : ℂ) := by
  rw [H_succ_left, H_zero_zero]
  simp [A0, X, phaseMoment_monomial]

private lemma Gamma_three_halves : Real.Gamma (3 / 2) = Real.sqrt Real.pi / 2 := by
  rw [show (3 / 2 : ℝ) = 1 / 2 + 1 by norm_num, Real.Gamma_add_one (by norm_num),
    Real.Gamma_one_half_eq]
  ring

private lemma phaseMoment_charge_norm (k : ℕ) :
    ‖phaseMoment (H (k + 1) k)‖ ^ 2 = haagCoeff k * ((k + 1).factorial * k.factorial : ℕ) := by
  induction k with
  | zero =>
    rw [phaseMoment_charge_zero, Gamma_three_halves, Complex.norm_real, Real.norm_eq_abs, sq_abs,
      div_pow, Real.sq_sqrt Real.pi_pos.le]
    norm_num [haagCoeff, haagR]
  | succ k ih =>
    rw [show k + 1 + 1 = k + 2 by omega, phaseMoment_charge_step, norm_mul, Complex.norm_real,
      Real.norm_eq_abs, mul_pow, sq_abs, ih]
    unfold haagCoeff
    rw [haagR, Nat.factorial_succ (k + 1), Nat.factorial_succ k]
    push_cast
    have h1 : (k : ℝ) + 1 ≠ 0 := by positivity
    have h2 : (k : ℝ) + 2 ≠ 0 := by positivity
    field_simp
    ring

private lemma integral_phase_eq_conj_phaseMoment (P : CPoly) :
    ∫ z, conj (ev z P) * ph z ∂gaussC = conj (phaseMoment P) := by
  rw [phaseMoment_apply, ← integral_conj]
  congr 1
  funext z
  simp

/-- The phase energies are precisely Haagerup's positive coefficients. -/
theorem phase_energy (k : ℕ) :
    ‖⟪hvec (k + 1, k), phaseLp⟫_ℂ‖ ^ 2 = haagCoeff k := by
  rw [hvec, phaseLp, UpperChaos.inner_toLp]
  simp only [hfun, map_mul, Complex.conj_ofReal]
  simp_rw [mul_assoc]
  rw [integral_const_mul, integral_phase_eq_conj_phaseMoment, norm_mul, Complex.norm_real,
    Real.norm_eq_abs, mul_pow, sq_abs, Complex.norm_conj, phaseMoment_charge_norm]
  calc
    _ = haagCoeff k * (nrm (k + 1) k * nrm (k + 1) k *
      ((k + 1).factorial * k.factorial : ℕ)) := by ring
    _ = _ := by rw [nrm_sq_mul, mul_one]

end
end Grothe.Haag
