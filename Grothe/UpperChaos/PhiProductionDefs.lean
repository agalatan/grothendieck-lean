import Grothe.UpperChaos.PhaseTermsDefs
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Tactic.FunProp

/-! Actual phase definitions, independent of structural rounding and table
proofs. Existing names and defining expressions are preserved.
Agent-ID: codex-8c4d. -/

open GrotheKernel Grothe.Upper
open scoped ComplexConjugate
namespace Grothe.UpperChaos
noncomputable section

/-- `S(U, V, W) = Σ c U^i V^j W^k`. -/
def Sphase (U V W : ℝ) : ℝ :=
  (phaseTerms.map fun t => (t.2 : ℝ) * U ^ t.1.1 * V ^ t.1.2.1 * W ^ t.1.2.2).sum

lemma continuous_Sphase : Continuous fun x : ℝ × ℝ × ℝ => Sphase x.1 x.2.1 x.2.2 := by
  unfold Sphase
  induction phaseTerms with
  | nil => simp; exact continuous_const
  | cons t l ih => simp only [List.map_cons, List.sum_cons]; exact Continuous.add (by fun_prop) ih

/-- **The phase** `φ = D e^{−ε(U+V)} S(U, V, W)`. -/
def phiT (u : ℂ × ℂ) : ℝ :=
  (conj u.1 * u.2).im * Real.exp (-(phaseEpsQ : ℝ) * (‖u.1‖ ^ 2 + ‖u.2‖ ^ 2))
    * Sphase (‖u.1‖ ^ 2) (‖u.2‖ ^ 2) (conj u.1 * u.2).re

end
end Grothe.UpperChaos
