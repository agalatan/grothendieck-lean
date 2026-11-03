import Grothe.UpperChaos.ActualRationalSourcePolynomial
import Grothe.UpperChaos.ActualGateConditionalScaling

/-!
# Exact coefficients and support under the actual gate scaling

Agent-ID: codex-2ca4. Complete source draft, not yet typechecked.

The scale is diagonal, so it changes coefficients without mixing monomials.
Checked gate positivity makes every scale nonzero and preserves support.
This supplies the missing coefficient factors for rationalizing complete Gram
summands; it does not assert that a raw pair Gram entry is rational.
-/

open MvPolynomial
open scoped ComplexConjugate

namespace Grothe.UpperChaos.ActualSourceCoefficientScaling

open ActualRationalSourcePolynomial ScaledActualCoherentL2
open OriginalHSParameterGates OriginalHSQuadraticForms

noncomputable section

def coefficientScale (g : Gate) (e : Fin 8 →₀ ℕ) : ℂ :=
  e.prod fun i k => (sourceScale g i : ℂ) ^ k

/-- Every diagonal source scale is real, so conjugation fixes its monomial factor. -/
theorem conj_coefficientScale (g : Gate) (e : Fin 8 →₀ ℕ) :
    conj (coefficientScale g e) = coefficientScale g e := by
  classical
  simp only [coefficientScale, Finsupp.prod_pow, map_prod, map_pow,
    Complex.conj_ofReal]

/-- The eight source factors split in the existing physical-pair order.
This identity uses no positivity or nonvanishing premise. -/
theorem coefficientScale_eq_pairSourceScale (g : Gate) (e : Fin 8 →₀ ℕ) :
    coefficientScale g e =
      ActualGateConditionalScaling.pairSourceScale (g.r : ℝ)
        (axisWeight g 0) (axisWeight g 1) (powers e).1 *
      ActualGateConditionalScaling.pairSourceScale (g.r : ℝ)
        (axisWeight g 2) (axisWeight g 3) (powers e).2 := by
  classical
  simp only [coefficientScale, Finsupp.prod_pow, Fin.prod_univ_eight]
  change
    (Real.sqrt (g.r : ℝ) : ℂ) ^ e 0 * (Real.sqrt (axisWeight g 0) : ℂ) ^ e 1 *
      (Real.sqrt (g.r : ℝ) : ℂ) ^ e 2 * (Real.sqrt (axisWeight g 1) : ℂ) ^ e 3 *
      (Real.sqrt (g.r : ℝ) : ℂ) ^ e 4 * (Real.sqrt (axisWeight g 2) : ℂ) ^ e 5 *
      (Real.sqrt (g.r : ℝ) : ℂ) ^ e 6 * (Real.sqrt (axisWeight g 3) : ℂ) ^ e 7 =
    ActualGateConditionalScaling.pairSourceScale (g.r : ℝ)
        (axisWeight g 0) (axisWeight g 1) (powers e).1 *
      ActualGateConditionalScaling.pairSourceScale (g.r : ℝ)
        (axisWeight g 2) (axisWeight g 3) (powers e).2
  simp only [powers, ActualGateConditionalScaling.pairSourceScale, pow_add]
  ring

theorem scaleHom_monomial (g : Gate) (e : Fin 8 →₀ ℕ) (r : ℚ) :
    scaleHom g (MvPolynomial.monomial e r) =
      MvPolynomial.monomial e ((r : ℂ) * coefficientScale g e) := by
  classical
  have hp :
      (∏ i ∈ e.support,
        (MvPolynomial.C (sourceScale g i : ℂ) * MvPolynomial.X i) ^ e i) =
      MvPolynomial.C (coefficientScale g e) *
        ∏ i ∈ e.support, MvPolynomial.X i ^ e i := by
    simp only [mul_pow, Finset.prod_mul_distrib, coefficientScale, Finsupp.prod,
      map_prod, map_pow]
  rw [scaleHom, MvPolynomial.eval₂Hom_monomial]
  change MvPolynomial.C (r : ℂ) *
    (∏ i ∈ e.support,
      (MvPolynomial.C (sourceScale g i : ℂ) * MvPolynomial.X i) ^ e i) = _
  rw [hp, MvPolynomial.monomial_eq]
  simp only [Finsupp.prod, map_mul, mul_assoc]

theorem coeff_scaleHom (g : Gate) (P : RationalSourcePolynomial)
    (e : Fin 8 →₀ ℕ) :
    (scaleHom g P).coeff e = (P.coeff e : ℂ) * coefficientScale g e := by
  classical
  calc
    (scaleHom g P).coeff e =
        (scaleHom g (∑ d ∈ P.support, MvPolynomial.monomial d (P.coeff d))).coeff e := by
      exact congrArg (fun Q => (scaleHom g Q).coeff e) P.as_sum
    _ = ∑ d ∈ P.support,
        (MvPolynomial.monomial d ((P.coeff d : ℂ) * coefficientScale g d)).coeff e := by
      simp only [map_sum, scaleHom_monomial, MvPolynomial.coeff_sum]
    _ = (P.coeff e : ℂ) * coefficientScale g e := by
      rw [Finset.sum_eq_single e]
      · simp
      · intro d hd hde
        simp only [MvPolynomial.coeff_monomial, if_neg hde]
      · intro he
        have hzero : P.coeff e = 0 := MvPolynomial.notMem_support_iff.mp he
        simp [hzero]

theorem sourceScale_pos (g : Gate) (hg : gateOK g = true) (i : Fin 8) :
    0 < sourceScale g i := by
  fin_cases i <;>
    simp only [sourceScale, Matrix.cons_val_zero, Matrix.cons_val_succ]
  all_goals first
    | exact Real.sqrt_pos.2 (radial_pos g hg)
    | exact Real.sqrt_pos.2 (axisWeight_pos g hg _)

theorem coefficientScale_ne_zero (g : Gate) (hg : gateOK g = true)
    (e : Fin 8 →₀ ℕ) : coefficientScale g e ≠ 0 := by
  classical
  unfold coefficientScale Finsupp.prod
  apply Finset.prod_ne_zero_iff.mpr
  intro i hi
  exact pow_ne_zero _ (Complex.ofReal_ne_zero.mpr (sourceScale_pos g hg i).ne')

theorem support_scaleHom (g : Gate) (hg : gateOK g = true)
    (P : RationalSourcePolynomial) : (scaleHom g P).support = P.support := by
  classical
  ext e
  simp only [MvPolynomial.mem_support_iff, coeff_scaleHom, mul_ne_zero_iff,
    coefficientScale_ne_zero g hg, and_true, Rat.cast_ne_zero]

/-- Actual coefficients, including exactly their diagonal square-root factors. -/
theorem actualSourcePolynomial_coeff (g : Gate) (e : Fin 8 →₀ ℕ) :
    (actualSourcePolynomial g).coeff e =
      ((rationalSourcePolynomial g.power).coeff e : ℂ) * coefficientScale g e := by
  rw [← scaleHom_rationalSourcePolynomial, coeff_scaleHom]

/-- The actual finite Gram sum can use the rational polynomial's exact support. -/
theorem actualSourcePolynomial_support (g : Gate) (hg : gateOK g = true) :
    (actualSourcePolynomial g).support = (rationalSourcePolynomial g.power).support := by
  rw [← scaleHom_rationalSourcePolynomial, support_scaleHom g hg]

end
end Grothe.UpperChaos.ActualSourceCoefficientScaling
