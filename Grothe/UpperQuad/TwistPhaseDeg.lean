import Grothe.UpperQuad.TwistFactsSound

/-!
# The degree bound of the phase monomials

Every monomial `C U^i V^j W^k` of `phaseStrs` has total degree `i + j + k ≤ 17` (`phaseDegOK`), the
finite check `PhaseDegOK` used by the twisted node scalars (`TermsOK`), by kernel evaluation of the
string parser on the 1,140 committed strings.

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad

set_option maxRecDepth 100000 in
/-- The kernel-checked degree bound on the parsed phase strings. -/
theorem phaseStrs_deg_check :
    (Grothe.Upper.phaseStrs.map GrotheKernel.parseTerm).all
      (fun t => decide (t.1.1 + t.1.2.1 + t.1.2.2 ≤ 17)) = true := by
  decide +kernel

/-- **The phase monomials have total degree at most 17.** -/
theorem phaseDegOK : PhaseDegOK := by
  intro t ht
  have h := List.all_eq_true.mp phaseStrs_deg_check t ht
  simpa using h

end Grothe.UpperQuad
