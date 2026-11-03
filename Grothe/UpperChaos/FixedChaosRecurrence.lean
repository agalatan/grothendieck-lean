import Grothe.UpperChaos.FixedChaosPolynomial

/-!
# Polynomial Gaussian integration by parts for the smoothing recurrence

These are the finite-moment identities used to reduce a Hermite matrix entry
by one degree, without expanding all eight-variable polynomial products.
Agent-ID: codex-7c2e
-/

open MeasureTheory MvPolynomial

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

noncomputable section

/-- The finite Gaussian moment functional as a complex linear map. -/
def moment : P8 →ₗ[ℂ] ℂ where
  toFun := finiteMoment
  map_add' P Q := by
    rw [← integral_evaluate_eq_finiteMoment, ← integral_evaluate_eq_finiteMoment,
      ← integral_evaluate_eq_finiteMoment]
    simp only [evaluate, map_add]
    exact integral_add (integrable_evaluate P) (integrable_evaluate Q)
  map_smul' c P := by
    rw [← integral_evaluate_eq_finiteMoment, ← integral_evaluate_eq_finiteMoment]
    simp only [evaluate, smul_eval, RingHom.id_apply, smul_eq_mul]
    exact integral_const_mul c _

theorem moment_monomial (s : Fin 8 →₀ ℕ) (c : ℂ) :
    moment (monomial s c) = c * monomialMoment s := by
  change finiteMoment _ = _
  rw [← integral_evaluate_eq_finiteMoment, integral_evaluate_monomial]

/-- The conjugate variable in the four independent complex Gaussian pairs. -/
def conjugateVar : Fin 8 → Fin 8 := ![1, 0, 3, 2, 5, 4, 7, 6]

private lemma single_add_apply8 (i j : Fin 8) (s : Fin 8 →₀ ℕ) :
    ((Finsupp.single i 1 + s : Fin 8 →₀ ℕ) : Fin 8 → ℕ) j =
      s j + if i = j then 1 else 0 := by
  simp [Finsupp.single_apply, add_comm]

private lemma sub_single_apply8 (i j : Fin 8) (s : Fin 8 →₀ ℕ) :
    ((s - Finsupp.single i 1 : Fin 8 →₀ ℕ) : Fin 8 → ℕ) j =
      s j - if i = j then 1 else 0 := by
  simp [Finsupp.single_apply]

/-- Complex Gaussian integration by parts, as an identity of finite moments. -/
theorem moment_X_mul (k : Fin 8) (P : P8) :
    moment (X k * P) = moment (pderiv (conjugateVar k) P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [X, monomial_mul_monomial, one_mul, pderiv_monomial,
      moment_monomial, moment_monomial]
    fin_cases k <;>
      simp [conjugateVar, monomialMoment, single_add_apply8, sub_single_apply8,
        mom_succ_left, mom_succ_right] <;> ring
  | add P Q hP hQ => simp only [mul_add, map_add, hP, hQ]

/-- Creation on one factor is differentiation on the other. -/
theorem moment_creation_mul (k : Fin 8) (P Q : P8) :
    moment ((X k * P - pderiv (conjugateVar k) P) * Q) =
      moment (P * pderiv (conjugateVar k) Q) := by
  rw [sub_mul, map_sub, mul_assoc, moment_X_mul, Derivation.leibniz, map_add]
  simp [smul_eq_mul, mul_comm]

theorem moment_C_mul (c : ℂ) (P : P8) : moment (C c * P) = c * moment P := by
  rw [C_mul', map_smul, smul_eq_mul]

private theorem moment_mul_C_mul (P Q : P8) (c : ℂ) :
    moment (P * (C c * Q)) = c * moment (P * Q) := by
  rw [show P * (C c * Q) = C c * (P * Q) by ring, moment_C_mul]

/-- The polynomial chain rule for either output coordinate of the smoothing. -/
theorem pderiv_pull (a b : P8) (k : Fin 8) (P : CPoly) :
    pderiv k (pull a b P) =
      pull a b (pderiv 0 P) * pderiv k a +
        pull a b (pderiv 1 P) * pderiv k b := by
  induction P using MvPolynomial.induction_on with
  | C c => simp [pull]
  | add P Q hP hQ => simp only [map_add, hP, hQ]; ring
  | mul_X P i hP =>
    simp only [map_mul, Derivation.leibniz, smul_eq_mul, map_add, hP]
    fin_cases i <;> simp [pull, pderiv_X] <;> ring

def inputPair (f g : CPoly) : P8 :=
  pull (X 0) (X 1) (conjP f) * pull (X 2) (X 3) (conjP g)

def outputPair (f g : CPoly) : P8 :=
  pull smoothFirst smoothFirstConj f * pull smoothSecond smoothSecondConj g

theorem inputPair_A0_first (f g : CPoly) :
    inputPair (A0 f) g = X 1 * inputPair f g - pderiv 0 (inputPair f g) := by
  have h : conjP (pderiv 1 f) = pderiv 0 (conjP f) := by
    rw [pderiv_conjP]; simp
  simp only [inputPair, A0, map_sub, map_mul, conjP_X, h,
    Derivation.leibniz, smul_eq_mul, pderiv_pull]
  simp [pull, pderiv_X]
  ring

theorem inputPair_A1_first (f g : CPoly) :
    inputPair (A1 f) g = X 0 * inputPair f g - pderiv 1 (inputPair f g) := by
  have h : conjP (pderiv 0 f) = pderiv 1 (conjP f) := by
    rw [pderiv_conjP]; simp
  simp only [inputPair, A1, map_sub, map_mul, conjP_X, h,
    Derivation.leibniz, smul_eq_mul, pderiv_pull]
  simp [pull, pderiv_X]
  ring

theorem inputPair_A0_second (f g : CPoly) :
    inputPair f (A0 g) = X 3 * inputPair f g - pderiv 2 (inputPair f g) := by
  have h : conjP (pderiv 1 g) = pderiv 0 (conjP g) := by
    rw [pderiv_conjP]; simp
  simp only [inputPair, A0, map_sub, map_mul, conjP_X, h,
    Derivation.leibniz, smul_eq_mul, pderiv_pull]
  simp [pull, pderiv_X]
  ring

theorem inputPair_A1_second (f g : CPoly) :
    inputPair f (A1 g) = X 2 * inputPair f g - pderiv 3 (inputPair f g) := by
  have h : conjP (pderiv 0 g) = pderiv 1 (conjP g) := by
    rw [pderiv_conjP]; simp
  simp only [inputPair, A1, map_sub, map_mul, conjP_X, h,
    Derivation.leibniz, smul_eq_mul, pderiv_pull]
  simp [pull, pderiv_X]
  ring

theorem pderiv0_outputPair (f g : CPoly) :
    pderiv 0 (outputPair f g) =
      C (m00 : ℂ) * outputPair (pderiv 0 f) g +
      C (m01 : ℂ) * outputPair f (pderiv 0 g) := by
  simp only [outputPair, Derivation.leibniz, smul_eq_mul, pderiv_pull]
  simp [smoothFirst, smoothFirstConj, smoothSecond, smoothSecondConj,
    Derivation.leibniz, pderiv_X]
  ring

theorem pderiv1_outputPair (f g : CPoly) :
    pderiv 1 (outputPair f g) =
      C (m00 : ℂ) * outputPair (pderiv 1 f) g +
      C (m01 : ℂ) * outputPair f (pderiv 1 g) := by
  simp only [outputPair, Derivation.leibniz, smul_eq_mul, pderiv_pull]
  simp [smoothFirst, smoothFirstConj, smoothSecond, smoothSecondConj,
    Derivation.leibniz, pderiv_X]
  ring

theorem pderiv2_outputPair (f g : CPoly) :
    pderiv 2 (outputPair f g) =
      C (m01 : ℂ) * outputPair (pderiv 0 f) g +
      C (m11 : ℂ) * outputPair f (pderiv 0 g) := by
  simp only [outputPair, Derivation.leibniz, smul_eq_mul, pderiv_pull]
  simp [smoothFirst, smoothFirstConj, smoothSecond, smoothSecondConj,
    Derivation.leibniz, pderiv_X]
  ring

theorem pderiv3_outputPair (f g : CPoly) :
    pderiv 3 (outputPair f g) =
      C (m01 : ℂ) * outputPair (pderiv 1 f) g +
      C (m11 : ℂ) * outputPair f (pderiv 1 g) := by
  simp only [outputPair, Derivation.leibniz, smul_eq_mul, pderiv_pull]
  simp [smoothFirst, smoothFirstConj, smoothSecond, smoothSecondConj,
    Derivation.leibniz, pderiv_X]
  ring

/-- The unnormalized Hermite pairing of the actual joint Gaussian law. -/
def pairing (f g h k : CPoly) : ℂ := moment (inputPair f g * outputPair h k)

theorem actualEntry_eq_pairing (j i : Idx2) :
    actualEntry j i = (nrm2 j : ℂ) * (nrm2 i : ℂ) *
      pairing (H j.1.1 j.1.2) (H j.2.1 j.2.2) (H i.1.1 i.1.2) (H i.2.1 i.2.2) := by
  rw [actualEntry_eq_finiteMoment]
  change moment _ = _
  rw [entryPolynomial, mul_assoc, moment_C_mul]
  rfl

theorem moment_one : moment 1 = 1 := by
  rw [show (1 : P8) = monomial 0 1 by rfl, moment_monomial]
  simp [monomialMoment, mom]

theorem pairing_one_one (i : Idx2) :
    pairing 1 1 (H i.1.1 i.1.2) (H i.2.1 i.2.2) =
      if i = ((0, 0), (0, 0)) then 1 else 0 := by
  by_cases hi : i = ((0, 0), (0, 0))
  · subst i
    simp [pairing, inputPair, outputPair, H_zero_zero, moment_one]
  · simp only [hi, ↓reduceIte]
    have hd : tdeg i ≠ tdeg ((0, 0), (0, 0)) := by
      rcases i with ⟨⟨a, b⟩, c, d⟩
      simp only [tdeg] at *
      intro he
      have : a = 0 ∧ b = 0 ∧ c = 0 ∧ d = 0 := by omega
      rcases this with ⟨rfl, rfl, rfl, rfl⟩
      exact hi rfl
    have hz : actualEntry ((0, 0), (0, 0)) i = 0 :=
      inner_smoothOp_hvec2_eq_zero hd
    rw [actualEntry_eq_pairing] at hz
    have hn : (nrm2 i : ℂ) ≠ 0 := by exact_mod_cast (nrm2_pos i).ne'
    simpa [nrm2, fac2, H_zero_zero] using
      (mul_eq_zero.mp hz).resolve_left (mul_ne_zero
        (by norm_num [nrm2, fac2]) hn)

theorem pairing_A0_first (f g h k : CPoly) :
    pairing (A0 f) g h k = (m00 : ℂ) * pairing f g (pderiv 0 h) k +
      (m01 : ℂ) * pairing f g h (pderiv 0 k) := by
  simp only [pairing, inputPair_A0_first]
  rw [show (0 : Fin 8) = conjugateVar 1 by rfl, moment_creation_mul]
  rw [show conjugateVar 1 = (0 : Fin 8) by rfl, pderiv0_outputPair, mul_add, map_add]
  simp only [moment_mul_C_mul]

theorem pairing_A1_first (f g h k : CPoly) :
    pairing (A1 f) g h k = (m00 : ℂ) * pairing f g (pderiv 1 h) k +
      (m01 : ℂ) * pairing f g h (pderiv 1 k) := by
  simp only [pairing, inputPair_A1_first]
  rw [show (1 : Fin 8) = conjugateVar 0 by rfl, moment_creation_mul]
  rw [show conjugateVar 0 = (1 : Fin 8) by rfl, pderiv1_outputPair, mul_add, map_add]
  simp only [moment_mul_C_mul]

theorem pairing_A0_second (f g h k : CPoly) :
    pairing f (A0 g) h k = (m01 : ℂ) * pairing f g (pderiv 0 h) k +
      (m11 : ℂ) * pairing f g h (pderiv 0 k) := by
  simp only [pairing, inputPair_A0_second]
  rw [show (2 : Fin 8) = conjugateVar 3 by rfl, moment_creation_mul]
  rw [show conjugateVar 3 = (2 : Fin 8) by rfl, pderiv2_outputPair, mul_add, map_add]
  simp only [moment_mul_C_mul]

theorem pairing_A1_second (f g h k : CPoly) :
    pairing f (A1 g) h k = (m01 : ℂ) * pairing f g (pderiv 1 h) k +
      (m11 : ℂ) * pairing f g h (pderiv 1 k) := by
  simp only [pairing, inputPair_A1_second]
  rw [show (3 : Fin 8) = conjugateVar 2 by rfl, moment_creation_mul]
  rw [show conjugateVar 2 = (3 : Fin 8) by rfl, pderiv3_outputPair, mul_add, map_add]
  simp only [moment_mul_C_mul]

end
end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.moment_creation_mul' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.moment_creation_mul
