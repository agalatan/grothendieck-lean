import Grothe.UpperChaos.Q0CommonMomentSum
import Grothe.UpperChaos.Q0RealPhaseSourceSum
import Grothe.UpperChaos.Q0RawWickTermDefs

/-!
# Source-derived rational terms for the q0 Wick expansion

These definitions construct trivariate rational monomials from source-format
phase terms using the common-index binomial factor. They do not assume an
external coefficient bank. The definitions are not yet connected by a theorem
to the real q0 source sum; the finite-sum algebra and radial substitution for
that connection remain separate obligations. Agent-ID: codex-8c4d.
-/

namespace Grothe.UpperChaos.Q0RawWickTerms

open Grothe.UpperChaos.Q0CommonMomentSum

/-- The rational factor is exactly the existing real Wick factor. -/
theorem imSqBinomialFactorQ_cast (p q j : ℕ) :
    (imSqBinomialFactorQ p q j : ℝ) = imSqBinomialFactor p q j := by
  unfold imSqBinomialFactorQ imSqBinomialFactor
  push_cast
  rfl

/-- The radius exponent has exactly the parity required by the common moment
range. This explicitly guards natural-number subtraction. -/
theorem rawWickEntry_radius_degree (a b c : ℕ) (d : ℚ) (k j : ℕ)
    (hj : 2 * j ≤ 2 * b + c + 2) :
    2 * (rawWickEntry a b c d k j).1.1 =
      2 * a + c + (rawWickEntry a b c d k j).1.2.2 := by
  simp only [rawWickEntry]
  omega

/-- Concatenating source-derived entries preserves their `Ssum` evaluation
term by term, independently of the eventual Wick-source bridge. -/
theorem Ssum_rawWickEntries (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (S Z V : ℝ) :
    Ssum (rawWickEntries ts) S Z V =
      (ts.map fun t => Ssum (rawWickEntriesOfTerm t) S Z V).sum := by
  have hAppend (xs ys : List ((ℕ × ℕ × ℕ) × ℚ)) :
      Ssum (xs ++ ys) S Z V = Ssum xs S Z V + Ssum ys S Z V := by
    simp [Ssum]
  induction ts with
  | nil => simp [rawWickEntries, Ssum]
  | cons t ts ih =>
      simp only [rawWickEntries, List.map_cons, List.sum_cons]
      rw [hAppend, ih]

end Grothe.UpperChaos.Q0RawWickTerms
