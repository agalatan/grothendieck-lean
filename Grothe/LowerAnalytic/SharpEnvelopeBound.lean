import Grothe.LowerAnalytic.LowerBound
import Grothe.Lower.Cert.SharpEnvelope
import Grothe.StatementBridges

set_option warningAsError true

/-!
# Lower bound from the sharp mixture of the certified scalar rows

The same tail node caps as the original certificate supply the Gaussian
witness. The affine envelope gives its smaller scalar cap.

Agent-ID: codex-a7c4
-/

open Grothe.Lower

namespace Grothe.LowerAnalytic

theorem sharp_lower_bound_of_tailNodeCaps (hcaps : TailNodeCaps (nuHat (47 / 2000))) {K : ℝ}
    (hK : IsGrothendieckBound K) : (SharpEnvelope.endpoint : ℝ) ≤ K := by
  have hbound (n : ℕ) (hn : 2 ≤ n) :
      WitnessCap n (191 / 250) (47 / 2000) ((1 - 47 / 2000) * (SharpEnvelope.hatCap : ℝ) + 47 / 2000) :=
    witnessCap_of_profile_upper (fun _ _ _ _ hv h0 h9 hm hr =>
      affineEnvelope_bound rowData massS SharpEnvelope.hatCap SharpEnvelope.cells
        SharpEnvelope.check hv h0 h9 (envRows_of_shared hm hr)) hcaps n hn
  simpa only [SharpEnvelope.endpoint, Rat.cast_div, Rat.cast_one, Rat.cast_sub, Rat.cast_mul,
    Rat.cast_add, Rat.cast_ofNat] using
    transfer_lower (transferInputs_of_witnessCap (by norm_num) (by norm_num) 2 hbound) hK

end Grothe.LowerAnalytic

namespace Grothe.Statement

/-- The constant is at least the reciprocal of the sharp scalar cap when the node caps hold. -/
theorem sharpEndpoint_le_of_tailNodeCaps
    (hcaps : LowerAnalytic.TailNodeCaps (LowerAnalytic.nuHat (47 / 2000)))
    (hne : ∃ K, IsBound K) : (SharpEnvelope.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  le_csInf hne fun _ hK => LowerAnalytic.sharp_lower_bound_of_tailNodeCaps hcaps (isBound_iff.mp hK)

end Grothe.Statement
