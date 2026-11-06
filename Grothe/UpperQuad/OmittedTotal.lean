import Grothe.UpperQuad.OmittedSound
import Grothe.UpperChaos.ProductionF0Head

/-!
# The omitted pairs of the cutoffs (part (C) of `hQuad`): the sum over the nodes

`gaussRawFull`/`gaussCoeffFull` are the exact Gauss sums of a list of node specs without the cutoffs
(every pair of the degree-501 triangle); they differ from the bridge's `gaussRaw`/`gaussCoeff` by the
omitted raw vector `omittedRaw` (`gaussRawFull_eq`).  The graded coefficients of the omitted vector are
the sum over the nodes of those of each node (`gradeValue` is linear), and Minkowski in
`EuclideanSpace ℝ (GradedIdx 251)` with `omittedNodeBound_sound` gives
`omittedBoundSum_sound`; **`omittedOK_sound`** turns the kernel's check into the `ℓ²` bound
`Σ_{qcd} (gaussCoeffFull − gaussCoeff)² ≤ (bound / 2^(2 KFix))²` of part (C).

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.F0ConditionalEvaluator
open Grothe.UpperChaos.FixedChaosSmoothing

/-! ### The full Gauss sums and the omitted vector -/

/-- The exact Gauss sums of the nodes without the cutoffs (every pair of the triangle). -/
noncomputable def gaussRawFull (specs : List NodeSpec) (x : NodeSpec → ℝ) (k j cIdx : ℕ) : ℝ :=
  (specs.map fun nd => nodeTerm (specNode nd (x nd)) (specWeight nd (x nd)) 531 0 251 k j cIdx).sum

/-- The graded Gauss coefficients without the cutoffs (reflected for `c > d + 1`). -/
noncomputable def gaussCoeffFull (specs : List NodeSpec) (x : NodeSpec → ℝ) (q c d : ℕ) : ℝ :=
  gradeValue (gaussRawFull specs x) (fun _ _ _ => 0) q c d

/-- The omitted raw vector of the list (the terms of the pairs beyond each node's cutoff). -/
noncomputable def omittedRaw (specs : List NodeSpec) (x : NodeSpec → ℝ) (k j cIdx : ℕ) : ℝ :=
  (specs.map fun nd =>
    omittedTerm (specNode nd (x nd)) (specWeight nd (x nd)) nd.cutoff k j cIdx).sum

lemma gaussRawFull_eq (specs : List NodeSpec) (x : NodeSpec → ℝ) (k j cIdx : ℕ) :
    gaussRawFull specs x k j cIdx = gaussRaw specs x k j cIdx + omittedRaw specs x k j cIdx := by
  unfold gaussRawFull gaussRaw omittedRaw
  rw [← List.sum_map_add]
  congr 1
  apply List.map_congr_left
  intro nd _
  unfold specTerm
  exact (nodeTerm_add_omittedTerm _ _ _ k j cIdx).symm

/-! ### Linearity of the graded coefficients in the raw vector -/

lemma gradeValue_zero (q c d : ℕ) :
    gradeValue (fun _ _ _ => (0 : ℝ)) (fun _ _ _ => 0) q c d = 0 := by
  unfold gradeValue rawValue
  split_ifs <;> simp

lemma gradeValue_add (R₁ R₂ : ℕ → ℕ → ℕ → ℝ) (q c d : ℕ) :
    gradeValue (fun k j cIdx => R₁ k j cIdx + R₂ k j cIdx) (fun _ _ _ => 0) q c d =
      gradeValue R₁ (fun _ _ _ => 0) q c d + gradeValue R₂ (fun _ _ _ => 0) q c d := by
  unfold gradeValue rawValue
  split_ifs <;> ring

lemma gradeValue_sub (R₁ R₂ : ℕ → ℕ → ℕ → ℝ) (q c d : ℕ) :
    gradeValue R₁ (fun _ _ _ => 0) q c d - gradeValue R₂ (fun _ _ _ => 0) q c d =
      gradeValue (fun k j cIdx => R₁ k j cIdx - R₂ k j cIdx) (fun _ _ _ => 0) q c d := by
  unfold gradeValue rawValue
  split_ifs <;> ring

lemma gradeValue_listSum {α : Type*} (l : List α) (T : α → ℕ → ℕ → ℕ → ℝ) (q c d : ℕ) :
    gradeValue (fun k j cIdx => (l.map fun a => T a k j cIdx).sum) (fun _ _ _ => 0) q c d =
      (l.map fun a => gradeValue (T a) (fun _ _ _ => 0) q c d).sum := by
  induction l with
  | nil => simp [gradeValue_zero]
  | cons a l ih =>
    simp only [List.map_cons, List.sum_cons]
    rw [gradeValue_add, ih]

/-! ### The graded vectors in `ℓ²` -/

/-- The graded vector of a coefficient family on the head modes. -/
noncomputable def vecOf (v : ℕ → ℕ → ℕ → ℝ) : EuclideanSpace ℝ (GradedIdx 251) :=
  WithLp.toLp 2 fun i => v i.1 i.2.1 i.2.2

lemma norm_vecOf_sq (v : ℕ → ℕ → ℕ → ℝ) :
    ‖vecOf v‖ ^ 2 = ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      v q c d ^ 2 := by
  rw [EuclideanSpace.norm_eq, Real.sq_sqrt (Finset.sum_nonneg fun _ _ => sq_nonneg _)]
  simp only [vecOf, PiLp.toLp_apply, Real.norm_eq_abs, sq_abs]
  rw [Fintype.sum_sigma, ← sum_bounded_graded_eq_range 251 (fun q c d => v q c d ^ 2)]
  apply Finset.sum_congr rfl
  intro q _
  rw [Fintype.sum_prod_type]

lemma vecOf_zero : vecOf (fun _ _ _ => (0 : ℝ)) = 0 := by
  ext i; simp [vecOf]

lemma vecOf_add (v w : ℕ → ℕ → ℕ → ℝ) :
    vecOf (fun q c d => v q c d + w q c d) = vecOf v + vecOf w := by
  ext i; simp [vecOf]

lemma vecOf_listSum {α : Type*} (l : List α) (g : α → ℕ → ℕ → ℕ → ℝ) :
    vecOf (fun q c d => (l.map fun a => g a q c d).sum) = (l.map fun a => vecOf (g a)).sum := by
  induction l with
  | nil => simp [vecOf_zero]
  | cons a l ih =>
    simp only [List.map_cons, List.sum_cons]
    rw [vecOf_add, ih]

/-- The graded vector of a node's omitted coefficients. -/
noncomputable def omittedVec (nd : NodeSpec) (x : ℝ) : EuclideanSpace ℝ (GradedIdx 251) :=
  vecOf fun q c d =>
    gradeValue (omittedTerm (specNode nd x) (specWeight nd x) nd.cutoff) (fun _ _ _ => 0) q c d

lemma omittedNodeBound_nonneg {P : ℕ} {piI : Ival} {pd : ProfileData} {nd : NodeSpec} {b : ℤ}
    (hb : omittedNodeBound P piI pd nd = some b) : 0 ≤ b := by
  unfold omittedNodeBound at hb
  split_ifs at hb with h
  · simp only [Option.some.injEq] at hb; omega
  · split at hb
    · exact absurd hb (by simp)
    · split_ifs at hb
      simp only [Option.some.injEq] at hb
      subst hb
      exact Int.natCast_nonneg _

/-- The `ℓ²` norm of a node's omitted vector is at most `b / 2^(2 KFix)`. -/
lemma norm_omittedVec_le (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    {pd : ProfileData} (hpd : profileAgrees pd) (hpv : profileValid P piI pd = true) (nd : NodeSpec)
    {x : ℝ} (hx : mem x nd.bracket.toIval)
    (hJ : ∀ neg aI, nodeShift P piI pd nd = some (neg, aI) →
      mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd x) ^ 2))
        (seedJ0I P piI (sqI P aI)))
    {b : ℤ} (hb : omittedNodeBound P piI pd nd = some b) :
    ‖omittedVec nd x‖ ≤ (b : ℝ) / (2 : ℝ) ^ (2 * KFix) := by
  have h := omittedNodeBound_sound P hP hpi hpd hpv nd hx hJ hb
  have hb0 : (0 : ℝ) ≤ (b : ℝ) / (2 : ℝ) ^ (2 * KFix) := by
    have := omittedNodeBound_nonneg hb
    positivity
  apply le_of_sq_le_sq _ hb0
  rw [omittedVec, norm_vecOf_sq]
  exact h

/-- **Minkowski over the nodes**: the kernel's running sum bounds the norm of the summed omitted
vectors. -/
theorem omittedBoundSum_sound (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    {pd : ProfileData} (hpd : profileAgrees pd) (hpv : profileValid P piI pd = true)
    (x : NodeSpec → ℝ) :
    ∀ (specs : List NodeSpec) (acc S : ℤ),
      (∀ nd ∈ specs, mem (x nd) nd.bracket.toIval) →
      (∀ nd ∈ specs, ∀ neg aI, nodeShift P piI pd nd = some (neg, aI) →
        mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd (x nd)) ^ 2))
          (seedJ0I P piI (sqI P aI))) →
      omittedBoundSum P piI pd specs acc = some S →
      ‖(specs.map fun nd => omittedVec nd (x nd)).sum‖ ≤ ((S - acc : ℤ) : ℝ) / (2 : ℝ) ^ (2 * KFix) := by
  intro specs
  induction specs with
  | nil =>
    intro acc S _ _ h
    simp only [omittedBoundSum, Option.some.injEq] at h
    subst h
    simp
  | cons nd rest ih =>
    intro acc S hx hJ h
    rw [omittedBoundSum, Option.bind_eq_some_iff] at h
    obtain ⟨b, hb, hrest⟩ := h
    have h1 := norm_omittedVec_le P hP hpi hpd hpv nd (hx nd (by simp)) (hJ nd (by simp)) hb
    have h2 := ih (acc + b) S (fun nd' hnd' => hx nd' (by simp [hnd']))
      (fun nd' hnd' => hJ nd' (by simp [hnd'])) hrest
    simp only [List.map_cons, List.sum_cons]
    calc ‖omittedVec nd (x nd) + (rest.map fun nd => omittedVec nd (x nd)).sum‖
        ≤ ‖omittedVec nd (x nd)‖ + ‖(rest.map fun nd => omittedVec nd (x nd)).sum‖ := norm_add_le _ _
      _ ≤ (b : ℝ) / 2 ^ (2 * KFix) + ((S - (acc + b) : ℤ) : ℝ) / 2 ^ (2 * KFix) := add_le_add h1 h2
      _ = ((S - acc : ℤ) : ℝ) / 2 ^ (2 * KFix) := by push_cast; ring

/-- **(C): the kernel's check bounds the omitted pairs in `ℓ²`.** -/
theorem omittedOK_sound (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    {pd : ProfileData} (hpd : profileAgrees pd) (hpv : profileValid P piI pd = true)
    (specs : List NodeSpec) (x : NodeSpec → ℝ) (hx : ∀ nd ∈ specs, mem (x nd) nd.bracket.toIval)
    (hJ : ∀ nd ∈ specs, ∀ neg aI, nodeShift P piI pd nd = some (neg, aI) →
      mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd (x nd)) ^ 2))
        (seedJ0I P piI (sqI P aI)))
    {bound : ℤ} (hOK : omittedOK P piI pd specs bound = true) :
    ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      (gaussCoeffFull specs x q c d - gaussCoeff specs x q c d) ^ 2 ≤
      ((bound : ℝ) / (2 : ℝ) ^ (2 * KFix)) ^ 2 := by
  unfold omittedOK at hOK
  rw [Option.any_eq_true] at hOK
  obtain ⟨S, hS, hle⟩ := hOK
  rw [decide_eq_true_eq] at hle
  have hnorm := omittedBoundSum_sound P hP hpi hpd hpv x specs 0 S hx hJ hS
  rw [sub_zero] at hnorm
  have hvec : vecOf (fun q c d => gaussCoeffFull specs x q c d - gaussCoeff specs x q c d) =
      (specs.map fun nd => omittedVec nd (x nd)).sum := by
    unfold omittedVec
    rw [← vecOf_listSum]
    congr 1
    funext q c d
    unfold gaussCoeffFull gaussCoeff
    rw [gradeValue_sub]
    have hR : (fun k j cIdx => gaussRawFull specs x k j cIdx - gaussRaw specs x k j cIdx) =
        omittedRaw specs x := by
      funext k j cIdx
      rw [gaussRawFull_eq]
      ring
    rw [hR]
    unfold omittedRaw
    exact gradeValue_listSum specs
      (fun nd => omittedTerm (specNode nd (x nd)) (specWeight nd (x nd)) nd.cutoff) q c d
  rw [← norm_vecOf_sq, hvec]
  have hS' : ((S : ℤ) : ℝ) / 2 ^ (2 * KFix) ≤ (bound : ℝ) / 2 ^ (2 * KFix) := by
    apply div_le_div_of_nonneg_right _ (by positivity)
    exact_mod_cast hle
  exact pow_le_pow_left₀ (norm_nonneg _) (hnorm.trans hS') 2

end Grothe.UpperQuad
