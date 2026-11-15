-- Grothe/UpperHead.lean
import Grothe.Upper.HeadWeight

/-!
# The kernel head from a weighted energy comparison

The existing finite table check and table-accuracy bound control the head of the reference
kernel. A variable weighted comparison allowance then controls the actual kernel head.
This finite calculation requires neither summability nor a Hardy or domination hypothesis.

Agent-ID: codex-c8a4. Refs #389.
-/

namespace Grothe.Upper

open Finset GrotheKernel

noncomputable section

/-- Assemble the finite head using the original table check and any comparison allowance. -/
theorem kernel_head_residual_le_of_comparison (E EX : ℕ × ℕ → ℝ)
    (hp : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → E p = 0)
    (hpX : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → EX p = 0)
    (hcheck : headOK 501 energyRows pList qList slopeQ headCapQ = true)
    {w : ℕ × ℕ → ℝ}
    (hw : ∀ p, ∑ j ∈ range 251,
      |(termOf primaryPoly auxPoly p).coeff j| ≤ w p)
    {τ : ℝ} (hclose : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ τ)
    {C : ℝ} (hcompare : ∑ p ∈ headIdx 501, w p * |E p - EX p| ≤ C) :
    ∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0| ≤
      (headCapQ : ℝ) + τ + C := by
  have htable : ∑ j ∈ range 251,
      |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0| ≤
        (headCapQ : ℝ) + τ := by
    have h1 := head_residual_le primaryPoly auxPoly Grothe.l1_primaryPoly
      Grothe.l1_auxPoly Grothe.auxPoly_coeff_zero EX
      (fun p ↦ (energyTable p : ℝ)) hpX (N := 501) (K := 251)
      (by norm_num) (slopeQ : ℝ)
    have h2 : ∑ j ∈ range 251,
        |∑ p ∈ headIdx 501, (energyTable p : ℝ) *
          (termOf primaryPoly auxPoly p).coeff j - if j = 0 then (slopeQ : ℝ) else 0| ≤
        (headCapQ : ℝ) := head_le_of_check hcheck
    unfold kernelCoeff
    exact h1.trans (add_le_add h2 hclose)
  have hloc := head_residual_le_weighted primaryPoly auxPoly Grothe.auxPoly_coeff_zero
    E EX hp (N := 501) (K := 251) (by norm_num) (slopeQ : ℝ)
    w (fun p _ ↦ hw p)
  have heq : (∑ j ∈ range 251,
      |∑ p ∈ headIdx 501, EX p * (termOf primaryPoly auxPoly p).coeff j -
        if j = 0 then (slopeQ : ℝ) else 0|) =
      ∑ j ∈ range 251, |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0| := by
    refine sum_congr rfl fun j hj ↦ ?_
    rw [show kernelCoeff EX j = ∑ p ∈ headIdx 501,
      EX p * (termOf primaryPoly auxPoly p).coeff j from
      bivarKernel_eq_head primaryPoly auxPoly Grothe.auxPoly_coeff_zero EX hpX
        (by have := mem_range.mp hj; omega)]
  rw [heq] at hloc
  exact hloc.trans (add_le_add htable hcompare)

end

end Grothe.Upper
