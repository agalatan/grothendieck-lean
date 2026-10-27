import Grothe.Haagerup.PhaseLaplaceFubini
import Grothe.UpperChaos.ComparisonPieces

/-!
# The actual Taylor inner products as Laplace integrals

Agent-ID: codex-6f91. The base phase argument and the full
production phase are retained exactly. This is an integral identity; numerical
Gaussian enclosures and quadrature budgets remain separate obligations.
-/

open MeasureTheory Complex Set
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- The actual affine argument of the base phase, with its radial profile unchanged. -/
def basePhaseArgument (u : ℂ × ℂ) : ℂ :=
  u.1 + (((Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖u.1‖ ^ 2) : ℝ) : ℂ) * u.2)

lemma measurable_basePhaseArgument : Measurable basePhaseArgument := by
  unfold basePhaseArgument
  have := continuous_vprof
  fun_prop

/-- The multiplicative Taylor phase factor before applying the base response. -/
def taylorPhasePower (j : ℕ) (u : ℂ × ℂ) : ℂ := (I * (phiT u : ℂ)) ^ j

lemma measurable_taylorPhasePower (j : ℕ) : Measurable (taylorPhasePower j) := by
  unfold taylorPhasePower
  exact (measurable_const.mul
    (Complex.measurable_ofReal.comp continuous_phiT.measurable)).pow_const j

lemma norm_taylorPhasePower_le (hφ : PhiBound) (j : ℕ) (u : ℂ × ℂ) :
    ‖taylorPhasePower j u‖ ≤ 1 := by
  have hφu : |phiT u| ≤ 1 := by
    have := hφ u
    rw [← sq_le_one_iff_abs_le_one]
    linarith
  rw [taylorPhasePower, norm_pow, norm_mul, norm_I, one_mul,
    Complex.norm_real, Real.norm_eq_abs]
  exact pow_le_one₀ (abs_nonneg _) hφu

lemma memLp_taylorPhasePower (hφ : PhiBound) (j : ℕ) :
    MemLp (taylorPhasePower j) 2 mu2 :=
  MemLp.of_bound (measurable_taylorPhasePower j).aestronglyMeasurable 1
    (Filter.Eventually.of_forall (norm_taylorPhasePower_le hφ j))

/-- The actual integrable weight multiplying the base phase in the inner product. -/
def taylorInnerSource (j : ℕ) (c : ℂ × ℂ → ℂ) (u : ℂ × ℂ) : ℂ :=
  conj (c u) * taylorPhasePower j u

lemma measurable_taylorInnerSource {c : ℂ × ℂ → ℂ} (hc : ChargeFn c) (j : ℕ) :
    Measurable (taylorInnerSource j c) :=
  (Complex.continuous_conj.measurable.comp hc.meas).mul (measurable_taylorPhasePower j)

/-- Holder integrability uses the already-certified phase bound, not a polynomial expansion. -/
lemma integrable_taylorInnerSource {c : ℂ × ℂ → ℂ} (hφ : PhiBound)
    (hc : ChargeFn c) (j : ℕ) : Integrable (taylorInnerSource j c) mu2 := by
  have hconj : MemLp (fun u => conj (c u)) 2 mu2 :=
    hc.memLp.congr_norm (Complex.continuous_conj.measurable.comp hc.meas).aestronglyMeasurable
      (Filter.Eventually.of_forall (fun u => (Complex.norm_conj (c u)).symm))
  exact hconj.integrable_mul (memLp_taylorPhasePower hφ j)

/-- The production Taylor inner product reduces to an absolutely integrable Laplace kernel. -/
theorem inner_hpow_eq_phaseLaplace {c : ℂ × ℂ → ℂ} (hφ : PhiBound)
    (hc : ChargeFn c) (j : ℕ) :
    ⟪hc.memLp.toLp c, (chargeFn_hpow hφ j).memLp.toLp (hpow j)⟫_ℂ =
      (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ t : ℝ in Ioi 0,
        ∫ u, taylorInnerSource j c u * Haag.phaseLaplaceKernel (basePhaseArgument u) t ∂mu2 := by
  rw [inner_toLp2 hc.memLp (chargeFn_hpow hφ j).memLp]
  calc
    (∫ u, conj (c u) * hpow j u ∂mu2) =
        ∫ u, taylorInnerSource j c u * Haag.ph (basePhaseArgument u) ∂mu2 := by
      apply integral_congr_ae
      refine Filter.Eventually.of_forall (fun u => ?_)
      change conj (c u) * ((I * (phiT u : ℂ)) ^ j * F0 u) =
        (conj (c u) * (I * (phiT u : ℂ)) ^ j) * F0 u
      ring
    _ = _ := Haag.integral_mul_ph_eq_phaseLaplace mu2
      (measurable_taylorInnerSource hc j) measurable_basePhaseArgument
      (integrable_taylorInnerSource hφ hc j)

end
end Grothe.UpperChaos
