import Grothe.LowerAnalytic.Gaussian

/-!
# Radial Gaussian integration by parts

Let `a`, `b` be real polynomials on `Fin d → ℝ` with `Σ_j (x_j ∂_j a − ∂_j² a) = 3a` and the same
for `b` (they are eigenfunctions of the Ornstein–Uhlenbeck generator with eigenvalue `−3`, as
every cubic Hermite combination is).  Put `U = a² + b²`, `S = Σ_j ((∂_j a)² + (∂_j b)²)`,
`V_j = a ∂_j a + b ∂_j b`, `T = Σ_j V_j²`.  For a differentiable test `H` with derivative `H'` and
`|H(u)|, |u H'(u)| ≤ M(1 + u)` on `u ≥ 0`,

  `3 E[U H(U)] = E[S H(U)] + 2 E[T H'(U)]`

under the standard Gaussian measure (`radial_parts`).
-/

open MeasureTheory MvPolynomial

namespace Grothe.LowerAnalytic

variable {d : ℕ}

/-- `U = a² + b²`. -/
noncomputable def radU (a b : MvPolynomial (Fin d) ℝ) : MvPolynomial (Fin d) ℝ := a * a + b * b

/-- `V_j = a ∂_j a + b ∂_j b`. -/
noncomputable def radV (a b : MvPolynomial (Fin d) ℝ) (j : Fin d) : MvPolynomial (Fin d) ℝ :=
  a * pderiv j a + b * pderiv j b

/-- `S = Σ_j ((∂_j a)² + (∂_j b)²)`. -/
noncomputable def radS (a b : MvPolynomial (Fin d) ℝ) : MvPolynomial (Fin d) ℝ :=
  ∑ j, (pderiv j a * pderiv j a + pderiv j b * pderiv j b)

/-- `T = Σ_j V_j²`. -/
noncomputable def radT (a b : MvPolynomial (Fin d) ℝ) : MvPolynomial (Fin d) ℝ :=
  ∑ j, radV a b j * radV a b j

lemma eval_radU (a b : MvPolynomial (Fin d) ℝ) (x : Fin d → ℝ) :
    eval x (radU a b) = eval x a * eval x a + eval x b * eval x b := by
  simp only [radU, map_add, map_mul]

lemma eval_radU_nonneg (a b : MvPolynomial (Fin d) ℝ) (x : Fin d → ℝ) : 0 ≤ eval x (radU a b) := by
  rw [eval_radU]; nlinarith [mul_self_nonneg (eval x a), mul_self_nonneg (eval x b)]

lemma pderiv_radU (a b : MvPolynomial (Fin d) ℝ) (j : Fin d) :
    pderiv j (radU a b) = 2 * radV a b j := by
  simp only [radU, radV, map_add, Derivation.leibniz, smul_eq_mul]
  ring

/-- A test function for the radial integration by parts. -/
structure RadialTest (H H' : ℝ → ℝ) (M : ℝ) : Prop where
  deriv : ∀ u, HasDerivAt H (H' u) u
  bound : ∀ u, 0 ≤ u → |H u| ≤ M * (1 + u)
  bound' : ∀ u, 0 ≤ u → |u * H' u| ≤ M * (1 + u)

section

variable {H H' : ℝ → ℝ} {M : ℝ} (hT : RadialTest H H' M) (a b : MvPolynomial (Fin d) ℝ)
include hT

lemma RadialTest.integrable (p : MvPolynomial (Fin d) ℝ) :
    Integrable (fun x => eval x p * H (eval x (radU a b))) (stdGaussian d) := by
  have hHc : Continuous H := continuous_iff_continuousAt.2 fun u => (hT.deriv u).continuousAt
  refine integrable_of_abs_le_eval
    ((continuous_eval p).mul (hHc.comp (continuous_eval _))).aestronglyMeasurable
    (C M * (1 + radU a b) * (1 + p * p)) fun x => ?_
  have hU := eval_radU_nonneg a b x
  have h1 : |eval x p| ≤ 1 + eval x p * eval x p := by
    rw [abs_le]; constructor <;> nlinarith [mul_self_nonneg (eval x p - 1),
      mul_self_nonneg (eval x p + 1)]
  have h2 := hT.bound _ hU
  have h3 : |eval x p * H (eval x (radU a b))|
      ≤ (1 + eval x p * eval x p) * (M * (1 + eval x (radU a b))) := by
    rw [abs_mul]; exact mul_le_mul h1 h2 (abs_nonneg _) (by nlinarith [mul_self_nonneg (eval x p)])
  simp only [map_mul, map_add, map_one, eval_C]
  linarith

lemma RadialTest.integrable' (p q : MvPolynomial (Fin d) ℝ)
    (hpq : ∀ x, |eval x p| ≤ eval x (radU a b) * eval x q) :
    Integrable (fun x => eval x p * H' (eval x (radU a b))) (stdGaussian d) := by
  have hH' : H' = _root_.deriv H := funext fun u => (hT.deriv u).deriv.symm
  have hm : Measurable H' := hH' ▸ measurable_deriv H
  refine integrable_of_abs_le_eval
    ((continuous_eval p).measurable.mul
      (hm.comp (continuous_eval (radU a b)).measurable)).aestronglyMeasurable
    (C M * (1 + radU a b) * (1 + q * q)) fun x => ?_
  have hU := eval_radU_nonneg a b x
  have h1 : |eval x q| ≤ 1 + eval x q * eval x q := by
    rw [abs_le]; constructor <;> nlinarith [mul_self_nonneg (eval x q - 1),
      mul_self_nonneg (eval x q + 1)]
  have h2 := hT.bound' _ hU
  have h3 : |eval x p * H' (eval x (radU a b))|
      ≤ |eval x q| * |eval x (radU a b) * H' (eval x (radU a b))| := by
    rw [abs_mul, abs_mul, abs_of_nonneg hU]
    calc |eval x p| * |H' (eval x (radU a b))|
        ≤ eval x (radU a b) * eval x q * |H' (eval x (radU a b))| :=
          mul_le_mul_of_nonneg_right (hpq x) (abs_nonneg _)
      _ = eval x q * (eval x (radU a b) * |H' (eval x (radU a b))|) := by ring
      _ ≤ |eval x q| * (eval x (radU a b) * |H' (eval x (radU a b))|) :=
          mul_le_mul_of_nonneg_right (le_abs_self _) (mul_nonneg hU (abs_nonneg _))
  have h4 : |eval x q| * |eval x (radU a b) * H' (eval x (radU a b))|
      ≤ (1 + eval x q * eval x q) * (M * (1 + eval x (radU a b))) :=
    mul_le_mul h1 h2 (abs_nonneg _) (by nlinarith [mul_self_nonneg (eval x q)])
  simp only [map_mul, map_add, map_one, eval_C]
  linarith

/-- The coordinate Stein identity for `p · H(U)`. -/
lemma RadialTest.stein (p q : MvPolynomial (Fin d) ℝ) (j : Fin d)
    (hpq : ∀ x, |eval x (p * pderiv j (radU a b))| ≤ eval x (radU a b) * eval x q) :
    ∫ x, eval x (X j * p) * H (eval x (radU a b)) ∂(stdGaussian d)
      = ∫ x, eval x (pderiv j p) * H (eval x (radU a b)) ∂(stdGaussian d)
        + ∫ x, eval x (p * pderiv j (radU a b)) * H' (eval x (radU a b)) ∂(stdGaussian d) := by
  have hD1 := hT.integrable a b (pderiv j p)
  have hD2 := hT.integrable' a b (p * pderiv j (radU a b)) q hpq
  have hxF : Integrable (fun x => x j * (eval x p * H (eval x (radU a b)))) (stdGaussian d) :=
    (hT.integrable a b (X j * p)).congr (Filter.Eventually.of_forall fun x => by
      simp only [map_mul, eval_X]; ring)
  have h := stein_coordinate j (fun x => eval x p * H (eval x (radU a b)))
    (fun x => eval x (pderiv j p) * H (eval x (radU a b))
      + eval x (p * pderiv j (radU a b)) * H' (eval x (radU a b)))
    (hT.integrable a b p) (hD1.add hD2) hxF fun x => by
      have hp := hasDerivAt_eval_update p x j (x j)
      have hU := hasDerivAt_eval_update (radU a b) x j (x j)
      rw [Function.update_eq_self] at hp hU
      have hH : HasDerivAt H (H' (eval x (radU a b)))
          (eval (Function.update x j (x j)) (radU a b)) := by
        rw [Function.update_eq_self]; exact hT.deriv _
      have hc := hH.comp (x j) hU
      exact (hp.mul hc).congr_deriv (by
        simp only [Function.update_eq_self, map_mul, Function.comp_apply]; ring)
  rw [integral_add hD1 hD2] at h
  rw [h]
  refine integral_congr_ae (Filter.Eventually.of_forall fun x => ?_)
  simp only [map_mul, eval_X]; ring

end

private lemma dom_a (α β α' β' : ℝ) :
    |α' * α * (2 * (α * α' + β * β'))| ≤ (α * α + β * β) * (2 * (2 * (α' * α') + β' * β')) := by
  rw [abs_le]
  constructor <;>
  nlinarith [mul_self_nonneg (α * α' - β * β'), mul_self_nonneg (α * α' + β * β'),
    mul_nonneg (mul_self_nonneg β) (mul_self_nonneg α'),
    mul_nonneg (mul_self_nonneg α) (mul_self_nonneg β'),
    mul_nonneg (mul_self_nonneg α) (mul_self_nonneg α'),
    mul_nonneg (mul_self_nonneg β) (mul_self_nonneg β')]

private lemma dom_b (α β α' β' : ℝ) :
    |β' * β * (2 * (α * α' + β * β'))| ≤ (α * α + β * β) * (2 * (α' * α' + 2 * (β' * β'))) := by
  rw [abs_le]
  constructor <;>
  nlinarith [mul_self_nonneg (α * α' - β * β'), mul_self_nonneg (α * α' + β * β'),
    mul_nonneg (mul_self_nonneg β) (mul_self_nonneg α'),
    mul_nonneg (mul_self_nonneg α) (mul_self_nonneg β'),
    mul_nonneg (mul_self_nonneg α) (mul_self_nonneg α'),
    mul_nonneg (mul_self_nonneg β) (mul_self_nonneg β')]

private lemma dom_v (α β α' β' : ℝ) :
    |2 * ((α * α' + β * β') * (α * α' + β * β'))|
      ≤ (α * α + β * β) * (2 * (α' * α' + β' * β')) := by
  rw [abs_of_nonneg (by nlinarith [mul_self_nonneg (α * α' + β * β')])]
  nlinarith [mul_self_nonneg (α * β' - β * α')]

lemma eval_radT_le (a b : MvPolynomial (Fin d) ℝ) (x : Fin d → ℝ) :
    |eval x (radT a b)| ≤ eval x (radU a b) * eval x (radS a b) := by
  have h0 : 0 ≤ eval x (radT a b) := by
    simp only [radT, map_sum, map_mul]
    exact Finset.sum_nonneg fun j _ => mul_self_nonneg _
  rw [abs_of_nonneg h0]
  simp only [radT, radS, map_sum, Finset.mul_sum]
  refine Finset.sum_le_sum fun j _ => ?_
  simp only [radV, eval_radU, map_add, map_mul]
  nlinarith [mul_self_nonneg (eval x a * eval x (pderiv j b) - eval x b * eval x (pderiv j a))]

/-- **Radial Gaussian integration by parts.** -/
theorem radial_parts {H H' : ℝ → ℝ} {M : ℝ} (hT : RadialTest H H' M)
    (a b : MvPolynomial (Fin d) ℝ)
    (ha : ∑ j, (X j * pderiv j a - pderiv j (pderiv j a)) = 3 * a)
    (hb : ∑ j, (X j * pderiv j b - pderiv j (pderiv j b)) = 3 * b) :
    3 * ∫ x, eval x (radU a b) * H (eval x (radU a b)) ∂(stdGaussian d)
      = ∫ x, eval x (radS a b) * H (eval x (radU a b)) ∂(stdGaussian d)
        + 2 * ∫ x, eval x (radT a b) * H' (eval x (radU a b)) ∂(stdGaussian d) := by
  -- the linear functionals
  obtain ⟨L, hL⟩ : ∃ L : MvPolynomial (Fin d) ℝ → ℝ, ∀ p,
      L p = ∫ x, eval x p * H (eval x (radU a b)) ∂(stdGaussian d) := ⟨_, fun _ => rfl⟩
  obtain ⟨L', hL'⟩ : ∃ L' : MvPolynomial (Fin d) ℝ → ℝ, ∀ p,
      L' p = ∫ x, eval x p * H' (eval x (radU a b)) ∂(stdGaussian d) := ⟨_, fun _ => rfl⟩
  have hadd : ∀ p q, L (p + q) = L p + L q := fun p q => by
    rw [hL, hL, hL, ← integral_add (hT.integrable a b p) (hT.integrable a b q)]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x => by
      simp only [map_add]; ring)
  have hsub : ∀ p q, L (p - q) = L p - L q := fun p q => by
    rw [hL, hL, hL, ← integral_sub (hT.integrable a b p) (hT.integrable a b q)]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x => by
      simp only [map_sub]; ring)
  have hsum : ∀ P : Fin d → MvPolynomial (Fin d) ℝ, L (∑ j, P j) = ∑ j, L (P j) := fun P => by
    simp only [hL]
    rw [← integral_finsetSum _ fun j _ => hT.integrable a b (P j)]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x => by
      simp only [map_sum, Finset.sum_mul])
  have h3 : L (3 * radU a b) = 3 * L (radU a b) := by
    rw [hL, hL, ← integral_const_mul]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x => by
      simp only [map_mul, map_ofNat]; ring)
  -- the coordinate identities
  have hqa : ∀ j x, |eval x (pderiv j a * a * pderiv j (radU a b))|
      ≤ eval x (radU a b)
        * eval x (2 * (2 * (pderiv j a * pderiv j a) + pderiv j b * pderiv j b)) := fun j x => by
    rw [pderiv_radU]
    simp only [radV, eval_radU, map_mul, map_add, map_ofNat]
    exact dom_a _ _ _ _
  have hqb : ∀ j x, |eval x (pderiv j b * b * pderiv j (radU a b))|
      ≤ eval x (radU a b)
        * eval x (2 * (pderiv j a * pderiv j a + 2 * (pderiv j b * pderiv j b))) := fun j x => by
    rw [pderiv_radU]
    simp only [radV, eval_radU, map_mul, map_add, map_ofNat]
    exact dom_b _ _ _ _
  have hqv : ∀ j x, |eval x (2 * (radV a b j * radV a b j))|
      ≤ eval x (radU a b) * eval x (2 * (pderiv j a * pderiv j a + pderiv j b * pderiv j b)) :=
    fun j x => by
      simp only [radV, eval_radU, map_mul, map_add, map_ofNat]
      exact dom_v _ _ _ _
  have hj : ∀ j, L (X j * (pderiv j a * a) + X j * (pderiv j b * b)
      - (pderiv j (pderiv j a * a) + pderiv j (pderiv j b * b)))
        = L' (2 * (radV a b j * radV a b j)) := fun j => by
    have h1 := hT.stein a b (pderiv j a * a) _ j (hqa j)
    have h2 := hT.stein a b (pderiv j b * b) _ j (hqb j)
    rw [← hL, ← hL, ← hL'] at h1 h2
    rw [hsub, hadd, hadd, h1, h2, hL', hL', hL',
      show ∫ x, eval x (2 * (radV a b j * radV a b j)) * H' (eval x (radU a b)) ∂(stdGaussian d)
        = ∫ x, (eval x (pderiv j a * a * pderiv j (radU a b)) * H' (eval x (radU a b))
          + eval x (pderiv j b * b * pderiv j (radU a b)) * H' (eval x (radU a b)))
            ∂(stdGaussian d) from
        integral_congr_ae (Filter.Eventually.of_forall fun x => by
          simp only [pderiv_radU, radV, map_mul, map_add, map_ofNat]; ring),
      integral_add (hT.integrable' a b _ _ (hqa j)) (hT.integrable' a b _ _ (hqb j))]
    ring
  -- summation
  have hpoly : ∑ j, (X j * (pderiv j a * a) + X j * (pderiv j b * b)
      - (pderiv j (pderiv j a * a) + pderiv j (pderiv j b * b)))
        = 3 * radU a b - radS a b := by
    have e : ∀ j : Fin d, X j * (pderiv j a * a) + X j * (pderiv j b * b)
        - (pderiv j (pderiv j a * a) + pderiv j (pderiv j b * b))
          = (X j * pderiv j a - pderiv j (pderiv j a)) * a
            + (X j * pderiv j b - pderiv j (pderiv j b)) * b
            - (pderiv j a * pderiv j a + pderiv j b * pderiv j b) := fun j => by
      simp only [Derivation.leibniz, smul_eq_mul]; ring
    simp only [e, Finset.sum_sub_distrib, Finset.sum_add_distrib, ← Finset.sum_mul, ha, hb, radU,
      radS]
    ring
  have hsumL := hsum fun j => X j * (pderiv j a * a) + X j * (pderiv j b * b)
      - (pderiv j (pderiv j a * a) + pderiv j (pderiv j b * b))
  rw [hpoly, hsub, h3] at hsumL
  simp only [hj] at hsumL
  have hTsum : ∑ j, L' (2 * (radV a b j * radV a b j)) = 2 * L' (radT a b) := by
    simp only [hL']
    rw [← integral_finsetSum _ fun j _ => hT.integrable' a b _ _ (hqv j), ← integral_const_mul]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x => by
      simp only [radT, map_sum, map_mul, map_ofNat, Finset.sum_mul, Finset.mul_sum]
      exact Finset.sum_congr rfl fun j _ => by ring)
  rw [hTsum, hL, hL, hL'] at hsumL
  linarith

end Grothe.LowerAnalytic
