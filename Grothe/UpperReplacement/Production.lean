import Grothe.UpperReplacement.CertificateData
import Grothe.UpperReplacement.CellData
import Grothe.UpperReplacement.Channels
import Grothe.UpperReplacement.HeadEnclosures
import Grothe.UpperReplacement.GTInterface
import Grothe.UpperReplacement.MixtureBudget

set_option warningAsError true

/-!
# Actual rounding channels of the private certificate

Agent-ID: codex-a7c4. The functions below fix the two dyadic responses and all eighteen
preprocessors. The finite polynomial is an approximation to these actual kernels; its cell
channel is truncated only after composition, and its GT error comes from the production table.
-/

namespace Grothe.UpperReplacement.Production

open MeasureTheory Finset Polynomial Upper UpperChaos GrotheKernel Certificate

noncomputable section

def leftTable : Array (ℤ × ℤ) := CellEncoding.decode leftCellRows
def rightTable : Array (ℤ × ℤ) := CellEncoding.decode rightCellRows

def leftResponse : ℂ × ℂ → ℂ := cellResponse leftTable (2 ^ 26) 128 64 6
def rightResponse : ℂ × ℂ → ℂ := cellResponse rightTable (2 ^ 26) 128 64 6

def leftVector : Lp ℂ 2 mu2 := (memLp_cellResponse leftTable (2 ^ 26) 128 64 6).toLp leftResponse
def rightVector : Lp ℂ 2 mu2 := (memLp_cellResponse rightTable (2 ^ 26) 128 64 6).toLp rightResponse

theorem left_charge : ChargeOne leftVector :=
  chargeOne_toLp (memLp_cellResponse leftTable (2 ^ 26) 128 64 6)
    (cellResponse_charge leftTable (2 ^ 26) 128 64 6)

def channelSequence (c : Channel) : ℕ → ℝ :=
  match c.kind with
  | .gt => bivarKernel (ofListQ c.primary) (ofListQ c.auxiliary) GTComparison.actualEG
  | .phase => bivarKernel (ofListQ c.primary) 0 (energy (memLp_phase2.toLp phase2))
  | .tiger => bivarKernel (ofListQ c.primary) (ofListQ c.primary) (pairEnergy leftVector rightVector)

def channelPolynomial (c : Channel) : ℝ[X] :=
  match c.kind with
  | .gt => tabPoly (ofListQ c.primary) (ofListQ c.auxiliary) energyRows
  | .phase => gradePolynomial 250 (ofListQ c.primary) haagCoeff
  | .tiger => polynomialHead 126
      (gradePolynomial 125 (ofListQ c.primary) (gradeEnergy leftVector rightVector))

theorem primary_l1 {c : Channel} (hc : c ∈ channels) : l1 (ofListQ c.primary) ≤ 1 :=
  (l1_ofListQ_le c.primary).trans (by exact_mod_cast (parameters_checked c hc).2.1)

theorem auxiliary_l1 {c : Channel} (hc : c ∈ channels) : l1 (ofListQ c.auxiliary) ≤ 1 :=
  (l1_ofListQ_le c.auxiliary).trans (by exact_mod_cast (parameters_checked c hc).2.2.1)

theorem auxiliary_zero {c : Channel} (hc : c ∈ channels) (hk : c.kind = .gt) :
    (ofListQ c.auxiliary).coeff 0 = 0 := by
  rw [coeff_ofListQ, (parameters_checked c hc).2.2.2.2.2 hk]
  norm_num

theorem channel_dominated {c : Channel} (hc : c ∈ channels) :
    DominatedKernel (radialKernel (channelSequence c)) := by
  have hP := primary_l1 hc
  have hQ := auxiliary_l1 hc
  cases hk : c.kind with
  | gt =>
    simp only [channelSequence, hk]
    exact (rounding_diskKernel measurable_GT (norm_GT_le phiBound)
      (fun _ u hu ↦ GT_rot2 hu u) (memLp_GT phiBound) hP hQ).dominated
  | phase =>
    simp only [channelSequence, hk]
    exact (rounding_diskKernel measurable_phase2 norm_phase2_le
      (fun _ u hu ↦ phase2_rot2 hu u) memLp_phase2 hP (by simp [l1])).dominated
  | tiger =>
    simp only [channelSequence, hk]
    exact pair_radial_dominated
      (measurable_cellResponse leftTable (2 ^ 26) 128 64 6)
      (measurable_cellResponse rightTable (2 ^ 26) 128 64 6)
      (norm_cellResponse_le leftTable (2 ^ 26) 128 64 6)
      (norm_cellResponse_le rightTable (2 ^ 26) 128 64 6)
      (memLp_cellResponse leftTable (2 ^ 26) 128 64 6)
      (memLp_cellResponse rightTable (2 ^ 26) 128 64 6)
      (cellResponse_charge leftTable (2 ^ 26) 128 64 6)
      (cellResponse_charge rightTable (2 ^ 26) 128 64 6) hP hP

theorem channel_summable {c : Channel} (hc : c ∈ channels) :
    Summable fun n ↦ |channelSequence c n| := by
  have hP := primary_l1 hc
  have hQ := auxiliary_l1 hc
  cases hk : c.kind <;> simp only [channelSequence, hk]
  · exact summable_abs_bivarKernel _ _ hP hQ _ (summable_abs_energy _)
  · exact summable_abs_bivarKernel _ _ hP (by simp [l1]) _ (summable_abs_energy _)
  · exact summable_abs_bivarKernel _ _ hP hP _ (summable_abs_pairEnergy _ _)

theorem phase_polynomial_coeff {c : Channel} (hk : c.kind = .phase) {n : ℕ} (hn : n ≤ 250) :
    (channelPolynomial c).coeff n = channelSequence c n := by
  simp only [channelPolynomial, channelSequence, hk]
  rw [gradePolynomial_coeff_stable _ _ hn, phase_bivarKernel_eq]
  simp only [gradePolynomial, finsetSum_coeff, coeff_C_mul]

theorem tiger_polynomial_coeff {c : Channel} (hc : c ∈ channels) (hk : c.kind = .tiger) (n : ℕ) :
    (channelPolynomial c).coeff n = truncateChannel (channelSequence c) 126 n := by
  simp only [channelPolynomial, channelSequence, hk, polynomialHead_coeff, truncateChannel]
  split_ifs with hn
  · exact gradePolynomial_coeff left_charge (primary_l1 hc) (by omega)
  · rfl

abbrev Index := Fin channels.length
def channel (i : Index) : Channel := channels[i.val]
def weight (i : Index) : ℝ := (channel i).weight
def mixture (n : ℕ) : ℝ := ∑ i : Index, weight i * channelSequence (channel i) n
def mixturePolynomial : ℝ[X] :=
  (channels.map fun c ↦ C (c.weight : ℝ) * channelPolynomial c).sum

theorem channel_mem (i : Index) : channel i ∈ channels := List.getElem_mem i.isLt

theorem sum_map_eq_fin {α β : Type*} [AddCommMonoid β] (l : List α) (f : α → β) :
    (l.map f).sum = ∑ i : Fin l.length, f l[i.val] := by
  rw [← List.ofFn_getElem_eq_map l f, List.sum_ofFn]

theorem weights_abs_sum : ∑ i : Index, |weight i| ≤ 1 := by
  have hw : ∀ i : Index, 0 ≤ weight i := fun i ↦ by
    unfold weight
    exact_mod_cast (parameters_checked (channel i) (channel_mem i)).1.le
  simp_rw [abs_of_nonneg (hw _)]
  have he := (sum_map_eq_fin channels Channel.weight).symm.trans weights_sum_one
  unfold weight channel
  exact le_of_eq (by exact_mod_cast he)

theorem mixture_summable : Summable fun n ↦ |mixture n| :=
  summable_abs_mixture univ weight (fun i ↦ channelSequence (channel i))
    (fun i _ ↦ channel_summable (channel_mem i))

theorem mixture_dominated : DominatedKernel (radialKernel mixture) := by
  apply (DominatedKernel.mixture univ weight (fun i ↦ radialKernel (channelSequence (channel i)))
    (fun i _ ↦ channel_dominated (channel_mem i)) weights_abs_sum).congr
  intro z hz
  exact radialKernel_mixture univ weight (fun i ↦ channelSequence (channel i))
    (fun i _ ↦ channel_summable (channel_mem i)) hz

theorem mixturePolynomial_coeff (n : ℕ) :
    mixturePolynomial.coeff n = ∑ i : Index, weight i * (channelPolynomial (channel i)).coeff n := by
  rw [mixturePolynomial, sum_map_eq_fin]
  simp only [finsetSum_coeff, coeff_C_mul, weight, channel]

theorem channel_polynomial_enclosure (c : Channel)
    {grades : Array Ival} (hsize : grades.size = 126)
    (hgrades : List.Forall₂ mem
      ((List.range 126).map (gradeEnergy leftVector rightVector)) grades.toList)
    {pi : Ival} (hpi : mem Real.pi pi) :
    memB 251 (channelPolynomial c) (HeadCompute.channelHead 251 energyRows grades pi c) := by
  cases hk : c.kind with
  | gt =>
    simp only [channelPolynomial, HeadCompute.channelHead, hk]
    apply memB_bivarT (memB_ofListQ c.primary _) (memB_ofListQ c.auxiliary _)
    intro r hr
    have hw := tabWithin_iff.mp GTComparison.table_within r hr
    exact ⟨by omega, fun e he ↦ by have := hw.2 e he; omega⟩
  | phase =>
    simp only [channelPolynomial, HeadCompute.channelHead, hk]
    exact HeadCompute.memB_phaseHead hpi 250 c.primary
  | tiger =>
    simp only [channelPolynomial, HeadCompute.channelHead, hk, hsize]
    have h : memB 126 (gradePolynomial 125 (ofListQ c.primary) (gradeEnergy leftVector rightVector))
        (HeadCompute.compose 126 c.primary grades.toList) := by
      rw [← HeadCompute.composePolynomial_eq]
      exact HeadCompute.memB_compose c.primary hgrades
    apply memB_polynomialHead h
    simp only [HeadCompute.compose, List.length_take]
    exact Nat.min_le_left _ _

theorem mixture_polynomial_enclosure {grades : Array Ival} (hsize : grades.size = 126)
    (hgrades : List.Forall₂ mem
      ((List.range 126).map (gradeEnergy leftVector rightVector)) grades.toList)
    {pi : Ival} (hpi : mem Real.pi pi) :
    memB 251 mixturePolynomial (HeadCompute.mixtureHead 251 energyRows grades pi) := by
  apply HeadCompute.memB_sumL
  intro c _
  exact memB_C_mul (mem_ofRatI c.weight) (channel_polynomial_enclosure c hsize hgrades hpi)

/-- Per-channel error for the actual finite head. The cell cutoff concerns the composed kernel. -/
theorem channel_head_error
    (hGT : ∑ p ∈ headIdx 501, |GTComparison.actualEG p - (energyTable p : ℝ)| ≤
      (GTComparison.univGTHeadErrQ : ℝ))
    {c : Channel} (hc : c ∈ channels) {T : ℝ}
    (hT : c.kind = .tiger → ∑' n, |channelSequence c (n + 126)| ≤ T) :
    ∑ n ∈ range 251, |channelSequence c n - (channelPolynomial c).coeff n| ≤
      (match c.kind with | .gt => (GTComparison.univGTHeadErrQ : ℝ) | .phase => 0 | .tiger => T) := by
  cases hk : c.kind with
  | gt =>
    simpa only [channelSequence, channelPolynomial, hk] using
      (GTComparison.gt_channel_props (primary_l1 hc) (auxiliary_l1 hc) (auxiliary_zero hc hk) hGT).2.2
  | phase =>
    apply le_of_eq
    apply sum_eq_zero
    intro n hn
    rw [phase_polynomial_coeff hk (by have := mem_range.mp hn; omega), sub_self, abs_zero]
  | tiger =>
    simp_rw [tiger_polynomial_coeff hc hk]
    exact (head_error_truncate (channelSequence c) (channel_summable hc)
      (by decide : 126 ≤ 251)).trans (hT hk)

end

end Grothe.UpperReplacement.Production
