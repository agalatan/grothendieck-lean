import Grothe.UpperChaos.ConditionalSeedNormalization
import Grothe.UpperChaos.OriginalMomentSeedEnclosure
import Grothe.UpperChaos.ProfileRootScreen

/-!
# The actual common scalar at source row 227's pinned midpoint

The accepted original-moment enclosure and the existing sqrt(pi) bounds
enclose the actual common seed scalar at the pinned midpoint. The only new
large literal is the numerator of the recorded dyadic scalar center.

Literal provenance: row227-common-scalar-budget.json, SHA256
cdd4b1f7e530955fec067db6d82530f578a5bfd136e2b4a9668124b82dbdc5de,
actual_scalar.dyadic_midpoint_numerator. Its recorded denominator equals
OriginalMomentSeedData.scale. The midpoint, moment endpoints, and sqrt(pi)
endpoints in that receipt were compared exactly with the imported constants.
The receipt is provenance; the proof uses the imported theorems and closed
kernel arithmetic, with no numerical-accuracy hypothesis.

This concerns the midpoint scalar only. Physical shift transport, normalized
triangle reconstruction, saved coefficient errors, and the final endpoint
remain separate.

Agent-ID: codex-aa04. Refs #21.
-/

namespace Grothe.UpperChaos.ConditionalSourceRow227Scalar

noncomputable section

open ConditionalSeedNormalization OriginalMomentSeedData ProfileRootScreen

/-- The sole new large literal, copied from the pinned receipt field above. -/
def shatNumerator : ℤ :=
  177092180340539192971727172057010141943132725994053502501819910332404160619849130473478710986101894412890358691491956437820687678233705691006804788944259220190163110739803828227000857003089751075957060789389646420360938794915028573507029669842043968334980677055191015628635612765275747850685803500568549949934

/-- The recorded center, on the same exact dyadic scale as the seed data. -/
def shat : ℚ := (shatNumerator : ℚ) / (scale : ℚ)

def momentLower : ℚ := (enclosureLower : ℚ) / (scale : ℚ)
def momentUpper : ℚ := (enclosureUpper : ℚ) / (scale : ℚ)

/-- Product endpoints use existing constants; no expanded product fraction
is copied from the external receipt. -/
def scalarLower : ℚ := (sqrtPiLo / 2) * midpointQ * momentLower
def scalarUpper : ℚ := (sqrtPiHi / 2) * midpointQ * momentUpper

def scalarRadius : ℚ := 784 / 10 ^ 24

private theorem positive_inputs :
    0 < midpointQ ∧ 0 ≤ momentLower := by
  decide +kernel

/-- Closed rational guards for the exact center and product endpoints. -/
private theorem scalar_guards :
    (49 / 50 : ℚ) < scalarLower ∧
      shat - scalarRadius ≤ scalarLower ∧
      scalarUpper ≤ shat + scalarRadius := by
  decide +kernel

theorem shat_cast :
    (shat : ℝ) = (shatNumerator : ℝ) / (scale : ℝ) := by
  simp only [shat, Rat.cast_div, Rat.cast_intCast]

/-- The product enclosure applies to the actual Gaussian seed scalar.
Positivity is proved from the imported data and analytic moment positivity. -/
theorem scalar_mem :
    (scalarLower : ℝ) ≤ seedScalar (midpointQ : ℝ) ∧
      seedScalar (midpointQ : ℝ) ≤ (scalarUpper : ℝ) := by
  have hA : (0 : ℝ) < (midpointQ : ℝ) :=
    (Rat.cast_pos (K := ℝ)).mpr positive_inputs.1
  have hjlo : (0 : ℝ) ≤ (momentLower : ℝ) := by
    simpa only [Rat.cast_zero] using
      (Rat.cast_le (K := ℝ)).mpr positive_inputs.2
  have hj :
      (momentLower : ℝ) ≤ OriginalPositiveMoment.moment 0 ((midpointQ : ℝ) ^ 2) ∧
        OriginalPositiveMoment.moment 0 ((midpointQ : ℝ) ^ 2) ≤
          (momentUpper : ℝ) := by
    simpa only [momentLower, momentUpper, midpointQ, Rat.cast_div, Rat.cast_intCast]
      using OriginalMomentSeedEnclosure.moment_midpoint_mem
  have hjnonneg : 0 ≤ OriginalPositiveMoment.moment 0 ((midpointQ : ℝ) ^ 2) :=
    (OriginalPositiveMoment.moment_pos 0 ((midpointQ : ℝ) ^ 2)).le
  have hp := sqrtPi_real_bounds
  have hpHi : (0 : ℝ) ≤ (sqrtPiHi : ℝ) := (Real.sqrt_nonneg _).trans hp.2
  have htwo : (0 : ℝ) ≤ 2 := by norm_num
  have hprefLo :
      ((sqrtPiLo : ℝ) / 2) * (midpointQ : ℝ) ≤
        (Real.sqrt Real.pi / 2) * (midpointQ : ℝ) :=
    mul_le_mul_of_nonneg_right (div_le_div_of_nonneg_right hp.1 htwo) hA.le
  have hprefHi :
      (Real.sqrt Real.pi / 2) * (midpointQ : ℝ) ≤
        ((sqrtPiHi : ℝ) / 2) * (midpointQ : ℝ) :=
    mul_le_mul_of_nonneg_right (div_le_div_of_nonneg_right hp.2 htwo) hA.le
  have hprefNonneg : 0 ≤ (Real.sqrt Real.pi / 2) * (midpointQ : ℝ) :=
    mul_nonneg (div_nonneg (Real.sqrt_nonneg _) htwo) hA.le
  have hprefHiNonneg : 0 ≤ ((sqrtPiHi : ℝ) / 2) * (midpointQ : ℝ) :=
    mul_nonneg (div_nonneg hpHi htwo) hA.le
  constructor
  · have hlo :
        ((sqrtPiLo : ℝ) / 2) * (midpointQ : ℝ) * (momentLower : ℝ) ≤
          (Real.sqrt Real.pi / 2) * (midpointQ : ℝ) *
            OriginalPositiveMoment.moment 0 ((midpointQ : ℝ) ^ 2) :=
      (mul_le_mul_of_nonneg_right hprefLo hjlo).trans
        (mul_le_mul_of_nonneg_left hj.1 hprefNonneg)
    simpa only [scalarLower, Rat.cast_mul, Rat.cast_div, Rat.cast_ofNat, seedScalar]
      using hlo
  · have hhi :
        (Real.sqrt Real.pi / 2) * (midpointQ : ℝ) *
            OriginalPositiveMoment.moment 0 ((midpointQ : ℝ) ^ 2) ≤
          ((sqrtPiHi : ℝ) / 2) * (midpointQ : ℝ) * (momentUpper : ℝ) :=
      (mul_le_mul_of_nonneg_right hprefHi hjnonneg).trans
        (mul_le_mul_of_nonneg_left hj.2 hprefHiNonneg)
    simpa only [scalarUpper, Rat.cast_mul, Rat.cast_div, Rat.cast_ofNat, seedScalar]
      using hhi

/-- A strict positive lower bound at the exact imported midpoint. -/
theorem seedScalar_gt :
    (49 : ℝ) / 50 < seedScalar ((midpoint : ℝ) / (scale : ℝ)) := by
  have hlo : (49 : ℝ) / 50 < (scalarLower : ℝ) := by
    simpa only [Rat.cast_div, Rat.cast_ofNat] using
      (Rat.cast_lt (K := ℝ)).mpr scalar_guards.1
  have h := hlo.trans_le scalar_mem.1
  simpa only [midpointQ, Rat.cast_div, Rat.cast_intCast] using h

/-- The recorded dyadic center encloses the actual common scalar with the
claimed absolute radius, without an analytic or numerical error premise. -/
theorem seedScalar_sub_shat_abs_le :
    |seedScalar ((midpoint : ℝ) / (scale : ℝ)) - (shat : ℝ)| ≤
      (784 : ℝ) / 10 ^ 24 := by
  have hlo : (shat : ℝ) - (scalarRadius : ℝ) ≤ (scalarLower : ℝ) := by
    simpa only [Rat.cast_sub] using
      (Rat.cast_le (K := ℝ)).mpr scalar_guards.2.1
  have hhi : (scalarUpper : ℝ) ≤ (shat : ℝ) + (scalarRadius : ℝ) := by
    simpa only [Rat.cast_add] using
      (Rat.cast_le (K := ℝ)).mpr scalar_guards.2.2
  have habs : |seedScalar (midpointQ : ℝ) - (shat : ℝ)| ≤ (scalarRadius : ℝ) := by
    apply abs_le.mpr
    constructor
    · apply (le_sub_iff_add_le).2
      simpa only [sub_eq_add_neg, add_comm] using hlo.trans scalar_mem.1
    · apply (sub_le_iff_le_add).2
      simpa only [add_comm] using scalar_mem.2.trans hhi
  simpa only [midpointQ, scalarRadius, Rat.cast_div, Rat.cast_intCast,
    Rat.cast_pow, Rat.cast_ofNat] using habs

end
end Grothe.UpperChaos.ConditionalSourceRow227Scalar

/-- info: 'Grothe.UpperChaos.ConditionalSourceRow227Scalar.scalar_mem' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSourceRow227Scalar.scalar_mem

/-- info: 'Grothe.UpperChaos.ConditionalSourceRow227Scalar.seedScalar_gt' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSourceRow227Scalar.seedScalar_gt

/-- info: 'Grothe.UpperChaos.ConditionalSourceRow227Scalar.seedScalar_sub_shat_abs_le' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSourceRow227Scalar.seedScalar_sub_shat_abs_le
