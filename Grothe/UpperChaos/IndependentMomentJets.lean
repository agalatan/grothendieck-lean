import Grothe.UpperChaos.HolomorphicCoefficientJets
import Grothe.UpperChaos.HermiteFallingFactorial
import Grothe.UpperChaos.HermiteConjugation
import Grothe.LowerAnalytic.CapSymmetry

/-!
# Finite coherent jets of the independently evaluated physical moments

Agent-ID: codex-2ca4.

Every source derivative used here comes from the existing independent-source
Gaussian domination theorem. Finite Leibniz differentiation then gives the
Hermite contraction terms, including the negative normalization exp(-u*v).
No physical/source Fubini statement or reproducing identity is assumed.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.IndependentMomentJets

open IndependentSourceMoments IndependentSourcePolynomial
open HermiteFallingFactorial HolomorphicCoefficientJets

noncomputable section

/-- The moment evaluator inherits the already dominated physical derivative. -/
theorem hasDerivAt_momentValue_a (p q : ℕ) {r : ℝ} (hr : 0 < r) (a b : ℂ) :
    HasDerivAt (fun t => momentValue r t b p q)
      (momentValue r a b (p + 1) q) a := by
  simpa only [integral_eq_momentValue p q hr,
    integral_eq_momentValue (p + 1) q hr] using hasDerivAt_integral_a p q hr a b

theorem hasDerivAt_momentValue_b (p q : ℕ) {r : ℝ} (hr : 0 < r) (a b : ℂ) :
    HasDerivAt (fun t => momentValue r a t p q)
      (momentValue r a b p (q + 1)) b := by
  simpa only [integral_eq_momentValue p q hr,
    integral_eq_momentValue p (q + 1) hr] using hasDerivAt_integral_b p q hr a b

theorem iteratedDeriv_momentValue_a (p q k : ℕ) {r : ℝ} (hr : 0 < r) (b : ℂ) :
    iteratedDeriv k (fun a => momentValue r a b p q) =
      fun a => momentValue r a b (p + k) q := by
  induction k with
  | zero => simp
  | succ k ih =>
      rw [iteratedDeriv_succ, ih]
      funext a
      simpa only [Nat.add_assoc] using (hasDerivAt_momentValue_a (p + k) q hr a b).deriv

theorem iteratedDeriv_momentValue_b (p q k : ℕ) {r : ℝ} (hr : 0 < r) (a : ℂ) :
    iteratedDeriv k (fun b => momentValue r a b p q) =
      fun b => momentValue r a b p (q + k) := by
  induction k with
  | zero => simp
  | succ k ih =>
      rw [iteratedDeriv_succ, ih]
      funext b
      simpa only [Nat.add_assoc] using (hasDerivAt_momentValue_b p (q + k) hr a b).deriv

/-- Smoothness needed for finite Leibniz rules follows from the same proved
moment derivatives at every order, not an additional regularity premise. -/
theorem contDiff_momentValue_a (p q k : ℕ) {r : ℝ} (hr : 0 < r) (b : ℂ) :
    ContDiff ℂ k (fun a => momentValue r a b p q) := by
  apply contDiff_nat_iff_iteratedDeriv.mpr
  constructor
  · intro l hl
    rw [iteratedDeriv_momentValue_a p q l hr]
    exact (show Differentiable ℂ (fun a => momentValue r a b (p + l) q) from
      fun a => (hasDerivAt_momentValue_a (p + l) q hr a b).differentiableAt).continuous
  · intro l hl
    rw [iteratedDeriv_momentValue_a p q l hr]
    exact fun a => (hasDerivAt_momentValue_a (p + l) q hr a b).differentiableAt

theorem contDiff_momentValue_b (p q k : ℕ) {r : ℝ} (hr : 0 < r) (a : ℂ) :
    ContDiff ℂ k (fun b => momentValue r a b p q) := by
  apply contDiff_nat_iff_iteratedDeriv.mpr
  constructor
  · intro l hl
    rw [iteratedDeriv_momentValue_b p q l hr]
    exact (show Differentiable ℂ (fun b => momentValue r a b p (q + l)) from
      fun b => (hasDerivAt_momentValue_b p (q + l) hr a b).differentiableAt).continuous
  · intro l hl
    rw [iteratedDeriv_momentValue_b p q l hr]
    exact fun b => (hasDerivAt_momentValue_b p (q + l) hr a b).differentiableAt

theorem iteratedDeriv_momentValue_a_shift (p q k : ℕ) {r : ℝ}
    (hr : 0 < r) (a b : ℂ) :
    iteratedDeriv k (fun t => momentValue r (a + t) b p q) 0 =
      momentValue r a b (p + k) q := by
  rw [iteratedDeriv_comp_const_add, iteratedDeriv_momentValue_a p q k hr, add_zero]

theorem iteratedDeriv_momentValue_b_shift (p q k : ℕ) {r : ℝ}
    (hr : 0 < r) (a b : ℂ) :
    iteratedDeriv k (fun t => momentValue r a (b + t) p q) 0 =
      momentValue r a b p (q + k) := by
  rw [iteratedDeriv_comp_const_add, iteratedDeriv_momentValue_b p q k hr, add_zero]

/-- Finite source differentiation of a normalized Gaussian moment times an
arbitrary linear holomorphic exponential. -/
theorem first_source_exponential_jet (p q n : ℕ) {r : ℝ} (hr : 0 < r)
    (a b c : ℂ) :
    iteratedDeriv n (fun t => Complex.exp (c * t) *
      momentValue r (a + t) b p q) 0 =
      ∑ k ∈ Finset.range (n + 1), (n.choose k : ℂ) * c ^ k *
        momentValue r a b (p + (n - k)) q := by
  have hM : ContDiff ℂ n (fun t => momentValue r (a + t) b p q) :=
    (contDiff_momentValue_a p q n hr b).comp (contDiff_const.add contDiff_id)
  rw [iteratedDeriv_fun_mul (by fun_prop) hM.contDiffAt]
  apply Finset.sum_congr rfl
  intro k hk
  rw [iteratedDeriv_cexp_const_mul, iteratedDeriv_momentValue_a_shift p q (n - k) hr]
  simp only [mul_zero, Complex.exp_zero, mul_one]

/-- Conjugation of the physical integration variable swaps both independent
sources and the two monomial exponents, without conjugating the sources. -/
theorem momentValue_swap (p q : ℕ) {r : ℝ} (hr : 0 < r) (a b : ℂ) :
    momentValue r a b p q = momentValue r b a q p := by
  rw [← integral_eq_momentValue p q hr, ← integral_eq_momentValue q p hr]
  have hm : (∫ z, integrand r a b p q (conj z) ∂gaussC) =
      ∫ z, integrand r a b p q z ∂gaussC := by
    conv_rhs => rw [← gaussC_map_conj]
    rw [integral_map Complex.continuous_conj.measurable.aemeasurable
      (show Continuous (integrand r a b p q) by unfold integrand; fun_prop).aestronglyMeasurable]
  rw [← hm]
  apply integral_congr_ae
  refine Filter.Eventually.of_forall fun z => ?_
  simp only [integrand, Complex.conj_conj, Complex.normSq_conj]
  congr 1
  · ring
  · congr 1
    ring

/-- First contract the conjugate source of the normalized incoming pair. -/
theorem incoming_inner_jet (p q d : ℕ) {r : ℝ} (hr : 0 < r) (a b u : ℂ) :
    iteratedDeriv d (fun v => Complex.exp (-u * v) *
      momentValue r (a + u) (b + v) p q) 0 =
      ∑ k ∈ Finset.range (d + 1),
        ((d.choose k : ℂ) * (-1 : ℂ) ^ k) *
          (u ^ k * momentValue r (a + u) b p (q + (d - k))) := by
  have hM : ContDiff ℂ d (fun v => momentValue r (a + u) (b + v) p q) :=
    (contDiff_momentValue_b p q d hr (a + u)).comp (contDiff_const.add contDiff_id)
  rw [iteratedDeriv_fun_mul (by fun_prop) hM.contDiffAt]
  apply Finset.sum_congr rfl
  intro k hk
  rw [iteratedDeriv_cexp_const_mul, iteratedDeriv_momentValue_b_shift p q (d - k) hr]
  simp only [mul_zero, Complex.exp_zero, mul_one, neg_pow]
  ring

/-- The complete finite incoming source jet, including every contraction from
the actual coherent normalization exp(-u*v). -/
theorem incoming_jet_eq_sum (p q c d : ℕ) {r : ℝ} (hr : 0 < r) (a b : ℂ) :
    iteratedDeriv c (fun u => iteratedDeriv d (fun v =>
      Complex.exp (-u * v) * momentValue r (a + u) (b + v) p q) 0) 0 =
      ∑ k ∈ Finset.range (d + 1),
        ((-1 : ℂ) ^ k * (d.choose k : ℂ) * (c.descFactorial k : ℂ)) *
          momentValue r a b (p + (c - k)) (q + (d - k)) := by
  have he : (fun u => iteratedDeriv d (fun v => Complex.exp (-u * v) *
      momentValue r (a + u) (b + v) p q) 0) =
      fun u => ∑ k ∈ Finset.range (d + 1),
        ((d.choose k : ℂ) * (-1 : ℂ) ^ k) *
          (u ^ k * momentValue r (a + u) b p (q + (d - k))) :=
    funext (incoming_inner_jet p q d hr a b)
  rw [he]
  have hM (k : ℕ) : ContDiff ℂ c
      (fun u => momentValue r (a + u) b p (q + (d - k))) :=
    (contDiff_momentValue_a p (q + (d - k)) c hr b).comp
      (contDiff_const.add contDiff_id)
  rw [iteratedDeriv_fun_sum (fun k hk =>
    ((contDiff_const.mul ((contDiff_id.pow k).mul (hM k)))).contDiffAt)]
  apply Finset.sum_congr rfl
  intro k hk
  rw [iteratedDeriv_const_mul_field,
    iteratedDeriv_pow_mul_zero k c _ (hM k).contDiffAt,
    iteratedDeriv_momentValue_a_shift p (q + (d - k)) (c - k) hr]
  ring

private theorem ev_H_right_sum (z : ℂ) (c d : ℕ) :
    ev z (H c d) = ∑ k ∈ Finset.range (d + 1),
      ((-1 : ℂ) ^ k * (d.choose k : ℂ) * (c.descFactorial k : ℂ)) *
        z ^ (c - k) * conj z ^ (d - k) := by
  rw [← conj_ev_H_swap z d c, conj_ev_H_eq_fallingFactorial]
  apply Finset.sum_congr rfl
  intro k hk
  ring

private theorem integrand_mul_H_eq_sum (p q c d : ℕ) (r : ℝ) (a b z : ℂ) :
    integrand r a b p q z * ev z (H c d) =
      ∑ k ∈ Finset.range (d + 1),
        ((-1 : ℂ) ^ k * (d.choose k : ℂ) * (c.descFactorial k : ℂ)) *
          integrand r a b (p + (c - k)) (q + (d - k)) z := by
  rw [ev_H_right_sum, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  simp only [integrand, pow_add]
  ring

theorem integrable_hermite_insertion (p q c d : ℕ) {r : ℝ}
    (hr : 0 < r) (a b : ℂ) :
    Integrable (fun z => integrand r a b p q z * ev z (H c d)) gaussC := by
  simp_rw [integrand_mul_H_eq_sum]
  exact integrable_finsetSum _ fun k hk =>
    (integrable_integrand (p + (c - k)) (q + (d - k)) hr a b).const_mul _

/-- The finite coherent source jet equals the actual physical Hermite
insertion for arbitrary monomial degrees and arbitrary external sources.
Its proof uses only previously dominated moment derivatives and finite sums. -/
theorem incoming_jet_eq_integral_hermite (p q c d : ℕ) {r : ℝ}
    (hr : 0 < r) (a b : ℂ) :
    iteratedDeriv c (fun u => iteratedDeriv d (fun v =>
      Complex.exp (-u * v) * momentValue r (a + u) (b + v) p q) 0) 0 =
      ∫ z, integrand r a b p q z * ev z (H c d) ∂gaussC := by
  rw [incoming_jet_eq_sum p q c d hr a b]
  simp_rw [integrand_mul_H_eq_sum]
  rw [integral_finsetSum _ fun k hk =>
    (integrable_integrand (p + (c - k)) (q + (d - k)) hr a b).const_mul _]
  apply Finset.sum_congr rfl
  intro k hk
  rw [integral_const_mul, integral_eq_momentValue _ _ hr]

end
end Grothe.UpperChaos.IndependentMomentJets
