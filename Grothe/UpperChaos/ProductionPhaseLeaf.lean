import Grothe.UpperChaos.PhiProductionIdentity
import Grothe.UpperChaos.Rounder
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Transfer an actual-source integer leaf certificate to the production phase.
The finite checker inputs remain explicit until their source certificates close.
No global numerical phase-cover theorem is used. Agent-ID: codex-8c4d. -/

open GrotheKernel
open scoped ComplexConjugate
namespace Grothe.UpperChaos.ProductionPhaseLeaf
noncomputable section

theorem gram_constraint (u : ℂ × ℂ) :
    (conj u.1 * u.2).re ^ 2 ≤ ‖u.1‖ ^ 2 * ‖u.2‖ ^ 2 := by
  have h := Complex.normSq_apply (conj u.1 * u.2)
  rw [Complex.normSq_mul, Complex.normSq_conj, Complex.normSq_eq_norm_sq,
    Complex.normSq_eq_norm_sq] at h
  nlinarith [sq_nonneg (conj u.1 * u.2).im]

/-- The checker is evaluated on the actual production source, not a surrogate. -/
theorem phase_sq_le_of_leaf (hts : termsOK phaseTerms = true) {b : Box}
    (hleaf : leafOK (commonDen phaseTerms) (denseA0 phaseTerms) b = true)
    (u : ℂ × ℂ)
    (hb : InBox b (‖u.1‖ ^ 2) (‖u.2‖ ^ 2) (conj u.1 * u.2).re) :
    phiT u ^ 2 ≤ 99 / 100 := by
  rw [phiT_sq]
  simpa only [tN, tD, Nat.cast_ofNat] using leaf_sound hts hleaf hb (gram_constraint u)

theorem abs_phase_lt_one_of_leaf (hts : termsOK phaseTerms = true) {b : Box}
    (hleaf : leafOK (commonDen phaseTerms) (denseA0 phaseTerms) b = true)
    (u : ℂ × ℂ)
    (hb : InBox b (‖u.1‖ ^ 2) (‖u.2‖ ^ 2) (conj u.1 * u.2).re) :
    |phiT u| < 1 := by
  have h := phase_sq_le_of_leaf hts hleaf u hb
  rw [← sq_lt_one_iff_abs_lt_one]
  linarith

theorem norm_phase_factor_le_one_of_leaf (hts : termsOK phaseTerms = true) {b : Box}
    (hleaf : leafOK (commonDen phaseTerms) (denseA0 phaseTerms) b = true)
    (u : ℂ × ℂ)
    (hb : InBox b (‖u.1‖ ^ 2) (‖u.2‖ ^ 2) (conj u.1 * u.2).re) :
    ‖P3 (phiT u)‖ ≤ 1 :=
  norm_P3_le_one_of_abs (abs_phase_lt_one_of_leaf hts hleaf u hb).le

/-- Local disk-valuedness of the actual unsmoothed production rounding. -/
theorem norm_rounding_le_one_of_leaf (hts : termsOK phaseTerms = true) {b : Box}
    (hleaf : leafOK (commonDen phaseTerms) (denseA0 phaseTerms) b = true)
    (u : ℂ × ℂ)
    (hb : InBox b (‖u.1‖ ^ 2) (‖u.2‖ ^ 2) (conj u.1 * u.2).re) :
    ‖Tround u‖ ≤ 1 := by
  exact norm_mul_P3_le_one (Grothe.Haag.norm_ph_le _)
    (abs_phase_lt_one_of_leaf hts hleaf u hb).le

end
open Lean Elab Command
run_cmd do
  for target in #[``gram_constraint, ``phase_sq_le_of_leaf,
      ``abs_phase_lt_one_of_leaf, ``norm_phase_factor_le_one_of_leaf,
      ``norm_rounding_le_one_of_leaf] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dependency do
        throwError m!"{target} depends on nonstandard axiom {dependency}"
end Grothe.UpperChaos.ProductionPhaseLeaf
