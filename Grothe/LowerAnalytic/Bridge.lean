import Grothe.Lower.RowCheck
import Grothe.LowerAnalytic.SixthMoment
import Grothe.LowerAnalytic.RadialCut
import Grothe.LowerAnalytic.FourthMoment
import Grothe.LowerAnalytic.Circular
import Grothe.LowerAnalytic.CircularTensor
import Grothe.LowerAnalytic.GramBudget

/-!
# From the Gaussian lemmas to the hypotheses of `lower_bound_data`

`lower_bound_data` is stated for an abstract law `U` packaged in `SharedReduction`, which asks
for `Moments μ U x` and `GramInputs μ U`.  This file instantiates both for the law of
`U = a² + b² = |q|²` under the standard Gaussian measure, `q = a + ib` a normalized circular cubic
chaos (`Chaos3 a`, `E a² = 1/2`, `Circular J a b`; `Chaos3 b`, `E b² = 1/2` and `E ab = 0`
follow, by `Circular.chaos3_right`, `Circular.gaussian_sq_eq`, `Circular.gaussian_mul`), and
states the lower bound with only the genuinely open Gaussian facts left as hypotheses.

* `moments_of_three`: `E √U ≤ ρ` and the integrability of `√U` are consequences of the other
  fields of `Moments` (by `first_moment_lt_rho`), so `Moments` follows from three moments.
* `gaussian_moments`: for the Gaussian law, `E U = 1`, `E U² ≥ 2` (from the fluctuation bound),
  the cap `E U² ≤ 62 ≤ 2 + xMax²` (`gaussian_radU_cap`, in `FourthMoment.lean`) and
  integrability are proved; with `x = √(E U² − 2)`, `Moments` holds with the sixth-moment
  inequality `E U³ ≤ 9m − 12 + C₆ (m − 2)^{3/2}` (`m = E U²`) supplied by
  `Circular.gaussian_sixth` from the tensor facts `TensorFacts` of `Circular.lean`, assembled by
  `TensorFactsRest.toTensorFacts` (`CircularTensor.lean`) from the eight still-unproved fields
  `TensorFactsRest` (`wick4`, `anti`, `block`, `A0nn`, `A2nn` are proved there).  (The
  sixth-moment inequality is false for general real pairs `(a, b)` in the third chaos; it needs
  the circularity `D_J q = i q`.)
* `gaussian_steinInputs` (in `RadialCut.lean`) gives `SteinInputs` with no hypothesis;
  `gaussian_gramInputs` (in `GramBudget.lean`) gives `GramInputs` (the inputs of all Stein cuts,
  including the contraction-Gram budgets cited by the spectral nodes) from the tensor facts
  `GramFacts` of the circular cubic.
* `sharedReduction_of_gaussian` and `lower_bound_gaussian`: the finite-layer bound `V ≤ B` for a
  Gaussian residual.  What remains assumed: the tensor facts `TensorFactsRest` of the sixth-moment
  certificate (the Wick identity for `κ₆` and seven charge-sector inequalities), the tensor facts
  `GramFacts` of the contraction-Gram budget (the four spectral identities; `b ≤ n`, `y ≤ z` and
  `G₁ ⪰ 0` are proved in `GramTensor.lean`), the scale `0 ≤ τ ≤ ρ`, the gate variable with `|X₁|² = τ² |q|²`, the row inequalities
  `RowShared` of the Gaussian reduction, and the crude row.
-/

open MeasureTheory MvPolynomial Grothe.Lower

namespace Grothe.LowerAnalytic

/-- `√Z` is integrable when `Z ≥ 0` is. -/
lemma integrable_sqrt {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsFiniteMeasure μ]
    {Z : Ω → ℝ} (hZ : ∀ ω, 0 ≤ Z ω) (hZ1 : Integrable Z μ) :
    Integrable (fun ω => √(Z ω)) μ := by
  refine ((integrable_const (1 : ℝ)).add hZ1).mono'
    (Real.continuous_sqrt.comp_aestronglyMeasurable hZ1.aestronglyMeasurable)
    (Filter.Eventually.of_forall fun ω => ?_)
  show ‖√(Z ω)‖ ≤ 1 + Z ω
  rw [Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _), Real.sqrt_le_left (by linarith [hZ ω])]
  nlinarith [hZ ω]

/-- **`Moments` from three moments**: the first-moment field `E √U ≤ ρ` follows from the others. -/
theorem moments_of_three {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    (U : Ω → ℝ) (x : ℝ) (hU : ∀ ω, 0 ≤ U ω) (hx0 : 0 ≤ x) (hx1 : x ≤ xMax)
    (i1 : Integrable U μ) (i2 : Integrable (fun ω => U ω ^ 2) μ)
    (i3 : Integrable (fun ω => U ω ^ 3) μ) (m1 : ∫ ω, U ω ∂μ = 1)
    (m2 : ∫ ω, U ω ^ 2 ∂μ = 2 + x ^ 2) (m3 : ∫ ω, U ω ^ 3 ∂μ ≤ nX x) :
    Moments μ U x where
  nonneg := hU
  x0 := hx0
  x1 := hx1
  ih := integrable_sqrt hU i1
  i1 := i1
  i2 := i2
  i3 := i3
  mh := (first_moment_lt_rho μ U hU i1 i2 i3 x hx0 (by simpa [xMax] using hx1) m1 m2 m3).le
  m1 := m1
  m2 := m2
  m3 := m3

variable {d : ℕ}

/-- `E[eval P ^ k] = E[eval (P^k)]`, the integrand written as a polynomial. -/
private lemma eval_pow_integrable (P : MvPolynomial (Fin d) ℝ) (k : ℕ) :
    Integrable (fun x => eval x P ^ k) (stdGaussian d) :=
  (integrable_eval (P ^ k)).congr (Filter.Eventually.of_forall fun x => by simp)

/-- **The moments of the Gaussian law.**  For `q = a + ib` a normalized circular cubic chaos, the
law of `U = |q|²` satisfies `Moments` with `x = √(E U² − 2)`, given the tensor facts of the
sixth-moment certificate (the cap `E U² ≤ 2 + xMax²` is `gaussian_radU_cap`). -/
theorem gaussian_moments (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) (hR : TensorFactsRest (gaussE d) J a) :
    Moments (stdGaussian d) (fun x => eval x (radU a b))
      √(∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2) := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hT : TensorFacts (gaussE d) J a := hR.toTensorFacts (gaussE_isGaussianExpectation d) ha hc
  have hbb := hc.gaussian_sq_eq haa
  have hab := hc.gaussian_mul
  have h6 := hc.gaussian_sixth ha haa hT
  set m := ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) with hm
  have hE := gaussE_isGaussianExpectation d
  have toE : ∀ P Q : MvPolynomial (Fin d) ℝ,
      ∫ x, eval x P * eval x Q ∂(stdGaussian d) = gaussE d (P * Q) := fun P Q => by
    rw [gaussE_apply]; simp only [map_mul]
  have haa' : gaussE d (a * a) = 1 / 2 := by rw [← toE, ← haa]; simp only [sq]
  have hbb' : gaussE d (b * b) = 1 / 2 := by rw [← toE, ← hbb]; simp only [sq]
  have hab' : gaussE d (a * b) = 0 := by rw [← toE, hab]
  -- `m ≥ 2` from the fluctuation bound
  have hm2 : 2 ≤ m := by
    have h := fluctuation_bound hE gaussE_mul_self_nonneg ha hb haa' hbb' hab'
    have e : gaussE d (radU a b * radU a b) = m := by rw [hm, ← toE]; simp only [sq]
    rw [e] at h
    nlinarith [gaussE_mul_self_nonneg (radS a b - 3), gaussE_mul_self_nonneg (radA a b),
      gaussE_mul_self_nonneg (radB a b)]
  have hcap : m ≤ 62 := gaussian_radU_cap a b ha hb haa hbb hab
  have hx2 : √(m - 2) ^ 2 = m - 2 := Real.sq_sqrt (by linarith)
  refine moments_of_three _ _ _ (fun x => eval_radU_nonneg a b x) (Real.sqrt_nonneg _) ?_
    (integrable_eval _) (eval_pow_integrable _ 2) (eval_pow_integrable _ 3) ?_ (by rw [hx2]; ring)
    ?_
  · rw [Real.sqrt_le_left (by norm_num [xMax])]
    norm_num [xMax]
    linarith
  · have e : ∀ x, eval x (radU a b) = eval x a ^ 2 + eval x b ^ 2 := fun x => by
      simp only [radU, map_add, map_mul, sq]
    simp only [e]
    rw [integral_add (eval_pow_integrable a 2) (eval_pow_integrable b 2), haa, hbb]
    norm_num
  · have e : nX √(m - 2) = 9 * m - 12 + LowerAnalytic.C6 * (m - 2) ^ ((3 : ℝ) / 2) := by
      rw [rpow_three_halves (by linarith), nX,
        show √(m - 2) ^ 3 = √(m - 2) ^ 2 * √(m - 2) by ring, hx2]
      ring
    rw [e]
    exact h6

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- **The Gaussian reduction discharges the law hypotheses of `SharedReduction`**: for the law of
`|q|²` under the standard Gaussian measure, `q` circular, only the remaining tensor facts of the
sixth-moment certificate and of the contraction-Gram budget, the scale, the gate variable and the
row inequalities remain to be supplied. -/
theorem sharedReduction_of_gaussian (rows : List Row) (V t : ℝ) (Qh v : E)
    (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) (hR : TensorFactsRest (gaussE d) J a) (hG : GramFacts (gaussE d) J a b)
    (X1 X2 X3 : (Fin d → ℝ) → ℂ) (τ : ℝ) (hτ0 : 0 ≤ τ) (hτ1 : τ ≤ ρ)
    (hX : ∀ x, ‖X1 x‖ ^ 2 = τ ^ 2 * eval x (radU a b))
    (hrows : ∀ r ∈ rows,
      RowShared r (stdGaussian d) (fun x => eval x (radU a b)) X1 X2 X3 τ V t Qh v) :
    SharedReduction rows V t Qh v :=
  ⟨Fin d → ℝ, inferInstance, stdGaussian d, inferInstance, fun x => eval x (radU a b), X1, X2,
    X3, τ, _, gaussian_moments a b ha haa hc hR,
    gaussian_gramInputs a b ha (hc.chaos3_right ha) haa (hc.gaussian_sq_eq haa) hc.gaussian_mul hG,
    hτ0, hτ1, hX, hrows⟩

/-- **The finite-layer lower bound for a Gaussian residual**: `lower_bound_data` with the law
hypotheses of `SharedReduction` discharged by the Gaussian lemmas. -/
theorem lower_bound_gaussian (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t)
    (ht1 : t ≤ 9 / 10) (hcrude : RowOf crudeRow V t Qh v)
    (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) (hR : TensorFactsRest (gaussE d) J a) (hG : GramFacts (gaussE d) J a b)
    (X1 X2 X3 : (Fin d → ℝ) → ℂ) (τ : ℝ) (hτ0 : 0 ≤ τ) (hτ1 : τ ≤ ρ)
    (hX : ∀ x, ‖X1 x‖ ^ 2 = τ ^ 2 * eval x (radU a b))
    (hrows : ∀ r ∈ rowData,
      RowShared r (stdGaussian d) (fun x => eval x (radU a b)) X1 X2 X3 τ V t Qh v) :
    V ≤ Bcap :=
  lower_bound_data V t Qh v hv ht0 ht1 hcrude
    (sharedReduction_of_gaussian rowData V t Qh v a b ha haa hc hR hG X1 X2 X3 τ hτ0 hτ1 hX
      hrows)

end Grothe.LowerAnalytic
