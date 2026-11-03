import Grothe.UpperChaos.BipartiteKernelGramMoments
import Grothe.UpperChaos.Mehler
import Grothe.UpperChaos.QuadraticMomentScaling
import Lean.Elab.Tactic.Omega

/-!
# Finite polynomial evaluation of the bipartite kernel Gram moments

Agent-ID: codex-2ca4.


The conditional shifted moments are represented by actual finite P4
polynomials in (w1, conjugate w1, w2, conjugate w2). Their canonical support
and coefficients are then passed to the existing correlated Gaussian moment
evaluator. The source kernel mass |c|^2, all monomial orders, and the exact
Schur quadratic form are retained. No coefficient identity is assumed and no
explicit multi-level binomial expansion is needed.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.BipartiteKernelGramEvaluation

open BipartitePolynomialL2 BipartiteKernelGramMoments WeightedHSMass

noncomputable section

/-- The linear form a*w1+b*w2 in physical P4 variable order. -/
def linearPolynomial (a b : ℝ) : P4 :=
  MvPolynomial.C (a : ℂ) * X 0 + MvPolynomial.C (b : ℂ) * X 2

/-- The conjugate linear form uses X1 and X3, with the same real coefficients. -/
def conjugateLinearPolynomial (a b : ℝ) : P4 :=
  MvPolynomial.C (a : ℂ) * X 1 + MvPolynomial.C (b : ℂ) * X 3

theorem ev4_linearPolynomial (a b : ℝ) (w : ℂ × ℂ) :
    ev4 w (linearPolynomial a b) = (a : ℂ) * w.1 + (b : ℂ) * w.2 := by
  simp [linearPolynomial, ev4, wv]

theorem ev4_conjugateLinearPolynomial (a b : ℝ) (w : ℂ × ℂ) :
    ev4 w (conjugateLinearPolynomial a b) =
      conj ((a : ℂ) * w.1 + (b : ℂ) * w.2) := by
  simp [conjugateLinearPolynomial, ev4, wv, map_add, map_mul, Complex.conj_ofReal]

/-- The finite unit-rate Wick polynomial at mean conjugate(a*w1+b*w2).
Its holomorphic order u uses the conjugate form, and its antiholomorphic
order v uses the original form. The k! factor remains explicit. -/
def shiftedMomentPolynomial (a b : ℝ) (u v : ℕ) : P4 :=
  ∑ k ∈ Finset.range (min u v + 1),
    MvPolynomial.C ((u.choose k : ℂ) * (v.choose k : ℂ) * (k.factorial : ℂ)) *
      conjugateLinearPolynomial a b ^ (u - k) * linearPolynomial a b ^ (v - k)

/-- The same finite Wick polynomial with its conditional variance explicit. -/
def varianceShiftedMomentPolynomial (variance a b : ℝ) (u v : ℕ) : P4 :=
  ∑ k ∈ Finset.range (min u v + 1),
    MvPolynomial.C ((u.choose k : ℂ) * (v.choose k : ℂ) * (k.factorial : ℂ)) *
      MvPolynomial.C (variance : ℂ) ^ k *
      conjugateLinearPolynomial a b ^ (u - k) * linearPolynomial a b ^ (v - k)

theorem linearPolynomial_scale (s a b : ℝ) :
    linearPolynomial (s * a) (s * b) =
      MvPolynomial.C (s : ℂ) * linearPolynomial a b := by
  simp only [linearPolynomial, Complex.ofReal_mul, map_mul]
  ring

theorem conjugateLinearPolynomial_scale (s a b : ℝ) :
    conjugateLinearPolynomial (s * a) (s * b) =
      MvPolynomial.C (s : ℂ) * conjugateLinearPolynomial a b := by
  simp only [conjugateLinearPolynomial, Complex.ofReal_mul, map_mul]
  ring

/-- Scaling both the mean and its standard deviation gives the exact source
degree factor. This finite identity retains every contraction term, including
the variance power, and also holds at zero scale without division. -/
theorem varianceShiftedMomentPolynomial_scale (s a b : ℝ) (u v : ℕ) :
    varianceShiftedMomentPolynomial (s ^ 2) (s * a) (s * b) u v =
      MvPolynomial.C (s : ℂ) ^ (u + v) * shiftedMomentPolynomial a b u v := by
  classical
  unfold varianceShiftedMomentPolynomial shiftedMomentPolynomial
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  have hkmin : k < min u v + 1 := Finset.mem_range.mp hk
  have he : 2 * k + (u - k) + (v - k) = u + v := by omega
  simp only [linearPolynomial_scale, conjugateLinearPolynomial_scale,
    Complex.ofReal_pow, map_pow]
  calc
    _ = MvPolynomial.C
          ((u.choose k : ℂ) * (v.choose k : ℂ) * (k.factorial : ℂ)) *
        MvPolynomial.C (s : ℂ) ^ (2 * k + (u - k) + (v - k)) *
        conjugateLinearPolynomial a b ^ (u - k) *
        linearPolynomial a b ^ (v - k) := by
      simp only [pow_add, pow_mul, mul_pow]
      ring
    _ = _ := by
      rw [he]
      ring

/-- Forward substitution of the two outer complex coordinates and their
conjugates. The same real scale is used on each conjugate pair. -/
def outerScaleHom (x z : ℝ) : P4 →+* P4 :=
  MvPolynomial.eval₂Hom MvPolynomial.C
    ![MvPolynomial.C (x : ℂ) * X 0, MvPolynomial.C (x : ℂ) * X 1,
      MvPolynomial.C (z : ℂ) * X 2, MvPolynomial.C (z : ℂ) * X 3]

theorem outerScaleHom_C (x z : ℝ) (c : ℂ) :
    outerScaleHom x z (MvPolynomial.C c) = MvPolynomial.C c := by
  simp [outerScaleHom]

theorem outerScaleHom_linearPolynomial (x z a b : ℝ) :
    outerScaleHom x z (linearPolynomial a b) =
      linearPolynomial (a * x) (b * z) := by
  simp only [linearPolynomial, map_add, map_mul, outerScaleHom_C]
  simp [outerScaleHom, Complex.ofReal_mul, map_mul, mul_assoc]

theorem outerScaleHom_conjugateLinearPolynomial (x z a b : ℝ) :
    outerScaleHom x z (conjugateLinearPolynomial a b) =
      conjugateLinearPolynomial (a * x) (b * z) := by
  simp only [conjugateLinearPolynomial, map_add, map_mul, outerScaleHom_C]
  simp [outerScaleHom, Complex.ofReal_mul, map_mul, mul_assoc]

/-- Substitution preserves the contraction variance and changes only the
mean. This is the forward substitution used to cancel source square roots. -/
theorem outerScaleHom_varianceShiftedMomentPolynomial
    (x z variance a b : ℝ) (u v : ℕ) :
    outerScaleHom x z (varianceShiftedMomentPolynomial variance a b u v) =
      varianceShiftedMomentPolynomial variance (a * x) (b * z) u v := by
  classical
  simp only [varianceShiftedMomentPolynomial, map_sum, map_mul, map_pow,
    outerScaleHom_C, outerScaleHom_conjugateLinearPolynomial,
    outerScaleHom_linearPolynomial]

theorem outerScaleHom_monomial (x z : ℝ) (e : Fin 4 →₀ ℕ) (c : ℂ) :
    outerScaleHom x z (MvPolynomial.monomial e c) =
      MvPolynomial.monomial e
        (c * ((x : ℂ) ^ (e 0 + e 1) * (z : ℂ) ^ (e 2 + e 3))) := by
  classical
  simp only [outerScaleHom, MvPolynomial.monomial_eq,
    Finsupp.prod_pow, Fin.prod_univ_four]
  simp only [map_mul, map_pow, MvPolynomial.eval₂Hom_C, MvPolynomial.eval₂Hom_X']
  change (MvPolynomial.C c : P4) *
    ((MvPolynomial.C (x : ℂ) * X 0) ^ e 0 *
      (MvPolynomial.C (x : ℂ) * X 1) ^ e 1 *
      (MvPolynomial.C (z : ℂ) * X 2) ^ e 2 *
      (MvPolynomial.C (z : ℂ) * X 3) ^ e 3) = _
  simp only [mul_pow, pow_add]
  ring

theorem ev4_shiftedMomentPolynomial (a b : ℝ) (u v : ℕ) (w : ℂ × ℂ) :
    ev4 w (shiftedMomentPolynomial a b u v) =
      shiftedDampedMoment 1 (conj ((a : ℂ) * w.1 + (b : ℂ) * w.2)) u v := by
  classical
  have hs : ev4 w (shiftedMomentPolynomial a b u v) =
      ∑ k ∈ Finset.range (min u v + 1),
        ((u.choose k : ℂ) * (v.choose k : ℂ) * (k.factorial : ℂ)) *
          ev4 w (conjugateLinearPolynomial a b) ^ (u - k) *
            ev4 w (linearPolynomial a b) ^ (v - k) := by
    simp only [shiftedMomentPolynomial, ev4, map_sum, map_mul, map_pow,
      MvPolynomial.eval_C]
  rw [hs]
  simp only [ev4_conjugateLinearPolynomial, ev4_linearPolynomial,
    shiftedDampedMoment, Complex.conj_conj, Complex.ofReal_one, one_pow, div_one]
  apply Finset.sum_congr rfl
  intro k _
  ring

/-- The original outer powers, with f holomorphic and e antiholomorphic. -/
def outerPolynomial (e f : PairPowers) : P4 :=
  (X 0 ^ f.2.1 * X 1 ^ e.2.1) * (X 2 ^ f.2.2 * X 3 ^ e.2.2)

theorem outerScaleHom_outerPolynomial (x z : ℝ) (e f : PairPowers) :
    outerScaleHom x z (outerPolynomial e f) =
      (MvPolynomial.C (x : ℂ) ^ (e.2.1 + f.2.1) *
        MvPolynomial.C (z : ℂ) ^ (e.2.2 + f.2.2)) * outerPolynomial e f := by
  simp [outerPolynomial, outerScaleHom, mul_pow, pow_add]
  ring

theorem ev4_outerPolynomial (e f : PairPowers) (w : ℂ × ℂ) :
    ev4 w (outerPolynomial e f) = outerMonomial e f w := by
  simp [outerPolynomial, outerMonomial, ev4, wv]

/-- The complete finite conditional polynomial for B=[[p,q],[r,s]]. -/
def conditionalP4 (e f : PairPowers) (p q r s : ℝ) : P4 :=
  outerPolynomial e f *
    shiftedMomentPolynomial p q f.1.1 e.1.1 *
      shiftedMomentPolynomial r s f.1.2 e.1.2

private theorem ev4_mul (w : ℂ × ℂ) (P Q : P4) :
    ev4 w (P * Q) = ev4 w P * ev4 w Q := by
  simp only [ev4, map_mul]

/-- The polynomial is identified with the actual conditional moment formula,
including its conjugate means and both shifted-moment order pairs. -/
theorem ev4_conditionalP4 (e f : PairPowers) (p q r s : ℝ) (w : ℂ × ℂ) :
    ev4 w (conditionalP4 e f p q r s) = conditionalPolynomial e f p q r s w := by
  simp only [conditionalP4, ev4_mul, ev4_outerPolynomial,
    ev4_shiftedMomentPolynomial, conditionalPolynomial, image]

private theorem ev4_eq_support (P : P4) (w : ℂ × ℂ) :
    ev4 w P = ∑ e ∈ P.support, P.coeff e *
      ((w.1 ^ e 0 * conj w.1 ^ e 1) * (w.2 ^ e 2 * conj w.2 ^ e 3)) := by
  classical
  have h := congrArg (fun Q : P4 => ev4 w Q) P.as_sum
  simp only [ev4, map_sum] at h
  change ev4 w P = ∑ e ∈ P.support, ev4 w (MvPolynomial.monomial e (P.coeff e)) at h
  simpa only [ev4_monomial] using h

/-- Canonical finite-support evaluation against the correlated Gaussian.
The scalar monomial evaluator retains its determinant and inverse-rate masses. -/
def polynomialMomentValue (A B C : ℝ) (P : P4) : ℂ :=
  ∑ e ∈ P.support, P.coeff e *
    QuadraticPolynomialMoments.momentValue A B C (e 0) (e 1) (e 2) (e 3)

theorem polynomialMomentValue_monomial (A B C : ℝ) (e : Fin 4 →₀ ℕ) (c : ℂ) :
    polynomialMomentValue A B C (MvPolynomial.monomial e c) =
      c * QuadraticPolynomialMoments.momentValue A B C (e 0) (e 1) (e 2) (e 3) := by
  classical
  change (Finsupp.single e c).sum
    (fun d a => a * QuadraticPolynomialMoments.momentValue A B C
      (d 0) (d 1) (d 2) (d 3)) = _
  exact Finsupp.sum_single_index (zero_mul _)

theorem polynomialMomentValue_add (A B C : ℝ) (P Q : P4) :
    polynomialMomentValue A B C (P + Q) =
      polynomialMomentValue A B C P + polynomialMomentValue A B C Q := by
  classical
  change (P.coeff + Q.coeff).sum
      (fun d a => a * QuadraticPolynomialMoments.momentValue A B C
        (d 0) (d 1) (d 2) (d 3)) = _
  exact Finsupp.sum_add_index' (fun _ => zero_mul _) (fun _ _ _ => add_mul _ _ _)

theorem polynomialMomentValue_C_mul (A B C : ℝ) (c : ℂ) (P : P4) :
    polynomialMomentValue A B C (MvPolynomial.C c * P) =
      c * polynomialMomentValue A B C P := by
  induction P using MvPolynomial.induction_on' with
  | monomial e a =>
    rw [MvPolynomial.C_mul_monomial, polynomialMomentValue_monomial,
      polynomialMomentValue_monomial, mul_assoc]
  | add P Q hP hQ =>
    rw [mul_add, polynomialMomentValue_add, polynomialMomentValue_add, hP, hQ,
      mul_add]

/-- Forward outer substitution cancels the Gaussian coordinate scales for
every finite polynomial, retaining both complex-coordinate Jacobians. -/
theorem polynomialMomentValue_outerScale (R Q A B C : ℝ)
    (hR : 0 < R) (hQ : 0 < Q) (hA : A ≠ 0) (P : P4) :
    polynomialMomentValue (R * A) (Real.sqrt (R * Q) * B) (Q * C)
      (outerScaleHom (Real.sqrt R) (Real.sqrt Q) P) =
        polynomialMomentValue A B C P / ((R * Q : ℝ) : ℂ) := by
  induction P using MvPolynomial.induction_on' with
  | monomial e c =>
    rw [outerScaleHom_monomial, polynomialMomentValue_monomial,
      polynomialMomentValue_monomial]
    rw [mul_assoc, QuadraticMomentScaling.momentValue_sqrt_scale
      R Q A B C hR hQ hA (e 0) (e 1) (e 2) (e 3)]
    ring
  | add P Q' hP hQ' =>
    rw [map_add, polynomialMomentValue_add, polynomialMomentValue_add,
      hP, hQ', add_div]

/-- Every P4 polynomial is integrated by its actual support and coefficients.
The underlying finite-moment theorem supplies all termwise integrability. -/
theorem integral_ev4_quadraticWeight (P : P4) {A B C : ℝ}
    (hA : 0 < A) (hdet : 0 < A * C - B ^ 2) :
    (∫ w : ℂ × ℂ, ev4 w P * (quadraticWeight A B C w : ℂ)
      ∂gaussC.prod gaussC) = polynomialMomentValue A B C P := by
  classical
  simpa only [ev4_eq_support, polynomialMomentValue] using
    QuadraticPolynomialMoments.integral_finite_mixed_polynomial P.support P.coeff
      (fun e => e 0) (fun e => e 1) (fun e => e 2) (fun e => e 3) hA hdet

/-- The full finite scalar evaluator for the four-source Gram entry. -/
def gramMomentValue (e f : PairPowers) (c : ℂ) (p q r s : ℝ) : ℂ :=
  ((‖c‖ ^ 2 : ℝ) : ℂ) *
    polynomialMomentValue (1 - p ^ 2 - r ^ 2) (-(p * q + r * s))
      (1 - q ^ 2 - s ^ 2) (conditionalP4 e f p q r s)

/-- Exact scalar evaluation of every Gram monomial under the original Schur
conditions. All four source exponents from each Gram index are retained. -/
theorem integral_gramIntegrand_eq_value (e f : PairPowers) (c : ℂ)
    {p q r s : ℝ} (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (p * q + r * s) ^ 2) :
    (∫ zw, gramIntegrand e f c p q r s zw ∂pairMeasure) =
      gramMomentValue e f c p q r s := by
  have hdet' : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (-(p * q + r * s)) ^ 2 := by
    simpa only [neg_sq] using hdet
  rw [integral_gramIntegrand_eq_conditional e f c hA hdet]
  simp_rw [← ev4_conditionalP4]
  unfold gramMomentValue
  rw [integral_ev4_quadraticWeight (conditionalP4 e f p q r s) hA hdet']

/-- Direct L2-pairing form for the finite Gram assembly consumer. -/
theorem integral_pairing_eq_value (e f : PairPowers) (c : ℂ)
    {p q r s : ℝ} (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (p * q + r * s) ^ 2) :
    (∫ zw, conj (BipartitePolynomialL2.monomial e zw * kernel c p q r s zw) *
      (BipartitePolynomialL2.monomial f zw * kernel c p q r s zw) ∂pairMeasure) =
      gramMomentValue e f c p q r s := by
  simp_rw [← gramIntegrand_eq_pairing]
  exact integral_gramIntegrand_eq_value e f c hA hdet

end
end Grothe.UpperChaos.BipartiteKernelGramEvaluation
