-- Grothe/LowerAnalytic/FourthMoment.lean
import Grothe.LowerAnalytic.CircularTensor

/-!
# The sharp fourth moment of a real cubic chaos

The scalar bound follows directly from the exact fourth cumulant. For `f = ∂³F/6`, write
`N = Σ f²`, `s = tenS f`, and `h = tenH f`. The identities `E F² = 6N` and
`E F⁴ − 3(E F²)² = 1296(s + 3h/2)`, together with `s ≤ N²` and `h ≤ s`, give
`E F⁴ ≤ 93(E F²)²` (`Chaos3.fourth_le`). The tensor inequalities are finite-dimensional
Cauchy–Schwarz and contraction under averaging; they need no symmetry or positivity premise.
The scalar theorem uses only `IsGaussianExpectation` and `Chaos3`.
-/

open MvPolynomial

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι]

section expectation

variable {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
include hE

variable [DecidableEq ι]

/-- The sharp fourth-moment bound of the third chaos follows from its Wick identity. -/
theorem Chaos3.fourth_le {F : MvPolynomial ι ℝ} (hF : Chaos3 F) :
    E (F ^ 4) ≤ 93 * E (F ^ 2) ^ 2 := by
  have h4 := hF.wick4 hE
  have h2 : E (F ^ 2) = 6 * ∑ a, ∑ b, ∑ c, cubicKernel F a b c ^ 2 := by
    simpa only [sq] using hF.gE_sq_eq_kernel hE
  rw [h2] at h4 ⊢
  nlinarith [tenS_le_sq_sum (cubicKernel F), tenH_le_tenS (cubicKernel F)]

end expectation

end

end Grothe.LowerAnalytic
