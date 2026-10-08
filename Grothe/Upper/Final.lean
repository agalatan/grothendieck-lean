import Grothe.Upper.Assembly
import Grothe.Upper.Value

/-!
# `K_G^ℂ < 1.404898359045958`

The interval checker certifies `FiniteCertificate Dlo` with `Dlo ≥ DloNeeded`
(`Grothe/Upper/Value.lean`), and the analytic assembly turns that into the bound.  The only
remaining hypotheses are the analytic and quadrature inputs of the construction, listed in the
theorem statement.
-/

namespace Grothe

open Finset Upper
open scoped ComplexConjugate

/-- **Main theorem.**  Conditional on: kernel domination, box containment of the truncated
coefficient integrals, the scalar coefficient identification, the sixth-kernel coefficient
structure with truncation error `e⁻¹⁸`, the four Cauchy tails, the finite fifth-tail part, and
the three first-order energy caps. -/
theorem complex_grothendieck_upper
    (k : Fin 6 → ℕ → ℝ) (hk : ∀ i, Summable fun n => |k i n|)
    (hdom : ∀ i, DominatedKernel (radialKernel (k i)))
    (A B : ℕ → ℂ) (hA : InBoxA A) (hB : InBoxB B)
    (hscalar : ∀ i : Fin 5, ∀ n < modes, k i.castSucc n = Real.pi * (sProf (rowQ i) n : ℝ))
    (a b : ℕ → ℂ) (hk5 : ∀ n < modes, k 5 n = (a n * conj (b n)).re)
    (herrA : ∑ n ∈ range modes, ‖a n - A n‖ ^ 2 ≤ Real.exp (-18) ^ 2)
    (herrB : ∑ n ∈ range modes, ‖b n - B n‖ ^ 2 ≤ Real.exp (-18) ^ 2)
    (hcauchy0 : ∑' n, |k 0 (n + modes)| ≤ cauchyTail 1.2)
    (hcauchy1 : ∑' n, |k 1 (n + modes)| ≤ cauchyTail 1.11)
    (hcauchy2 : ∑' n, |k 2 (n + modes)| ≤ cauchyTail 1.11)
    (hcauchy3 : ∑' n, |k 3 (n + modes)| ≤ cauchyTail 1.11)
    (hfifth : ∑' n, |k 4 (n + modes)| ≤
      (fifthFinite : ℝ) + ∑' m, h (320 + m) * l1 (P5 ^ (2 * (320 + m) + 1)))
    (ξ c : ℕ → ℝ) (r s : ℕ → ℂ) (hξ : ∀ n, ξ n ^ 2 = h n)
    (hk5tail : ∀ n, modes ≤ n → k 5 n = ξ n * c n + (r n * conj (s n)).re)
    (hcs : Summable fun n => (2 * ((modes + n : ℕ) : ℝ) + 1) * c (modes + n) ^ 2)
    (hEC : ∑' n, (2 * ((modes + n : ℕ) : ℝ) + 1) * c (modes + n) ^ 2 ≤ 0.003521036759326558)
    (hrs : Summable fun n => (2 * ((modes + n : ℕ) : ℝ) + 1) * ‖r (modes + n)‖ ^ 2)
    (hEL : ∑' n, (2 * ((modes + n : ℕ) : ℝ) + 1) * ‖r (modes + n)‖ ^ 2 ≤ 0.000884260662142687)
    (hss : Summable fun n => (2 * ((modes + n : ℕ) : ℝ) + 1) * ‖s (modes + n)‖ ^ 2)
    (hER : ∑' n, (2 * ((modes + n : ℕ) : ℝ) + 1) * ‖s (modes + n)‖ ^ 2 ≤ 0.000885126188452271) :
    IsGrothendieckBound (1404898359045958 / 10 ^ 15) :=
  grothendieck_of_slope Dlo dlo_ge_needed finite_certificate k hk hdom A B hA hB
    hscalar a b hk5 herrA herrB hcauchy0 hcauchy1 hcauchy2 hcauchy3 hfifth ξ c r s hξ hk5tail
    hcs hEC hrs hEL hss hER

end Grothe
