import Grothe.UpperQuad.TwistRadialExtension

/-!
# Analyticity of the actual twisted radial extension

The signed profile ratio is analytic at every radial point whose squared argument is not a
profile zero. Local analyticity and continuity provide a closed disk with bounded parameters,
so the Gaussian composition theorem requires no numerical bound. The origin is permitted.

Agent-ID: codex-2f3d. Refs #334, #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistRadialExt

open Complex Metric Filter MvPolynomial Grothe.UpperChaos
open scoped Topology

noncomputable section

/-- The fixed positive profile scale is nonzero as a complex number. -/
theorem kappa_ne_zero : (QuadRem.kappa : ℂ) ≠ 0 := by
  have hk : 0 < QuadRem.kappa := by
    unfold QuadRem.kappa
    exact Real.sqrt_pos.mpr (by positivity)
  exact Complex.ofReal_ne_zero.mpr hk.ne'

/-- The signed radial shift is analytic wherever its profile denominator is nonzero. -/
theorem analyticAt_shift {r : ℂ} (hv : QuadRem.vC (r ^ 2) ≠ 0) :
    AnalyticAt ℂ shift r := by
  have hp : AnalyticAt ℂ (fun z : ℂ ↦ QuadRem.vC (z ^ 2)) r :=
    (QuadRem.differentiable_vC.analyticAt (r ^ 2)).comp
      (f := fun z : ℂ ↦ z ^ 2) (analyticAt_id.pow 2)
  exact analyticAt_id.div (analyticAt_const.mul hp) (mul_ne_zero kappa_ne_zero hv)

/-- Both arguments of the normalized formal Hermite polynomial may vary with the radius. -/
theorem analyticAt_normalizedHf_diag (p q : ℕ) (r : ℂ) :
    AnalyticAt ℂ (fun z : ℂ ↦ FinitePolynomialMehler.normalizedHf p q z z) r := by
  have hvars (k : Fin 2) : AnalyticAt ℂ (fun z : ℂ ↦ (![z, z] : Fin 2 → ℂ) k) r := by
    fin_cases k <;> dsimp <;> exact analyticAt_id
  simpa only [MvPolynomial.aeval_eq_eval, PolynomialHermite.eval_normalized_H] using
    AnalyticAt.aeval_mvPolynomial hvars ((nrm p q : ℂ) • H p q)

/-- Local continuity supplies the bounded disk required by Gaussian integration. -/
theorem analyticAt_profileCoefficient (j : ℕ) (hj : 0 < j) (i : ℕ × ℕ)
    {r : ℂ} (hv : QuadRem.vC (r ^ 2) ≠ 0) :
    AnalyticAt ℂ (fun z ↦ GaussianShift.coefficient j z (shift z).re (shift z).im i) r := by
  have hs := analyticAt_shift hv
  let M : ℝ := ‖r‖ + ‖shift r‖ + 1
  have hnorm_id : ∀ᶠ z : ℂ in 𝓝 r, ‖z‖ < ‖r‖ + 1 :=
    (continuousAt_id.norm : ContinuousAt (fun z : ℂ ↦ ‖z‖) r).eventually_lt_const
      (lt_add_one ‖r‖)
  have hnorm_shift : ∀ᶠ z in 𝓝 r, ‖shift z‖ < ‖shift r‖ + 1 :=
    hs.continuousAt.norm.eventually_lt_const (lt_add_one ‖shift r‖)
  have hgood :
      {z : ℂ | AnalyticAt ℂ shift z ∧ ‖z‖ ≤ M ∧ ‖shift z‖ ≤ M} ∈ 𝓝 r := by
    filter_upwards [hs.eventually_analyticAt, hnorm_id, hnorm_shift] with z hz hzi hzs
    refine ⟨hz, ?_, ?_⟩ <;> dsimp [M] <;> linarith [norm_nonneg r, norm_nonneg (shift r)]
  obtain ⟨R, hR, hball⟩ := Metric.nhds_basis_closedBall.mem_iff.mp hgood
  apply GaussianShift.analyticAt_coefficient_comp j hj i hR differentiableOn_id
    (M := M)
  · intro z hz
    exact (hball hz).1.differentiableAt.differentiableWithinAt
  · intro z hz
    exact (hball hz).2

/-- Every positive-power radial component is analytic wherever the squared profile is nonzero. -/
theorem analyticAt_radial (j q c d : ℕ) (σ : ℝ) (hj : 0 < j)
    {r : ℂ} (hv : QuadRem.vC (r ^ 2) ≠ 0) :
    AnalyticAt ℂ (radial j q c d σ) r := by
  have he : AnalyticAt ℂ (fun z : ℂ ↦ Complex.exp (-(z ^ 2)) * (σ : ℂ)) r := by
    fun_prop
  exact (he.mul (analyticAt_normalizedHf_diag (q - d) (q + 1 - c) r)).mul
    (analyticAt_profileCoefficient j hj (c, d) hv)

end

end Grothe.UpperQuad.TwistRadialExt

open Lean Elab Command
run_cmd do
  let inherited ← Lean.collectAxioms ``Grothe.UpperQuad.GaussianShift.analyticAt_coefficient_comp
  for target in #[``Grothe.UpperQuad.TwistRadialExt.kappa_ne_zero,
      ``Grothe.UpperQuad.TwistRadialExt.analyticAt_shift,
      ``Grothe.UpperQuad.TwistRadialExt.analyticAt_normalizedHf_diag,
      ``Grothe.UpperQuad.TwistRadialExt.analyticAt_profileCoefficient,
      ``Grothe.UpperQuad.TwistRadialExt.analyticAt_radial] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[`propext, `Classical.choice, `Quot.sound].contains dependency ||
          inherited.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
