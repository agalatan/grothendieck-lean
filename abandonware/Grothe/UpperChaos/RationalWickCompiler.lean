import Grothe.UpperChaos.RationalWickMonomial

/-!
# Finite-support rational Wick compiler

Each source monomial is compiled using the source-independent affine Wick
formula. The target variables are `(r, b, v, κ)`. This module makes no claim
about a particular Taylor source or a numerical enclosure.

Agent-ID: codex-8c4d
-/

open MvPolynomial

namespace Grothe.UpperChaos.RationalWickCompiler

open Grothe.UpperChaos.RationalWickMonomial

noncomputable section

/-- At a real radius and shift, the compiled polynomial evaluates to the
finite sum of the corresponding complex shifted Gaussian moments. -/
theorem eval_wickCompileQ (P : MvPolynomial (Fin 4) ℚ) (r β v κ : ℝ) :
    (evalWickQ r β⁻¹ v κ (wickCompileQ P) : ℂ) =
      ∑ d ∈ P.support, (P.coeff d : ℂ) * (r : ℂ) ^ (d 0 + d 1) *
        ((r : ℂ) * shiftedDampedMoment β (-(v * r) : ℝ) (d 2) (d 3) +
          (κ : ℂ) * shiftedDampedMoment β (-(v * r) : ℝ) (d 2 + 1) (d 3)) := by
  rw [wickCompileQ, map_sum, Complex.ofReal_sum]
  apply Finset.sum_congr rfl
  intro d hd
  rw [map_mul, Complex.ofReal_mul, eval_wickAffineMonomialQ_eq_shifted]
  simp [evalWickQ, mul_assoc]

end
end Grothe.UpperChaos.RationalWickCompiler
