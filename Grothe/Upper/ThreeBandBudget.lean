import Grothe.Upper.ComparisonGroups
import Grothe.Upper.Data
import Grothe.Upper.Residual
import Lean.Util.CollectAxioms

/-! Agent-ID: codex-2ca4. Task295 exact numerical budget, SOURCE ONLY / UNCOMPILED.
These constants do not certify Gaussian errors or table agreement. Original
comparison data, slope, table allowance and public UpperTarget are unchanged.
The raw Hardy tail is used without the old head-dependent linear deduction. -/

set_option warningAsError true

namespace Grothe.Upper
open Finset GrotheKernel

def threeBandLowIndex (g : Fin 3) : Fin 18 :=
  if g = 0 then 1 else if g = 1 then 8 else 13

def threeBandLowErrorQ (g : Fin 3) : ℚ :=
  comparisonBands[threeBandLowIndex g].error

def threeBandLowNormQ (g : Fin 3) : ℚ :=
  comparisonBands[threeBandLowIndex g].norm

/-- These are independent whole-error radius targets, not consequences of
the earlier eighteen Gaussian band hypotheses. The raw errors have radii
R1, 2*R2 and 6*R3, since hpow j = (i*phi)^j F0 is divided by j! only later. -/
def threeBandScaledRQ (g : Fin 3) : ℚ :=
  comparisonGroupRadiusQ ⟨g.val + 1, by omega⟩

def threeBandHighRadiusQ (g : Fin 3) : ℚ :=
  if g = 2 then 199 / 1000 else 229 / 2500

def threeBandRoundingErrorQ : ℚ := comparisonBands[0].error

def threeBandRoundingNormQ : ℚ := comparisonBands[0].norm

/-- Seven pieces for linear cross terms: rounding, low1, high1, low2,
high2, low3, high3. `hi=0` retains the complete infinite upper band. -/
def threeBandBands (j : Fin 7) : ComparisonBand :=
  if j = 0 then comparisonBands[0] else
  if j = 1 then comparisonBands[1] else
  if j = 2 then ⟨51, 0, threeBandScaledRQ 0, threeBandHighRadiusQ 0⟩ else
  if j = 3 then comparisonBands[8] else
  if j = 4 then ⟨51, 0, threeBandScaledRQ 1, threeBandHighRadiusQ 1⟩ else
  if j = 5 then comparisonBands[13] else
    ⟨11, 0, threeBandScaledRQ 2, threeBandHighRadiusQ 2⟩

def threeBandOldGroup (k : Fin 18) : Fin 7 :=
  if k = 0 then 0 else if k = 1 then 1 else if k.val < 8 then 2 else
  if k = 8 then 3 else if k.val < 13 then 4 else if k = 13 then 5 else 6

/-- Original mass-cap squares suffice for each coarser actual-X mass cap.
This rational statement uses no Gaussian band-error bound. -/
theorem threeBand_mass_caps (j : Fin 7) :
    (∑ k : Fin 18, if threeBandOldGroup k = j then comparisonBands[k].norm ^ 2 else 0) ≤
      (threeBandBands j).norm ^ 2 := by
  have h : ∀ j : Fin 7,
      (∑ k : Fin 18, if threeBandOldGroup k = j then comparisonBands[k].norm ^ 2 else 0) ≤
        (threeBandBands j).norm ^ 2 := by decide +kernel
  exact h j

theorem threeBand_nonneg (j : Fin 7) :
    0 ≤ (threeBandBands j).norm ∧ 0 ≤ (threeBandBands j).error := by
  have h : ∀ j : Fin 7, 0 ≤ (threeBandBands j).norm ∧
      0 ≤ (threeBandBands j).error := by decide +kernel
  exact h j

theorem threeBand_scaledR_literals :
    threeBandScaledRQ 0 = 7438538917225 / 1000000000000000000 ∧
    threeBandScaledRQ 1 = 1164322916284 / 1000000000000000000 ∧
    threeBandScaledRQ 2 = 355864656182 / 1000000000000000000 := by
  decide +kernel

def threeBandLinearQ : ℚ :=
  2 * ∑ j : Fin 7, (threeBandBands j).norm * (threeBandBands j).error

/-- The quadratic charge uses four unsplit sources, not seven independently
charged pieces and not the old eighteen error premises. -/
def threeBandQuadraticQ : ℚ := (∑ g : Fin 4, comparisonGroupRadiusQ g) ^ 2

def threeBandCompareQ : ℚ := threeBandLinearQ + threeBandQuadraticQ

theorem threeBandLinearQ_exact :
    threeBandLinearQ = 859076918404956932531963 / 500000000000000000000000000000 := by
  decide +kernel

theorem threeBandQuadraticQ_exact :
    threeBandQuadraticQ = 5016173769819321536390929 /
      62500000000000000000000000000000000 := by
  decide +kernel

theorem threeBandCompareQ_exact :
    threeBandCompareQ = 107389630974389435888031765929 /
      62500000000000000000000000000000000 := by
  decide +kernel

def threeBandHeadQ : ℚ := headCapQ + energyErrQ + threeBandCompareQ

def threeBandRawTailQ : ℚ := 36748 / 1000000000000

def threeBandResidualQ : ℚ := threeBandHeadQ + threeBandRawTailQ

def threeBandValueQ : ℚ := 1 / (slopeQ - threeBandResidualQ)

theorem threeBandResidualQ_exact :
    threeBandResidualQ = 111446799350514435888031765929 /
      62500000000000000000000000000000000 := by
  decide +kernel

theorem threeBandValueQ_exact :
    threeBandValueQ = 62500000000000000000000000000000000 /
      44496657949831899485564111968234071 := by
  decide +kernel

theorem threeBandResidualQ_lt_slopeQ : threeBandResidualQ < slopeQ := by
  decide +kernel

theorem threeBandValueQ_lt : threeBandValueQ < (140459988 : ℚ) / 100000000 := by
  decide +kernel

theorem threeBand_positive_denominator :
    0 < (slopeQ : ℝ) - (threeBandResidualQ : ℝ) := by
  exact sub_pos.mpr (by exact_mod_cast threeBandResidualQ_lt_slopeQ)

theorem threeBand_real_reciprocal :
    1 / ((slopeQ : ℝ) - (threeBandResidualQ : ℝ)) = (threeBandValueQ : ℝ) := by
  norm_num only [threeBandValueQ, Rat.cast_div, Rat.cast_one, Rat.cast_sub]

theorem threeBand_real_value_lt : (threeBandValueQ : ℝ) < (1.40459988 : ℝ) := by
  calc
    (threeBandValueQ : ℝ) < (((140459988 : ℚ) / 100000000 : ℚ) : ℝ) := by
      exact_mod_cast threeBandValueQ_lt
    _ = (1.40459988 : ℝ) := by norm_num

theorem threeBand_real_reciprocal_lt :
    1 / ((slopeQ : ℝ) - (threeBandResidualQ : ℝ)) < (1.40459988 : ℝ) := by
  rw [threeBand_real_reciprocal]
  exact threeBand_real_value_lt

theorem threeBand_decimal_inside_target :
    (1.4045 : ℝ) < 1.40459988 ∧ (1.40459988 : ℝ) < 1.4046 := by norm_num

/-- Exact finite integer comparison for the original raw Hardy budget 7/4,
radius4149/4000 and radial tail starting at251 (degree exponent1006). -/
theorem threeBand_raw_hardy_numeric :
    (7 / 4 : ℝ) * (4149 / 4000 : ℝ)⁻¹ ^ (2 * (2 * 251 + 1)) ≤
      (threeBandRawTailQ : ℝ) ^ 2 * (1 - (4149 / 4000 : ℝ)⁻¹ ^ 4) := by
  have hN : (32410953319981359375000000000000000000 * 4000 ^ 1006 : ℕ) ≤
      3403782714698914680569 * 4149 ^ 1006 := by decide +kernel
  have hR : (32410953319981359375000000000000000000 * 4000 ^ 1006 : ℝ) ≤
      3403782714698914680569 * 4149 ^ 1006 := by exact_mod_cast hN
  have ha : 0 ≤ (4000 : ℝ) ^ 1006 := by positivity
  have hb : 0 < (4149 : ℝ) ^ 1006 := by positivity
  rw [show 2 * (2 * 251 + 1) = 1006 by norm_num,
    show (4149 / 4000 : ℝ)⁻¹ = 4000 / 4149 by norm_num, div_pow]
  generalize (4000 : ℝ) ^ 1006 = a at hR ha ⊢
  generalize (4149 : ℝ) ^ 1006 = b at hR hb ⊢
  norm_num [threeBandRawTailQ]
  rw [← mul_div_assoc, div_le_iff₀ hb]
  linarith

end Grothe.Upper

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.Upper.threeBandLowIndex,
      ``Grothe.Upper.threeBandLowErrorQ, ``Grothe.Upper.threeBandLowNormQ,
      ``Grothe.Upper.threeBandScaledRQ, ``Grothe.Upper.threeBandHighRadiusQ,
      ``Grothe.Upper.threeBandRoundingErrorQ, ``Grothe.Upper.threeBandRoundingNormQ,
      ``Grothe.Upper.threeBandBands, ``Grothe.Upper.threeBandOldGroup,
      ``Grothe.Upper.threeBand_mass_caps, ``Grothe.Upper.threeBand_nonneg,
      ``Grothe.Upper.threeBand_scaledR_literals, ``Grothe.Upper.threeBandLinearQ,
      ``Grothe.Upper.threeBandQuadraticQ, ``Grothe.Upper.threeBandCompareQ,
      ``Grothe.Upper.threeBandLinearQ_exact, ``Grothe.Upper.threeBandQuadraticQ_exact,
      ``Grothe.Upper.threeBandCompareQ_exact, ``Grothe.Upper.threeBandHeadQ,
      ``Grothe.Upper.threeBandRawTailQ, ``Grothe.Upper.threeBandResidualQ,
      ``Grothe.Upper.threeBandValueQ, ``Grothe.Upper.threeBandResidualQ_exact,
      ``Grothe.Upper.threeBandValueQ_exact, ``Grothe.Upper.threeBandResidualQ_lt_slopeQ,
      ``Grothe.Upper.threeBandValueQ_lt, ``Grothe.Upper.threeBand_positive_denominator,
      ``Grothe.Upper.threeBand_real_reciprocal, ``Grothe.Upper.threeBand_real_value_lt,
      ``Grothe.Upper.threeBand_real_reciprocal_lt,
      ``Grothe.Upper.threeBand_decimal_inside_target,
      ``Grothe.Upper.threeBand_raw_hardy_numeric] do
    let deps ← Lean.collectAxioms target
    let bad := deps.filter fun n => !allowed.contains n
    unless bad.isEmpty do throwError m!"Unexpected three-band numerical axioms: {bad}"
