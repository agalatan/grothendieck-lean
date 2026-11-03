import Grothe.UpperChaos.Rounder
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Exact identity for the actual production phase, independent of its
numerical cover. Agent-ID: codex-8c4d. -/

open GrotheKernel Grothe.Upper
open scoped ComplexConjugate

namespace Grothe.UpperChaos
noncomputable section

lemma phaseEps_eq : ((phaseEpsQ : ℚ) : ℝ) = 21 / 20 := by
  simp [phaseEpsQ]

/-- `φ² = g(U, V, W)`. -/
lemma phiT_sq (u : ℂ × ℂ) :
    phiT u ^ 2 = gphi phaseTerms (‖u.1‖ ^ 2) (‖u.2‖ ^ 2) (conj u.1 * u.2).re := by
  have hD : (conj u.1 * u.2).im ^ 2 = ‖u.1‖ ^ 2 * ‖u.2‖ ^ 2 - (conj u.1 * u.2).re ^ 2 := by
    have h := Complex.normSq_apply (conj u.1 * u.2)
    rw [Complex.normSq_mul, Complex.normSq_conj, Complex.normSq_eq_norm_sq,
      Complex.normSq_eq_norm_sq] at h
    nlinarith [h]
  unfold phiT gphi
  rw [phaseEps_eq]
  have he : Real.exp (-(21 / 20) * (‖u.1‖ ^ 2 + ‖u.2‖ ^ 2)) ^ 2
      = Real.exp (-(21 / 10) * (‖u.1‖ ^ 2 + ‖u.2‖ ^ 2)) := by
    rw [← Real.exp_nat_mul]; congr 1; push_cast; ring
  rw [mul_pow, mul_pow, hD, he]
  rfl

end
end Grothe.UpperChaos

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for target in #[``Grothe.UpperChaos.phaseEps_eq, ``Grothe.UpperChaos.phiT_sq] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} depends on nonstandard axiom {dependency}"
