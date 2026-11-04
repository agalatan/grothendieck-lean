import Grothe.UpperChaos.Q0GaussProductionMass
import Grothe.UpperChaos.ProfileRootSound
import Grothe.UpperChaos.OriginalMomentSeedData
import Grothe.UpperChaos.ConditionalShiftEnclosure

/-!
# Actual source-row 227 shift versus the saved seed midpoint

This uses the original panel 4 / rule 31 address, the selected order-62
root's actual bracket, and the existing centered profile evaluator. The
numerical endpoint checks are explicit kernel checks, not hypotheses.
The saved midpoint is only proved close to the actual shift, never equal.
No coefficient reconstruction, seed-scalar enclosure, transport theorem,
or finite-to-actual allowance is included here.

Arithmetic source: row227-physical-binding-audit.json, SHA256
807f6909a1bd77fe6aa637c7e41ff9cda5e49b70200afc6395c6f68e38b6c56b.
Agent-ID: codex-aa04. Refs #21.
-/

namespace Grothe.UpperChaos.ConditionalSourceRow227Shift

open Q0GaussAddress Q0GaussAddressScan Q0GaussOrdinalEquiv Q0GaussProductionMass
open F0ConditionalEvaluator

/-- The original zero-based source coordinates, independent of toAddress. -/
def address : Address :=
  ⟨⟨4, by decide +kernel⟩, ⟨31, by decide +kernel⟩⟩

theorem panel_eq : sourcePanels.get address.1 = (⟨1, 2, 62, 196⟩ : Panel) := by
  decide +kernel

theorem address_ordinal : (fromAddress address).val = 227 := by decide +kernel

/-- Reduce only the known order selector, not any root or context table. -/
private theorem selected62_root (h : 1 ≤ 62 ∧ 62 ≤ 64) (i : Fin 62) :
    (Q0GaussSelectedChoice.selectedFor 62 h).root i = Q0GaussSelectedRule62.root i := by
  rfl

theorem sourceRoot_eq :
    sourceRoot address = Q0GaussSelectedRule62.root (31 : Fin 62) := by
  have ho : (sourcePanels.get address.1).order = 62 := congrArg Panel.order panel_eq
  have h := selected_root_congr ho (source_order_bounds address)
    (by decide : 1 ≤ 62 ∧ 62 ≤ 64) address.2 (31 : Fin 62) (by rfl)
  exact h.trans (selected62_root _ _)

theorem sourceNode_eq :
    sourceNode address = 3 / 2 + Q0GaussSelectedRule62.root (31 : Fin 62) / 2 := by
  simp only [sourceNode, panel_eq, sourceRoot_eq, Q0LegendreInteger.panelNode]
  ring

def rootLowerZ : ℤ :=
  114650899874979377689273316031068338956467605415691762931839861847958546058901462010762880492528003872455326791093334887479914695971648255193455885081050717937389912377384486361059252343372655
def rootUpperZ : ℤ :=
  114650899874979377689273316031068338956467605415691762931839861847958546058901462010762880492528003872455326791093334887479914695971648255193455885081050717937389912377384486361059252343372658
def rootLo : ℚ := (rootLowerZ : ℚ) / (Q0LegendreRuleBase.denominator : ℚ)
def rootHi : ℚ := (rootUpperZ : ℚ) / (Q0LegendreRuleBase.denominator : ℚ)

def nodeLo : ℚ := 514699077763439272113483351139629922918 / (2 : ℚ) ^ 128
def nodeHi : ℚ := 514699077763439272113483351139629922919 / (2 : ℚ) ^ 128

theorem root_mem :
    (rootLo : ℝ) ≤ Q0GaussSelectedRule62.root (31 : Fin 62) ∧
      Q0GaussSelectedRule62.root (31 : Fin 62) ≤ (rootHi : ℝ) := by
  simpa only [rootLo, rootHi, rootLowerZ, rootUpperZ,
    Rat.cast_div, Rat.cast_intCast, Set.mem_Icc] using Q0GaussSelectedRule62.specr31.1

private theorem node_arithmetic :
    nodeLo ≤ 3 / 2 + rootLo / 2 ∧ 3 / 2 + rootHi / 2 ≤ nodeHi := by
  decide +kernel

theorem sourceNode_mem :
    (nodeLo : ℝ) ≤ sourceNode address ∧ sourceNode address ≤ (nodeHi : ℝ) := by
  have hl : (nodeLo : ℝ) ≤ 3 / 2 + (rootLo : ℝ) / 2 := by
    have h := (Rat.cast_le (K := ℝ)).mpr node_arithmetic.1
    simpa only [Rat.cast_add, Rat.cast_div, Rat.cast_ofNat] using h
  have hu : 3 / 2 + (rootHi : ℝ) / 2 ≤ (nodeHi : ℝ) := by
    have h := (Rat.cast_le (K := ℝ)).mpr node_arithmetic.2
    simpa only [Rat.cast_add, Rat.cast_div, Rat.cast_ofNat] using h
  rw [sourceNode_eq]
  constructor
  · linarith [root_mem.1]
  · linarith [root_mem.2]

def profileRow : ProfileRootScreen.Row := ⟨nodeLo, nodeHi, false⟩
def profileLowerZ : ℤ := 100954445748654391508608534115898241127
def profileUpperZ : ℤ := 100954445748654391508852243803249414424
def profileLo : ℚ := (profileLowerZ : ℚ) / (GrotheKernel.D : ℚ)
def profileHi : ℚ := (profileUpperZ : ℚ) / (GrotheKernel.D : ℚ)

/-- The existing production centered Horner evaluator, including its own
outward rounding, gives these endpoints; this is not historical rational Horner. -/
theorem profile_evaluation :
    (ProfileRootScreen.evalRow profileRow).lo = profileLowerZ ∧
      (ProfileRootScreen.evalRow profileRow).hi = profileUpperZ := by
  decide +kernel

theorem scaled_profile_mem :
    (profileLo : ℝ) ≤ Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof (sourceNode address) ∧
      Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof (sourceNode address) ≤ (profileHi : ℝ) := by
  have hm := ProfileRootScreen.row_horner_mem profileRow (sourceNode address)
    sourceNode_mem.1 sourceNode_mem.2
  rw [ProfileRootScreen.centered_horner_profile] at hm
  change ((ProfileRootScreen.evalRow profileRow).lo : ℝ) ≤
      (Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof (sourceNode address)) *
        (GrotheKernel.D : ℝ) ∧
    (Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof (sourceNode address)) *
        (GrotheKernel.D : ℝ) ≤ (ProfileRootScreen.evalRow profileRow).hi at hm
  rw [profile_evaluation.1, profile_evaluation.2] at hm
  constructor
  · have h := (div_le_iff₀ Upper.D_pos).2 hm.1
    simpa only [profileLo, Rat.cast_div, Rat.cast_intCast] using h
  · have h := (le_div_iff₀ Upper.D_pos).2 hm.2
    simpa only [profileHi, Rat.cast_div, Rat.cast_intCast] using h

private theorem profileLo_pos : 0 < profileLo := by decide +kernel

/-- The source profile is positive, so the canonical words need no sign twist. -/
theorem profile_pos : 0 < vprof (sourceNode address) := by
  have hp : (0 : ℝ) < profileLo := (Rat.cast_pos (K := ℝ)).mpr profileLo_pos
  have hb : 0 < Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof (sourceNode address) :=
    hp.trans_le scaled_profile_mem.1
  have hsqrt : 0 < Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) :=
    Real.sqrt_pos.2 (by positivity)
  exact (mul_pos_iff_of_pos_left hsqrt).mp hb

theorem profileSign_eq_one : profileSign (sourceNode address) = 1 := by
  simp only [profileSign, not_lt_of_ge profile_pos.le, if_false]

/-- The actual fixed-source coefficient equals the canonical evaluator at
the actual shift, with its original Hermite index order and no phase factor. -/
theorem actual_coefficient_eq_canonical (i : ℕ × ℕ) :
    F0ConditionalNode.coefficient (sourceNode address) i =
      canonicalCoefficient (profileShift (sourceNode address)) i := by
  rw [coefficient_eq_signed (sourceNode address) (sourceNode_nonneg address)
    profile_pos.ne' i, profileSign_eq_one]
  simp only [Complex.ofReal_one, one_pow, one_mul]

theorem profileScale_mem :
    (profileLo : ℝ) ≤ profileScale (sourceNode address) ∧
      profileScale (sourceNode address) ≤ (profileHi : ℝ) := by
  have hp : (0 : ℝ) < profileLo := (Rat.cast_pos (K := ℝ)).mpr profileLo_pos
  have hb : 0 < Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof (sourceNode address) :=
    hp.trans_le scaled_profile_mem.1
  simpa only [profileScale_eq_abs_scaled_profile, abs_of_pos hb] using scaled_profile_mem

def shiftLo : ℚ := 4145443198320354695 / 10 ^ 18
def shiftHi : ℚ := 4145443198320354696 / 10 ^ 18
def shiftRadius : ℚ := 2 / 10 ^ 18

private theorem shift_nonnegative : 0 ≤ shiftLo ∧ 0 ≤ shiftHi := by decide +kernel

private theorem squared_guards :
    (shiftLo * profileHi) ^ 2 ≤ nodeLo ∧
      nodeHi ≤ (shiftHi * profileLo) ^ 2 := by
  decide +kernel

/-- The bound is for the actual source-node shift and proves profile nonvanishing. -/
theorem actual_shift_mem :
    vprof (sourceNode address) ≠ 0 ∧
      (shiftLo : ℝ) ≤ profileShift (sourceNode address) ∧
      profileShift (sourceNode address) ≤ (shiftHi : ℝ) := by
  have hb : (0 : ℝ) < profileLo := (Rat.cast_pos (K := ℝ)).mpr profileLo_pos
  have haLo : (0 : ℝ) ≤ shiftLo := by
    simpa only [Rat.cast_zero] using (Rat.cast_le (K := ℝ)).mpr shift_nonnegative.1
  have haHi : (0 : ℝ) ≤ shiftHi := by
    simpa only [Rat.cast_zero] using (Rat.cast_le (K := ℝ)).mpr shift_nonnegative.2
  have hLower : ((shiftLo : ℝ) * (profileHi : ℝ)) ^ 2 ≤ (nodeLo : ℝ) := by
    simpa only [Rat.cast_pow, Rat.cast_mul] using (Rat.cast_le (K := ℝ)).mpr squared_guards.1
  have hUpper : (nodeHi : ℝ) ≤ ((shiftHi : ℝ) * (profileLo : ℝ)) ^ 2 := by
    simpa only [Rat.cast_pow, Rat.cast_mul] using (Rat.cast_le (K := ℝ)).mpr squared_guards.2
  exact profileShift_mem_of_squared_bounds (sourceNode address) nodeLo nodeHi
    profileLo profileHi shiftLo shiftHi (sourceNode_nonneg address)
    sourceNode_mem.1 sourceNode_mem.2 hb profileScale_mem.1 profileScale_mem.2
    haLo haHi hLower hUpper

/-- Exact comparisons to the one saved midpoint, without identifying it
with the physical shift. The checkpoint table is not evaluated here. -/
private theorem midpoint_guards :
    OriginalMomentSeedData.midpointQ - shiftRadius ≤ shiftLo ∧
      shiftHi ≤ OriginalMomentSeedData.midpointQ + shiftRadius := by
  decide +kernel

/-- Concrete original-address-to-midpoint error, with no numerical premises. -/
theorem actual_shift_midpoint_error :
    vprof (sourceNode address) ≠ 0 ∧
      |profileShift (sourceNode address) -
        (OriginalMomentSeedData.midpoint : ℝ) / (OriginalMomentSeedData.scale : ℝ)| ≤
        (2 : ℝ) / 10 ^ 18 := by
  have hl : (OriginalMomentSeedData.midpointQ : ℝ) - (shiftRadius : ℝ) ≤ (shiftLo : ℝ) := by
    simpa only [Rat.cast_sub] using (Rat.cast_le (K := ℝ)).mpr midpoint_guards.1
  have hu : (shiftHi : ℝ) ≤ (OriginalMomentSeedData.midpointQ : ℝ) + (shiftRadius : ℝ) := by
    simpa only [Rat.cast_add] using (Rat.cast_le (K := ℝ)).mpr midpoint_guards.2
  refine ⟨actual_shift_mem.1, ?_⟩
  have h := profileShift_midpoint_error (sourceNode address) shiftLo shiftHi
    OriginalMomentSeedData.midpointQ shiftRadius actual_shift_mem.2.1 actual_shift_mem.2.2 hl hu
  simpa only [OriginalMomentSeedData.midpointQ, shiftRadius,
    Rat.cast_div, Rat.cast_intCast, Rat.cast_pow, Rat.cast_ofNat] using h

end Grothe.UpperChaos.ConditionalSourceRow227Shift

/-- info: 'Grothe.UpperChaos.ConditionalSourceRow227Shift.actual_shift_mem' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSourceRow227Shift.actual_shift_mem

/-- info: 'Grothe.UpperChaos.ConditionalSourceRow227Shift.actual_coefficient_eq_canonical' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSourceRow227Shift.actual_coefficient_eq_canonical

/-- info: 'Grothe.UpperChaos.ConditionalSourceRow227Shift.actual_shift_midpoint_error' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSourceRow227Shift.actual_shift_midpoint_error
