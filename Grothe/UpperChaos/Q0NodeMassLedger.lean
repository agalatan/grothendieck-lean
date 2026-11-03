import Mathlib.Tactic

/-!
# Numerical inputs for the source-node error ledger

Only the shared scalar inputs are defined here. The current norm-dependent
ledger is in Q0NodeMassLedgerSharp. Connecting these inputs to the actual
quadrature, matrix contraction and omitted coefficients remains separate.
Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.Q0NodeMassLedger

/-- Binary64 unit roundoff. -/
def u : ℚ := 1 / 2^53
/-- Relative enclosure allowance obtained by solving the unit-roundoff inequality. -/
def rounding : ℚ := u / (1 - u)
/-- Allocated absolute error per stored scale or primary center. -/
def tinyInput : ℚ := 1 / 10^24
/-- Allocated absolute error per retained conditional coefficient. -/
def conditionalError : ℚ := 2 / 10^16
/-- Allocated accumulated underflow allowance; an actual operation model
must establish that the errors fit this cap. -/
def underflow : ℚ := 1 / 10^24
/-- Rounding-path budget: 2*32+10 stages for a block dot product, followed
by at most 675 block accumulations, hence 749 in the standard gamma formula. -/
def gamma749 : ℚ := 749 * u / (1 - 749 * u)
/-- Aggregate primary-input allowance: 197 is the primary-center Frobenius
norm cap; 147 bounds sqrt(21577 nodes), and 179 bounds sqrt(31877 selected
pairs). Their product converts a per-entry absolute error to a vector error.
This definition does not prove the source counts or primary norm estimate. -/
def primaryInputError : ℚ := 197 * rounding + 147 * 179 * tinyInput

end Grothe.UpperChaos.Q0NodeMassLedger
