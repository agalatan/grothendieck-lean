import Grothe.Upper.Residual
import Grothe.Transfer

/-!
# A finite residual and a Hardy budget share their linear coefficient

A finite head estimate already forces a lower bound on the linear coefficient. Deduct its
weighted square before applying Cauchy–Schwarz to the tail. The same statement works for every
head length, comparison allowance and Hardy radius; no particular numerical certificate is used.

Agent-ID: codex-c8a4. Refs #389.
-/

namespace Grothe

open Finset

noncomputable section

/-- A finite residual forces the linear coefficient to be at least the target minus the allowance. -/
theorem linear_lower_of_head {h : ℕ → ℝ} {c H : ℝ} {K : ℕ}
    (hhead : ∑ n ∈ range (K + 1), |h n - if n = 0 then c else 0| ≤ H) :
    c - H ≤ h 0 := by
  have hzero : |h 0 - c| ≤ H := by
    refine (show |h 0 - c| ≤
      ∑ n ∈ range (K + 1), |h n - if n = 0 then c else 0| from ?_).trans hhead
    simpa using single_le_sum
      (fun n (_ : n ∈ range (K + 1)) ↦ abs_nonneg (h n - if n = 0 then c else 0))
      (show 0 ∈ range (K + 1) by simp)
  linarith [(abs_le.mp hzero).1]

/-- Combine the head and tail after deducting the linear energy forced by the same head bound. -/
theorem residual_le_of_head_hardy {h : ℕ → ℝ} (hs : Summable fun n ↦ |h n|)
    {c H r B T : ℝ} {K : ℕ} (hr : 1 < r) (hL : 0 ≤ c - H)
    (hhead : ∑ n ∈ range (K + 1), |h n - if n = 0 then c else 0| ≤ H)
    (hB : ∀ J, ∑ n ∈ range J, h n ^ 2 * r ^ (2 * (2 * n + 1)) ≤ B)
    (hT : 0 ≤ T)
    (hnum : ((B - (c - H) ^ 2 * r ^ 2) / r ^ 4) * r⁻¹ ^ (2 * (2 * K + 1)) ≤
      T ^ 2 * (1 - r⁻¹ ^ 4)) :
    |h 0 - c| + ∑' n, |h (n + 1)| ≤ H + T := by
  have hshift := hardy_budget_after_linear h r B (c - H) (zero_lt_one.trans hr)
    hL (linear_lower_of_head hhead) hB
  have htail := hardy_tail (fun n ↦ h (n + 1)) r hr
    ((B - (c - H) ^ 2 * r ^ 2) / r ^ 4) hshift K T hT hnum
  rw [residual_split h hs c K]
  apply add_le_add hhead
  simpa only [Nat.add_assoc, Nat.add_comm K 1] using htail

/-- A certificate-independent transfer theorem retaining the linear Hardy-budget deduction. -/
theorem transfer_of_head_hardy {h : ℕ → ℝ} (hs : Summable fun n ↦ |h n|)
    (hv : DominatedKernel (radialKernel h)) {c H r B T : ℝ} {K : ℕ}
    (hr : 1 < r) (hL : 0 ≤ c - H)
    (hhead : ∑ n ∈ range (K + 1), |h n - if n = 0 then c else 0| ≤ H)
    (hB : ∀ J, ∑ n ∈ range J, h n ^ 2 * r ^ (2 * (2 * n + 1)) ≤ B)
    (hT : 0 ≤ T)
    (hnum : ((B - (c - H) ^ 2 * r ^ 2) / r ^ 4) * r⁻¹ ^ (2 * (2 * K + 1)) ≤
      T ^ 2 * (1 - r⁻¹ ^ 4))
    (hdelta : H + T < c) :
    IsGrothendieckBound (1 / (c - (H + T))) :=
  transfer h hs hv hdelta (residual_le_of_head_hardy hs hr hL hhead hB hT hnum)

end

end Grothe
