import Grothe.UpperQuad.TailBound
import Grothe.UpperChaos.ProductionF0Radial
import Grothe.UpperChaos.ProductionF0Reconstruction
import Grothe.UpperChaos.RadialLaguerre
import Grothe.UpperChaos.ConditionalReconstruction
import Grothe.UpperQuad.NodeSound
import Grothe.UpperChaos.F0ConditionalReality

/-!
# The radial form of the covered parts of the F0 coefficients (part (Q) of `hQuad`)

* `partCoefficient_eq_radial`: the part of the F0 coefficient `(q, c, d)` carried by a radial event
  `S` is the radial integral
  `∫_{S ∩ (0,∞)} e^{−s} conj(h_{q+1−c,q−d}(√s)) · coefficient s (c, d) ds`
  (Fubini over the second Gaussian and the exponential law of `|z|²`, as in master's
  `baseGradedCoefficient_eq_radial`, with the indicator of `S`).
* `partCoefficient_reflection`: for `c > d + 1` the part is `√((d+1)/c)` times the part of the
  canonical partner `(q, d + 1, c − 1)` (master's pointwise `radialBaseCoefficient_reflection`).
* `radialIntegrand_eq_node`: for a canonical entry `c ≤ d + 1` the integrand is the real node
  integrand `ψ_{d+1−c, q−d}(s) e^{−s} nodeCoef s (c, d)` of the kernel's `nodeTerm`, at every
  `s > 0` with `vprof s ≠ 0`.

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.QuadRem

open MeasureTheory Set Grothe.UpperChaos Grothe.UpperChaos.FixedChaosSmoothing
open Grothe.UpperChaos.F0ConditionalEvaluator Grothe.LowerAnalytic
open scoped ComplexConjugate

noncomputable section

/-- The radial integrand of the F0 coefficient `(q, c, d)`. -/
def radialIntegrand (q c d : ℕ) (s : ℝ) : ℂ :=
  (Real.exp (-s) : ℂ) *
    (conj (hfun (q + 1 - c, q - d) (Real.sqrt s : ℂ)) * F0ConditionalNode.coefficient s (c, d))

/-- **The radial form of a part**. -/
theorem partCoefficient_eq_radial {S : Set ℝ} (hS : MeasurableSet S) (q c d : ℕ)
    (hc : c ≤ q + 1) (hd : d ≤ q) :
    Tail.partCoefficient S q c d = ∫ s in S ∩ Ioi 0, radialIntegrand q c d s := by
  set i := gradedMode q c d with hi_def
  have hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1 := by
    simp only [hi_def, gradedMode]; omega
  set S' : Set ℂ := {z : ℂ | ‖z‖ ^ 2 ∈ S} with hS'
  have hS'm : MeasurableSet S' := (measurable_norm.pow_const 2) hS
  set g : ℂ × ℂ → ℂ := fun u => conj (hfun2 i u) * F0 u with hg
  have hgi : Integrable g mu2 := integrable_baseCoefficient i
  have hind : ∀ u : ℂ × ℂ,
      (Tail.radialSet S).indicator g u = S'.indicator (fun _ => (1 : ℂ)) u.1 * g u := by
    intro u
    by_cases hu : ‖u.1‖ ^ 2 ∈ S
    · have h1 : u ∈ Tail.radialSet S := by simp [Tail.radialSet, hu]
      have h2 : u.1 ∈ S' := hu
      simp [Set.indicator_of_mem h1, Set.indicator_of_mem h2]
    · have h1 : u ∉ Tail.radialSet S := by simp [Tail.radialSet, hu]
      have h2 : u.1 ∉ S' := hu
      simp [Set.indicator_of_notMem h1, Set.indicator_of_notMem h2]
  have hmS : Measurable (fun s : ℝ => S.indicator (fun s =>
      baseCoefficientSlice i (Real.sqrt s : ℂ)) s) :=
    ((measurable_baseCoefficientSlice i).comp
      (Complex.measurable_ofReal.comp Real.continuous_sqrt.measurable)).indicator hS
  calc Tail.partCoefficient S q c d
      = ∫ u, (Tail.radialSet S).indicator g u ∂mu2 := by
        unfold Tail.partCoefficient
        rw [integral_indicator (Tail.measurableSet_radialSet hS)]
    _ = ∫ z, ∫ w, (Tail.radialSet S).indicator g (z, w) ∂gaussC ∂gaussC :=
        integral_prod _ (hgi.indicator (Tail.measurableSet_radialSet hS))
    _ = ∫ z, S'.indicator (fun _ => (1 : ℂ)) z * baseCoefficientSlice i z ∂gaussC := by
        apply integral_congr_ae
        filter_upwards with z
        simp_rw [hind]
        rw [integral_const_mul]
        rfl
    _ = ∫ z, S.indicator (fun s => baseCoefficientSlice i (Real.sqrt s : ℂ)) (‖z‖ ^ 2) ∂gaussC := by
        apply integral_congr_ae
        filter_upwards with z
        by_cases hz : ‖z‖ ^ 2 ∈ S
        · have h2 : z ∈ S' := hz
          rw [Set.indicator_of_mem h2, Set.indicator_of_mem hz, one_mul,
            Real.sqrt_sq (norm_nonneg z)]
          exact baseCoefficientSlice_eq_norm i hi z
        · have h2 : z ∉ S' := hz
          rw [Set.indicator_of_notMem h2, Set.indicator_of_notMem hz, zero_mul]
    _ = ∫ s in Ioi (0 : ℝ), (Real.exp (-s) : ℂ) *
          S.indicator (fun s => baseCoefficientSlice i (Real.sqrt s : ℂ)) s :=
        integral_gaussC_norm_sq_complex _ hmS
    _ = ∫ s in Ioi (0 : ℝ), S.indicator (fun s => radialIntegrand q c d s) s := by
        apply setIntegral_congr_fun measurableSet_Ioi
        intro s _
        dsimp only
        by_cases hs : s ∈ S
        · rw [Set.indicator_of_mem hs, Set.indicator_of_mem hs]
          unfold radialIntegrand
          rw [baseCoefficientSlice_eq, baseConditionalCoefficient_at_node]
          rfl
        · rw [Set.indicator_of_notMem hs, Set.indicator_of_notMem hs, mul_zero]
    _ = ∫ s in S ∩ Ioi 0, radialIntegrand q c d s := by
        rw [setIntegral_indicator hS, Set.inter_comm]

/-- The pointwise reflection of the radial integrand (master's identity). -/
theorem radialIntegrand_reflection (q c d : ℕ) (href : d + 1 < c) {s : ℝ} (hs : 0 < s) :
    radialIntegrand q c d s =
      (Real.sqrt (((d + 1 : ℕ) : ℝ) / (c : ℝ)) : ℂ) * radialIntegrand q (d + 1) (c - 1) s := by
  have hfirst : q + 1 - (d + 1) = q - d := by omega
  have hsecond : q - (c - 1) = q + 1 - c := by omega
  have hp : hfun (q + 1 - c, q - d) (Real.sqrt s : ℂ) =
      hfun (q + 1 - (d + 1), q - (c - 1)) (Real.sqrt s : ℂ) := by
    simpa only [hfirst, hsecond] using hfun_ofReal_swap (Real.sqrt s) (q + 1 - c) (q - d)
  unfold radialIntegrand
  rw [hp, production_reflected_coefficient_all_profiles s hs.le c d href]
  ring

/-- **The reflection of the parts.** -/
theorem partCoefficient_reflection {S : Set ℝ} (hS : MeasurableSet S) (q c d : ℕ)
    (hc : c ≤ q + 1) (hd : d ≤ q) (href : d + 1 < c) :
    Tail.partCoefficient S q c d =
      (Real.sqrt (((d + 1 : ℕ) : ℝ) / (c : ℝ)) : ℂ) * Tail.partCoefficient S q (d + 1) (c - 1) := by
  rw [partCoefficient_eq_radial hS q c d hc hd,
    partCoefficient_eq_radial hS q (d + 1) (c - 1) (by omega) (by omega), ← integral_const_mul]
  exact setIntegral_congr_fun (hS.inter measurableSet_Ioi) fun s hs =>
    radialIntegrand_reflection q c d href hs.2

/-- **The canonical radial integrand is the kernel's real node integrand.** -/
theorem radialIntegrand_eq_node (q c d : ℕ) (hd : d ≤ q) (hc : c ≤ d + 1) {s : ℝ} (hs : 0 < s)
    (hv : vprof s ≠ 0) :
    radialIntegrand q c d s =
      ((RadialLaguerre.radialFactor (d + 1 - c) (q - d) s * Real.exp (-s) * nodeCoef s (c, d) :
        ℝ) : ℂ) := by
  unfold radialIntegrand nodeCoef
  rw [RadialLaguerre.conj_primary_laguerre q c d hd hc hs.le, coefficient_eq_signed s hs.le hv]
  nth_rewrite 1 [canonicalCoefficient_eq_ofReal_re]
  push_cast
  ring

end

end Grothe.UpperQuad.QuadRem
