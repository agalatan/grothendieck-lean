import Mathlib.Tactic

/-! Generic coverage by a list whose stored ordinals enumerate an initial
segment. It does not by itself identify those ordinals with Gauss nodes.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0OrdinalCoverage

/-- Every ordinal occurs in exactly one row when the mapped ordinal list is
exactly a range. -/
theorem exists_unique_of_map_range {α : Type*} (index : α → ℕ) (rows : List α)
    (n : ℕ) (h : rows.map index = List.range' 0 n) (i : ℕ) (hi : i < n) :
    ∃! r, r ∈ rows ∧ index r = i := by
  have hm : i ∈ rows.map index := by
    rw [h]
    simpa using hi
  obtain ⟨r, hr, hri⟩ := List.mem_map.mp hm
  have hn : (rows.map index).Nodup := by
    rw [h]
    exact List.nodup_range' _
  refine ⟨r, ⟨hr, hri⟩, ?_⟩
  intro other ho
  exact List.inj_on_of_nodup_map hn ho.1 hr (ho.2.trans hri.symm)

end Grothe.UpperChaos.Q0OrdinalCoverage
