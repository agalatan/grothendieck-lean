import Grothe.Upper.Compose
import Grothe.Upper.Head
import Grothe.Upper.Residual

/-!
# Haagerup coefficients

The positive coefficients `r_k` of Haagerup's phase rounding, by their recurrence (`haagR`), and
Haagerup's coefficients `c_k = (π/4) r_k` of the Gaussian phase kernel (`haagCoeff`). The Gaussian
identity is proved in `Grothe.Haagerup.Identity` (from `Grothe.Haagerup.PhaseCoefficients` and
`Grothe.Haagerup.PhaseKernel`) and is used by the two-coordinate rounding realization.

The imports are not needed by the two definitions; they are kept because the `Grothe.Haagerup`
modules reach `Grothe.Transfer`, `Grothe.ListPoly` and the `Grothe.Upper` modules through this one.
-/

namespace Grothe

noncomputable section

/-- `r_k = (1/2)_k² / (k!(k+1)!)`, by its recurrence. -/
def haagR : ℕ → ℚ
  | 0 => 1
  | k + 1 => haagR k * (((2 * k + 1) ^ 2 : ℕ) : ℚ) / ((4 * (k + 1) * (k + 2) : ℕ) : ℚ)

/-- Haagerup's coefficients `c_k = (π/4) r_k`. -/
def haagCoeff (k : ℕ) : ℝ := Real.pi / 4 * haagR k

end

end Grothe
