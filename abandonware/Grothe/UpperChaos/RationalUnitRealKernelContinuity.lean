import Grothe.UpperChaos.RationalUnitQuadrature
import Mathlib.Topology.Algebra.MvPolynomial

/-!
# Global continuity of the compiled unit-mode kernel

The first real argument is squared radius `s`; the second is the regular
auxiliary coordinate `u`. The expression is defined on the whole plane and
agrees with the production quadrature kernel for `s ≥ 0` and `u > 0`.
No numerical enclosure or endpoint equality at `u = 0` is asserted.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.RationalUnitRealKernelContinuity

open Grothe.UpperChaos.RationalUnitTaylorSource
open Grothe.UpperChaos.RationalWickMonomial
open Grothe.UpperChaos.RationalWickCompiler
open Grothe.UpperChaos.RationalUnitWickProduction
open Grothe.UpperChaos.RationalUnitQuadrature

noncomputable section

/-- The real compiled kernel, with arguments in generator order `(s,u)`. -/
def unitRealKernel {N : ℕ} (i : GradedIdx N) (j : ℕ) (η s u : ℝ) : ℝ :=
  2 * Real.exp (-(η ^ 2 * u ^ 2)) * Real.exp (-s) *
    Real.exp (-(j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ) * s) *
      nrm2 (gradedIdx i) *
        Real.exp (-(unitAlpha j * u ^ 2 * s /
          unitBeta j (Real.sqrt s) (u ^ 2))) *
            evalWickQ (Real.sqrt s) (unitBeta j (Real.sqrt s) (u ^ 2))⁻¹
              (unitKappa (Real.sqrt s) * u ^ 2 /
                unitBeta j (Real.sqrt s) (u ^ 2)) (unitKappa (Real.sqrt s))
              (wickCompileQ (unitSourceQ phaseTerms i j))

/-- This real function is the actual production kernel on the physical
half-plane. -/
theorem taylorQuadratureKernel_unit_eq_realKernel {N : ℕ} (i : GradedIdx N)
    (j : ℕ) (η u s : ℝ) (hu : 0 < u) (hs : 0 ≤ s) :
    taylorQuadratureKernel η j N (gradedUnitCoeff i) u s =
      (unitRealKernel i j η s u : ℂ) := by
  exact taylorQuadratureKernel_unit_eq_compiled i j η u s hu hs

/-- The conditional denominator is strictly positive even outside the
physical domain, because the auxiliary variable enters as a square. -/
theorem unitBeta_square_pos (j : ℕ) (s u : ℝ) :
    0 < unitBeta j (Real.sqrt s) (u ^ 2) := by
  unfold unitBeta
  exact add_pos_of_pos_of_nonneg (unitAlpha_pos j)
    (mul_nonneg (sq_nonneg _) (sq_nonneg _))

/-- The compiled real kernel is globally continuous on `(s,u) ∈ ℝ²`. -/
theorem continuous_unitRealKernel {N : ℕ} (i : GradedIdx N) (j : ℕ) (η : ℝ) :
    Continuous (Function.uncurry (unitRealKernel i j η)) := by
  have hr : Continuous (fun v : ℝ × ℝ => Real.sqrt v.1) :=
    Real.continuous_sqrt.comp continuous_fst
  have hnorm : Continuous (fun v : ℝ × ℝ => ‖(Real.sqrt v.1 : ℂ)‖ ^ 2) := by
    fun_prop
  have hk : Continuous (fun v : ℝ × ℝ => unitKappa (Real.sqrt v.1)) := by
    unfold unitKappa
    exact continuous_const.mul (continuous_vprof.comp hnorm)
  have hb : Continuous (fun v : ℝ × ℝ => unitBeta j (Real.sqrt v.1) (v.2 ^ 2)) := by
    unfold unitBeta
    exact continuous_const.add ((hk.pow 2).mul (continuous_snd.pow 2))
  have hbne : ∀ v : ℝ × ℝ, unitBeta j (Real.sqrt v.1) (v.2 ^ 2) ≠ 0 :=
    fun v => (unitBeta_square_pos j v.1 v.2).ne'
  have hinv : Continuous (fun v : ℝ × ℝ => (unitBeta j (Real.sqrt v.1) (v.2 ^ 2))⁻¹) :=
    hb.inv₀ hbne
  have hshift : Continuous (fun v : ℝ × ℝ =>
      unitKappa (Real.sqrt v.1) * v.2 ^ 2 / unitBeta j (Real.sqrt v.1) (v.2 ^ 2)) :=
    (hk.mul (continuous_snd.pow 2)).div₀ hb hbne
  let env : ℝ × ℝ → Fin 4 → ℝ := fun v =>
    ![Real.sqrt v.1, (unitBeta j (Real.sqrt v.1) (v.2 ^ 2))⁻¹,
      unitKappa (Real.sqrt v.1) * v.2 ^ 2 / unitBeta j (Real.sqrt v.1) (v.2 ^ 2),
      unitKappa (Real.sqrt v.1)]
  have henv : Continuous env := by
    apply continuous_pi
    intro k
    fin_cases k
    · simpa [env] using hr
    · simpa [env] using hinv
    · simpa [env] using hshift
    · simpa [env] using hk
  have hpoly : Continuous (fun v : ℝ × ℝ =>
      evalWickQ (Real.sqrt v.1) (unitBeta j (Real.sqrt v.1) (v.2 ^ 2))⁻¹
        (unitKappa (Real.sqrt v.1) * v.2 ^ 2 /
          unitBeta j (Real.sqrt v.1) (v.2 ^ 2)) (unitKappa (Real.sqrt v.1))
        (wickCompileQ (unitSourceQ phaseTerms i j))) := by
    have h := (MvPolynomial.continuous_eval
      (MvPolynomial.map (Rat.castHom ℝ) (wickCompileQ (unitSourceQ phaseTerms i j)))).comp henv
    simpa only [evalWickQ, MvPolynomial.coe_eval₂Hom, MvPolynomial.eval₂_eq_eval_map,
      env, Function.comp_def] using h
  have hnum : Continuous (fun v : ℝ × ℝ => unitAlpha j * v.2 ^ 2 * v.1) := by
    fun_prop
  have hgauss : Continuous (fun v : ℝ × ℝ =>
      Real.exp (-(unitAlpha j * v.2 ^ 2 * v.1 /
        unitBeta j (Real.sqrt v.1) (v.2 ^ 2)))) :=
    Real.continuous_exp.comp ((hnum.div₀ hb hbne).neg)
  have heta : Continuous (fun v : ℝ × ℝ => Real.exp (-(η ^ 2 * v.2 ^ 2))) := by
    fun_prop
  have hrad : Continuous (fun v : ℝ × ℝ => Real.exp (-v.1)) := by
    fun_prop
  have hphase : Continuous (fun v : ℝ × ℝ =>
      Real.exp (-(j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ) * v.1)) := by
    fun_prop
  change Continuous (fun v : ℝ × ℝ => unitRealKernel i j η v.1 v.2)
  unfold unitRealKernel
  exact (((((continuous_const.mul heta).mul hrad).mul hphase).mul continuous_const).mul
    hgauss).mul hpoly

end
end Grothe.UpperChaos.RationalUnitRealKernelContinuity
