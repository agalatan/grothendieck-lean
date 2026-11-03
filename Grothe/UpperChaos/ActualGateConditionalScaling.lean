import Grothe.UpperChaos.BipartiteKernelGramEvaluation
import Grothe.UpperChaos.RationalQuadraticMoments

/-!
# Rational conditional Wick polynomials for the actual parameter gates

Agent-ID: codex-2ca4.

The rational polynomial uses normalized conditional variances R and P. Its
forward outer substitution is exactly the actual conditional polynomial
times the two source-coefficient scales. No Gaussian mass or Jacobian is
inserted here: those belong to the outer moment evaluator.
-/

open MvPolynomial

namespace Grothe.UpperChaos.ActualGateConditionalScaling

open BipartitePolynomialL2 BipartiteKernelGramEvaluation
open OriginalHSParameterGates OriginalHSParameterSoundness
open OriginalHSQuadraticForms OriginalHSGaussianMass RationalQuadraticMoments

noncomputable section

abbrev RationalP4 := MvPolynomial (Fin 4) ℚ

def linearQ (a b : ℚ) : RationalP4 :=
  MvPolynomial.C a * X 0 + MvPolynomial.C b * X 2

def conjugateLinearQ (a b : ℚ) : RationalP4 :=
  MvPolynomial.C a * X 1 + MvPolynomial.C b * X 3

/-- Normalized conditional variance: the contraction coefficient is T^k,
not T^(k+1). The first order uses the conjugate mean form. -/
def varianceWickQ (T a b : ℚ) (u v : ℕ) : RationalP4 :=
  ∑ k ∈ Finset.range (min u v + 1),
    MvPolynomial.C ((u.choose k : ℚ) * (v.choose k : ℚ) * (k.factorial : ℚ)) *
      MvPolynomial.C T ^ k *
      conjugateLinearQ a b ^ (u - k) * linearQ a b ^ (v - k)

def outerQ (e f : PairPowers) : RationalP4 :=
  (X 0 ^ f.2.1 * X 1 ^ e.2.1) * (X 2 ^ f.2.2 * X 3 ^ e.2.2)

def varianceConditionalP4Q (R P a n : ℚ) (e f : PairPowers) : RationalP4 :=
  outerQ e f * varianceWickQ R (-a * R) (n * R) f.1.1 e.1.1 *
    varianceWickQ P (n * P) (-a * P) f.1.2 e.1.2

def varianceConditionalP4 (R P a n : ℝ) (e f : PairPowers) : P4 :=
  outerPolynomial e f *
    varianceShiftedMomentPolynomial R (-a * R) (n * R) f.1.1 e.1.1 *
      varianceShiftedMomentPolynomial P (n * P) (-a * P) f.1.2 e.1.2

/-- Casting the rational finite Wick expression preserves every contraction. -/
theorem map_varianceWickQ (T a b : ℚ) (u v : ℕ) :
    MvPolynomial.map (Rat.castHom ℂ) (varianceWickQ T a b u v) =
      varianceShiftedMomentPolynomial (T : ℝ) (a : ℝ) (b : ℝ) u v := by
  classical
  simp only [varianceWickQ, varianceShiftedMomentPolynomial,
    linearQ, conjugateLinearQ, linearPolynomial, conjugateLinearPolynomial,
    map_sum, map_add, map_mul, map_pow, MvPolynomial.map_C, MvPolynomial.map_X,
    Rat.coe_castHom, Rat.cast_natCast, Complex.ofReal_ratCast]

theorem map_outerQ (e f : PairPowers) :
    MvPolynomial.map (Rat.castHom ℂ) (outerQ e f) = outerPolynomial e f := by
  simp only [outerQ, outerPolynomial, map_mul, map_pow, MvPolynomial.map_X]

/-- The actual rational polynomial has a proved cast identity, rather than a
source-polynomial equality premise. -/
theorem map_varianceConditionalP4Q (R P a n : ℚ) (e f : PairPowers) :
    MvPolynomial.map (Rat.castHom ℂ) (varianceConditionalP4Q R P a n e f) =
      varianceConditionalP4 (R : ℝ) (P : ℝ) (a : ℝ) (n : ℝ) e f := by
  simp only [varianceConditionalP4Q, varianceConditionalP4, map_mul,
    map_outerQ, map_varianceWickQ, Rat.cast_mul, Rat.cast_neg]

/-- The diagonal source coefficient factor for one physical pair, in source
order ((z1,z2),(w1,w2)) with squared scales ((R,P),(R,Q)). -/
def pairSourceScale (R P Q : ℝ) (e : PairPowers) : ℂ :=
  (Real.sqrt R : ℂ) ^ (e.1.1 + e.2.1) *
    (Real.sqrt P : ℂ) ^ e.1.2 * (Real.sqrt Q : ℂ) ^ e.2.2

private theorem first_variance_scale (R Q a n : ℝ) (hR : 0 ≤ R) (u v : ℕ) :
    outerScaleHom (Real.sqrt R) (Real.sqrt Q)
      (varianceShiftedMomentPolynomial R (-a * R) (n * R) u v) =
        MvPolynomial.C (Real.sqrt R : ℂ) ^ (u + v) *
          shiftedMomentPolynomial (-a * R) (n * Real.sqrt (R * Q)) u v := by
  have h0 : (-a * R) * Real.sqrt R = Real.sqrt R * (-a * R) := by ring
  have h1 : (n * R) * Real.sqrt Q =
      Real.sqrt R * (n * Real.sqrt (R * Q)) := by
    rw [Real.sqrt_mul hR Q]
    calc
      (n * R) * Real.sqrt Q =
          (n * (Real.sqrt R * Real.sqrt R)) * Real.sqrt Q := by
        rw [Real.mul_self_sqrt hR]
      _ = Real.sqrt R * (n * (Real.sqrt R * Real.sqrt Q)) := by ring
  rw [outerScaleHom_varianceShiftedMomentPolynomial, h0, h1]
  simpa only [Real.sq_sqrt hR] using
    varianceShiftedMomentPolynomial_scale (Real.sqrt R)
      (-a * R) (n * Real.sqrt (R * Q)) u v

private theorem second_variance_scale (R P Q a n : ℝ)
    (hR : 0 ≤ R) (hP : 0 ≤ P) (u v : ℕ) :
    outerScaleHom (Real.sqrt R) (Real.sqrt Q)
      (varianceShiftedMomentPolynomial P (n * P) (-a * P) u v) =
        MvPolynomial.C (Real.sqrt P : ℂ) ^ (u + v) *
          shiftedMomentPolynomial (n * Real.sqrt (R * P))
            (-a * Real.sqrt (P * Q)) u v := by
  have h0 : (n * P) * Real.sqrt R =
      Real.sqrt P * (n * Real.sqrt (R * P)) := by
    rw [Real.sqrt_mul hR P]
    calc
      (n * P) * Real.sqrt R =
          (n * (Real.sqrt P * Real.sqrt P)) * Real.sqrt R := by
        rw [Real.mul_self_sqrt hP]
      _ = Real.sqrt P * (n * (Real.sqrt R * Real.sqrt P)) := by ring
  have h1 : (-a * P) * Real.sqrt Q =
      Real.sqrt P * (-a * Real.sqrt (P * Q)) := by
    rw [Real.sqrt_mul hP Q]
    calc
      (-a * P) * Real.sqrt Q =
          (-a * (Real.sqrt P * Real.sqrt P)) * Real.sqrt Q := by
        rw [Real.mul_self_sqrt hP]
      _ = Real.sqrt P * (-a * (Real.sqrt P * Real.sqrt Q)) := by ring
  rw [outerScaleHom_varianceShiftedMomentPolynomial, h0, h1]
  simpa only [Real.sq_sqrt hP] using
    varianceShiftedMomentPolynomial_scale (Real.sqrt P)
      (n * Real.sqrt (R * P)) (-a * Real.sqrt (P * Q)) u v

/-- The finite conditional identity, before selecting any parameter gate.
No division is used; nonnegative R and P suffice, including zero scales. -/
theorem varianceConditionalP4_scale (R P Q a n : ℝ)
    (hR : 0 ≤ R) (hP : 0 ≤ P) (e f : PairPowers) :
    outerScaleHom (Real.sqrt R) (Real.sqrt Q) (varianceConditionalP4 R P a n e f) =
      MvPolynomial.C (pairSourceScale R P Q e * pairSourceScale R P Q f) *
        conditionalP4 e f (-a * R) (n * Real.sqrt (R * Q))
          (n * Real.sqrt (R * P)) (-a * Real.sqrt (P * Q)) := by
  simp only [varianceConditionalP4, map_mul, outerScaleHom_outerPolynomial,
    first_variance_scale R Q a n hR, second_variance_scale R P Q a n hR hP]
  simp only [pairSourceScale, conditionalP4, map_mul, map_pow, pow_add]
  ring

/-- The executable rational conditional polynomial for the actual gate.
Its coefficients use only the existing rational gate data. -/
def gateConditionalP4Q (g : Gate) (side : Fin 2) (e f : PairPowers) : RationalP4 :=
  varianceConditionalP4Q g.r (axisWeightQ g (2 * side.val))
    (dampingQ g.power) (nuQ g.power) e f

/-- Forward outer scaling of the actual rational conditional polynomial
recovers precisely the actual matrix conditional polynomial and source
coefficient factors. Gaussian masses and the 1/(R*Q) Jacobian are separate. -/
theorem actual_gate_conditional_scaling (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) (e f : PairPowers) :
    outerScaleHom (Real.sqrt (g.r : ℝ))
      (Real.sqrt (axisWeight g (2 * side.val + 1)))
      (MvPolynomial.map (Rat.castHom ℂ) (gateConditionalP4Q g side e f)) =
        MvPolynomial.C
          (pairSourceScale (g.r : ℝ) (axisWeight g (2 * side.val))
              (axisWeight g (2 * side.val + 1)) e *
            pairSourceScale (g.r : ℝ) (axisWeight g (2 * side.val))
              (axisWeight g (2 * side.val + 1)) f) *
          conditionalP4 e f (matrix00 g) (matrix01 g side)
            (matrix10 g side) (matrix11 g side) := by
  simp only [gateConditionalP4Q, map_varianceConditionalP4Q,
    axisWeightQ_cast, dampingQ_cast, nuQ_cast]
  simpa only [matrix00, matrix01, matrix10, matrix11] using
    varianceConditionalP4_scale (g.r : ℝ) (axisWeight g (2 * side.val))
      (axisWeight g (2 * side.val + 1)) (damping g.power) (nu g.power)
      (radial_pos g hg).le (axisWeight_pos g hg _).le e f

end
end Grothe.UpperChaos.ActualGateConditionalScaling
