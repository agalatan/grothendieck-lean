import Grothe.Upper.Final
import Grothe.UpperReplacement.TailInputs

set_option warningAsError true

/-!
# First-coefficient deductions for the individual Hardy tails

Agent-ID: codex-a7c4. The GT table and the phase coefficient π/4 give
family-specific floors. Multiplying by each primary constant coefficient
gives the forced energy on its circle. The cell channel uses the full budget.
-/

namespace Grothe.UpperReplacement.LinearTail

open Finset Polynomial Upper TailInputs

def gtFirst : ℚ := 7181579359 / 10 ^ 10

def phaseFirst : ℚ := 785398163397 / 10 ^ 12

def linearLower (i : Fin 18) : ℚ :=
  (match (channelAt i).kind with
   | .gt => gtFirst
   | .phase => phaseFirst
   | .tiger => 0) * (channelAt i).primary.getD 0 0

/-- The upward-rounded ceilings for the tail from index 251. -/
def ceiling (i : Fin 18) : ℚ :=
  (match i.val with
  | 0 => 214440422
  | 1 => 1639542401
  | 2 => 43534670
  | 3 => 269467216059
  | 4 => 296329361382
  | 5 => 296305430504
  | 6 => 295490858801
  | 7 => 24137727
  | 8 => 295858987405
  | 9 => 296167126881
  | 10 => 295768624495
  | 11 => 291018944063
  | 12 => 296348778273
  | 13 => 271626324663
  | 14 => 275532996788
  | 15 => 1
  | 16 => 271150858635
  | _ => 269532804807) / 10 ^ 15

theorem first_energy_checked : (718159430018 / 10 ^ 12 : ℚ) ≤ energyTable (1, 0) := by
  native_decide

set_option maxRecDepth 10000 in
theorem estimates_checked : ∀ i : Fin 18,
    0 ≤ (channelAt i).primary.getD 0 0 ∧ 0 ≤ linearLower i ∧ 0 ≤ ceiling i ∧
    ((budget i - linearLower i ^ 2 * radius i ^ 2) / radius i ^ 4) *
      (radius i)⁻¹ ^ 1002 ≤ ceiling i ^ 2 * (1 - (radius i)⁻¹ ^ 4) ∧
    ((channelAt i).kind = .tiger → ceiling i = tail i) := by
  native_decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
theorem weighted_ceiling :
    ((List.finRange 18).map fun i ↦ (channelAt i).weight * ceiling i).sum ≤
      (225168500 / 10 ^ 15 : ℚ) := by
  decide +kernel

end Grothe.UpperReplacement.LinearTail
