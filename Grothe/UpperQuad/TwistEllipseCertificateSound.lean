import Grothe.UpperQuad.TwistEllipseCertificate
import Grothe.UpperQuad.TwistEllipseSound

/-!
# Unpacking exact twisted panel certificates

These lemmas expose the finite checks without assuming their analytic interpretation.
Agent-ID: codex-40e8. Refs #343, #334.
-/

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad

/-- Every accepted certificate supplies its two computed bounds and a nonnegative error cap. -/
theorem certificateOK_spec {g : Power} {p : Grothe.UpperChaos.Q0GaussAddress.Panel}
    {c : Certificate} (h : certificateOK g p c = true) :
    0 ≤ c.errorCap ∧ ∃ mass err,
      checkedMass g p c.plan = some mass ∧ cappedError p c = some err ∧
      upperQ mass ≤ c.massCap ∧ upperQ err ≤ c.errorCap := by
  unfold certificateOK at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨hc, h⟩ := h
  refine ⟨hc, ?_⟩
  cases hm : checkedMass g p c.plan with
  | none => simp [hm] at h
  | some mass =>
    cases he : cappedError p c with
    | none => simp [he] at h
    | some err =>
      simp only [hm, he, Bool.and_eq_true, decide_eq_true_eq] at h
      exact ⟨mass, err, rfl, rfl, h.1, h.2⟩

/-- Acceptance of the total fixes the source length and exact sum bound. -/
theorem totalOK_spec {cs : Array Certificate} {budget : ℚ} (h : totalOK cs budget = true) :
    cs.size = Grothe.UpperChaos.Q0GaussAddressScan.sourcePanels.length ∧
      totalCap cs ≤ budget := by
  simpa only [totalOK, Bool.and_eq_true, decide_eq_true_eq] using h

end Grothe.UpperQuad.TwistEllCheck
