-- Grothe/Research/LawNodeLower.lean
import Grothe.Lower.FiniteMix
import Grothe.LowerAnalytic.Reduction
import Grothe.Lower.Cert.Rows0
import Grothe.Lower.Cert.Rows1
import Grothe.Lower.Cert.Rows2
import Grothe.Lower.Cert.Rows3
import Grothe.Lower.Cert.Rows4
import Grothe.Lower.Cert.Batches0
import Grothe.Lower.Cert.Batches1
import Grothe.Lower.Cert.Batches2

/-!
# Extend the checked lower law nodes without changing the Gaussian source hypotheses

The original row checks and mixed-batch checks are reused. Additional batches must pass
`checkBatch rowData`; a separately checked cover may refer to the concatenated batch list.
All row potentials, the witness and the Gaussian `NodeCaps` assumption remain unchanged.
The interface permits any extra batch accepted by the existing checker, including pure-row
Stein certificates at new law scales. No particular new node or endpoint is asserted here.
-/

open MeasureTheory Grothe.Lower Grothe.LowerAnalytic

namespace Grothe.Research.LawNodeLower

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The existing row chunks certify all unchanged rows, independently of any cover. -/
theorem certified_rows : rowData.all checkRow = true :=
  all_of_chunk _ _ 0 4 certRows0 <| all_of_chunk _ _ 4 4 certRows1 <|
    all_of_chunk _ _ 8 4 certRows2 <| all_of_chunk _ _ 12 4 certRows3 <|
    all_of_chunk _ _ 16 4 certRows4 <| all_drop_of_le _ _ _ (by decide +kernel)

/-- The existing batch chunks certify all original batches, independently of any cover. -/
theorem certified_mixed_batches : mixedBatches.all (checkBatch rowData) = true :=
  all_of_chunk _ _ 0 7 certBatches0 <| all_of_chunk _ _ 7 7 certBatches1 <|
    all_of_chunk _ _ 14 7 certBatches2 <| all_drop_of_le _ _ _ (by decide +kernel)

/-- Checking the additional batches suffices for the entire extended batch list. -/
theorem extended_batches_checked (extraBatches : List JBatch)
    (hextra : extraBatches.all (checkBatch rowData) = true) :
    (mixedBatches ++ extraBatches).all (checkBatch rowData) = true := by
  simp only [List.all_append, certified_mixed_batches, hextra, Bool.and_self]

/-- A checked extended law-node list and complete cover bound the original profile. -/
theorem profile_bound_of_law_nodes (extraBatches : List JBatch) (B : ℚ) (cuts : List String) (boxes : List MixBox)
    (hextra : extraBatches.all (checkBatch rowData) = true)
    (hcover : checkMixCover rowData (mixedBatches ++ extraBatches) B cuts boxes = true)
    (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hcrude : RowOf crudeRow V t Qh v) (hred : SharedReduction rowData V t Qh v) :
    V ≤ (B : ℝ) := by
  have hrows : rowData.all checkRow = true := certified_rows
  have hbatches : (mixedBatches ++ extraBatches).all (checkBatch rowData) = true :=
    extended_batches_checked extraBatches hextra
  simp only [List.all_eq_true] at hrows hbatches
  obtain ⟨Ω, _, μ, _, U, X1, X2, X3, τ, x, hM, hSI, hτ0, hτ1, hX, hshared⟩ := hred
  have hS : SteinCut μ U := steinCut_of_inputs μ hM hSI
  have hscal : ∀ k a, envRowAt rowData k = some a → RowOf a V t Qh v := by
    rintro (_ | k) a h
    · cases h
      exact hcrude
    · obtain ⟨r, hr, rfl⟩ := Option.map_eq_some_iff.1 h
      have hm := List.mem_of_getElem? hr
      exact rowOf_of_shared r (hrows r hm) hM hS hτ0 hτ1 hX (hshared r hm)
  simp only [RowShared] at hshared
  choose! Ψ hΨ using hshared
  exact mixCover_bound rowData (mixedBatches ++ extraBatches) hrows hbatches B cuts boxes hcover
    X1 X2 X3 τ hX hM hS V t Qh v hv Ψ hΨ hscal ht0 ht1 hτ0 hτ1 hM.x0 hM.x1

/-- The phase reduction and the endpoint (`witnessCap_of_VhatOf_le` for the certified witness
`(e, ν) = (ε, 0)`, where the hat value is the profile value and `B = (1 − ν)B + ν`) convert the
extended-cover cap into a scalar witness cap. -/
theorem witnessCap_of_law_nodes_reduction (extraBatches : List JBatch) (B : ℚ) (cuts : List String) (boxes : List MixBox)
    (hextra : extraBatches.all (checkBatch rowData) = true)
    (hcover : checkMixCover rowData (mixedBatches ++ extraBatches) B cuts boxes = true) (n : ℕ)
    (hred : ∀ f g : L2G n, f ∈ Unimod (stdGaussian (n + n)) →
      g ∈ Unimod (stdGaussian (n + n)) → 0 ≤ VOf n ε 0 f g → ReductionHyp n f g) :
    WitnessCap n ε 0 (B : ℝ) := by
  have h := witnessCap_of_VhatOf_le n (e := ε) (ν := 0) (c := (B : ℝ)) zero_lt_one
      fun f g hf hg hV => by
    obtain ⟨v, hv, hshared⟩ := hred f g hf hg hV
    rw [VhatOf_zero]
    exact profile_bound_of_law_nodes extraBatches B cuts boxes hextra hcover _ _ _ v hv
      (norm_nonneg _) (tOf_le n hf hg) (rowOf_crude n f g (normQk_le_rho n hf hg) v) hshared
  simpa using h

/-- The scalar cap retains exactly the existing Gaussian `NodeCaps` assumption. -/
theorem witnessCap_of_law_nodes (extraBatches : List JBatch) (B : ℚ) (cuts : List String) (boxes : List MixBox)
    (hextra : extraBatches.all (checkBatch rowData) = true)
    (hcover : checkMixCover rowData (mixedBatches ++ extraBatches) B cuts boxes = true)
    (hcaps : NodeCaps) (n : ℕ) (hn : 2 ≤ n) : WitnessCap n ε 0 (B : ℝ) := by
  refine witnessCap_of_law_nodes_reduction extraBatches B cuts boxes hextra hcover n
    fun f g hf hg _ => ?_
  obtain ⟨m, rfl⟩ : ∃ m, n = m + 1 := ⟨n - 1, by omega⟩
  exact reductionHyp_of_nodeCaps hcaps (by omega) f g hf hg

/-- A complete cover using extra checked nodes supplies the same transfer inputs. -/
theorem transferInputs_of_law_nodes (extraBatches : List JBatch) (B : ℚ) (cuts : List String) (boxes : List MixBox)
    (hextra : extraBatches.all (checkBatch rowData) = true)
    (hcover : checkMixCover rowData (mixedBatches ++ extraBatches) B cuts boxes = true) (hcaps : NodeCaps) :
    TransferInputsL2 (B : ℝ) :=
  transferInputs_of_witnessCap (e := ε) (by norm_num [ε]) le_rfl 2 (fun n hn =>
    witnessCap_of_law_nodes extraBatches B cuts boxes hextra hcover hcaps n hn)

/-- Any newly checked cover gives its reciprocal lower bound under the same `NodeCaps`. -/
theorem lower_bound_of_law_nodes (extraBatches : List JBatch) (B : ℚ) (cuts : List String) (boxes : List MixBox)
    (hextra : extraBatches.all (checkBatch rowData) = true)
    (hcover : checkMixCover rowData (mixedBatches ++ extraBatches) B cuts boxes = true) (hcaps : NodeCaps)
    {K : ℝ} (hK : IsGrothendieckBound K) : 1 / (B : ℝ) ≤ K :=
  transfer_lower (transferInputs_of_law_nodes extraBatches B cuts boxes hextra hcover hcaps) hK

/-- A strict displayed endpoint follows by a separate rational comparison with `1 / B`. -/
theorem strict_lower_bound_of_law_nodes (extraBatches : List JBatch) (L B : ℚ) (cuts : List String) (boxes : List MixBox)
    (hextra : extraBatches.all (checkBatch rowData) = true)
    (hcover : checkMixCover rowData (mixedBatches ++ extraBatches) B cuts boxes = true) (hcaps : NodeCaps)
    (hL : (L : ℝ) < 1 / (B : ℝ)) {K : ℝ} (hK : IsGrothendieckBound K) : (L : ℝ) < K :=
  hL.trans_le (lower_bound_of_law_nodes extraBatches B cuts boxes hextra hcover hcaps hK)

end

end Grothe.Research.LawNodeLower
