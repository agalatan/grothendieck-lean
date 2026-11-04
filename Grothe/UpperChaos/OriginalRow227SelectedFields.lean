import Grothe.UpperChaos.OriginalRow227SelectedError
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
Exact selected certificate fields.

Each selected key chooses an existing generated error record. Existence follows
from exact key coverage, and uniqueness follows from mapped-key Nodup. The
numerator functions use zero only outside the selected domain. In particular,
no failed lookup can supply zero for a selected key. Rational functions use the
original common grid 2^768 and retain the exact existing center/radius fields.
No checkpoint enclosure, payload equality, or vector-error bound is asserted.

Agent-ID: codex-aa04. Refs #293, #21.
-/

namespace Grothe.UpperChaos.OriginalRow227SelectedFields

open OriginalRow227SelectedError OriginalRow227SelectedError.Data

/-- A duplicate-free list of keys makes the key injective on list members. -/
theorem eq_of_mem_of_key_eq {α β : Type*} (key : α → β) :
    ∀ xs : List α, (xs.map key).Nodup →
      ∀ a ∈ xs, ∀ b ∈ xs, key a = key b → a = b := by
  intro xs
  induction xs with
  | nil =>
      intro _ a ha
      cases ha
  | cons x xs ih =>
      intro h a ha b hb hab
      have hn : key x ∉ xs.map key ∧ (xs.map key).Nodup := by
        simpa only [List.map_cons, List.nodup_cons] using h
      rcases List.mem_cons.mp ha with rfl | ha
      · rcases List.mem_cons.mp hb with rfl | hb
        · rfl
        · exact False.elim (hn.1 (List.mem_map.mpr ⟨b, hb, hab.symm⟩))
      · rcases List.mem_cons.mp hb with rfl | hb
        · exact False.elim (hn.1 (List.mem_map.mpr ⟨a, ha, hab⟩))
        · exact ih hn.2 a ha b hb hab

/-- Exact selected-set coverage supplies a real record, not a default value. -/
theorem exists_entry (p : ℕ × ℕ) (hp : p ∈ ConditionalNodeIndices.modes) :
    ∃ e ∈ entries, entryKey e = p := by
  have hkeys : p ∈ (entries.map entryKey).toFinset := by
    rw [entries_keys_eq_modes]
    exact hp
  exact List.mem_map.mp (List.mem_toFinset.mp hkeys)

/-- A proof-indexed choice among the existing complete selected records. -/
noncomputable def selectedEntry (p : ℕ × ℕ) (hp : p ∈ ConditionalNodeIndices.modes) :
    OriginalRow227ErrorBoundary.ErrorEntry :=
  Classical.choose (exists_entry p hp)

theorem selectedEntry_mem (p : ℕ × ℕ) (hp : p ∈ ConditionalNodeIndices.modes) :
    selectedEntry p hp ∈ entries :=
  (Classical.choose_spec (exists_entry p hp)).1

theorem selectedEntry_key (p : ℕ × ℕ) (hp : p ∈ ConditionalNodeIndices.modes) :
    entryKey (selectedEntry p hp) = p :=
  (Classical.choose_spec (exists_entry p hp)).2

/-- Choosing by a key returns every existing record with that key exactly. -/
theorem selectedEntry_eq (p : ℕ × ℕ) (hp : p ∈ ConditionalNodeIndices.modes)
    (e : OriginalRow227ErrorBoundary.ErrorEntry) (he : e ∈ entries)
    (hkey : entryKey e = p) : selectedEntry p hp = e := by
  exact eq_of_mem_of_key_eq entryKey entries entries_keys_nodup
    (selectedEntry p hp) (selectedEntry_mem p hp) e he
    ((selectedEntry_key p hp).trans hkey.symm)

theorem entry_mem_modes (e : OriginalRow227ErrorBoundary.ErrorEntry)
    (he : e ∈ entries) : (e.c, e.d) ∈ ConditionalNodeIndices.modes := by
  change entryKey e ∈ ConditionalNodeIndices.modes
  rw [← entries_keys_eq_modes]
  exact List.mem_toFinset.mpr (List.mem_map.mpr ⟨e, he, rfl⟩)

/-- Existing signed center numerator; the outside-domain value is merely an
extension of the selected data, not a value assigned to any missing record. -/
noncomputable def centerNumerator (p : ℕ × ℕ) : ℤ :=
  if hp : p ∈ ConditionalNodeIndices.modes then (selectedEntry p hp).center else 0

/-- Existing radius numerator, on the same exact selected domain. -/
noncomputable def radiusNumerator (p : ℕ × ℕ) : ℤ :=
  if hp : p ∈ ConditionalNodeIndices.modes then (selectedEntry p hp).radius else 0

/-- The existing signed saved-center residual numerator, using the same
selected record and the original common product grid. -/
noncomputable def residualNumerator (p : ℕ × ℕ) : ℤ :=
  if hp : p ∈ ConditionalNodeIndices.modes then
    OriginalRow227ErrorBoundary.errorNumerator (selectedEntry p hp)
  else 0

noncomputable def centerQ (p : ℕ × ℕ) : ℚ :=
  (centerNumerator p : ℚ) / (2 : ℚ) ^ 768

noncomputable def radiusQ (p : ℕ × ℕ) : ℚ :=
  (radiusNumerator p : ℚ) / (2 : ℚ) ^ 768

theorem centerNumerator_at_entry (e : OriginalRow227ErrorBoundary.ErrorEntry)
    (he : e ∈ entries) : centerNumerator (e.c, e.d) = e.center := by
  have hm := entry_mem_modes e he
  simp only [centerNumerator, dite_eq_left hm]
  exact congrArg OriginalRow227ErrorBoundary.ErrorEntry.center
    (selectedEntry_eq (e.c, e.d) hm e he rfl)

theorem radiusNumerator_at_entry (e : OriginalRow227ErrorBoundary.ErrorEntry)
    (he : e ∈ entries) : radiusNumerator (e.c, e.d) = e.radius := by
  have hm := entry_mem_modes e he
  simp only [radiusNumerator, dite_eq_left hm]
  exact congrArg OriginalRow227ErrorBoundary.ErrorEntry.radius
    (selectedEntry_eq (e.c, e.d) hm e he rfl)

theorem residualNumerator_at_entry (e : OriginalRow227ErrorBoundary.ErrorEntry)
    (he : e ∈ entries) :
    residualNumerator (e.c, e.d) = OriginalRow227ErrorBoundary.errorNumerator e := by
  have hm := entry_mem_modes e he
  simp only [residualNumerator, dite_eq_left hm]
  exact congrArg OriginalRow227ErrorBoundary.errorNumerator
    (selectedEntry_eq (e.c, e.d) hm e he rfl)

theorem centerQ_at_entry (e : OriginalRow227ErrorBoundary.ErrorEntry)
    (he : e ∈ entries) : centerQ (e.c, e.d) = (e.center : ℚ) / (2 : ℚ) ^ 768 := by
  rw [centerQ, centerNumerator_at_entry e he]

theorem radiusQ_at_entry (e : OriginalRow227ErrorBoundary.ErrorEntry)
    (he : e ∈ entries) : radiusQ (e.c, e.d) = (e.radius : ℚ) / (2 : ℚ) ^ 768 := by
  rw [radiusQ, radiusNumerator_at_entry e he]

theorem centerNumerator_of_not_mem (p : ℕ × ℕ)
    (hp : p ∉ ConditionalNodeIndices.modes) : centerNumerator p = 0 := by
  simp only [centerNumerator, dite_eq_right hp]

theorem radiusNumerator_of_not_mem (p : ℕ × ℕ)
    (hp : p ∉ ConditionalNodeIndices.modes) : radiusNumerator p = 0 := by
  simp only [radiusNumerator, dite_eq_right hp]

end Grothe.UpperChaos.OriginalRow227SelectedFields

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227SelectedFields.eq_of_mem_of_key_eq,
      ``Grothe.UpperChaos.OriginalRow227SelectedFields.exists_entry,
      ``Grothe.UpperChaos.OriginalRow227SelectedFields.selectedEntry_mem,
      ``Grothe.UpperChaos.OriginalRow227SelectedFields.selectedEntry_key,
      ``Grothe.UpperChaos.OriginalRow227SelectedFields.selectedEntry_eq,
      ``Grothe.UpperChaos.OriginalRow227SelectedFields.entry_mem_modes,
      ``Grothe.UpperChaos.OriginalRow227SelectedFields.centerNumerator_at_entry,
      ``Grothe.UpperChaos.OriginalRow227SelectedFields.radiusNumerator_at_entry,
      ``Grothe.UpperChaos.OriginalRow227SelectedFields.residualNumerator_at_entry,
      ``Grothe.UpperChaos.OriginalRow227SelectedFields.centerQ_at_entry,
      ``Grothe.UpperChaos.OriginalRow227SelectedFields.radiusQ_at_entry,
      ``Grothe.UpperChaos.OriginalRow227SelectedFields.centerNumerator_of_not_mem,
      ``Grothe.UpperChaos.OriginalRow227SelectedFields.radiusNumerator_of_not_mem] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
