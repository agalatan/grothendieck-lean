import Grothe.UpperChaos.ActualSourceNormEvaluation
import Mathlib.RingTheory.MvPolynomial.WeightedHomogeneous
import Mathlib.Algebra.BigOperators.Fin
import Lean.Elab.Tactic.Omega

/-!
# Rational charge orthogonality for the actual source Gram evaluator

Agent-ID: codex-2ca4.

Task #40: finite algebraic decomposition of the actual rational source norm.

The result removes cross-charge terms from the existing exact rational source
norm. It does not identify the finite set of production charges, bind the
archived Laguerre table, prove covariance/Hermite diagonalization, establish
the 18-block/1140-square compressor, or prove a numerical enclosure.
-/

namespace Grothe.UpperChaos.RationalChargeOrthogonality

open MvPolynomial BipartitePolynomialL2 ActualGateConditionalScaling
open RationalQuadraticMoments ActualSourceNormEvaluation
open ActualRationalSourcePolynomial ScaledActualCoherentL2 OriginalHSParameterGates

noncomputable section

/-- The finite rational moment vanishes unless its two total degrees balance.
No convergence or denominator hypothesis is needed for this total expression. -/
theorem momentValue_eq_zero_of_unbalanced (A B C : ℚ) (p q r s : ℕ)
    (h : p + r ≠ q + s) :
    RationalQuadraticMoments.momentValue A B C p q r s = 0 := by
  unfold RationalQuadraticMoments.momentValue
  apply Finset.sum_eq_zero
  intro k hk
  have hk' : k < min p q + 1 := Finset.mem_range.mp hk
  have hkp : k ≤ p := by omega
  have hkq : k ≤ q := by omega
  have hb : (p - k) + r ≠ (q - k) + s := by omega
  simp only [ite_eq_right hb, mul_zero]

/-- The P4 variables are ordered as (w, conjugate w, v, conjugate v). -/
def chargeWeights : Fin 4 → ℤ := ![1, -1, 1, -1]

theorem weight_chargeWeights (d : Fin 4 →₀ ℕ) :
    Finsupp.weight chargeWeights d =
      ((d 0 : ℤ) + d 2) - ((d 1 : ℤ) + d 3) := by
  simp [Finsupp.weight_eq_sum, chargeWeights, Fin.sum_univ_succ,
    sub_eq_add_neg, add_assoc, add_comm, add_left_comm]
  omega

/-- First bipartite source degree minus second bipartite source degree. -/
def pairCharge (e : PairPowers) : ℤ :=
  ((e.1.1 : ℤ) + e.1.2) - ((e.2.1 : ℤ) + e.2.2)

private theorem homogeneous_C (c : ℚ) :
    IsWeightedHomogeneous chargeWeights (C c : RationalP4) 0 :=
  isWeightedHomogeneous_C chargeWeights c

private theorem homogeneous_X0 :
    IsWeightedHomogeneous chargeWeights (X 0 : RationalP4) (1 : ℤ) :=
  isWeightedHomogeneous_X ℚ chargeWeights 0

private theorem homogeneous_X1 :
    IsWeightedHomogeneous chargeWeights (X 1 : RationalP4) (-1 : ℤ) :=
  isWeightedHomogeneous_X ℚ chargeWeights 1

private theorem homogeneous_X2 :
    IsWeightedHomogeneous chargeWeights (X 2 : RationalP4) (1 : ℤ) :=
  isWeightedHomogeneous_X ℚ chargeWeights 2

private theorem homogeneous_X3 :
    IsWeightedHomogeneous chargeWeights (X 3 : RationalP4) (-1 : ℤ) :=
  isWeightedHomogeneous_X ℚ chargeWeights 3

theorem homogeneous_linearQ (a b : ℚ) :
    IsWeightedHomogeneous chargeWeights (linearQ a b) (1 : ℤ) := by
  exact (homogeneous_X0.C_mul a).add (homogeneous_X2.C_mul b)

theorem homogeneous_conjugateLinearQ (a b : ℚ) :
    IsWeightedHomogeneous chargeWeights (conjugateLinearQ a b) (-1 : ℤ) := by
  exact (homogeneous_X1.C_mul a).add (homogeneous_X3.C_mul b)

/-- Every Wick contraction removes equal exponents and preserves charge. -/
theorem homogeneous_varianceWickQ (T a b : ℚ) (u v : ℕ) :
    IsWeightedHomogeneous chargeWeights (varianceWickQ T a b u v)
      ((v : ℤ) - u) := by
  unfold varianceWickQ
  apply IsWeightedHomogeneous.sum
  intro k hk
  have hk' : k < min u v + 1 := Finset.mem_range.mp hk
  have hku : k ≤ u := by omega
  have hkv : k ≤ v := by omega
  have hs : IsWeightedHomogeneous chargeWeights
      (C ((u.choose k : ℚ) * (v.choose k : ℚ) * (k.factorial : ℚ)) *
        C T ^ k : RationalP4) 0 := by
    simpa only [nsmul_zero, add_zero] using
      (homogeneous_C ((u.choose k : ℚ) * (v.choose k : ℚ) * (k.factorial : ℚ))).mul
        ((homogeneous_C T).pow k)
  have hd : (u - k) • (-1 : ℤ) + (v - k) • (1 : ℤ) = (v : ℤ) - u := by
    simp only [Int.nsmul_eq_mul, mul_neg_one, mul_one]
    omega
  simpa only [zero_add, hd] using
    (hs.mul ((homogeneous_conjugateLinearQ a b).pow (u - k))).mul
      ((homogeneous_linearQ a b).pow (v - k))

theorem homogeneous_outerQ (e f : PairPowers) :
    IsWeightedHomogeneous chargeWeights (outerQ e f)
      (((f.2.1 : ℤ) + f.2.2) - ((e.2.1 : ℤ) + e.2.2)) := by
  have hd : f.2.1 • (1 : ℤ) + e.2.1 • (-1 : ℤ) +
      (f.2.2 • (1 : ℤ) + e.2.2 • (-1 : ℤ)) =
      ((f.2.1 : ℤ) + f.2.2) - ((e.2.1 : ℤ) + e.2.2) := by
    simp only [Int.nsmul_eq_mul, mul_neg_one, mul_one]
    omega
  simpa only [outerQ, hd] using
    ((homogeneous_X0.pow f.2.1).mul (homogeneous_X1.pow e.2.1)).mul
      ((homogeneous_X2.pow f.2.2).mul (homogeneous_X3.pow e.2.2))

theorem homogeneous_varianceConditionalP4Q (R P a n : ℚ) (e f : PairPowers) :
    IsWeightedHomogeneous chargeWeights (varianceConditionalP4Q R P a n e f)
      (pairCharge e - pairCharge f) := by
  have hd : (((f.2.1 : ℤ) + f.2.2) - ((e.2.1 : ℤ) + e.2.2)) +
      ((e.1.1 : ℤ) - f.1.1) + ((e.1.2 : ℤ) - f.1.2) =
      pairCharge e - pairCharge f := by
    unfold pairCharge
    omega
  simpa only [varianceConditionalP4Q, hd] using
    ((homogeneous_outerQ e f).mul
      (homogeneous_varianceWickQ R (-a * R) (n * R) f.1.1 e.1.1)).mul
      (homogeneous_varianceWickQ P (n * P) (-a * P) f.1.2 e.1.2)

theorem homogeneous_gateConditionalP4Q (g : Gate) (side : Fin 2)
    (e f : PairPowers) :
    IsWeightedHomogeneous chargeWeights (gateConditionalP4Q g side e f)
      (pairCharge e - pairCharge f) := by
  exact homogeneous_varianceConditionalP4Q g.r (axisWeightQ g (2 * side.val))
    (dampingQ g.power) (nuQ g.power) e f

theorem polynomialMomentValue_eq_zero_of_charge_ne_zero (A B C : ℚ)
    (P : RationalP4) (m : ℤ) (hP : IsWeightedHomogeneous chargeWeights P m)
    (hm : m ≠ 0) :
    RationalQuadraticMoments.polynomialMomentValue A B C P = 0 := by
  unfold RationalQuadraticMoments.polynomialMomentValue
  apply Finset.sum_eq_zero
  intro d hd
  have hw : Finsupp.weight chargeWeights d = m :=
    hP (MvPolynomial.mem_support_iff.mp hd)
  have hb : d 0 + d 2 ≠ d 1 + d 3 := by
    intro heq
    have hz : Finsupp.weight chargeWeights d = 0 := by
      rw [weight_chargeWeights]
      omega
    exact hm (hw.symm.trans hz)
  rw [momentValue_eq_zero_of_unbalanced A B C (d 0) (d 1) (d 2) (d 3) hb,
    mul_zero]

/-- Different pair charges are orthogonal in the actual total rational evaluator.
This conclusion is algebraic and does not require gate positivity. -/
theorem rationalGatePairValue_eq_zero_of_charge_ne (g : Gate) (side : Fin 2)
    (e f : PairPowers) (h : pairCharge e ≠ pairCharge f) :
    rationalGatePairValue g side e f = 0 := by
  have hz := polynomialMomentValue_eq_zero_of_charge_ne_zero
    (gateLeadingQ g side) (gateCrossQ g side) (gateTrailingQ g side)
    (gateConditionalP4Q g side e f) (pairCharge e - pairCharge f)
    (homogeneous_gateConditionalP4Q g side e f) (sub_ne_zero.mpr h)
  simp only [rationalGatePairValue, hz, mul_zero, zero_div]

/-- Two signed charges, one for each independent physical coordinate. -/
def sourceCharge (e : Fin 8 →₀ ℕ) : ℤ × ℤ :=
  (pairCharge (powers e).1, pairCharge (powers e).2)

theorem rationalTensorPairValue_eq_zero_of_charge_ne (g : Gate)
    (e f : Fin 8 →₀ ℕ) (h : sourceCharge e ≠ sourceCharge f) :
    rationalGatePairValue g 0 (powers e).1 (powers f).1 *
      rationalGatePairValue g 1 (powers e).2 (powers f).2 = 0 := by
  by_cases h0 : pairCharge (powers e).1 = pairCharge (powers f).1
  · have h1 : pairCharge (powers e).2 ≠ pairCharge (powers f).2 := by
      intro h1
      exact h (Prod.ext h0 h1)
    rw [rationalGatePairValue_eq_zero_of_charge_ne g 1 (powers e).2 (powers f).2 h1,
      mul_zero]
  · rw [rationalGatePairValue_eq_zero_of_charge_ne g 0 (powers e).1 (powers f).1 h0,
      zero_mul]

/-- Exact removal of all cross-charge terms from the landed rational source
norm. This is charge filtering, not the Laguerre/Hermite square compressor. -/
theorem rationalSourceNormValue_eq_charge_filtered (g : Gate) :
    rationalSourceNormValue g =
      ∑ e ∈ (rationalSourcePolynomial g.power).support,
        ∑ f ∈ (rationalSourcePolynomial g.power).support.filter
            (fun f => sourceCharge f = sourceCharge e),
          ((rationalSourcePolynomial g.power).coeff e *
            (rationalSourcePolynomial g.power).coeff f) *
            (rationalGatePairValue g 0 (powers e).1 (powers f).1 *
              rationalGatePairValue g 1 (powers e).2 (powers f).2) := by
  classical
  unfold rationalSourceNormValue
  apply Finset.sum_congr rfl
  intro e _he
  rw [Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro f _hf
  by_cases hc : sourceCharge f = sourceCharge e
  · simp only [hc, ite_true]
  · have hne : sourceCharge e ≠ sourceCharge f := by
      intro heq
      exact hc heq.symm
    rw [rationalTensorPairValue_eq_zero_of_charge_ne g e f hne]
    simp only [mul_zero, ite_eq_right hc]

open Lean Elab Command
run_cmd do
  for target in #[``momentValue_eq_zero_of_unbalanced,
      ``rationalGatePairValue_eq_zero_of_charge_ne,
      ``rationalSourceNormValue_eq_charge_filtered] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"

end
end Grothe.UpperChaos.RationalChargeOrthogonality
