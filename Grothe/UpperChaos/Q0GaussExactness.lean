import Grothe.UpperChaos.Q0LegendrePolynomial
import Mathlib.LinearAlgebra.Lagrange
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Topology.Algebra.Polynomial

/-!
# Exact Gaussian quadrature from the actual recurrence and finite identities

Agent-ID: codex-2ca4.

The final theorem is tied to Q0LegendreInteger.polyPair and realPair. Its
finite polynomial premises are intended to be discharged by the accompanying
rational certificates, not retained as assumptions in a final application.
No analytic quadrature remainder is asserted here.
-/

open MeasureTheory Polynomial Finset

namespace Grothe.UpperChaos.Q0GaussExactness

noncomputable section

/-- Exact rational monomial moment on the original reference interval. -/
def moment (r : ℕ) : ℚ := (1 - (-1) ^ (r + 1)) / (r + 1)

/-- Integration of real polynomials, with its actual analytic meaning. -/
def integralPoly : ℝ[X] →ₗ[ℝ] ℝ where
  toFun p := ∫ x in (-1 : ℝ)..1, p.eval x
  map_add' p q := by
    simp only [Polynomial.eval_add]
    exact intervalIntegral.integral_add
      (p.continuous.intervalIntegrable _ _) (q.continuous.intervalIntegrable _ _)
  map_smul' c p := by
    simp only [Polynomial.eval_smul, RingHom.id_apply]
    exact intervalIntegral.integral_smul c (fun x => p.eval x)

theorem integralPoly_C_mul (c : ℝ) (p : ℝ[X]) :
    integralPoly (C c * p) = c * integralPoly p := by
  simpa only [Polynomial.smul_eq_C_mul, smul_eq_mul] using
    (map_smul integralPoly c p)

theorem integralPoly_X_pow (r : ℕ) :
    integralPoly (X ^ r) = (moment r : ℝ) := by
  change (∫ x in (-1 : ℝ)..1, (X ^ r : ℝ[X]).eval x) = _
  simp only [Polynomial.eval_pow, Polynomial.eval_X]
  rw [integral_pow]
  simp only [moment, Rat.cast_div, Rat.cast_sub, Rat.cast_one,
    Rat.cast_pow, Rat.cast_neg, Rat.cast_add, Rat.cast_natCast, one_pow]

/-- This is the bridge from finite rational coefficient checks to integration. -/
theorem integralPoly_eq_moment_sum (p : ℝ[X]) (m : ℕ) (hp : p.natDegree < m) :
    integralPoly p = ∑ r ∈ range m, p.coeff r * (moment r : ℝ) := by
  calc
    integralPoly p = integralPoly (∑ r ∈ range m, C (p.coeff r) * X ^ r) :=
      congrArg integralPoly (p.as_sum_range_C_mul_X_pow' hp)
    _ = ∑ r ∈ range m, p.coeff r * (moment r : ℝ) := by
      simp only [map_sum, integralPoly_C_mul, integralPoly_X_pow]

/-- The integrated divided difference. The r-first order matches Mathlib's
coefficient formula for division by a monic linear polynomial. -/
def secondKind (n : ℕ) (p : ℝ[X]) : ℝ[X] :=
  ∑ r ∈ range n, ∑ k ∈ Icc (r + 1) n,
    C ((moment r : ℝ) * p.coeff k) * X ^ (k - (r + 1))

theorem integralPoly_divByMonic (n : ℕ) (hn : 0 < n) (p : ℝ[X])
    (hdegree : p.natDegree = n) (t : ℝ) :
    integralPoly (p /ₘ (X - C t)) = (secondKind n p).eval t := by
  have hq : (p /ₘ (X - C t)).natDegree < n := by
    rw [Polynomial.natDegree_divByMonic p (monic_X_sub_C t),
      Polynomial.natDegree_X_sub_C, hdegree]
    omega
  calc
    integralPoly (p /ₘ (X - C t)) =
        ∑ r ∈ range n, (p /ₘ (X - C t)).coeff r * (moment r : ℝ) :=
      integralPoly_eq_moment_sum _ n hq
    _ = ∑ r ∈ range n, ∑ k ∈ Icc (r + 1) n,
        ((moment r : ℝ) * p.coeff k) * t ^ (k - (r + 1)) := by
      apply Finset.sum_congr rfl
      intro r hr
      rw [Polynomial.coeff_divByMonic_X_sub_C, hdegree, Finset.sum_mul]
      apply Finset.sum_congr rfl
      intro k hk
      ring
    _ = (secondKind n p).eval t := by
      simp only [secondKind, Polynomial.eval_finsetSum, Polynomial.eval_mul,
        Polynomial.eval_C, Polynomial.eval_pow, Polynomial.eval_X]

/-- Polynomial, rather than pointwise, division makes the value at t well-defined. -/
def cardinal (p : ℝ[X]) (t : ℝ) : ℝ[X] :=
  C ((p.derivative.eval t)⁻¹) * (p /ₘ (X - C t))

theorem eval_divByMonic_self (p : ℝ[X]) (t : ℝ) :
    (p /ₘ (X - C t)).eval t = p.derivative.eval t := by
  have h := congrArg (fun q : ℝ[X] => q.eval t)
    (Polynomial.divByMonic_add_X_sub_C_mul_derivative_divByMonic_eq_derivative p t)
  simpa only [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_sub,
    Polynomial.eval_X, Polynomial.eval_C, sub_self, zero_mul, add_zero] using h

theorem cardinal_eval_self (p : ℝ[X]) (t : ℝ)
    (hd : p.derivative.eval t ≠ 0) : (cardinal p t).eval t = 1 := by
  rw [cardinal, Polynomial.eval_mul, Polynomial.eval_C, eval_divByMonic_self,
    inv_mul_cancel₀ hd]

theorem cardinal_eval_other (p : ℝ[X]) (s t : ℝ)
    (hs : p.eval s = 0) (ht : p.eval t = 0) (hst : s ≠ t) :
    (cardinal p t).eval s = 0 := by
  have h := congrArg (fun q : ℝ[X] => q.eval s)
    (Polynomial.X_sub_C_mul_divByMonic_eq_sub_modByMonic p t)
  simp only [Polynomial.modByMonic_X_sub_C_eq_C_eval, Polynomial.eval_mul,
    Polynomial.eval_sub, Polynomial.eval_X, Polynomial.eval_C, hs, ht, sub_zero] at h
  have hz : (p /ₘ (X - C t)).eval s = 0 :=
    (mul_eq_zero.mp h).resolve_left (sub_ne_zero.mpr hst)
  simp only [cardinal, Polynomial.eval_mul, Polynomial.eval_C, hz, mul_zero]

theorem cardinal_natDegree_lt (n : ℕ) (hn : 0 < n) (p : ℝ[X])
    (hdegree : p.natDegree = n) (t : ℝ) : (cardinal p t).natDegree < n := by
  have h := Polynomial.natDegree_C_mul_le ((p.derivative.eval t)⁻¹)
    (p /ₘ (X - C t))
  rw [Polynomial.natDegree_divByMonic p (monic_X_sub_C t),
    Polynomial.natDegree_X_sub_C, hdegree] at h
  exact h.trans_lt (by omega)

/-- The root quotient is exactly Mathlib's cardinal polynomial. -/
theorem cardinal_eq_lagrange (n : ℕ) (hn : 0 < n) (p : ℝ[X])
    (hdegree : p.natDegree = n) (node : Fin n → ℝ)
    (hinj : Function.Injective node) (hroot : ∀ i, p.eval (node i) = 0)
    (hderiv : ∀ i, p.derivative.eval (node i) ≠ 0) (i : Fin n) :
    cardinal p (node i) = Lagrange.basis univ node i := by
  have hvs : Set.InjOn node (univ : Finset (Fin n)) := fun _ _ _ _ h => hinj h
  apply Polynomial.eq_of_degrees_lt_of_eval_index_eq univ hvs
  · have h := (Polynomial.degree_le_natDegree (p := cardinal p (node i))).trans_lt
      (show ((cardinal p (node i)).natDegree : WithBot ℕ) < (n : WithBot ℕ) by
        exact_mod_cast cardinal_natDegree_lt n hn p hdegree (node i))
    simpa using h
  · rw [Lagrange.degree_basis hvs (mem_univ i)]
    simp only [card_univ, Fintype.card_fin]
    exact_mod_cast (show n - 1 < n by omega)
  · intro j hj
    by_cases hji : j = i
    · subst j
      rw [cardinal_eval_self p (node i) (hderiv i), Lagrange.eval_basis_self hvs hj]
    · rw [cardinal_eval_other p (node j) (node i) (hroot j) (hroot i)
        (fun h => hji (hinj h)), Lagrange.eval_basis_of_ne (Ne.symm hji) hj]

/-- Two exact polynomial identities identify the original weight formula.
The Bezout identity itself proves all required nonvanishing facts. -/
theorem integralPoly_cardinal_weight (n : ℕ) (hn : 0 < n)
    (p previous witness : ℝ[X]) (hdegree : p.natDegree = n)
    (hderivative : (1 - X ^ 2) * p.derivative = C (n : ℝ) * (previous - X * p))
    (hbezout : C (n : ℝ) * previous * secondKind n p - C 2 = p * witness)
    (t : ℝ) (hroot : p.eval t = 0) :
    p.derivative.eval t ≠ 0 ∧
      integralPoly (cardinal p t) = 2 * (1 - t ^ 2) / ((n : ℝ) ^ 2 * previous.eval t ^ 2) := by
  have hn0 : (n : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.ne_of_gt hn)
  have hb : (n : ℝ) * previous.eval t * (secondKind n p).eval t = 2 := by
    have h := congrArg (fun q : ℝ[X] => q.eval t) hbezout
    simp only [Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_C,
      hroot, zero_mul] at h
    linarith
  have hd : (1 - t ^ 2) * p.derivative.eval t = (n : ℝ) * previous.eval t := by
    have h := congrArg (fun q : ℝ[X] => q.eval t) hderivative
    simpa only [Polynomial.eval_mul, Polynomial.eval_sub, Polynomial.eval_one,
      Polynomial.eval_pow, Polynomial.eval_X, Polynomial.eval_C, hroot,
      mul_zero, sub_zero] using h
  have hprev : previous.eval t ≠ 0 := by
    intro hzero
    rw [hzero, mul_zero, zero_mul] at hb
    norm_num at hb
  have hderiv : p.derivative.eval t ≠ 0 := by
    intro hzero
    rw [hzero, mul_zero] at hd
    exact (mul_ne_zero hn0 hprev) hd.symm
  refine ⟨hderiv, ?_⟩
  rw [cardinal, integralPoly_C_mul, integralPoly_divByMonic n hn p hdegree t]
  field_simp [hderiv, hprev, hn0]
  linear_combination ((n : ℝ) * previous.eval t) * hb - 2 * hd

/-- Orthogonality against monomials extends to every polynomial of degree below n. -/
theorem integralPoly_mul_eq_zero (n : ℕ) (p : ℝ[X])
    (hmoments : ∀ j < n, integralPoly (p * X ^ j) = 0)
    (q : ℝ[X]) (hq : q.natDegree < n) : integralPoly (p * q) = 0 := by
  calc
    integralPoly (p * q) =
        ∑ j ∈ range (q.natDegree + 1), q.coeff j * integralPoly (p * X ^ j) := by
      conv_lhs => rw [q.as_sum_range_C_mul_X_pow]
      simp only [Finset.mul_sum, map_sum]
      apply Finset.sum_congr rfl
      intro j hj
      rw [show p * (C (q.coeff j) * X ^ j) = C (q.coeff j) * (p * X ^ j) by ring,
        integralPoly_C_mul]
    _ = 0 := by
      apply Finset.sum_eq_zero
      intro j hj
      rw [hmoments j (by have := mem_range.mp hj; omega), mul_zero]

/-- This low-degree step is actual interpolation and integration, not an
assumed quadrature property. -/
theorem integralPoly_eq_sum_of_cardinals (n : ℕ)
    (node weight : Fin n → ℝ) (hinj : Function.Injective node)
    (hweight : ∀ i, integralPoly (Lagrange.basis univ node i) = weight i)
    (f : ℝ[X]) (hf : f.natDegree < n) :
    integralPoly f = ∑ i, weight i * f.eval (node i) := by
  have hvs : Set.InjOn node (univ : Finset (Fin n)) := fun _ _ _ _ h => hinj h
  have hdeg : f.degree < ((univ : Finset (Fin n)).card : WithBot ℕ) := by
    have h := (Polynomial.degree_le_natDegree (p := f)).trans_lt
      (show (f.natDegree : WithBot ℕ) < (n : WithBot ℕ) by exact_mod_cast hf)
    simpa using h
  calc
    integralPoly f = integralPoly (Lagrange.interpolate univ node (fun i => f.eval (node i))) :=
      congrArg integralPoly (Lagrange.eq_interpolate hvs hdeg)
    _ = ∑ i, f.eval (node i) * integralPoly (Lagrange.basis univ node i) := by
      simp only [Lagrange.interpolate_apply, map_sum, integralPoly_C_mul]
    _ = ∑ i, weight i * f.eval (node i) := by
      apply Finset.sum_congr rfl
      intro i hi
      rw [hweight i, mul_comm]

private theorem natDegree_div_lt (n : ℕ) (hn : 0 < n) (p f : ℝ[X])
    (hp : p.natDegree = n) (hf : f.natDegree < 2 * n) : (f / p).natDegree < n := by
  have hp0 : p ≠ 0 := Polynomial.ne_zero_of_natDegree_gt
    (show 0 < p.natDegree by omega)
  by_cases hq0 : f / p = 0
  · simpa [hq0] using hn
  · have hf0 : f ≠ 0 := by
      intro hzero
      apply hq0
      simp [hzero]
    have hle : p.degree ≤ f.degree := le_of_not_gt fun hlt =>
      hq0 ((Polynomial.div_eq_zero_iff hp0).mpr hlt)
    have hdeg := Polynomial.degree_add_div hp0 hle
    rw [Polynomial.degree_eq_natDegree hp0, Polynomial.degree_eq_natDegree hq0,
      Polynomial.degree_eq_natDegree hf0] at hdeg
    have hnat : p.natDegree + (f / p).natDegree = f.natDegree := by exact_mod_cast hdeg
    omega

/-- Polynomial division upgrades cardinal exactness from n to 2n degrees. -/
theorem exactness_of_cardinal_integrals (n : ℕ) (hn : 0 < n) (p : ℝ[X])
    (hp : p.natDegree = n) (node weight : Fin n → ℝ)
    (hinj : Function.Injective node) (hroot : ∀ i, p.eval (node i) = 0)
    (hmoments : ∀ j < n, integralPoly (p * X ^ j) = 0)
    (hweight : ∀ i, integralPoly (Lagrange.basis univ node i) = weight i)
    (f : ℝ[X]) (hf : f.natDegree < 2 * n) :
    integralPoly f = ∑ i, weight i * f.eval (node i) := by
  have hp0 : p ≠ 0 := Polynomial.ne_zero_of_natDegree_gt
    (show 0 < p.natDegree by omega)
  have hq := natDegree_div_lt n hn p f hp hf
  have hr : (f % p).natDegree < n := by
    by_cases hr0 : f % p = 0
    · simpa [hr0] using hn
    · apply (Polynomial.natDegree_lt_iff_degree_lt hr0).mpr
      simpa [Polynomial.degree_eq_natDegree hp0, hp] using Polynomial.degree_mod_lt f hp0
  have hsplit : p * (f / p) + f % p = f := EuclideanDomain.div_add_mod f p
  have hvalues (i : Fin n) : (f % p).eval (node i) = f.eval (node i) := by
    have h := congrArg (fun q : ℝ[X] => q.eval (node i)) hsplit
    simpa only [Polynomial.eval_add, Polynomial.eval_mul, hroot i,
      zero_mul, zero_add] using h
  calc
    integralPoly f = integralPoly (p * (f / p) + f % p) := congrArg integralPoly hsplit.symm
    _ = integralPoly (f % p) := by
      rw [map_add, integralPoly_mul_eq_zero n p hmoments _ hq, zero_add]
    _ = ∑ i, weight i * (f % p).eval (node i) :=
      integralPoly_eq_sum_of_cardinals n node weight hinj hweight _ hr
    _ = ∑ i, weight i * f.eval (node i) := by simp only [hvalues]

open Q0LegendreInteger

/-- Actual root-order k+1, with the exact same standard Legendre normalization
and previous polynomial used by the integer recurrence and root selections.

The algebraic premises are explicit finite certificate obligations.
They have not been filled merely by proving this consumer theorem. -/
theorem actual_recurrence_gauss_exactness (k : ℕ)
    (node : Fin (k + 1) → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (realPair (node i) k).2 = 0)
    (hdegree : (polyPair k).2.natDegree = k + 1)
    (hmoments : ∀ j < k + 1,
      ∑ r ∈ range (2 * (k + 1)), ((polyPair k).2 * X ^ j).coeff r * (moment r : ℝ) = 0)
    (hderivative : (1 - X ^ 2) * (polyPair k).2.derivative =
      C ((k + 1 : ℕ) : ℝ) * ((polyPair k).1 - X * (polyPair k).2))
    (witness : ℝ[X])
    (hbezout : C ((k + 1 : ℕ) : ℝ) * (polyPair k).1 * secondKind (k + 1) (polyPair k).2 - C 2 =
      (polyPair k).2 * witness)
    (f : ℝ[X]) (hf : f.natDegree < 2 * (k + 1)) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        (((k + 1 : ℕ) : ℝ) ^ 2 * ((realPair (node i) k).1) ^ 2)) * f.eval (node i) := by
  have hn : 0 < k + 1 := Nat.succ_pos k
  have hpRoot (i : Fin (k + 1)) : (polyPair k).2.eval (node i) = 0 := by
    exact (congrArg Prod.snd (eval_polyPair k (node i))).trans (hroot i)
  have hprevious (i : Fin (k + 1)) : (polyPair k).1.eval (node i) = (realPair (node i) k).1 :=
    congrArg Prod.fst (eval_polyPair k (node i))
  have hw (i : Fin (k + 1)) := integralPoly_cardinal_weight (k + 1) hn
    (polyPair k).2 (polyPair k).1 witness hdegree hderivative hbezout (node i) (hpRoot i)
  have horth (j : ℕ) (hj : j < k + 1) : integralPoly ((polyPair k).2 * X ^ j) = 0 := by
    have hdeg : ((polyPair k).2 * X ^ j).natDegree < 2 * (k + 1) := by
      have h := Polynomial.natDegree_mul_le (p := (polyPair k).2) (q := X ^ j)
      rw [hdegree, Polynomial.natDegree_X_pow] at h
      omega
    rw [integralPoly_eq_moment_sum _ (2 * (k + 1)) hdeg]
    exact hmoments j hj
  apply exactness_of_cardinal_integrals (k + 1) hn (polyPair k).2 hdegree node
    (fun i => 2 * (1 - node i ^ 2) /
      (((k + 1 : ℕ) : ℝ) ^ 2 * ((realPair (node i) k).1) ^ 2)) hinj hpRoot horth
  · intro i
    rw [← cardinal_eq_lagrange (k + 1) hn (polyPair k).2 hdegree node hinj hpRoot
      (fun j => (hw j).1) i]
    simpa only [hprevious i] using (hw i).2
  · exact hf

end
end Grothe.UpperChaos.Q0GaussExactness
