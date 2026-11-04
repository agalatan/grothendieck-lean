import Grothe.UpperChaos.OriginalRow227TriangleLocalChecks
import Grothe.UpperChaos.OriginalRow227RatioCertificate
import Grothe.UpperChaos.OriginalRow227SelectedIntervals
import Grothe.UpperChaos.OriginalRow227SelectedPayloadBinding
import Grothe.UpperChaos.OriginalRow227SelectedBudgets
import Grothe.UpperChaos.OriginalRow227VectorAssembly

/-!
Assembly of the full task293 row contract. All arguments to
the analytic bridges are supplied by concrete finite certificates and original
payload bindings. No numerical-accuracy hypothesis occurs in the final theorem.

The statement concerns the original row227 at its exact midpoint.
Physical midpoint transport and the final Grothendieck endpoint remain separate.
Agent-ID: codex-aa04. Refs #293, #21.
-/

open scoped BigOperators

namespace Grothe.UpperChaos.OriginalRow227Certificate

open ConditionalNodeIndices ConditionalSeedNormalization ConditionalNormalizedTriangle
open OriginalMomentSeedData OriginalRow227TriangleLookup OriginalRow227SelectedFields

noncomputable section

theorem midpoint_pos : (0 : ℝ) < (midpointQ : ℝ) :=
  (Rat.cast_pos (K := ℝ)).mpr (by decide +kernel : (0 : ℚ) < midpointQ)

/-- Every checkpoint encloses the actual normalized Gaussian integral.
All 2546 backward transitions remain in the imported ratio certificate. -/
theorem normalized_mem (c d : ℕ) (hcd : c ≤ d + 1) (hsum : c + d < 502) :
    normalizedReal (midpointQ : ℝ) c d ∈ T c d := by
  apply ConditionalNormalizedCertificate.normalized_mem_of_local midpoint_pos
    (by decide : (-768 : ℤ) ≤ 0) 502 OriginalRow227TriangleShared.shift
    OriginalRow227RatioLookup.R OriginalRow227RootLookup.S T
    OriginalRow227Roots.midpoint_enclosed OriginalRow227TriangleLocalChecks.checks
    (fun k hk => OriginalRow227RatioCertificate.ratio_mem k (by omega)) c d hcd hsum

theorem normalized_complex_mem (p : ℕ × ℕ) (hp : p ∈ modes) :
    (normalizedCoefficient (midpointQ : ℝ) p).re ∈ T p.1 p.2 ∧
      (normalizedCoefficient (midpointQ : ℝ) p).im = 0 := by
  obtain ⟨c, d⟩ := p
  have hm := (mem_modes c d).mp hp
  rw [normalizedCoefficient_eq_ofReal]
  simp only [Complex.ofReal_re, Complex.ofReal_im, and_true]
  exact normalized_mem c d hm.2 (by omega)

/-- Complete selected Gaussian error, including reality and all selected keys.
The integer sum retains all 31877 mode radii, with no discarded coefficient. -/
theorem normalized_vector_error :
    (∑ p ∈ modes,
      ‖normalizedCoefficient (midpointQ : ℝ) p - (centerQ p : ℂ)‖ ^ 2) ≤
      ((157 : ℝ) / 10 ^ 40) ^ 2 := by
  have h := ConditionalCheckpointVector.sum_norm_sub_rat_sq_le_of_enclosures
    modes (normalizedCoefficient (midpointQ : ℝ)) (fun p => T p.1 p.2)
    centerQ radiusQ ((157 : ℚ) / 10 ^ 40)
    (fun p hp => (normalized_complex_mem p hp).1)
    (fun p hp => (normalized_complex_mem p hp).2)
    (fun p hp => (OriginalRow227SelectedIntervals.selected_enclosure p hp).1)
    (fun p hp => (OriginalRow227SelectedIntervals.selected_enclosure p hp).2)
    OriginalRow227SelectedBudgets.normalized_radius_budget
  simpa only [Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat] using h

/-- Exact comparison with the production decoder of the unchanged full row.
Every selected word is bound through an actual successful source lookup. -/
theorem saved_vector_error :
    (∑ p ∈ modes,
      ‖(ConditionalSourceRow227Scalar.shat : ℂ) * (centerQ p : ℂ) -
        Q0SourceExceptionCenters.storedModeCenter OriginalRow227Payload.row p‖ ^ 2) ≤
      ((13759969 : ℝ) / 10 ^ 24) ^ 2 :=
  OriginalRow227SelectedBudgets.saved_vector_budget_of_payload
    OriginalRow227SelectedPayloadBinding.entries_payloadBound

/-- The full original-row midpoint contract. The common Gaussian scalar's
uncertainty is charged once for the vector, not once per coefficient.
No numerical-accuracy premise remains in this proposed final statement. -/
theorem midpoint_saved_vector_error :
    (∑ p ∈ modes,
      ‖F0ConditionalEvaluator.canonicalCoefficient (midpointQ : ℝ) p -
        Q0SourceExceptionCenters.storedModeCenter OriginalRow227Payload.row p‖ ^ 2) ≤
      ((14 : ℝ) / 10 ^ 18) ^ 2 :=
  OriginalRow227VectorAssembly.midpoint_saved_error_of_two_checks
    (fun p => (centerQ p : ℂ)) normalized_vector_error saved_vector_error

end
end Grothe.UpperChaos.OriginalRow227Certificate

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227Certificate.midpoint_pos,
      ``Grothe.UpperChaos.OriginalRow227Certificate.normalized_mem,
      ``Grothe.UpperChaos.OriginalRow227Certificate.normalized_complex_mem,
      ``Grothe.UpperChaos.OriginalRow227Certificate.normalized_vector_error,
      ``Grothe.UpperChaos.OriginalRow227Certificate.saved_vector_error,
      ``Grothe.UpperChaos.OriginalRow227Certificate.midpoint_saved_vector_error] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"unexpected axiom {dependency}"
