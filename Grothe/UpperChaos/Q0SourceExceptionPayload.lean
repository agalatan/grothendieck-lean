import Grothe.UpperChaos.Q0SourceExceptionMetadataAll
import Grothe.UpperChaos.Q0SourceExceptionIndex
import Lean.Util.CollectAxioms

/-! Saved binary64 rows at the actual exceptional source addresses. The
selected vector is the stored approximation; true omitted coefficients are
still present in the analytic error. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionPayload

open Grothe.UpperChaos.Q0SourceExceptionCenters
open Grothe.UpperChaos.Q0SourceExceptionGeometry
open Grothe.UpperChaos.Q0GaussOrdinalEquiv

/-- The ordinal list proves both coverage and absence of duplicates. -/
theorem unique_row (n : ℕ) (hn : exceptionalOrdinal n) :
    ∃! r : Row, r ∈ Q0SourceExceptionCentersAll.rows ∧ r.ordinal = n := by
  have hm : n ∈ Q0SourceExceptionCentersAll.rows.map Row.ordinal := by
    rw [Q0SourceExceptionCentersAll.ordinals]
    exact (exceptionalOrdinal_iff_mem n).mp hn
  obtain ⟨r, hr, heq⟩ := List.mem_map.mp hm
  have hnodup : (Q0SourceExceptionCentersAll.rows.map Row.ordinal).Nodup := by
    rw [Q0SourceExceptionCentersAll.ordinals]
    decide +kernel
  refine ⟨r, ⟨hr, heq⟩, ?_⟩
  intro other ho
  exact List.inj_on_of_nodup_map hnodup ho.1 hr (ho.2.trans heq.symm)

noncomputable def rowAt (a : Address) (ha : exceptionalPanel a.1.val) : Row :=
  Classical.choose (unique_row (fromAddress a).val
    (source_ordinal_exceptional a ha)).exists

theorem rowAt_spec (a : Address) (ha : exceptionalPanel a.1.val) :
    rowAt a ha ∈ Q0SourceExceptionCentersAll.rows ∧
      (rowAt a ha).ordinal = (fromAddress a).val :=
  Classical.choose_spec (unique_row (fromAddress a).val
    (source_ordinal_exceptional a ha)).exists

theorem rowAt_valid (a : Address) (ha : exceptionalPanel a.1.val) :
    validRow (rowAt a ha) = true :=
  (List.all_eq_true.mp Q0SourceExceptionCentersAll.all_valid) _ (rowAt_spec a ha).1

/-- The matching metadata is the unique original row at this same address,
not an independently chosen cutoff or an ordinal from a shorter table. -/
theorem rowAt_matches (a : Address) (ha : exceptionalPanel a.1.val) :
    matchesMetadata (rowAt a ha) (Q0ConditionalMetadataAll.rowAt a) = true := by
  obtain ⟨m, hm, hmatch⟩ := Q0SourceExceptionMetadataAll.each_row_source
    (rowAt a ha) (rowAt_spec a ha).1
  have hi : m.index = (fromAddress a).val :=
    (matchesMetadata_sound _ _ hmatch).1.symm.trans (rowAt_spec a ha).2
  have heq : m = Q0ConditionalMetadataAll.rowAt a :=
    (Q0ConditionalMetadataAll.unique_row_for_address a).unique
      ⟨hm, hi⟩ ⟨(Q0ConditionalMetadataAll.rowAt_spec a).1,
        (Q0ConditionalMetadataAll.rowAt_spec a).2.1⟩
  simpa only [heq] using hmatch

theorem original_metadata_valid (a : Address) :
    Q0ConditionalMetadataCheck.valid (Q0ConditionalMetadataAll.rowAt a) = true :=
  (List.all_eq_true.mp Q0ConditionalMetadataAll.checked) _
    (Q0ConditionalMetadataAll.rowAt_spec a).1

noncomputable def sourceCenter (a : Address) (ha : exceptionalPanel a.1.val)
    (p : ℕ × ℕ) : ℂ := storedModeCenter (rowAt a ha) p

/-- The stored finite vector bound at every exceptional source address,
on any selected subset of the original canonical pair domain. -/
theorem sourceCenter_norm (a : Address) (ha : exceptionalPanel a.1.val)
    (S : Finset (ℕ × ℕ))
    (hdom : ∀ p ∈ S, p.1 ≤ 266 ∧ p.2 ≤ 265 ∧
      p.1 ≤ p.2 + 1 ∧ p.1 + p.2 ≤ 531) :
    Real.sqrt (∑ p ∈ S, ‖sourceCenter a ha p‖ ^ 2) ≤ (5 / 2 : ℝ) :=
  storedModeCenter_vector_norm (rowAt a ha) (Q0ConditionalMetadataAll.rowAt a)
    (rowAt_valid a ha) (original_metadata_valid a) (rowAt_matches a ha) S hdom

/-- The saved approximation already has the original source cutoff. This
does not assert that the omitted true Gaussian coefficients vanish. -/
theorem sourceCenter_completion (a : Address) (ha : exceptionalPanel a.1.val)
    (c d : ℕ) (hc : c ≤ 266) (hd : d ≤ 265)
    (hcd : c ≤ d + 1) (htotal : c + d ≤ 531) :
    Q0ExceptionSupport.completed (Q0ConditionalMetadataAll.rowAt a).cutoff
      (sourceCenter a ha) (c, d) = sourceCenter a ha (c, d) := by
  have h := storedModeCenter_completion (rowAt a ha) (Q0ConditionalMetadataAll.rowAt a)
    (original_metadata_valid a) (rowAt_matches a ha) c d hc hd hcd htotal
  have hcut := (matchesMetadata_sound _ _ (rowAt_matches a ha)).2.2.2
  change Q0ExceptionSupport.completed (Q0ConditionalMetadataAll.rowAt a).cutoff
    (storedModeCenter (rowAt a ha)) (c, d) =
      storedModeCenter (rowAt a ha) (c, d)
  simpa only [hcut] using h

end Grothe.UpperChaos.Q0SourceExceptionPayload

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0SourceExceptionPayload.unique_row,
      ``Grothe.UpperChaos.Q0SourceExceptionPayload.rowAt_matches,
      ``Grothe.UpperChaos.Q0SourceExceptionPayload.sourceCenter_norm,
      ``Grothe.UpperChaos.Q0SourceExceptionPayload.sourceCenter_completion] do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Exception payload audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
