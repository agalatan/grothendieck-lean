import Grothe.UpperQuad.Facts.Even
import Grothe.UpperQuad.Facts.GradeBlock00
import Grothe.UpperQuad.Facts.GradeBlock01
import Grothe.UpperQuad.Facts.GradeBlock02
import Grothe.UpperQuad.Facts.GradeBlock03
import Grothe.UpperQuad.Facts.GradeBlock04
import Grothe.UpperQuad.Facts.GradeBlock05
import Grothe.UpperQuad.Facts.GradeBlock06
import Grothe.UpperQuad.Facts.GradeBlock07
import Grothe.UpperQuad.Facts.GradeBlock08
import Grothe.UpperQuad.Facts.GradeBlock09
import Grothe.UpperQuad.Facts.GradeBlock10
import Grothe.UpperQuad.Facts.GradeBlock11
import Grothe.UpperQuad.Facts.Budget
import Grothe.UpperQuad.WatsonSeed

/-!
# `hclose` from the native facts

The twelve block facts and the even fact, with the two analytic hypotheses (the seed enclosure at
every node, S2, and the quadrature hypothesis `hQuad` with its constant `ρ`) and the budget
inequalities, give the hypothesis `hclose` of `fresh_upper_concrete_taylor`.  The arithmetic
hypotheses are left explicit until the analytic layer fixes `ρ`: with the inherited
`ρ = 1.55·10⁻¹²` one may take `δ = 2.2·10⁻¹²`, `Δ = 2.3·10⁻¹²` (`hsmoothing`), and the budget
`(2·501/500 + 3Δ)Δ + 12·epsBlock/2²⁵⁶ ≈ 4.6·10⁻¹² + 5.2·10⁻¹² ≤ 1.369·10⁻¹¹` holds.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad.Facts

open GrotheQuad Grothe.UpperQuad Grothe.UpperChaos Grothe.Upper
  Grothe.UpperChaos.F0ConditionalEvaluator

theorem blockFacts : ∀ b, b < 12 → blockFact b epsBlock bndBlock = true := by
  intro b hb
  interval_cases b
  exacts [gradeBlock00, gradeBlock01, gradeBlock02, gradeBlock03, gradeBlock04, gradeBlock05,
    gradeBlock06, gradeBlock07, gradeBlock08, gradeBlock09, gradeBlock10, gradeBlock11]

/-- **`hclose` from the native facts** (the analytic hypotheses S2 and `hQuad` and the budget
inequalities explicit). -/
theorem hclose_of_facts
    (hJ : ∀ nd ∈ partitionSpecs, ∀ neg aI, nodeShift P0 piI profile nd = some (neg, aI) →
      mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd (rootOf nd)) ^ 2))
        (seedJ0I P0 piI (sqI P0 aI)))
    {ρ : ℝ} (hQuad : ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1),
        ‖FixedChaosSmoothing.baseGradedCoefficient q c d -
          ((gaussCoeff partitionSpecs rootOf q c d : ℝ) : ℂ)‖ ^ 2 ≤ ρ ^ 2)
    {δ Δ : ℝ} (hδ0 : 0 ≤ δ)
    (hδ : 2 * ρ ^ 2 + 2 * (((12 * bndBlock : ℤ) : ℝ) / 2 ^ (2 * KFix)) ≤ δ ^ 2)
    (hsmoothing : δ + (4 / 10 ^ 15 : ℝ) * ((501 / 500 : ℝ) + δ) ≤ Δ)
    (hbudget : (2 * (501 / 500 : ℝ) + 3 * Δ) * Δ + (((12 * epsBlock : ℤ) : ℝ)) / 2 ^ (2 * KFix) ≤
      (energyErrQ : ℝ)) :
    ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn)) p -
        (energyTable p : ℝ)| ≤ (energyErrQ : ℝ) := by
  have hsum12 : ∀ z : ℤ, (∑ _b ∈ Finset.range 12, z) = 12 * z := by
    intro z; simp [Finset.sum_const, Finset.card_range]
  apply hclose_of_blockFacts (fun _ => epsBlock) (fun _ => bndBlock) blockFacts (evenFact_spec evenCheck)
    hJ hQuad hδ0
  · rw [hsum12]; exact hδ
  · exact hsmoothing
  · rw [hsum12, add_zero]; exact hbudget

/-- **`hclose` from the native facts and the quadrature hypothesis alone**: the thirteen facts, the
numeric constants of `Facts/Budget.lean`, S2 proved (`WatsonSeed.watsonHyp`), and `QuadHyp` (the
exact Gauss–Legendre sums approximate the F0 coefficients in ℓ² within `ρ₀ = 1.55·10⁻¹²`). -/
theorem hclose_of_facts_quad (hQuad : QuadHyp) :
    ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn)) p -
        (energyTable p : ℝ)| ≤ (energyErrQ : ℝ) :=
  hclose_of_blockFacts_numeric blockFacts evenCheck (Watson.watsonHyp 70) hQuad

end Grothe.UpperQuad.Facts
