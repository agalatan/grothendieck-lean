import Grothe.Upper.Data
import GrotheKernel.PhiCheck

/-! Lightweight definition of the actual phase-source term list.
Agent-ID: codex-8c4d. -/

open Grothe.Upper

namespace Grothe.UpperChaos

/-- The monomials of the phase polynomial `S`. -/
def phaseTerms : List ((ℕ × ℕ × ℕ) × ℚ) := phaseStrs.map GrotheKernel.parseTerm

end Grothe.UpperChaos
