import Grothe.Research.LawNodeLower

/-!
# A new finite cover with the existing Gaussian source hypotheses

The rows, mixed node certificates and witness remain those of the existing lower proof.
Only the rational cap and the finite cover may change. `checkCover` checks every box and
the complete parameter partition; the existing row and batch chunks supply their unchanged
checks without depending on the old cover chunks. The Gaussian reduction still requires
exactly `NodeCaps`.

This module introduces no particular refined cover or improved numerical endpoint.
`lower_bound_of_refined_cover` is the interface for a separately checked finite cover.
-/

open MeasureTheory Grothe.Lower Grothe.LowerAnalytic

namespace Grothe.Research.RefinedLower

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Replace the finite cover and its cap, retaining all certified rows and batches. -/
theorem profile_bound_of_refined_cover (B : ℚ) (cuts boxes : List String)
    (hcover : checkCover rowData mixedBatches B cuts boxes = true)
    (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hcrude : RowOf crudeRow V t Qh v) (hred : SharedReduction rowData V t Qh v) :
    V ≤ (B : ℝ) := by
  exact LawNodeLower.profile_bound_of_law_nodes [] B cuts boxes (by rfl)
    (by simpa only [List.append_nil] using hcover) V t Qh v hv ht0 ht1 hcrude hred

/-- The same phase reduction converts a refined profile cap into a scalar witness cap. -/
theorem witnessCap_of_refined_cover_reduction (B : ℚ) (cuts boxes : List String)
    (hcover : checkCover rowData mixedBatches B cuts boxes = true) (n : ℕ)
    (hred : ∀ f g : L2G n, f ∈ Unimod (stdGaussian (n + n)) →
      g ∈ Unimod (stdGaussian (n + n)) → 0 ≤ VOf n f g → ReductionHyp n f g) :
    WitnessCap n (B : ℝ) := by
  exact LawNodeLower.witnessCap_of_law_nodes_reduction [] B cuts boxes (by rfl)
    (by simpa only [List.append_nil] using hcover) n hred

/-- The refined scalar cap uses exactly the existing Gaussian `NodeCaps` assumption. -/
theorem witnessCap_of_refined_cover (B : ℚ) (cuts boxes : List String)
    (hcover : checkCover rowData mixedBatches B cuts boxes = true)
    (hcaps : NodeCaps) (n : ℕ) (hn : 2 ≤ n) : WitnessCap n (B : ℝ) := by
  exact LawNodeLower.witnessCap_of_law_nodes [] B cuts boxes (by rfl)
    (by simpa only [List.append_nil] using hcover) hcaps n hn

/-- A complete refined finite cover supplies the existing all-dimensional transfer inputs. -/
theorem transferInputs_of_refined_cover (B : ℚ) (cuts boxes : List String)
    (hcover : checkCover rowData mixedBatches B cuts boxes = true) (hcaps : NodeCaps) :
    TransferInputsL2 (B : ℝ) :=
  transferInputs_of_witnessCap 2 (fun n hn =>
    witnessCap_of_refined_cover B cuts boxes hcover hcaps n hn)

/-- Any newly checked cover gives its reciprocal lower bound under the same `NodeCaps`. -/
theorem lower_bound_of_refined_cover (B : ℚ) (cuts boxes : List String)
    (hcover : checkCover rowData mixedBatches B cuts boxes = true) (hcaps : NodeCaps)
    {K : ℝ} (hK : IsGrothendieckBound K) : 1 / (B : ℝ) ≤ K :=
  transfer_lower (transferInputs_of_refined_cover B cuts boxes hcover hcaps) hK

/-- A strict displayed endpoint follows by a separate rational comparison with `1 / B`. -/
theorem strict_lower_bound_of_refined_cover (L B : ℚ) (cuts boxes : List String)
    (hcover : checkCover rowData mixedBatches B cuts boxes = true) (hcaps : NodeCaps)
    (hL : (L : ℝ) < 1 / (B : ℝ)) {K : ℝ} (hK : IsGrothendieckBound K) : (L : ℝ) < K :=
  hL.trans_le (lower_bound_of_refined_cover B cuts boxes hcover hcaps hK)

#print axioms profile_bound_of_refined_cover
#print axioms witnessCap_of_refined_cover_reduction
#print axioms witnessCap_of_refined_cover
#print axioms transferInputs_of_refined_cover
#print axioms lower_bound_of_refined_cover
#print axioms strict_lower_bound_of_refined_cover

end

end Grothe.Research.RefinedLower
