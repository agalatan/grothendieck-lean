import Grothe.UpperChaos.Q0BasePairKernelContinuity
import Grothe.UpperChaos.RectangleModelCheck
import Grothe.UpperChaos.LocalAffineSquareIntegralBounds

/-!
# Integrating actual base-pair models on arbitrary finite cells

Rational centers and positive half-widths specify the physical rectangle.
A proved pair of normalized-square models yields two rational enclosures of
the actual signed kernel integrals, in auxiliary-outer order. This is a local
interface: assembling cells, controlling omitted domains, and applying the
outer `1 / sqrt(pi)` factor are separate obligations.

Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.Q0BasePairCellIntegral

open MeasureTheory Set LeanCert.Core
open RectangleModelCheck RectangleCoefficientArithmetic RectangleListPolynomialIntegral
open AffineSquareIntegralBounds Q0BasePairKernelContinuity

/-- Exact polynomial integral plus the area-scaled model remainder. -/
def modelIntegral (hs hu : ℚ) (m : Model) : IntervalRat :=
  IntervalRat.add (IntervalRat.singleton (hs * hu * squareListIntegralQ m.coefficients))
    (IntervalRat.scale (4 * hs * hu) m.remainder)

theorem modelIntegral_width (hs hu : ℚ) (m : Model) (hs0 : 0 ≤ hs) (hu0 : 0 ≤ hu) :
    (modelIntegral hs hu m).hi - (modelIntegral hs hu m).lo =
      (4 * hs * hu) * (m.remainder.hi - m.remainder.lo) := by
  have harea : 0 ≤ 4 * hs * hu := by positivity
  simp only [modelIntegral, IntervalRat.add, IntervalRat.singleton, IntervalRat.scale,
    dite_eq_left harea]
  ring

private theorem integral_mem_of_model (f : ℝ → ℝ → ℝ)
    (cs hs cu hu : ℚ) (m : Model) (hs0 : 0 < hs) (hu0 : 0 < hu)
    (hf : ContinuousOn (Function.uncurry f)
      (Icc ((cs : ℝ) - hs) ((cs : ℝ) + hs) ×ˢ Icc ((cu : ℝ) - hu) ((cu : ℝ) + hu)))
    (hm : ∀ x y : ℝ, |x| ≤ 1 → |y| ≤ 1 →
      Contains m x y (f ((cs : ℝ) + (hs : ℝ) * x) ((cu : ℝ) + (hu : ℝ) * y))) :
    (∫ u in ((cu : ℝ) - hu)..((cu : ℝ) + hu),
      ∫ s in ((cs : ℝ) - hs)..((cs : ℝ) + hs), f s u) ∈ modelIntegral hs hu m := by
  apply integral_mem_affine_square_model_swapped_of_continuousOn f cs hs cu hu
    m.coefficients m.remainder hs0 hu0 hf
  intro x hx y hy
  simpa only [Contains, eval2_eq_squareListEval] using
    hm x y (abs_le.mpr hx) (abs_le.mpr hy)

/-- Any proved direct pair model gives both actual finite-cell integrals.
There are no separate continuity or integrability hypotheses for the caller. -/
theorem direct_pair_integral_mem (η : ℝ) (cs hs cu hu : ℚ) (first companion : Model)
    (hs0 : 0 < hs) (hu0 : 0 < hu)
    (hpair : ∀ x y : ℝ, |x| ≤ 1 → |y| ≤ 1 →
      Contains first x y (directFirst η ((cs : ℝ) + (hs : ℝ) * x)
          ((cu : ℝ) + (hu : ℝ) * y)) ∧
        Contains companion x y (directCompanion η ((cs : ℝ) + (hs : ℝ) * x)
          ((cu : ℝ) + (hu : ℝ) * y))) :
    (∫ u in ((cu : ℝ) - hu)..((cu : ℝ) + hu),
      ∫ s in ((cs : ℝ) - hs)..((cs : ℝ) + hs), directFirst η s u) ∈
        modelIntegral hs hu first ∧
      (∫ u in ((cu : ℝ) - hu)..((cu : ℝ) + hu),
        ∫ s in ((cs : ℝ) - hs)..((cs : ℝ) + hs), directCompanion η s u) ∈
          modelIntegral hs hu companion := by
  have hc := continuous_direct_pair η
  exact ⟨integral_mem_of_model (directFirst η) cs hs cu hu first hs0 hu0
      hc.1.continuousOn (fun x y hx hy => (hpair x y hx hy).1),
    integral_mem_of_model (directCompanion η) cs hs cu hu companion hs0 hu0
      hc.2.continuousOn (fun x y hx hy => (hpair x y hx hy).2)⟩

/-- Reciprocal pair models integrate on every cell with positive auxiliary
lower endpoint. The models already include the reciprocal Jacobian. -/
theorem reciprocal_pair_integral_mem (η : ℝ) (cs hs cu hu : ℚ) (first companion : Model)
    (hs0 : 0 < hs) (hu0 : 0 < hu) (haux : 0 < cu - hu)
    (hpair : ∀ x y : ℝ, |x| ≤ 1 → |y| ≤ 1 →
      Contains first x y (reciprocalFirst η ((cs : ℝ) + (hs : ℝ) * x)
          ((cu : ℝ) + (hu : ℝ) * y)) ∧
        Contains companion x y (reciprocalCompanion η ((cs : ℝ) + (hs : ℝ) * x)
          ((cu : ℝ) + (hu : ℝ) * y))) :
    (∫ u in ((cu : ℝ) - hu)..((cu : ℝ) + hu),
      ∫ s in ((cs : ℝ) - hs)..((cs : ℝ) + hs), reciprocalFirst η s u) ∈
        modelIntegral hs hu first ∧
      (∫ u in ((cu : ℝ) - hu)..((cu : ℝ) + hu),
        ∫ s in ((cs : ℝ) - hs)..((cs : ℝ) + hs), reciprocalCompanion η s u) ∈
          modelIntegral hs hu companion := by
  have hauxR : (0 : ℝ) < (cu : ℝ) - (hu : ℝ) := by exact_mod_cast haux
  have hc := continuousOn_reciprocal_pair η
    ((cs : ℝ) - hs) ((cs : ℝ) + hs) ((cu : ℝ) - hu) ((cu : ℝ) + hu) hauxR
  exact ⟨integral_mem_of_model (reciprocalFirst η) cs hs cu hu first hs0 hu0
      hc.1 (fun x y hx hy => (hpair x y hx hy).1),
    integral_mem_of_model (reciprocalCompanion η) cs hs cu hu companion hs0 hu0
      hc.2 (fun x y hx hy => (hpair x y hx hy).2)⟩

end Grothe.UpperChaos.Q0BasePairCellIntegral
