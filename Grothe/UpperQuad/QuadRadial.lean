import Grothe.UpperQuad.TailBound
import Grothe.UpperChaos.ProductionF0Radial
import Grothe.UpperChaos.ProductionF0Reconstruction

/-!
# The radial form of the parts of the F0 coefficients (part (Q) of `hQuad`, step 1)

`partCoefficient S q c d` (`TailBound.lean`), the part of the coefficient `(q, c, d)` carried by the
radial event `‖z‖² ∈ S`, is the radial integral of master's node integrand over `(0, ∞) ∩ S`
(`partCoefficient_eq_radial`): the restriction of `baseGradedCoefficient_eq_radial`
(`ProductionF0Radial.lean`) to a measurable radial set. With `S = tailSetᶜ` this is the left side of
`QuadRemainderHyp`, as an integral over the union of the panels.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad.Tail

open MeasureTheory Set Grothe.UpperChaos Grothe.UpperChaos.FixedChaosSmoothing Grothe.LowerAnalytic
open scoped ComplexConjugate

noncomputable section

/-- Master's radial integrand of the coefficient `(q, c, d)`: the Gaussian density `e^{−s}`, the
primary Hermite factor at radius `√s` and the conditional node coefficient. -/
def radialIntegrand (q c d : ℕ) (s : ℝ) : ℂ :=
  (Real.exp (-s) : ℂ) *
    (conj (hfun (q + 1 - c, q - d) (Real.sqrt s : ℂ)) * F0ConditionalNode.coefficient s (c, d))

lemma radialBaseCoefficient_eq_integral (q c d : ℕ) :
    radialBaseCoefficient q c d = ∫ s in Ioi (0 : ℝ), radialIntegrand q c d s := rfl

/-- The part of the coefficient on the radial event `S` is the radial integral over `(0, ∞) ∩ S`. -/
theorem partCoefficient_eq_radial {S : Set ℝ} (hS : MeasurableSet S) {N : ℕ} (q : Fin N)
    (c : Fin (q.val + 2)) (d : Fin (q.val + 1)) :
    partCoefficient S q c d = ∫ s in Ioi (0 : ℝ) ∩ S, radialIntegrand q c d s := by
  let i := gradedMode q c d
  have hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1 := by
    simpa only [gradedIdx] using (gradedIdx_charge (N := N) ⟨q, c, d⟩)
  have hm : Measurable (fun s : ℝ => baseCoefficientSlice i (Real.sqrt s : ℂ)) :=
    (measurable_baseCoefficientSlice i).comp
      (Complex.measurable_ofReal.comp Real.continuous_sqrt.measurable)
  have hA : MeasurableSet {z : ℂ | ‖z‖ ^ 2 ∈ S} := (measurable_norm.pow_const 2) hS
  unfold partCoefficient radialSet
  calc ∫ u in {z : ℂ | ‖z‖ ^ 2 ∈ S} ×ˢ univ, conj (hfun2 i u) * F0 u ∂mu2
      = ∫ z in {z : ℂ | ‖z‖ ^ 2 ∈ S}, baseCoefficientSlice i z ∂gaussC := by
        rw [setIntegral_prod _ (integrable_baseCoefficient i).integrableOn]
        simp only [Measure.restrict_univ]
        rfl
    _ = ∫ z, S.indicator (fun s => baseCoefficientSlice i (Real.sqrt s : ℂ)) (‖z‖ ^ 2) ∂gaussC := by
        rw [← integral_indicator hA]
        apply integral_congr_ae
        filter_upwards with z
        by_cases hz : ‖z‖ ^ 2 ∈ S
        · rw [Set.indicator_of_mem hz, Set.indicator_of_mem (show z ∈ {z : ℂ | ‖z‖ ^ 2 ∈ S} from hz),
            Real.sqrt_sq (norm_nonneg z)]
          exact baseCoefficientSlice_eq_norm i hi z
        · rw [Set.indicator_of_notMem hz,
            Set.indicator_of_notMem (show z ∉ {z : ℂ | ‖z‖ ^ 2 ∈ S} from hz)]
    _ = ∫ s in Ioi (0 : ℝ), (Real.exp (-s) : ℂ) *
          S.indicator (fun s => baseCoefficientSlice i (Real.sqrt s : ℂ)) s :=
        integral_gaussC_norm_sq_complex _ (hm.indicator hS)
    _ = ∫ s in Ioi (0 : ℝ),
          S.indicator (fun s => (Real.exp (-s) : ℂ) * baseCoefficientSlice i (Real.sqrt s : ℂ)) s := by
        apply setIntegral_congr_fun measurableSet_Ioi
        intro s _
        by_cases hs : s ∈ S
        · simp only [Set.indicator_of_mem hs]
        · simp only [Set.indicator_of_notMem hs, mul_zero]
    _ = ∫ s in Ioi (0 : ℝ) ∩ S, (Real.exp (-s) : ℂ) * baseCoefficientSlice i (Real.sqrt s : ℂ) :=
        setIntegral_indicator hS
    _ = _ := by
        apply setIntegral_congr_fun (measurableSet_Ioi.inter hS)
        intro s _
        change (Real.exp (-s) : ℂ) * baseCoefficientSlice i (Real.sqrt s : ℂ) = _
        rw [baseCoefficientSlice_eq, baseConditionalCoefficient_at_node]
        rfl

/-- The natural-number form, for the canonical index ranges of the sums. -/
theorem partCoefficient_eq_radial_nat {S : Set ℝ} (hS : MeasurableSet S) (q c d : ℕ)
    (hc : c ≤ q + 1) (hd : d ≤ q) :
    partCoefficient S q c d = ∫ s in Ioi (0 : ℝ) ∩ S, radialIntegrand q c d s := by
  have hc' : c < q + 2 := by omega
  have hd' : d < q + 1 := by omega
  exact partCoefficient_eq_radial hS (⟨q, Nat.lt_succ_self q⟩ : Fin (q + 1)) ⟨c, hc'⟩ ⟨d, hd'⟩

end

end Grothe.UpperQuad.Tail
