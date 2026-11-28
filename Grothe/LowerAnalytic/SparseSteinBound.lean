import Grothe.Lower.SparseSteinEnvelope
import Grothe.LowerAnalytic.SparseSteinRows
import Grothe.LowerAnalytic.LowerBoundTight
import Grothe.StatementBridges

set_option warningAsError true

/-!
# Sparse transported Stein cuts in the identity-tail witness

The actual cubic supplies the shared scale for each pair of rows. The existing
node caps and witness transfer convert the resulting amplitude cap into a
lower endpoint for the complex Grothendieck constant.

Agent-ID: codex-a7c4
-/

open Grothe.Lower

namespace Grothe.LowerAnalytic.SparseStein

theorem midpoint_profile {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (V t : ℝ) (Qh v : E) (hv : ‖v‖^2 = 2) (ht₀ : 0 ≤ t) (ht₁ : t ≤ 9/10)
    (hmass : V ≤ (1-1/2)*t^2+1/2+(massS : ℝ)-(ε : ℝ)*‖Qh‖^2)
    (hred : CircularSharedReduction rowData V t Qh v) : V ≤ (SparseEnvelope.Midpoint.cap : ℝ) := by
  exact SparseEnvelope.midpoint_profile_bound hv ht₀ ht₁ hred (tight_scalar_rows V t Qh v hmass hred)
    (actual_deductions hred)

theorem midpoint_lower_of_nodeCaps (hcaps : TailNodeCaps (nuHat (47/2000))) {K : ℝ}
    (hK : IsGrothendieckBound K) : (SparseEnvelope.Midpoint.endpoint : ℝ) ≤ K := by
  simpa only [SparseEnvelope.Midpoint.endpoint,Rat.cast_div,Rat.cast_one,Rat.cast_sub,Rat.cast_mul,Rat.cast_add,
    Rat.cast_ofNat] using
    transfer_lower (transferInputs_of_witnessCap (by norm_num) (by norm_num) 2
      (witnessCap_of_circular_profile (@midpoint_profile) hcaps)) hK

theorem profile {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (V t : ℝ) (Qh v : E) (hv : ‖v‖^2 = 2) (ht₀ : 0 ≤ t) (ht₁ : t ≤ 9/10)
    (hmass : V ≤ (1-1/2)*t^2+1/2+(massS : ℝ)-(ε : ℝ)*‖Qh‖^2)
    (hred : CircularSharedReduction rowData V t Qh v) : V ≤ (SparseEnvelope.cap : ℝ) := by
  exact (midpoint_profile V t Qh v hv ht₀ ht₁ hmass hred).trans (Rat.cast_le.mpr SparseEnvelope.Midpoint.cap_le)

theorem lower_of_nodeCaps (hcaps : TailNodeCaps (nuHat (47/2000))) {K : ℝ}
    (hK : IsGrothendieckBound K) : (SparseEnvelope.endpoint : ℝ) ≤ K :=
  (Rat.cast_le.mpr SparseEnvelope.Midpoint.endpoint_lt.le).trans (midpoint_lower_of_nodeCaps hcaps hK)

end Grothe.LowerAnalytic.SparseStein

namespace Grothe.Statement

theorem sparseSteinEndpoint_le_of_tailNodeCaps
    (hcaps : LowerAnalytic.TailNodeCaps (LowerAnalytic.nuHat (47/2000))) (hne : ∃ K, IsBound K) :
    (Lower.SparseEnvelope.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  le_csInf hne fun _ hK ↦ LowerAnalytic.SparseStein.lower_of_nodeCaps hcaps (isBound_iff.mp hK)

/-- The finite-matrix endpoint of the bisected central interval. -/
theorem sparseMidpointEndpoint_le_of_tailNodeCaps
    (hcaps : LowerAnalytic.TailNodeCaps (LowerAnalytic.nuHat (47/2000))) (hne : ∃ K, IsBound K) :
    (Lower.SparseEnvelope.Midpoint.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  le_csInf hne fun _ hK ↦ LowerAnalytic.SparseStein.midpoint_lower_of_nodeCaps hcaps (isBound_iff.mp hK)

end Grothe.Statement
