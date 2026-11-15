-- Grothe/Upper/SignedTailTransfer.lean
import Grothe.Upper.SignedTailMassCertificate
import Grothe.Upper.Residual
import Grothe.Transfer

/-!
# Grothendieck transfer from signed coefficient-tail certificates

The finite head of a dominated radial kernel is combined with the mass-sensitive
tail estimate. The tail certificate uses only a positive summable reference,
finite quadratic-error budgets, an upper bound on the signed tail, and an
algebraic comparison with a proposed nonnegative absolute-tail cap.

These inputs imply absolute summability of the full coefficient sequence before
the transfer theorem is applied. The total-mass variant obtains the signed tail
from an upper bound on total signed mass and a lower bound on its finite head.
No numerical kernel or Grothendieck endpoint is asserted by these adapters.

Agent-ID: codex-9b17
Refs #379
-/

namespace Grothe.Upper

open Finset

noncomputable section

private lemma summable_abs_of_tail_quadratic_budget
    (a h : ℕ → ℝ) (N : ℕ) (E : ℝ)
    (ha : ∀ n, 0 < a (n + N))
    (hs : Summable fun n => a (n + N))
    (hE : ∀ J, ∑ n ∈ range J,
      (h (n + N) - a (n + N)) ^ 2 / a (n + N) ≤ E) :
    Summable fun n => |h n| := by
  have hn (n : ℕ) : 0 ≤ (h (n + N) - a (n + N)) ^ 2 / a (n + N) :=
    div_nonneg (sq_nonneg _) (ha n).le
  have he := summable_of_sum_range_le hn hE
  exact (summable_nat_add_iff N).mp (summable_abs_of_reference_quadratic ha hs he)

/-- A finite head and a mass-sensitive signed-tail certificate give a genuine
Grothendieck bound for any dominated radial kernel. Absolute summability of the
kernel coefficients is a consequence, not an additional hypothesis. -/
theorem transfer_of_signed_tail_mass
    (a h : ℕ → ℝ) (K : ℕ) (c H E S T : ℝ)
    (hdom : DominatedKernel (radialKernel h))
    (ha : ∀ n, 0 < a (n + (K + 1)))
    (hs : Summable fun n => a (n + (K + 1)))
    (hE : ∀ J, ∑ n ∈ range J,
      (h (n + (K + 1)) - a (n + (K + 1))) ^ 2 / a (n + (K + 1)) ≤ E)
    (hS : (∑' n, h (n + (K + 1))) ≤ S)
    (hT : 0 ≤ T)
    (hcert : (∑' n, a (n + (K + 1))) *
      (2 * S - (∑' n, a (n + (K + 1))) + E) ≤ T ^ 2)
    (hhead : (∑ n ∈ range (K + 1), |h n - if n = 0 then c else 0|) ≤ H)
    (hgap : H + T < c) :
    IsGrothendieckBound (1 / (c - (H + T))) := by
  have hh := summable_abs_of_tail_quadratic_budget a h (K + 1) E ha hs hE
  have htail := signed_tail_le_of_mass_quadratic_budget a h (K + 1) E S T
    ha hs hE hS hT hcert
  apply Grothe.transfer h hh hdom hgap
  rw [Grothe.residual_split h hh c K]
  exact add_le_add hhead htail

/-- A signed total-mass upper bound and a signed-head lower bound supply the
tail input to `transfer_of_signed_tail_mass`. All certificate comparisons are
polynomial or rational; the theorem introduces no square roots. -/
theorem transfer_of_signed_total_mass
    (a h : ℕ → ℝ) (K : ℕ) (c H E M B T : ℝ)
    (hdom : DominatedKernel (radialKernel h))
    (ha : ∀ n, 0 < a (n + (K + 1)))
    (hs : Summable fun n => a (n + (K + 1)))
    (hE : ∀ J, ∑ n ∈ range J,
      (h (n + (K + 1)) - a (n + (K + 1))) ^ 2 / a (n + (K + 1)) ≤ E)
    (hM : (∑' n, h n) ≤ M)
    (hB : B ≤ ∑ n ∈ range (K + 1), h n)
    (hT : 0 ≤ T)
    (hcert : (∑' n, a (n + (K + 1))) *
      (2 * (M - B) - (∑' n, a (n + (K + 1))) + E) ≤ T ^ 2)
    (hhead : (∑ n ∈ range (K + 1), |h n - if n = 0 then c else 0|) ≤ H)
    (hgap : H + T < c) :
    IsGrothendieckBound (1 / (c - (H + T))) := by
  have hh := summable_abs_of_tail_quadratic_budget a h (K + 1) E ha hs hE
  have hsplit := hh.of_abs.sum_add_tsum_nat_add (K + 1)
  have hS : (∑' n, h (n + (K + 1))) ≤ M - B := by linarith
  exact transfer_of_signed_tail_mass a h K c H E (M - B) T
    hdom ha hs hE hS hT hcert hhead hgap

/-- An enclosure of the positive reference mass suffices for transfer. The
finite certificate checks the maximum of the concave mass expression over
that enclosure, rather than an exact value of an infinite reference sum. -/
theorem transfer_of_signed_tail_mass_interval
    (a h : ℕ → ℝ) (K : ℕ) (c H E S T lo hi : ℝ)
    (hdom : DominatedKernel (radialKernel h))
    (ha : ∀ n, 0 < a (n + (K + 1)))
    (hs : Summable fun n => a (n + (K + 1)))
    (hE : ∀ J, ∑ n ∈ range J,
      (h (n + (K + 1)) - a (n + (K + 1))) ^ 2 / a (n + (K + 1)) ≤ E)
    (hS : (∑' n, h (n + (K + 1))) ≤ S)
    (hlo : lo ≤ ∑' n, a (n + (K + 1)))
    (hhi : (∑' n, a (n + (K + 1))) ≤ hi)
    (hT : 0 ≤ T)
    (hcert : referenceMassEnvelope lo hi (S + E / 2) ≤ T ^ 2)
    (hhead : (∑ n ∈ range (K + 1), |h n - if n = 0 then c else 0|) ≤ H)
    (hgap : H + T < c) :
    IsGrothendieckBound (1 / (c - (H + T))) := by
  have hh := summable_abs_of_tail_quadratic_budget a h (K + 1) E ha hs hE
  have htail := signed_tail_le_of_mass_interval a h (K + 1) E S T lo hi
    ha hs hE hS hlo hhi hT hcert
  apply Grothe.transfer h hh hdom hgap
  rw [Grothe.residual_split h hh c K]
  exact add_le_add hhead htail

/-- A complete interval certificate combines an upper bound on total signed
mass, a lower bound on the signed head, an enclosure of reference mass, a
quadratic-error budget and an absolute-head cap. No exact infinite mass or
square root occurs in the numerical comparison. -/
theorem transfer_of_signed_total_mass_interval
    (a h : ℕ → ℝ) (K : ℕ) (c H E M B T lo hi : ℝ)
    (hdom : DominatedKernel (radialKernel h))
    (ha : ∀ n, 0 < a (n + (K + 1)))
    (hs : Summable fun n => a (n + (K + 1)))
    (hE : ∀ J, ∑ n ∈ range J,
      (h (n + (K + 1)) - a (n + (K + 1))) ^ 2 / a (n + (K + 1)) ≤ E)
    (hM : (∑' n, h n) ≤ M)
    (hB : B ≤ ∑ n ∈ range (K + 1), h n)
    (hlo : lo ≤ ∑' n, a (n + (K + 1)))
    (hhi : (∑' n, a (n + (K + 1))) ≤ hi)
    (hT : 0 ≤ T)
    (hcert : referenceMassEnvelope lo hi (M - B + E / 2) ≤ T ^ 2)
    (hhead : (∑ n ∈ range (K + 1), |h n - if n = 0 then c else 0|) ≤ H)
    (hgap : H + T < c) :
    IsGrothendieckBound (1 / (c - (H + T))) := by
  have hh := summable_abs_of_tail_quadratic_budget a h (K + 1) E ha hs hE
  have hsplit := hh.of_abs.sum_add_tsum_nat_add (K + 1)
  have hS : (∑' n, h (n + (K + 1))) ≤ M - B := by linarith
  exact transfer_of_signed_tail_mass_interval a h K c H E (M - B) T lo hi
    hdom ha hs hE hS hlo hhi hT hcert hhead hgap

end

end Grothe.Upper
