import Grothe.Lower.SharedGateSaving
import Grothe.LowerAnalytic.LowerBound
import Grothe.StatementBridges

set_option warningAsError true

/-!
# A lower bound from the common gate of the two active Gaussian rows

The finite cover uses scalar mixtures and discounted mixtures of the two
shared rows. Their common gate improves the witness cap at every residual scale.

Agent-ID: codex-a7c4
-/

open Grothe.Lower

namespace Grothe.LowerAnalytic

theorem sharedGate_profile {F : Type} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    (V t : ℝ) (Qh v : F) (hv : ‖v‖ ^ 2 = 2) (h0 : 0 ≤ t) (h9 : t ≤ 9 / 10)
    (hmass : V ≤ (1 - 1 / 2) * t ^ 2 + 1 / 2 + (massS : ℝ) - (ε : ℝ) * ‖Qh‖ ^ 2)
    (hred : SharedReduction rowData V t Qh v) : V ≤ (SharedGate.hatCap : ℝ) := by
  obtain ⟨c, hc, hlo, hhi⟩ := chainTo_sound AffineEnvCell.lo AffineEnvCell.hi SharedGate.cells
    0 (9 / 10) SharedGate.check.1 t (by simpa using h0) (by push_cast; exact h9)
  rcases Bool.or_eq_true_iff.mp (List.all_eq_true.mp SharedGate.check.2 c hc) with hscalar | hshared
  · exact affineCell_bound rowData massS SharedGate.hatCap c hscalar hv hlo hhi (envRows_of_shared hmass hred)
  · exact SharedGate.cell_bound c hshared hv hred hlo hhi

theorem sharedGate_lower_of_tailNodeCaps (hcaps : TailNodeCaps (nuHat (47 / 2000))) {K : ℝ}
    (hK : IsGrothendieckBound K) : (SharedGate.endpoint : ℝ) ≤ K := by
  have hbound (n : ℕ) (hn : 2 ≤ n) :
      WitnessCap n (191 / 250) (47 / 2000) ((1 - 47 / 2000) * (SharedGate.hatCap : ℝ) + 47 / 2000) :=
    witnessCap_of_profile_upper (@sharedGate_profile) hcaps n hn
  simpa only [SharedGate.endpoint, Rat.cast_div, Rat.cast_one, Rat.cast_sub, Rat.cast_mul,
    Rat.cast_add, Rat.cast_ofNat] using
    transfer_lower (transferInputs_of_witnessCap (by norm_num) (by norm_num) 2 hbound) hK

end Grothe.LowerAnalytic

namespace Grothe.Statement

theorem sharedGateEndpoint_le_of_tailNodeCaps
    (hcaps : LowerAnalytic.TailNodeCaps (LowerAnalytic.nuHat (47 / 2000)))
    (hne : ∃ K, IsBound K) : (SharedGate.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  le_csInf hne fun _ hK => LowerAnalytic.sharedGate_lower_of_tailNodeCaps hcaps (isBound_iff.mp hK)

end Grothe.Statement
