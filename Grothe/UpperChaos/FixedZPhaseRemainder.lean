import Grothe.UpperChaos.ZeroProfilePhaseLinearization
import Grothe.LowerAnalytic.ComplexGaussianCore

/-! Rotation of the constant and linear Gaussian model to the physical slice.
Source-only candidate. Agent-ID: codex-8c4d. -/
open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.FixedZPhaseRemainder
open F0ConditionalNode ZeroProfilePhaseStability
noncomputable section

def direction (z : ℂ) : ℂ := z / (‖z‖ : ℂ)

private theorem direction_unit {z : ℂ} (hz : z ≠ 0) : ‖direction z‖ = 1 := by
  simp [direction, Complex.norm_real, norm_ne_zero_iff.mpr hz]

def unrotate (z w : ℂ) : ℂ := conj (direction z) * w

private theorem unrotate_preserves {z : ℂ} (hz : z ≠ 0) :
    MeasurePreserving (unrotate z) gaussC gaussC := by
  refine ⟨measurable_const.mul measurable_id, map_rot_gaussC (conj (direction z)) ?_⟩
  rw [Complex.norm_conj, direction_unit hz]

theorem fixed_phase_eq {z : ℂ} (hz : z ≠ 0) (w : ℂ) :
    F0 (z, w) = direction z * phaseSlice (‖z‖ ^ 2) (unrotate z w) := by
  have hr : (‖z‖ : ℂ) ≠ 0 := by exact_mod_cast norm_ne_zero_iff.mpr hz
  have hfirst : direction z * (↑(Real.sqrt (‖z‖ ^ 2)) : ℂ) = z := by
    rw [Real.sqrt_sq (norm_nonneg z)]
    exact div_mul_cancel₀ _ hr
  have hprod : direction z * conj (direction z) = 1 := by
    simp [Complex.mul_conj, Complex.normSq_eq_norm_sq, direction_unit hz]
  have hrot : rot2 (direction z) ((↑(Real.sqrt (‖z‖ ^ 2)) : ℂ), unrotate z w) =
      (z, w) := by
    simp only [rot2, hfirst, unrotate, ← mul_assoc, hprod, one_mul]
  have h := F0_rot2 (direction_unit hz) ((↑(Real.sqrt (‖z‖ ^ 2)) : ℂ), unrotate z w)
  rw [hrot] at h
  simpa only [phaseSlice] using h

def model (z w : ℂ) : ℂ := direction z * linearSlice (‖z‖ ^ 2) (unrotate z w)

def residual (z w : ℂ) : ℂ := F0 (z, w) - model z w

theorem measurable_residual (z : ℂ) : Measurable (residual z) := by
  have hm : Measurable (model z) := by
    unfold model linearSlice unrotate
    fun_prop
  exact (measurable_F0.comp (measurable_const.prodMk measurable_id)).sub hm

private def lifted {z : ℂ} (hz : z ≠ 0) : Lp ℂ 2 gaussC :=
  direction z • Lp.compMeasurePreserving (unrotate z) (unrotate_preserves hz)
    (phaseSliceLp (‖z‖ ^ 2) - linearSliceLp (‖z‖ ^ 2))

private theorem lifted_coe {z : ℂ} (hz : z ≠ 0) :
    ⇑(lifted hz) =ᵐ[gaussC] residual z := by
  let s := ‖z‖ ^ 2
  let g := phaseSliceLp s - linearSliceLp s
  have hg : ∀ᵐ w ∂gaussC, g w = phaseSlice s w - linearSlice s w := by
    filter_upwards [Lp.coeFn_sub (phaseSliceLp s) (linearSliceLp s),
      (phaseSlice_memLp s).coeFn_toLp, linearSliceLp_coe s] with w hd hp hl
    change (phaseSliceLp s - linearSliceLp s) w = _
    change phaseSliceLp s w = phaseSlice s w at hp
    simpa only [Pi.sub_apply, hp, hl] using hd
  let mp := unrotate_preserves hz
  filter_upwards [Lp.coeFn_smul (direction z) (Lp.compMeasurePreserving (unrotate z) mp g),
    Lp.coeFn_compMeasurePreserving g mp, mp.quasiMeasurePreserving.ae hg] with w hm hc hd
  change (direction z • Lp.compMeasurePreserving (unrotate z) mp g) w = residual z w
  change (Lp.compMeasurePreserving (unrotate z) mp g) w = g (unrotate z w) at hc
  rw [hm, Pi.smul_apply, hc, hd]
  change direction z * (phaseSlice s (unrotate z w) - linearSlice s (unrotate z w)) =
    F0 (z, w) - direction z * linearSlice s (unrotate z w)
  rw [fixed_phase_eq hz, mul_sub]

theorem residual_memLp {z : ℂ} (hz : z ≠ 0) : MemLp (residual z) 2 gaussC :=
  MemLp.ae_eq (lifted_coe hz) (Lp.memLp _)

theorem integrable_residual_sq {z : ℂ} (hz : z ≠ 0) :
    Integrable (fun w => ‖residual z w‖ ^ 2) gaussC :=
  (residual_memLp hz).integrable_norm_pow two_ne_zero

theorem norm_actual_residual {z : ℂ} (hz : z ≠ 0) :
    ‖(residual_memLp hz).toLp (residual z)‖ ≤
      5 * (Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof (‖z‖ ^ 2) / ‖z‖) ^ 2 := by
  have he : (residual_memLp hz).toLp (residual z) = lifted hz :=
    Lp.ext ((residual_memLp hz).coeFn_toLp.trans (lifted_coe hz).symm)
  rw [he, lifted, norm_smul, direction_unit hz, one_mul, Lp.norm_compMeasurePreserving]
  simpa only [signedProfileRatio, Real.sqrt_sq (norm_nonneg z)] using
    norm_phaseSliceLp_sub_linear (‖z‖ ^ 2) (sq_pos_of_pos (norm_pos_iff.mpr hz))

open Lean Elab Command
run_cmd do
  for target in #[``fixed_phase_eq, ``measurable_residual, ``residual_memLp,
      ``integrable_residual_sq, ``norm_actual_residual] do
    for dep in (← Lean.collectAxioms target) do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dep do
        throwError m!"{target} depends on nonstandard axiom {dep}"
end
end Grothe.UpperChaos.FixedZPhaseRemainder
