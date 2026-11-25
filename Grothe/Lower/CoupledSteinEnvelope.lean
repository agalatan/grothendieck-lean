import Grothe.Lower.Cert.CoupledStein
import Grothe.Lower.WeightedTightEnvelope
import Grothe.LowerAnalytic.CoupledSteinWeights

set_option warningAsError true

/-!
# The full amplitude envelope for the coupled Stein rows

Every mass tangent belongs to its parent cell. Every pair of distinct row slopes
can use an affine weight; the scale-law discount applies on the central pair.

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.CoupledStein

open WeightedTight (Segment)
open Grothe.LowerAnalytic
open Grothe.LowerAnalytic.CoupledStein (prices approxDiscount)

def cells := envCellsTight.flatMap (WeightedTight.segments true)

private theorem checks :
    chainTo (fun s : Segment ↦ s.base.lo) (fun s ↦ s.base.hi) 0 (9/10) cells = true ∧
    cells.all (WeightedTight.segmentOK cap approxDiscount) = true ∧
    cells.all (fun s ↦ !s.active || decide
      (s.leftWeight ∈ prices.map Prod.fst ∧ s.rightWeight ∈ prices.map Prod.fst)) = true := by
  decide +kernel

/-- The amplitude cap with explicit assumptions only on the nine prices used by the certificate. -/
theorem profile_bound {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hv : ‖v‖^2 = 2) (ht₀ : 0 ≤ t) (ht₁ : t ≤ 9/10)
    (hrows : ∀ k m a, envRowAtPure envRowsTight massS m k = some a → RowOf a V t Qh v)
    (hsave : ∀ w ∈ prices.map Prod.fst, ∀ z ∈ prices.map Prod.fst, 0 ≤ w → w ≤ 1 →
      0 ≤ z → z ≤ 1 → ∀ x : ℝ, 0 ≤ x → x ≤ 1 →
      let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
      ∃ d8 d9 : ℝ, (1-x)*(approxDiscount w : ℝ)+x*(approxDiscount z : ℝ) ≤ (1-θ)*d8+θ*d9 ∧
        RowHolds ε TightShared.row8.ell TightShared.row8.beta ((TightShared.row8.C : ℝ)-d8) V t Qh v ∧
        RowHolds ε TightShared.row9.ell TightShared.row9.beta ((TightShared.row9.C : ℝ)-d9) V t Qh v) :
    V ≤ (cap : ℝ) := by
  apply WeightedTight.profile_bound_of cells cap approxDiscount ⟨checks.1,checks.2.1⟩ hv ht₀ ht₁ hrows
  intro s hs ha
  have h := List.all_eq_true.mp checks.2.2 s hs
  simp only [ha, Bool.not_true, Bool.false_or, decide_eq_true_eq] at h
  exact hsave _ h.1 _ h.2

end Grothe.Lower.CoupledStein
