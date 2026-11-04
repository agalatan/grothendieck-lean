import Grothe.Upper.ThreeBandBudget
import Grothe.Upper.HeadWeight
import Grothe.Transfer
import Lean.Util.CollectAxioms

/-! Agent-ID: codex-2ca4. Task295 SOURCE ONLY / UNCOMPILED.
Standard-three conditional core. The finite head input is the actual original
headOK predicate, not the desired real head or residual inequality. Structural,
comparison, table and raw Hardy inputs are explicit. No old compareQ input,
head-dependent refined Hardy tail, or alteration of UpperTarget is used. -/

set_option warningAsError true

namespace Grothe.Upper
open Finset GrotheKernel

structure ThreeBandDirectInputs (E EX : ℕ × ℕ → ℝ) : Prop where
  valid : Grothe.DominatedKernel (Grothe.radialKernel (kernelCoeff E))
  summable : Summable fun p => |E p|
  parityX : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → EX p = 0
  parity : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → E p = 0
  compare : ∑ p ∈ headIdx 501, comparisonWeight p * |E p - EX p| ≤
    (threeBandCompareQ : ℝ)
  energy_close : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)
  originalHeadCheck : headOK 501 energyRows pList qList slopeQ headCapQ = true
  hardy : ∀ J, ∑ n ∈ range J, kernelCoeff E n ^ 2 *
    (4149 / 4000 : ℝ) ^ (2 * (2 * n + 1)) ≤ 7 / 4

noncomputable section

theorem threeBand_table_head_le {E EX : ℕ × ℕ → ℝ} (h : ThreeBandDirectInputs E EX) :
    ∑ j ∈ range 251, |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0| ≤
      (headCapQ : ℝ) + (energyErrQ : ℝ) := by
  have h1 := head_residual_le primaryPoly auxPoly Grothe.l1_primaryPoly
    Grothe.l1_auxPoly Grothe.auxPoly_coeff_zero EX
    (fun p => (energyTable p : ℝ)) h.parityX (N := 501) (K := 251)
    (by norm_num) (slopeQ : ℝ)
  have h2 : ∑ j ∈ range 251,
      |∑ p ∈ headIdx 501, (energyTable p : ℝ) *
        (termOf primaryPoly auxPoly p).coeff j - if j = 0 then (slopeQ : ℝ) else 0| ≤
      (headCapQ : ℝ) := head_le_of_check h.originalHeadCheck
  have hclose := h.energy_close
  unfold kernelCoeff
  linarith

theorem threeBand_head_residual_le {E EX : ℕ × ℕ → ℝ}
    (h : ThreeBandDirectInputs E EX) :
    ∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0| ≤
      (threeBandHeadQ : ℝ) := by
  have hloc := head_residual_le_weighted primaryPoly auxPoly Grothe.auxPoly_coeff_zero
    E EX h.parity (N := 501) (K := 251) (by norm_num) (slopeQ : ℝ) comparisonWeight
    (fun p _ => comparisonWeight_sound p)
  have heq : (∑ j ∈ range 251,
      |∑ p ∈ headIdx 501, EX p * (termOf primaryPoly auxPoly p).coeff j -
        if j = 0 then (slopeQ : ℝ) else 0|) =
      ∑ j ∈ range 251, |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0| := by
    refine sum_congr rfl fun j hj => ?_
    rw [show kernelCoeff EX j = ∑ p ∈ headIdx 501,
      EX p * (termOf primaryPoly auxPoly p).coeff j from
      bivarKernel_eq_head primaryPoly auxPoly Grothe.auxPoly_coeff_zero EX h.parityX
        (by have := mem_range.mp hj; omega)]
  rw [heq] at hloc
  have hh := hloc.trans (add_le_add (threeBand_table_head_le h) h.compare)
  simpa only [threeBandHeadQ, Rat.cast_add] using hh

theorem threeBand_tail_le {E EX : ℕ × ℕ → ℝ} (h : ThreeBandDirectInputs E EX) :
    ∑' n, |kernelCoeff E (n + 251)| ≤ (threeBandRawTailQ : ℝ) := by
  exact Grothe.hardy_tail (kernelCoeff E) (4149 / 4000 : ℝ) (by norm_num)
    (7 / 4) h.hardy 251 (threeBandRawTailQ : ℝ)
    (by norm_num [threeBandRawTailQ]) threeBand_raw_hardy_numeric

theorem threeBand_residual_le {E EX : ℕ × ℕ → ℝ} (h : ThreeBandDirectInputs E EX) :
    |kernelCoeff E 0 - (slopeQ : ℝ)| + ∑' n, |kernelCoeff E (n + 1)| ≤
      (threeBandResidualQ : ℝ) := by
  rw [Grothe.residual_split (kernelCoeff E) (Grothe.summable_kernelCoeff h.summable)
    (slopeQ : ℝ) 250]
  have hh := add_le_add (threeBand_head_residual_le h) (threeBand_tail_le h)
  simpa only [threeBandResidualQ, Rat.cast_add] using hh

theorem threeBand_upper_from_inputs {E EX : ℕ × ℕ → ℝ}
    (h : ThreeBandDirectInputs E EX) : Grothe.IsGrothendieckBound (threeBandValueQ : ℝ) := by
  have hdelta : (threeBandResidualQ : ℝ) < (slopeQ : ℝ) := by
    exact_mod_cast threeBandResidualQ_lt_slopeQ
  have hu := Grothe.transfer (kernelCoeff E) (Grothe.summable_kernelCoeff h.summable)
    h.valid hdelta (threeBand_residual_le h)
  rw [threeBand_real_reciprocal] at hu
  exact hu

theorem threeBand_endpoint_from_inputs {E EX : ℕ × ℕ → ℝ}
    (h : ThreeBandDirectInputs E EX) :
    Grothe.IsGrothendieckBound (threeBandValueQ : ℝ) ∧
      (threeBandValueQ : ℝ) < (1.40459988 : ℝ) :=
  ⟨threeBand_upper_from_inputs h, threeBand_real_value_lt⟩

end
end Grothe.Upper

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.Upper.ThreeBandDirectInputs,
      ``Grothe.Upper.threeBand_table_head_le, ``Grothe.Upper.threeBand_head_residual_le,
      ``Grothe.Upper.threeBand_tail_le, ``Grothe.Upper.threeBand_residual_le,
      ``Grothe.Upper.threeBand_upper_from_inputs,
      ``Grothe.Upper.threeBand_endpoint_from_inputs] do
    let deps ← Lean.collectAxioms target
    let bad := deps.filter fun n => !allowed.contains n
    unless bad.isEmpty do throwError m!"Unexpected three-band core axioms: {bad}"
