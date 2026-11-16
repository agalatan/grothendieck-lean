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

**The identity tail.**  The cover bounds the hat value of every witness whose hat weight is the
constant `ε` of the rows, so the endpoint is stated for a weight `e ≥ 0` and a tail `0 ≤ ν < 1`
with `epsHat e ν = ε`: the cap `B` of the hat value gives `K ≥ 1/((1 − ν)B + ν)`
(`lower_bound_of_tail_nodes`), modulo the node caps `TailNodeCaps (nuHat ν)` of the potentials of
the rows with the tail.  The certified witness is `(e, ν) = (ε, 0)`, where the hypothesis is
`NodeCaps` and the bound is `1/B` (`lower_bound_of_law_nodes`).
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

/-- The phase reduction and the endpoint (`witnessCap_of_VhatOf_le`) convert the extended-cover cap
`B` of the hat value into the scalar cap `(1 − ν)B + ν` of a witness with weight `e` and tail
`0 ≤ ν < 1` whose hat weight is the constant `ε` of the rows.  For the certified witness
`(e, ν) = (ε, 0)` the hat value is the profile value and the cap is `B`. -/
theorem witnessCap_of_law_nodes_reduction (extraBatches : List JBatch) (B : ℚ) (cuts : List String) (boxes : List MixBox)
    (hextra : extraBatches.all (checkBatch rowData) = true)
    (hcover : checkMixCover rowData (mixedBatches ++ extraBatches) B cuts boxes = true) (n : ℕ)
    {e ν : ℝ} (he : epsHat e ν = ε) (hν0 : 0 ≤ ν) (hν1 : ν < 1)
    (hred : ∀ f g : L2G n, f ∈ Unimod (stdGaussian (n + n)) →
      g ∈ Unimod (stdGaussian (n + n)) → 0 ≤ VOf n e ν f g → ReductionHyp n e ν f g) :
    WitnessCap n e ν ((1 - ν) * (B : ℝ) + ν) :=
  witnessCap_of_VhatOf_le n hν1 fun f g hf hg hV => by
    obtain ⟨v, hv, hshared⟩ := hred f g hf hg hV
    exact profile_bound_of_law_nodes extraBatches B cuts boxes hextra hcover _ _ _ v hv
      (norm_nonneg _) (tOf_le n hf hg)
      (rowOf_crude n he (div_nonneg hν0 (sub_nonneg.2 hν1.le)) f g (normQk_le_rho n hf hg) v)
      hshared

/-- The scalar cap of a witness with an identity tail retains exactly one Gaussian assumption, the
node caps `TailNodeCaps (nuHat ν)` of the potentials of the rows with the tail. -/
theorem witnessCap_of_law_nodes (extraBatches : List JBatch) (B : ℚ) (cuts : List String) (boxes : List MixBox)
    (hextra : extraBatches.all (checkBatch rowData) = true)
    (hcover : checkMixCover rowData (mixedBatches ++ extraBatches) B cuts boxes = true)
    {e ν : ℝ} (he : epsHat e ν = ε) (hν0 : 0 ≤ ν) (hν1 : ν < 1)
    (hcaps : TailNodeCaps (nuHat ν)) (n : ℕ) (hn : 2 ≤ n) :
    WitnessCap n e ν ((1 - ν) * (B : ℝ) + ν) := by
  refine witnessCap_of_law_nodes_reduction extraBatches B cuts boxes hextra hcover n he hν0 hν1
    fun f g hf hg _ => ?_
  obtain ⟨m, rfl⟩ : ∃ m, n = m + 1 := ⟨n - 1, by omega⟩
  exact reductionHyp_of_nodeCaps he hcaps (by omega) f g hf hg

/-- A complete cover using extra checked nodes supplies the transfer inputs of a witness with an
identity tail, with the cap `(1 − ν)B + ν`. -/
theorem transferInputs_of_law_nodes (extraBatches : List JBatch) (B : ℚ) (cuts : List String) (boxes : List MixBox)
    (hextra : extraBatches.all (checkBatch rowData) = true)
    (hcover : checkMixCover rowData (mixedBatches ++ extraBatches) B cuts boxes = true)
    {e ν : ℝ} (he0 : 0 ≤ e) (he : epsHat e ν = ε) (hν0 : 0 ≤ ν) (hν1 : ν < 1)
    (hcaps : TailNodeCaps (nuHat ν)) :
    TransferInputsL2 ((1 - ν) * (B : ℝ) + ν) :=
  transferInputs_of_witnessCap he0 hν0 2 (fun n hn =>
    witnessCap_of_law_nodes extraBatches B cuts boxes hextra hcover he hν0 hν1 hcaps n hn)

/-- **The lower bound of a witness with an identity tail, modulo its node caps**: for a weight
`e ≥ 0` and a tail `0 ≤ ν < 1` with hat weight `epsHat e ν = ε`, a checked cover with the cap `B`
of the hat value and the node caps of the potentials of the rows with the tail `ν̂ = nuHat ν` give
`K ≥ 1/((1 − ν)B + ν)`. -/
theorem lower_bound_of_tail_nodes (extraBatches : List JBatch) (B : ℚ) (cuts : List String) (boxes : List MixBox)
    (hextra : extraBatches.all (checkBatch rowData) = true)
    (hcover : checkMixCover rowData (mixedBatches ++ extraBatches) B cuts boxes = true)
    {e ν : ℝ} (he0 : 0 ≤ e) (he : epsHat e ν = ε) (hν0 : 0 ≤ ν) (hν1 : ν < 1)
    (hcaps : TailNodeCaps (nuHat ν))
    {K : ℝ} (hK : IsGrothendieckBound K) : 1 / ((1 - ν) * (B : ℝ) + ν) ≤ K :=
  transfer_lower
    (transferInputs_of_law_nodes extraBatches B cuts boxes hextra hcover he0 he hν0 hν1 hcaps) hK

/-- Any newly checked cover gives its reciprocal lower bound under the same `NodeCaps`: the
certified witness `(e, ν) = (ε, 0)` in `lower_bound_of_tail_nodes`. -/
theorem lower_bound_of_law_nodes (extraBatches : List JBatch) (B : ℚ) (cuts : List String) (boxes : List MixBox)
    (hextra : extraBatches.all (checkBatch rowData) = true)
    (hcover : checkMixCover rowData (mixedBatches ++ extraBatches) B cuts boxes = true) (hcaps : NodeCaps)
    {K : ℝ} (hK : IsGrothendieckBound K) : 1 / (B : ℝ) ≤ K := by
  have h := lower_bound_of_tail_nodes extraBatches B cuts boxes hextra hcover (e := ε) (ν := 0)
    (by norm_num [ε]) (by simp [epsHat]) le_rfl zero_lt_one
    (by rw [show nuHat 0 = 0 by simp [nuHat]]; exact hcaps) hK
  rwa [sub_zero, one_mul, add_zero] at h

/-- A strict displayed endpoint follows by a separate rational comparison with `1 / B`. -/
theorem strict_lower_bound_of_law_nodes (extraBatches : List JBatch) (L B : ℚ) (cuts : List String) (boxes : List MixBox)
    (hextra : extraBatches.all (checkBatch rowData) = true)
    (hcover : checkMixCover rowData (mixedBatches ++ extraBatches) B cuts boxes = true) (hcaps : NodeCaps)
    (hL : (L : ℝ) < 1 / (B : ℝ)) {K : ℝ} (hK : IsGrothendieckBound K) : (L : ℝ) < K :=
  hL.trans_le (lower_bound_of_law_nodes extraBatches B cuts boxes hextra hcover hcaps hK)

end

end Grothe.Research.LawNodeLower
