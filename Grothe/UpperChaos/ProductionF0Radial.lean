import Grothe.UpperChaos.ProductionF0Head
import Grothe.UpperChaos.GradedHermiteFn
import Grothe.UpperChaos.TaylorRadialIntegral
import Lean.Util.CollectAxioms

/-! Actual retained F₀ coefficients in the physical squared-radius convention.
The complete tensor integrand is rotation invariant: the charge-one Hermite
factor cancels the charge of F₀. Gaussian radial integration then supplies
exp(-s) exactly once, including at profile zeros. No quadrature rule, saved
coefficient, primary-matrix normalization or floating error is assumed.
Agent-ID: codex-7c2e. -/

set_option warningAsError true
open MeasureTheory Set Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos.FixedChaosSmoothing
noncomputable section

/-- The actual tensor integrand after integrating the second Gaussian. -/
def baseCoefficientSlice (i : Idx2) (z : ℂ) : ℂ :=
  ∫ w, conj (hfun2 i (z, w)) * F0 (z, w) ∂gaussC

theorem measurable_baseCoefficientSlice (i : Idx2) :
    Measurable (baseCoefficientSlice i) := by
  have hm : Measurable (fun u : ℂ × ℂ => conj (hfun2 i u) * F0 u) :=
    (Complex.continuous_conj.comp (continuous_hfun2 i)).measurable.mul measurable_F0
  exact hm.stronglyMeasurable.integral_prod_right'.measurable

/-- Tensor normalization is retained before any radial specialization. -/
theorem baseCoefficientSlice_eq (i : Idx2) (z : ℂ) :
    baseCoefficientSlice i z =
      conj (hfun i.1 z) * baseConditionalCoefficient z i.2.1 i.2.2 := by
  unfold baseCoefficientSlice baseConditionalCoefficient
  simp_rw [hfun2_eq_coordinate_product, map_mul, mul_assoc]
  rw [integral_const_mul]

/-- Charge cancellation concerns the full actual integrand, so it needs
neither a nonzero radial profile nor a divided conditional parameter. -/
theorem baseCoefficientSlice_rot (i : Idx2)
    (hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1)
    (c z : ℂ) (hc : ‖c‖ = 1) :
    baseCoefficientSlice i (c * z) = baseCoefficientSlice i z := by
  have hcc : conj c * c = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc]
    norm_num
  have hrot := integral_rot_gaussC c hc (fun w : ℂ =>
    conj (hfun2 i (c * z, w)) * F0 (c * z, w))
  calc
    _ = ∫ w, conj (hfun2 i (c * z, c * w)) * F0 (c * z, c * w) ∂gaussC :=
      hrot.symm
    _ = _ := by
      apply integral_congr_ae
      filter_upwards [] with w
      change conj (hfun2 i (rot2 c (z, w))) * F0 (rot2 c (z, w)) = _
      rw [hfun2_rot2_of_charge i hi c (z, w) hc, F0_rot2 hc]
      simp only [map_mul]
      calc
        (conj c * conj (hfun2 i (z, w))) * (c * F0 (z, w)) =
            (conj c * c) * (conj (hfun2 i (z, w)) * F0 (z, w)) := by ring
        _ = _ := by rw [hcc, one_mul]

theorem baseCoefficientSlice_eq_norm (i : Idx2)
    (hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1) (z : ℂ) :
    baseCoefficientSlice i z = baseCoefficientSlice i (‖z‖ : ℂ) := by
  by_cases hz : z = 0
  · simp [hz]
  · have hn : (‖z‖ : ℂ) ≠ 0 := by
      exact_mod_cast (norm_ne_zero_iff.mpr hz)
    let c : ℂ := z / (‖z‖ : ℂ)
    have hc : ‖c‖ = 1 := by
      dsimp only [c]
      rw [norm_div, Complex.norm_real, Real.norm_eq_abs,
        abs_of_nonneg (norm_nonneg z)]
      exact div_self (norm_ne_zero_iff.mpr hz)
    have he : c * (‖z‖ : ℂ) = z := by
      dsimp only [c]
      exact div_mul_cancel₀ z hn
    have h := baseCoefficientSlice_rot i hi c (‖z‖ : ℂ) hc
    rw [he] at h
    exact h

/-- The physical first-radius integrand, with its Gaussian density once. -/
def radialBaseCoefficient (q c d : ℕ) : ℂ :=
  ∫ s : ℝ in Ioi 0, (Real.exp (-s) : ℂ) *
    (conj (hfun (q + 1 - c, q - d) (Real.sqrt s : ℂ)) *
      F0ConditionalNode.coefficient s (c, d))

/-- Every actual bounded tensor coefficient is the radial integral in the
same sqrt(s) phase convention as the source-node conditional coefficient. -/
theorem baseGradedCoefficient_eq_radial {N : ℕ} (q : Fin N)
    (c : Fin (q.val + 2)) (d : Fin (q.val + 1)) :
    baseGradedCoefficient q c d = radialBaseCoefficient q c d := by
  let i := gradedMode q c d
  have hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1 := by
    simpa only [gradedIdx] using (gradedIdx_charge (N := N) ⟨q, c, d⟩)
  have hm : Measurable (fun s : ℝ => baseCoefficientSlice i (Real.sqrt s : ℂ)) :=
    (measurable_baseCoefficientSlice i).comp
      (Complex.measurable_ofReal.comp Real.continuous_sqrt.measurable)
  calc
    _ = ∫ z, baseCoefficientSlice i z ∂gaussC := by
      exact integral_prod _ (integrable_baseCoefficient i)
    _ = ∫ z, baseCoefficientSlice i (Real.sqrt (‖z‖ ^ 2) : ℂ) ∂gaussC := by
      apply integral_congr_ae
      filter_upwards [] with z
      rw [Real.sqrt_sq (norm_nonneg z)]
      exact baseCoefficientSlice_eq_norm i hi z
    _ = ∫ s : ℝ in Ioi 0, (Real.exp (-s) : ℂ) *
        baseCoefficientSlice i (Real.sqrt s : ℂ) :=
      integral_gaussC_norm_sq_complex _ hm
    _ = _ := by
      unfold radialBaseCoefficient
      apply setIntegral_congr_fun measurableSet_Ioi
      intro s hs
      change (Real.exp (-s) : ℂ) * baseCoefficientSlice i (Real.sqrt s : ℂ) = _
      rw [baseCoefficientSlice_eq, baseConditionalCoefficient_at_node]
      rfl

/-- The full actual retained-source error is a coupled finite sum of errors
in the physical radial integrals. This is an identity, with no entry-count
loss and no numerical quadrature or table-agreement premise. -/
theorem norm_productionF0Head_sub_sq_radial (a0 : ℕ → ℕ → ℕ → ℚ) :
    ‖productionF0Head - gradedHermite 251 a0‖ ^ 2 =
      ∑ q : Fin 251, ∑ c : Fin (q.val + 2), ∑ d : Fin (q.val + 1),
        ‖radialBaseCoefficient q c d - (a0 q c d : ℂ)‖ ^ 2 := by
  rw [norm_productionF0Head_sub_sq,
    ← sum_bounded_graded_eq_range 251
      (fun q c d => ‖baseGradedCoefficient q c d - (a0 q c d : ℂ)‖ ^ 2)]
  apply Finset.sum_congr rfl
  intro q hq
  apply Finset.sum_congr rfl
  intro c hc
  apply Finset.sum_congr rfl
  intro d hd
  rw [baseGradedCoefficient_eq_radial q c d]

end
end Grothe.UpperChaos.FixedChaosSmoothing

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.FixedChaosSmoothing.baseCoefficientSlice_rot,
      ``Grothe.UpperChaos.FixedChaosSmoothing.baseGradedCoefficient_eq_radial,
      ``Grothe.UpperChaos.FixedChaosSmoothing.norm_productionF0Head_sub_sq_radial] do
    let dependencies ← Lean.collectAxioms target
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do throwError m!"Unexpected actual radial-source axioms: {unexpected}"
