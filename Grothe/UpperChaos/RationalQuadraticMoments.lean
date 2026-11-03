import Grothe.UpperChaos.QuadraticPolynomialMoments
import Grothe.UpperChaos.QuadraticMomentScaling
import Grothe.UpperChaos.OriginalHSGaussianMass
import Grothe.UpperChaos.BipartiteKernelGramEvaluation

/-!
# Rational execution of the finite correlated moment formula

Agent-ID: codex-2ca4. Complete WIP source, awaiting compilation.

This uses the same finite Wick sum, balance test and inverse-rate factors as
the analytic evaluator. Casting is proved directly from the definitions.
Convergence hypotheses belong to the integral theorem; no positivity is
needed for equality of the two total finite algebraic expressions.
-/

namespace Grothe.UpperChaos.RationalQuadraticMoments

def wickCoeff (A B : ℚ) (p q k : ℕ) : ℚ :=
  (p.choose k : ℚ) * (q.choose k : ℚ) *
    (-(B / A)) ^ ((p - k) + (q - k)) *
      (k.factorial : ℚ) / A ^ (k + 1)

def momentValue (A B C : ℚ) (p q r s : ℕ) : ℚ :=
  ∑ k ∈ Finset.range (min p q + 1), wickCoeff A B p q k *
    (if (p - k) + r = (q - k) + s then
      (((p - k) + r).factorial : ℚ) /
        ((A * C - B ^ 2) / A) ^ (((p - k) + r) + 1)
    else 0)

theorem cast_wickCoeff (A B : ℚ) (p q k : ℕ) :
    (wickCoeff A B p q k : ℂ) =
      QuadraticPolynomialMoments.wickCoeff (A : ℝ) (B : ℝ) p q k := by
  unfold wickCoeff QuadraticPolynomialMoments.wickCoeff
  push_cast

/-- Executable rational arithmetic equals the analytic finite evaluator,
including its unnormalized Gaussian mass. -/
theorem cast_momentValue (A B C : ℚ) (p q r s : ℕ) :
    (momentValue A B C p q r s : ℂ) =
      QuadraticPolynomialMoments.momentValue (A : ℝ) (B : ℝ) (C : ℝ) p q r s := by
  classical
  unfold momentValue QuadraticPolynomialMoments.momentValue
  rw [Rat.cast_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Rat.cast_mul, cast_wickCoeff]
  by_cases h : (p - k) + r = (q - k) + s
  · simp only [if_pos h]
    push_cast
  · simp only [if_neg h, Rat.cast_zero]

/-- The rational polynomial evaluator uses exactly the canonical finite
support and the same unnormalized moments as the analytic evaluator. -/
def polynomialMomentValue (A B C : ℚ) (P : MvPolynomial (Fin 4) ℚ) : ℚ :=
  ∑ e ∈ P.support, P.coeff e * momentValue A B C (e 0) (e 1) (e 2) (e 3)

theorem polynomialMomentValue_monomial (A B C : ℚ) (e : Fin 4 →₀ ℕ) (c : ℚ) :
    polynomialMomentValue A B C (MvPolynomial.monomial e c) =
      c * momentValue A B C (e 0) (e 1) (e 2) (e 3) := by
  classical
  change (Finsupp.single e c).sum
    (fun d a => a * momentValue A B C (d 0) (d 1) (d 2) (d 3)) = _
  exact Finsupp.sum_single_index (zero_mul _)

theorem polynomialMomentValue_add (A B C : ℚ) (P Q : MvPolynomial (Fin 4) ℚ) :
    polynomialMomentValue A B C (P + Q) =
      polynomialMomentValue A B C P + polynomialMomentValue A B C Q := by
  classical
  change (P.coeff + Q.coeff).sum
    (fun d a => a * momentValue A B C (d 0) (d 1) (d 2) (d 3)) = _
  exact Finsupp.sum_add_index' (fun _ => zero_mul _) (fun _ _ _ => add_mul _ _ _)

theorem cast_polynomialMomentValue (A B C : ℚ) (P : MvPolynomial (Fin 4) ℚ) :
    (polynomialMomentValue A B C P : ℂ) =
      BipartiteKernelGramEvaluation.polynomialMomentValue (A : ℝ) (B : ℝ) (C : ℝ)
        (MvPolynomial.map (Rat.castHom ℂ) P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial e c =>
    rw [polynomialMomentValue_monomial, MvPolynomial.map_monomial,
      BipartiteKernelGramEvaluation.polynomialMomentValue_monomial,
      Rat.cast_mul, cast_momentValue]
  | add P Q hP hQ =>
    rw [polynomialMomentValue_add, Rat.cast_add, map_add,
      BipartiteKernelGramEvaluation.polynomialMomentValue_add, hP, hQ]

open OriginalHSParameterGates OriginalHSParameterSoundness OriginalHSQuadraticForms

/-- The original gate parameters before their casts into the analytic field. -/
def nuQ (power : ℕ) : ℚ := 1 / (1 + 21 * (power : ℚ) / 20)

def dampingQ (power : ℕ) : ℚ := (21 * (power : ℚ) / 20) * nuQ power

def axisWeightQ (g : Gate) (i : ℕ) : ℚ :=
  if g.coordinate = i then g.t else 1

theorem nuQ_cast (power : ℕ) : (nuQ power : ℝ) = nu power := by
  simp only [nuQ, nu, alpha, Rat.cast_div, Rat.cast_one, Rat.cast_add,
    Rat.cast_mul, Rat.cast_ofNat, Rat.cast_natCast]

theorem dampingQ_cast (power : ℕ) : (dampingQ power : ℝ) = damping power := by
  simp only [dampingQ, damping, alpha, Rat.cast_mul, Rat.cast_div,
    Rat.cast_ofNat, Rat.cast_natCast, nuQ_cast]

theorem axisWeightQ_cast (g : Gate) (i : ℕ) :
    (axisWeightQ g i : ℝ) = axisWeight g i := by
  simp only [axisWeightQ, axisWeight]
  split_ifs <;> simp

/-- Rational Schur coefficients after dividing out the two diagonal variances.
The cross coefficient has no square root in this coordinate system. -/
def gateLeadingQ (g : Gate) (side : Fin 2) : ℚ :=
  1 / g.r - dampingQ g.power ^ 2 * g.r -
    nuQ g.power ^ 2 * axisWeightQ g (2 * side.val)

def gateCrossQ (g : Gate) (side : Fin 2) : ℚ :=
  dampingQ g.power * nuQ g.power * (g.r + axisWeightQ g (2 * side.val))

def gateTrailingQ (g : Gate) (side : Fin 2) : ℚ :=
  1 / axisWeightQ g (2 * side.val + 1) - nuQ g.power ^ 2 * g.r -
    dampingQ g.power ^ 2 * axisWeightQ g (2 * side.val)

theorem gateLeadingQ_cast (g : Gate) (side : Fin 2) :
    (gateLeadingQ g side : ℝ) =
      1 / (g.r : ℝ) - damping g.power ^ 2 * (g.r : ℝ) -
        nu g.power ^ 2 * axisWeight g (2 * side.val) := by
  simp only [gateLeadingQ, Rat.cast_sub, Rat.cast_div, Rat.cast_one,
    Rat.cast_mul, Rat.cast_pow, dampingQ_cast, nuQ_cast, axisWeightQ_cast]

theorem gateCrossQ_cast (g : Gate) (side : Fin 2) :
    (gateCrossQ g side : ℝ) =
      damping g.power * nu g.power * ((g.r : ℝ) + axisWeight g (2 * side.val)) := by
  simp only [gateCrossQ, Rat.cast_mul, Rat.cast_add,
    dampingQ_cast, nuQ_cast, axisWeightQ_cast]

theorem gateTrailingQ_cast (g : Gate) (side : Fin 2) :
    (gateTrailingQ g side : ℝ) =
      1 / axisWeight g (2 * side.val + 1) - nu g.power ^ 2 * (g.r : ℝ) -
        damping g.power ^ 2 * axisWeight g (2 * side.val) := by
  simp only [gateTrailingQ, Rat.cast_sub, Rat.cast_div, Rat.cast_one,
    Rat.cast_mul, Rat.cast_pow, dampingQ_cast, nuQ_cast, axisWeightQ_cast]

theorem gateLeadingQ_spec (g : Gate) (hg : gateOK g = true) (side : Fin 2) :
    (g.r : ℝ) * (gateLeadingQ g side : ℝ) = leadingRate g side := by
  rw [gateLeadingQ_cast]
  unfold leadingRate
  field_simp [(radial_pos g hg).ne']
  <;> ring

theorem gateCrossQ_spec (g : Gate) (side : Fin 2) :
    Real.sqrt ((g.r : ℝ) * axisWeight g (2 * side.val + 1)) *
      (gateCrossQ g side : ℝ) = crossRate g side := by
  rw [gateCrossQ_cast]
  unfold crossRate
  ring

theorem gateTrailingQ_spec (g : Gate) (hg : gateOK g = true) (side : Fin 2) :
    axisWeight g (2 * side.val + 1) * (gateTrailingQ g side : ℝ) =
      trailingRate g side := by
  rw [gateTrailingQ_cast]
  unfold trailingRate
  field_simp [(axisWeight_pos g hg (2 * side.val + 1)).ne']
  <;> ring

theorem gateLeadingQ_pos (g : Gate) (hg : gateOK g = true) (side : Fin 2) :
    0 < (gateLeadingQ g side : ℝ) := by
  have h : 0 < (g.r : ℝ) * (gateLeadingQ g side : ℝ) := by
    rw [gateLeadingQ_spec g hg side]
    exact leadingRate_pos g hg side
  exact (mul_pos_iff_of_pos_left (radial_pos g hg)).mp h

/-- The actual gate's scaled outer Gaussian moment is exactly rational,
with the inverse mass from both complex-coordinate Jacobians retained.
This supplies the scalar-moment part of the source-norm rationalization;
the conditional polynomial and its coefficient scales must still be joined. -/
theorem actual_scaled_momentValue_eq_rational (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) (p q r s : ℕ) :
    ((Real.sqrt (g.r : ℝ) : ℂ) ^ (p + q) *
      (Real.sqrt (axisWeight g (2 * side.val + 1)) : ℂ) ^ (r + s)) *
      QuadraticPolynomialMoments.momentValue
        (leadingRate g side) (crossRate g side) (trailingRate g side) p q r s =
      (momentValue (gateLeadingQ g side) (gateCrossQ g side)
        (gateTrailingQ g side) p q r s : ℂ) /
          ((g.r * axisWeightQ g (2 * side.val + 1) : ℚ) : ℂ) := by
  have h := QuadraticMomentScaling.momentValue_sqrt_scale
    (g.r : ℝ) (axisWeight g (2 * side.val + 1))
    (gateLeadingQ g side : ℝ) (gateCrossQ g side : ℝ) (gateTrailingQ g side : ℝ)
    (radial_pos g hg) (axisWeight_pos g hg _) (gateLeadingQ_pos g hg side).ne'
    p q r s
  rw [gateLeadingQ_spec g hg side, gateCrossQ_spec g side,
    gateTrailingQ_spec g hg side, ← cast_momentValue] at h
  have hden : (((g.r : ℝ) * axisWeight g (2 * side.val + 1) : ℝ) : ℂ) =
      ((g.r * axisWeightQ g (2 * side.val + 1) : ℚ) : ℂ) := by
    rw [← axisWeightQ_cast]
    norm_cast
  simpa only [hden] using h

/-- All coefficients of a rational conditional polynomial can now be
evaluated at once after the actual outer substitution. No support equality
or termwise numerical bound is assumed. -/
theorem actual_polynomialMomentValue_eq_rational (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) (P : MvPolynomial (Fin 4) ℚ) :
    BipartiteKernelGramEvaluation.polynomialMomentValue
      (leadingRate g side) (crossRate g side) (trailingRate g side)
      (BipartiteKernelGramEvaluation.outerScaleHom
        (Real.sqrt (g.r : ℝ)) (Real.sqrt (axisWeight g (2 * side.val + 1)))
        (MvPolynomial.map (Rat.castHom ℂ) P)) =
      (polynomialMomentValue (gateLeadingQ g side) (gateCrossQ g side)
        (gateTrailingQ g side) P : ℂ) /
          ((g.r * axisWeightQ g (2 * side.val + 1) : ℚ) : ℂ) := by
  have h := BipartiteKernelGramEvaluation.polynomialMomentValue_outerScale
    (g.r : ℝ) (axisWeight g (2 * side.val + 1))
    (gateLeadingQ g side : ℝ) (gateCrossQ g side : ℝ) (gateTrailingQ g side : ℝ)
    (radial_pos g hg) (axisWeight_pos g hg _) (gateLeadingQ_pos g hg side).ne'
    (MvPolynomial.map (Rat.castHom ℂ) P)
  rw [gateLeadingQ_spec g hg side, gateCrossQ_spec g side,
    gateTrailingQ_spec g hg side, ← cast_polynomialMomentValue] at h
  have hden : (((g.r : ℝ) * axisWeight g (2 * side.val + 1) : ℝ) : ℂ) =
      ((g.r * axisWeightQ g (2 * side.val + 1) : ℚ) : ℂ) := by
    rw [← axisWeightQ_cast]
    norm_cast
  simpa only [hden] using h

end Grothe.UpperChaos.RationalQuadraticMoments
