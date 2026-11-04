import Grothe.UpperChaos.PhiProductionIdentity
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Transfer an actual-source integer leaf certificate to the production phase.
This is a local consequence of a supplied leaf check, alongside the existing
native whole-domain cover. No concrete leaf check is established here, and a
single leaf does not supply whole-slice coverage. Agent-ID: codex-8c4d. -/

open GrotheKernel
open scoped ComplexConjugate
namespace Grothe.UpperChaos.ProductionPhaseLeaf
noncomputable section

/-- The checker is evaluated on the actual production source, not a surrogate. -/
theorem phase_sq_le_of_leaf (hts : termsOK phaseTerms = true) {b : Box}
    (hleaf : leafOK (commonDen phaseTerms) (denseA0 phaseTerms) b = true)
    (u : ℂ × ℂ)
    (hb : InBox b (‖u.1‖ ^ 2) (‖u.2‖ ^ 2) (conj u.1 * u.2).re) :
    phiT u ^ 2 ≤ 99 / 100 := by
  rw [phiT_sq]
  simpa only [tN, tD, Nat.cast_ofNat] using leaf_sound hts hleaf hb (phase_gram_re_sq_le u)

end
open Lean Elab Command
run_cmd do
  for target in #[``phase_sq_le_of_leaf] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dependency do
        throwError m!"{target} depends on nonstandard axiom {dependency}"
end Grothe.UpperChaos.ProductionPhaseLeaf
