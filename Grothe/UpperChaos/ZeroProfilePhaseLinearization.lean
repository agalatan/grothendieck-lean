import Grothe.UpperChaos.ZeroProfilePhaseStability
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! The actual Gaussian constant-and-linear approximation near a profile zero.
This does not enclose saved node bytes. Agent-ID: codex-8c4d. -/
open MeasureTheory Grothe.LowerAnalytic
open scoped InnerProductSpace ComplexConjugate
namespace Grothe.UpperChaos.ZeroProfilePhaseStability
noncomputable section

private theorem hfun00 (w : ℂ) : hfun (0, 0) w = 1 := by
  simp [hfun, nrm, H_zero_zero, ev]

private theorem hfun10 (w : ℂ) : hfun (1, 0) w = w := by
  simp [hfun, nrm, H_succ_left, H_zero_zero, A0, ev, zv]

private theorem hfun01 (w : ℂ) : hfun (0, 1) w = conj w := by
  simp [hfun, nrm, H_zero_succ, H_zero_zero, A1, ev, zv]

private theorem hfun11 (w : ℂ) : hfun (1, 1) w = ((‖w‖ ^ 2 : ℝ) : ℂ) - 1 := by
  simp [hfun, nrm, H_succ_left, H_zero_succ, H_zero_zero, A0, A1, ev, zv,
    Complex.mul_conj, Complex.normSq_eq_norm_sq]

/-- The actual constant and first Gaussian-chaos terms. -/
def linearSliceLp (s : ℝ) : Lp ℂ 2 gaussC :=
  hvec (0, 0) + ((signedProfileRatio s / 2 : ℝ) : ℂ) • (hvec (1, 0) - hvec (0, 1))

/-- These centers are approximations; the other true coefficients are not zero. -/
def linearCoefficient (s : ℝ) (i : ℕ × ℕ) : ℂ :=
  (if i = (0, 0) then 1 else 0) +
    ((signedProfileRatio s / 2 : ℝ) : ℂ) *
      ((if i = (1, 0) then 1 else 0) - (if i = (0, 1) then 1 else 0))

private theorem linearSliceLp_coe (s : ℝ) :
    ∀ᵐ w ∂gaussC, linearSliceLp s w = linearSlice s w := by
  filter_upwards [Lp.coeFn_add (hvec (0, 0))
      (((signedProfileRatio s / 2 : ℝ) : ℂ) • (hvec (1, 0) - hvec (0, 1))),
    Lp.coeFn_smul ((signedProfileRatio s / 2 : ℝ) : ℂ) (hvec (1, 0) - hvec (0, 1)),
    Lp.coeFn_sub (hvec (1, 0)) (hvec (0, 1)),
    (memLp_hfun (0, 0)).coeFn_toLp, (memLp_hfun (1, 0)).coeFn_toLp,
    (memLp_hfun (0, 1)).coeFn_toLp] with w ha hm hd h0 h1 h2
  change ((hvec (0, 0) + _) : Lp ℂ 2 gaussC) w = _
  rw [ha, hm, hd]
  change ((memLp_hfun (0, 0)).toLp _) w +
      ((signedProfileRatio s / 2 : ℝ) : ℂ) •
        (((memLp_hfun (1, 0)).toLp _) w - ((memLp_hfun (0, 1)).toLp _) w) = _
  rw [h0, h1, h2, hfun00, hfun10, hfun01]
  rfl

private theorem quadraticMajorant_coe :
    ∀ᵐ w ∂gaussC, (hvec (0, 0) + hvec (1, 1)) w = ((‖w‖ ^ 2 : ℝ) : ℂ) := by
  filter_upwards [Lp.coeFn_add (hvec (0, 0)) (hvec (1, 1)),
    (memLp_hfun (0, 0)).coeFn_toLp, (memLp_hfun (1, 1)).coeFn_toLp]
    with w ha h0 h11
  rw [ha]
  change ((memLp_hfun (0, 0)).toLp _) w + ((memLp_hfun (1, 1)).toLp _) w = _
  rw [h0, h11, hfun00, hfun11]
  ring

/-- The whole Gaussian phase error is quadratic in the signed physical ratio.
The bound uses only the two unit-norm basis vectors for 1 and |w|²-1. -/
theorem norm_phaseSliceLp_sub_linear (s : ℝ) (hs : 0 < s) :
    ‖F0ConditionalNode.phaseSliceLp s - linearSliceLp s‖ ≤
      5 * signedProfileRatio s ^ 2 := by
  let C : ℝ := (5 / 2) * signedProfileRatio s ^ 2
  have hC : 0 ≤ C := by dsimp only [C]; positivity
  have hpoint : ∀ᵐ w ∂gaussC,
      ‖(F0ConditionalNode.phaseSliceLp s - linearSliceLp s) w‖ ≤
        ‖((C : ℂ) • (hvec (0, 0) + hvec (1, 1))) w‖ := by
    filter_upwards [Lp.coeFn_sub (F0ConditionalNode.phaseSliceLp s) (linearSliceLp s),
      Lp.coeFn_smul (C : ℂ) (hvec (0, 0) + hvec (1, 1)),
      (F0ConditionalNode.phaseSlice_memLp s).coeFn_toLp,
      linearSliceLp_coe s, quadraticMajorant_coe] with w hd hm hp hl hq
    rw [hd, hm, hl, hq]
    change ‖((F0ConditionalNode.phaseSlice_memLp s).toLp _) w - linearSlice s w‖ ≤ _
    rw [hp, norm_smul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hC,
      Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (sq_nonneg ‖w‖)]
    exact phaseSlice_sub_linear_bound s hs w
  calc
    _ ≤ ‖(C : ℂ) • (hvec (0, 0) + hvec (1, 1))‖ := Lp.norm_le_norm_of_ae_le hpoint
    _ = C * ‖hvec (0, 0) + hvec (1, 1)‖ := by
      rw [norm_smul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hC]
    _ ≤ C * (‖hvec (0, 0)‖ + ‖hvec (1, 1)‖) :=
      mul_le_mul_of_nonneg_left (norm_add_le _ _) hC
    _ = 5 * signedProfileRatio s ^ 2 := by
      rw [orthonormal_hvec.norm_eq_one (0, 0), orthonormal_hvec.norm_eq_one (1, 1)]
      dsimp only [C]
      ring

theorem linearCoefficient_eq_inner (s : ℝ) (i : ℕ × ℕ) :
    linearCoefficient s i = ⟪hvec i, linearSliceLp s⟫_ℂ := by
  simp only [linearSliceLp, linearCoefficient, inner_add_right, inner_smul_right,
    inner_sub_right, inner_hvec]

/-- Uniform over ALL true conditional modes, including omitted stored modes. -/
theorem norm_coefficient_sub_linear (s : ℝ) (hs : 0 < s) (i : ℕ × ℕ) :
    ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      5 * signedProfileRatio s ^ 2 := by
  have heq : F0ConditionalNode.coefficient s i - linearCoefficient s i =
      ⟪hvec i, F0ConditionalNode.phaseSliceLp s - linearSliceLp s⟫_ℂ := by
    rw [inner_sub_right, ← linearCoefficient_eq_inner]
    rfl
  rw [heq]
  calc
    _ ≤ ‖hvec i‖ * ‖F0ConditionalNode.phaseSliceLp s - linearSliceLp s‖ := norm_inner_le_norm _ _
    _ = ‖F0ConditionalNode.phaseSliceLp s - linearSliceLp s‖ := by
      rw [orthonormal_hvec.norm_eq_one i, one_mul]
    _ ≤ _ := norm_phaseSliceLp_sub_linear s hs

/-- This reserve still requires a separately checked saved-center comparison. -/
theorem norm_coefficient_sub_linear_small (s : ℝ) (hs : 0 < s)
    (hρ : |signedProfileRatio s| ≤ 1 / 4000000) (i : ℕ × ℕ) :
    ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ < 1 / 10 ^ 12 := by
  have hsq : signedProfileRatio s ^ 2 ≤ (1 / 4000000 : ℝ) ^ 2 := by
    calc
      _ = |signedProfileRatio s| ^ 2 := by rw [sq_abs]
      _ ≤ _ := pow_le_pow_left₀ (abs_nonneg _) hρ 2
  calc
    _ ≤ 5 * signedProfileRatio s ^ 2 := norm_coefficient_sub_linear s hs i
    _ ≤ 5 * (1 / 4000000 : ℝ) ^ 2 := mul_le_mul_of_nonneg_left hsq (by norm_num)
    _ < _ := by norm_num

open Lean Elab Command
run_cmd do
  for target in #[``norm_phaseSliceLp_sub_linear, ``linearCoefficient_eq_inner,
      ``norm_coefficient_sub_linear, ``norm_coefficient_sub_linear_small] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dependency do
        throwError m!"{target} depends on nonstandard axiom {dependency}"
end
end Grothe.UpperChaos.ZeroProfilePhaseStability
