import Grothe.Cert240.Assembly240
import Grothe.Cert240.Value

/-!
# `K_G^ℂ ≤ 1.404898359045958` from the certified finite value

The interval checker (`Grothe/Cert240/Checker.lean`, `Value.lean`) certifies
`FiniteCertificate240 Dlo240` with `Dlo240 ≈ 0.71179529047965838`, and the analytic assembly
(`Assembly240.lean`) needs `Dlo ≥ DloNeeded = 0.7117952904796581`.  The margin is about
`2.8·10⁻¹⁶`.  This file combines the two: the only remaining hypotheses are the analytic and
quadrature inputs of the source construction (listed in the theorem statement).
-/

namespace Grothe

open Finset Cert240
open scoped ComplexConjugate

/-- The certified value clears the threshold. -/
theorem Dlo240_ge_needed : DloNeeded ≤ Dlo240 := by
  unfold DloNeeded Dlo240; norm_num

/-- **Main theorem (240-mode certificate).**  Conditional only on the analytic/quadrature inputs:
kernel domination, box containment of the truncated coefficient integrals, the scalar coefficient
identification, the sixth-kernel coefficient structure with truncation error `e⁻¹⁸`, the four
Cauchy tails, the finite fifth-tail part, and the three first-order energy caps. -/
theorem complex_grothendieck_240
    (k : Fin 6 → ℕ → ℝ) (hk : ∀ i, Summable fun n => |k i n|)
    (hdom : ∀ i, DominatedKernel (radialKernel (k i)))
    (A B : ℕ → ℂ) (hA : InBoxA A) (hB : InBoxB B)
    (hscalar : ∀ i : Fin 5, ∀ n < 240, k i.castSucc n = Real.pi * (sProf (rowQ i) n : ℝ))
    (a b : ℕ → ℂ) (hk5 : ∀ n < 240, k 5 n = (a n * conj (b n)).re)
    (herrA : ∑ n ∈ range 240, ‖a n - A n‖ ^ 2 ≤ Real.exp (-18) ^ 2)
    (herrB : ∑ n ∈ range 240, ‖b n - B n‖ ^ 2 ≤ Real.exp (-18) ^ 2)
    (hcauchy0 : ∑' n, |k 0 (n + 240)| ≤ cauchyTail240 1.2)
    (hcauchy1 : ∑' n, |k 1 (n + 240)| ≤ cauchyTail240 1.11)
    (hcauchy2 : ∑' n, |k 2 (n + 240)| ≤ cauchyTail240 1.11)
    (hcauchy3 : ∑' n, |k 3 (n + 240)| ≤ cauchyTail240 1.11)
    (hfifth : ∑' n, |k 4 (n + 240)| ≤
      (fifthFinite240 : ℝ) + ∑' m, h (320 + m) * l1 (P5 ^ (2 * (320 + m) + 1)))
    (ξ c : ℕ → ℝ) (r s : ℕ → ℂ) (hξ : ∀ n, ξ n ^ 2 = h n)
    (hk5tail : ∀ n, 240 ≤ n → k 5 n = ξ n * c n + (r n * conj (s n)).re)
    (hcs : Summable fun n => (2 * ((240 + n : ℕ) : ℝ) + 1) * c (240 + n) ^ 2)
    (hEC : ∑' n, (2 * ((240 + n : ℕ) : ℝ) + 1) * c (240 + n) ^ 2 ≤ 0.003521036759326558)
    (hrs : Summable fun n => (2 * ((240 + n : ℕ) : ℝ) + 1) * ‖r (240 + n)‖ ^ 2)
    (hEL : ∑' n, (2 * ((240 + n : ℕ) : ℝ) + 1) * ‖r (240 + n)‖ ^ 2 ≤ 0.000884260662142687)
    (hss : Summable fun n => (2 * ((240 + n : ℕ) : ℝ) + 1) * ‖s (240 + n)‖ ^ 2)
    (hER : ∑' n, (2 * ((240 + n : ℕ) : ℝ) + 1) * ‖s (240 + n)‖ ^ 2 ≤ 0.000885126188452271) :
    IsGrothendieckBound (1404898359045958 / 10 ^ 15) :=
  complex_grothendieck_combined Dlo240 Dlo240_ge_needed finite_certificate_240 k hk hdom A B hA hB
    hscalar a b hk5 herrA herrB hcauchy0 hcauchy1 hcauchy2 hcauchy3 hfifth ξ c r s hξ hk5tail
    hcs hEC hrs hEL hss hER

end Grothe
