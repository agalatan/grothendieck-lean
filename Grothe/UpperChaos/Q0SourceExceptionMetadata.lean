import Grothe.UpperChaos.Q0SourceExceptionCenters
import Grothe.UpperChaos.Q0ConditionalRetention
import Grothe.UpperChaos.Q0ExceptionSupport

/-! Bind the saved exception rows to original source cutoffs and storage ranks.
No bound on the actual Gaussian coefficients is asserted. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionCenters

def matchesMetadata (r : Row) (m : Q0ConditionalMetadataCheck.Row) : Bool :=
  decide (r.ordinal = m.index ∧ r.sourceStart = m.first ∧
    r.sourceStart + r.words.length = m.last ∧ r.cutoff = m.cutoff)

theorem matchesMetadata_sound (r : Row) (m : Q0ConditionalMetadataCheck.Row)
    (h : matchesMetadata r m = true) :
    r.ordinal = m.index ∧ r.sourceStart = m.first ∧
      r.sourceStart + r.words.length = m.last ∧ r.cutoff = m.cutoff :=
  of_decide_eq_true h

/-- A length check prevents `zip` from silently dropping any saved row. -/
theorem metadata_witness (rs : List Row) (ms : List Q0ConditionalMetadataCheck.Row)
    (h : rs.length = ms.length ∧
      (rs.zip ms).all (fun pair => matchesMetadata pair.1 pair.2) = true) :
    ∀ r ∈ rs, ∃ m ∈ ms, matchesMetadata r m = true := by
  induction rs generalizing ms with
  | nil => simp
  | cons r rs ih =>
    cases ms with
    | nil => simp at h
    | cons m ms =>
      have hlen : rs.length = ms.length := by simpa using h.1
      have hz : matchesMetadata r m = true ∧
          (rs.zip ms).all (fun pair => matchesMetadata pair.1 pair.2) = true := by
        simpa using h.2
      intro q hq
      rcases List.mem_cons.mp hq with rfl | hq
      · exact ⟨m, List.mem_cons_self, hz.1⟩
      · obtain ⟨m', hm', hmatch⟩ := ih ms ⟨hlen, hz.2⟩ q hq
        exact ⟨m', List.mem_cons_of_mem m hm', hmatch⟩

/-- Within the original canonical pair domain, an entry lies in the stored
row exactly when its total degree lies below the original cutoff. -/
theorem retained_iff_cutoff (r : Row) (m : Q0ConditionalMetadataCheck.Row)
    (hm : Q0ConditionalMetadataCheck.valid m = true)
    (hmatch : matchesMetadata r m = true)
    (c d : ℕ) (hc : c ≤ 266) (hd : d ≤ 265)
    (hcd : c ≤ d + 1) (htotal : c + d ≤ 531) :
    Q0ConditionalPairRankCheck.rank c d < r.words.length ↔ c + d ≤ r.cutoff := by
  have hs := matchesMetadata_sound r m hmatch
  have hv := Q0ConditionalMetadataCheck.valid_sound m hm
  have hlen : r.words.length =
      Q0ConditionalMetadataCheck.pairPrefix (min m.cutoff 531 + 1) := by
    omega
  rw [hlen, hs.2.2.2]
  exact Q0ConditionalRetention.retained_iff_degree_le_cutoff c d m.cutoff
    hc hd hcd htotal

/-- Exact source payload lookup, zero-completed outside the saved row.
This definition is an approximation, not a definition of the true coefficient. -/
def storedModeCenter (r : Row) (p : ℕ × ℕ) : ℂ :=
  if h : Q0ConditionalPairRankCheck.rank p.1 p.2 < r.words.length then
    (center r ⟨Q0ConditionalPairRankCheck.rank p.1 p.2, h⟩ : ℂ)
  else 0

theorem storedModeCenter_norm (r : Row) (h : validRow r = true) (p : ℕ × ℕ) :
    ‖storedModeCenter r p‖ ≤ (11 / 10 : ℝ) := by
  unfold storedModeCenter
  split
  · exact center_norm_le_eleven_tenths r h _
  · norm_num

/-- On the canonical domain, the actual payload lookup has exactly the
original total-degree cutoff. Missing true coefficients are not set to zero. -/
theorem storedModeCenter_completion (r : Row) (m : Q0ConditionalMetadataCheck.Row)
    (hm : Q0ConditionalMetadataCheck.valid m = true)
    (hmatch : matchesMetadata r m = true) (c d : ℕ)
    (hc : c ≤ 266) (hd : d ≤ 265) (hcd : c ≤ d + 1) (htotal : c + d ≤ 531) :
    Q0ExceptionSupport.completed r.cutoff (storedModeCenter r) (c, d) =
      storedModeCenter r (c, d) := by
  have hi := retained_iff_cutoff r m hm hmatch c d hc hd hcd htotal
  by_cases hcut : c + d ≤ r.cutoff
  · simp [Q0ExceptionSupport.completed, hcut]
  · have hr : ¬ Q0ConditionalPairRankCheck.rank c d < r.words.length :=
      fun h => hcut (hi.mp h)
    simp [Q0ExceptionSupport.completed, storedModeCenter, hcut, hr]

/-- The selected source payload, with its real cutoff and zero completion,
has norm at most 5/2 on any subset of the original canonical domain. -/
theorem storedModeCenter_vector_norm (r : Row) (m : Q0ConditionalMetadataCheck.Row)
    (hvalid : validRow r = true) (hm : Q0ConditionalMetadataCheck.valid m = true)
    (hmatch : matchesMetadata r m = true) (S : Finset (ℕ × ℕ))
    (hdom : ∀ p ∈ S, p.1 ≤ 266 ∧ p.2 ≤ 265 ∧ p.1 ≤ p.2 + 1 ∧ p.1 + p.2 ≤ 531) :
    Real.sqrt (∑ p ∈ S, ‖storedModeCenter r p‖ ^ 2) ≤ (5 / 2 : ℝ) := by
  have h := Q0ExceptionSupport.completed_norm_le S r.cutoff (storedModeCenter r)
    (validRow_cutoff_le_two r hvalid) (fun p hp => (hdom p hp).2.2.1)
    (fun p _ => storedModeCenter_norm r hvalid p)
  have he : (∑ p ∈ S, ‖Q0ExceptionSupport.completed r.cutoff (storedModeCenter r) p‖ ^ 2) =
      ∑ p ∈ S, ‖storedModeCenter r p‖ ^ 2 := by
    apply Finset.sum_congr rfl
    intro p hp
    have hd := hdom p hp
    rw [storedModeCenter_completion r m hm hmatch p.1 p.2 hd.1 hd.2.1 hd.2.2.1 hd.2.2.2]
  rw [he] at h
  exact h

end Grothe.UpperChaos.Q0SourceExceptionCenters
