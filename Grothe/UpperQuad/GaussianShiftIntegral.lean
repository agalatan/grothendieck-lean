import Grothe.UpperQuad.GaussianShiftVector
import Grothe.UpperQuad.GaussianShiftPolynomial
import Grothe.UpperQuad.GaussianShiftMeasure

/-!
# A fixed-phase integral for the shifted Gaussian coefficient

A real Gaussian translation puts the discontinuous phase factor at the fixed integration
variable. The remaining factors use polynomial evaluation and the complex production phase.
This is an exact identity of totalized integrals; analyticity of the integral requires a
separate domination argument.

Agent-ID: codex-2f3d. Refs #334, #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.GaussianShift

open MeasureTheory Complex MvPolynomial Grothe.LowerAnalytic Grothe.UpperChaos
open Grothe.UpperChaos.HermiteTranslation
open scoped ComplexConjugate

noncomputable section

/-- The integrand with its nonsmooth phase held at the integration variable. -/
def fixedPhaseIntegrand (j : ℕ) (r A : ℂ) (i : ℕ × ℕ) (w : ℂ) : ℂ :=
  Haag.ph w *
    eval ![(w.re : ℂ) - A + I * (w.im : ℂ), (w.re : ℂ) - A - I * (w.im : ℂ)]
      (conjP (normalizedPolynomial i)) *
    (I * PhasePolynomialComplex.phaseComplex w.im r ((w.re : ℂ) - A)) ^ j *
    Complex.exp (-A ^ 2 + 2 * A * (w.re : ℂ))

theorem measurable_fixedPhaseIntegrand (j : ℕ) (r A : ℂ) (i : ℕ × ℕ) :
    Measurable (fixedPhaseIntegrand j r A i) := by
  have hvars : Continuous (fun w : ℂ ↦
      ![(w.re : ℂ) - A + I * (w.im : ℂ), (w.re : ℂ) - A - I * (w.im : ℂ)]) := by
    apply continuous_pi
    intro k
    fin_cases k <;> dsimp <;> fun_prop
  have hpoly := (MvPolynomial.continuous_eval (conjP (normalizedPolynomial i))).comp hvars
  have hmap : Continuous (fun w : ℂ ↦ (w.im, r, (w.re : ℂ) - A)) := by fun_prop
  have hphase := continuous_phaseComplex.comp hmap
  unfold fixedPhaseIntegrand
  exact ((Haag.measurable_ph.mul hpoly.measurable).mul
    ((measurable_const.mul hphase.measurable).pow_const j)).mul (by fun_prop)

/-- At each fixed integration variable, the integrand is jointly complex analytic
in the phase coordinate and the translation parameter. -/
theorem analyticAt_fixedPhaseIntegrand (j : ℕ) (i : ℕ × ℕ) (w : ℂ) (p : ℂ × ℂ) :
    AnalyticAt ℂ (fun q : ℂ × ℂ ↦ fixedPhaseIntegrand j q.1 q.2 i w) p := by
  have hf : AnalyticAt ℂ (fun q : ℂ × ℂ ↦ q.1) p := analyticAt_fst
  have hs : AnalyticAt ℂ (fun q : ℂ × ℂ ↦ q.2) p := analyticAt_snd
  have hvars (k : Fin 2) : AnalyticAt ℂ (fun q : ℂ × ℂ ↦
      ![(w.re : ℂ) - q.2 + I * (w.im : ℂ), (w.re : ℂ) - q.2 - I * (w.im : ℂ)] k) p := by
    fin_cases k <;> dsimp <;> fun_prop
  have hpoly := AnalyticAt.aeval_mvPolynomial hvars (conjP (normalizedPolynomial i))
  have hmap : AnalyticAt ℂ (fun q : ℂ × ℂ ↦ (q.1, (w.re : ℂ) - q.2)) p := by
    fun_prop
  have hphase := (PhasePolynomialComplex.analyticAt_phaseComplex w.im
    (p.1, (w.re : ℂ) - p.2)).comp (f := fun q : ℂ × ℂ ↦ (q.1, (w.re : ℂ) - q.2)) hmap
  have he : AnalyticAt ℂ (fun q : ℂ × ℂ ↦
      Complex.exp (-q.2 ^ 2 + 2 * q.2 * (w.re : ℂ))) p := by fun_prop
  unfold fixedPhaseIntegrand
  exact ((analyticAt_const.mul hpoly).mul ((analyticAt_const.mul hphase).pow j)).mul he

private theorem translation_exponential (a b x : ℝ) :
    Complex.exp (-((a : ℂ) ^ 2)) *
        Complex.exp (-((a : ℂ) + I * (b : ℂ)) ^ 2 +
          2 * ((a : ℂ) + I * (b : ℂ)) * ((x : ℂ) + (a : ℂ))) *
        Complex.exp (2 * (-(a : ℂ)) * (x : ℂ)) =
      (Real.exp (b ^ 2) : ℂ) * Complex.exp (2 * I * (b : ℂ) * (x : ℂ)) := by
  rw [← Complex.exp_add, ← Complex.exp_add, Complex.ofReal_exp, ← Complex.exp_add]
  congr 1
  push_cast
  calc
    _ = -(I ^ 2) * (b : ℂ) ^ 2 + 2 * I * (b : ℂ) * (x : ℂ) := by ring
    _ = _ := by rw [I_sq]; ring

/-- The Gaussian density correction cancels the real translation and leaves the
imaginary-shift coefficient source. -/
theorem fixedPhaseIntegrand_real_translate (j : ℕ) (r : ℂ) (a b : ℝ)
    (i : ℕ × ℕ) (w : ℂ) :
    Complex.exp (-((a : ℂ) ^ 2)) *
        (fixedPhaseIntegrand j r ((a : ℂ) + I * (b : ℂ)) i (w + (a : ℂ)) *
          Complex.exp (2 * (-(a : ℂ)) * (w.re : ℂ))) =
      (Real.exp (b ^ 2) : ℂ) *
        conj (ev w (simultaneousShift (I * (b : ℂ)) (normalizedPolynomial i))) *
          source j r a b w := by
  have hx : (((w + (a : ℂ)).re : ℝ) : ℂ) = (w.re : ℂ) + (a : ℂ) := by simp
  have hy : (w + (a : ℂ)).im = w.im := by simp
  have hcoord : (((w + (a : ℂ)).re : ℝ) : ℂ) - ((a : ℂ) + I * (b : ℂ)) =
      (w.re : ℂ) - I * (b : ℂ) := by rw [hx]; ring
  have hph : Haag.ph (w + (a : ℂ)) = Haag.ph ((a : ℂ) + w) :=
    congrArg Haag.ph (add_comm w (a : ℂ))
  rw [conj_ev_imaginaryShift]
  simp only [fixedPhaseIntegrand, source, hy, hcoord, hph]
  simp only [hx]
  have hexp := translation_exponential a b w.re
  linear_combination
    (Haag.ph ((a : ℂ) + w) *
      eval ![(w.re : ℂ) - I * (b : ℂ) + I * (w.im : ℂ),
        (w.re : ℂ) - I * (b : ℂ) - I * (w.im : ℂ)] (conjP (normalizedPolynomial i)) *
      (I * PhasePolynomialComplex.phaseComplex w.im r ((w.re : ℂ) - I * (b : ℂ))) ^ j) *
      hexp

/-- The existing shifted coefficient equals the fixed-phase integral at `A = a + I*b`.
This is a measurable Gaussian change of variables, with no additional integrability premise. -/
theorem coefficient_eq_fixedPhaseIntegral (j : ℕ) (r : ℂ) (a b : ℝ) (i : ℕ × ℕ) :
    coefficient j r a b i =
      ∫ w, fixedPhaseIntegrand j r ((a : ℂ) + I * (b : ℂ)) i w ∂gaussC := by
  have hshift := integral_real_shift_cexp
    (fixedPhaseIntegrand j r ((a : ℂ) + I * (b : ℂ)) i)
    (measurable_fixedPhaseIntegrand j r ((a : ℂ) + I * (b : ℂ)) i) (-a)
  simp only [Complex.ofReal_neg, neg_sq, sub_neg_eq_add] at hshift
  calc
    coefficient j r a b i =
        ∫ w, (Real.exp (b ^ 2) : ℂ) *
          conj (ev w (simultaneousShift (I * (b : ℂ)) (normalizedPolynomial i))) *
            source j r a b w ∂gaussC := by
      rw [coefficient_eq_integral, ← integral_const_mul]
      apply integral_congr_ae
      exact Filter.Eventually.of_forall fun w ↦ by ring
    _ = ∫ w, Complex.exp (-((a : ℂ) ^ 2)) *
        (fixedPhaseIntegrand j r ((a : ℂ) + I * (b : ℂ)) i (w + (a : ℂ)) *
          Complex.exp (2 * (-(a : ℂ)) * (w.re : ℂ))) ∂gaussC := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall fun w ↦
        (fixedPhaseIntegrand_real_translate j r a b i w).symm
    _ = _ := by rw [integral_const_mul]; exact hshift.symm

end

end Grothe.UpperQuad.GaussianShift

open Lean Elab Command
run_cmd do
  let inherited ← Lean.collectAxioms ``Grothe.UpperQuad.GaussianShift.coefficient_eq_integral
  for target in #[``Grothe.UpperQuad.GaussianShift.analyticAt_fixedPhaseIntegrand,
      ``Grothe.UpperQuad.GaussianShift.fixedPhaseIntegrand_real_translate,
      ``Grothe.UpperQuad.GaussianShift.coefficient_eq_fixedPhaseIntegral] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[`propext, `Classical.choice, `Quot.sound].contains dependency ||
          inherited.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
