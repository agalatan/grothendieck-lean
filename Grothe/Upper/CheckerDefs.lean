import Grothe.Upper.Interface
import GrotheKernel.Basic

/-!
# Interval constants of the checker (definitions only)

The interval for `π` and the exact rational recursion for Haagerup's coefficients `hₙ/π`, used
by the columns of the certificate (`CertDefs.lean`).
-/

namespace Grothe.Upper

open GrotheKernel

/-- Interval for `π` from Mathlib's 20-digit bounds. -/
def piI : Ival := boxI 3.14159265358979323846 3.14159265358979323847

/-- `[hRat j, …, hRat (j + n − 1)]`, given `cur = hRat j`. -/
def hRatFrom (j : ℕ) (cur : ℚ) : ℕ → List ℚ
  | 0 => []
  | n + 1 =>
    cur :: hRatFrom (j + 1) (cur * ((2 * (j : ℚ) + 1) ^ 2) / (4 * ((j : ℚ) + 1) * ((j : ℚ) + 2))) n

end Grothe.Upper
