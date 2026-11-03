import Grothe.UpperChaos.Q0GaussAddress

/-! A successful panel scan gives ordered, disjoint ordinal intervals.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussAddress

/-- A panel in a successful scan starts no earlier than the scan and ends
no later than its final ordinal. -/
theorem scan_member_bounds (ps : List Panel) (start finish : ℕ)
    (h : scan ps start = some finish) (p : Panel) (hp : p ∈ ps) :
    start ≤ p.offset ∧ p.offset + p.order ≤ finish := by
  induction ps generalizing start with
  | nil => simp at hp
  | cons q qs ih =>
    obtain ⟨hq, ht⟩ := scan_cons_sound q qs start finish h
    rcases List.mem_cons.mp hp with rfl | hp
    · exact ⟨by omega, by simpa [hq.1] using scan_mono qs (start + p.order) finish ht⟩
    · have hb := ih (start + q.order) ht hp
      omega

/-- Distinct positions in a scanned panel list have disjoint ordered
ordinal intervals. -/
theorem scan_pairwise (ps : List Panel) (start finish : ℕ)
    (h : scan ps start = some finish) :
    ps.Pairwise (fun p q => p.offset + p.order ≤ q.offset) := by
  induction ps generalizing start with
  | nil => simp
  | cons p ps ih =>
    obtain ⟨hp, ht⟩ := scan_cons_sound p ps start finish h
    apply List.pairwise_cons.mpr
    refine ⟨?_, ih (start + p.order) ht⟩
    intro q hq
    have hb := (scan_member_bounds ps (start + p.order) finish ht q hq).1
    omega


/-- An ordinal in two scanned panel intervals identifies the same panel
position and the same rule index. -/
theorem scanned_address_unique (ps : List Panel) (start finish : ℕ)
    (h : scan ps start = some finish) (i j : Fin ps.length) (k l : ℕ)
    (hk : k < (ps.get i).order) (hl : l < (ps.get j).order)
    (heq : (ps.get i).offset + k = (ps.get j).offset + l) :
    i = j ∧ k = l := by
  have hw := scan_pairwise ps start finish h
  have hij : i = j := by
    by_contra hne
    rcases lt_or_gt_of_ne hne with hij | hji
    · have hsep := hw.rel_getElem_of_lt i.isLt j.isLt hij
      change (ps.get i).offset + (ps.get i).order ≤ (ps.get j).offset at hsep
      omega
    · have hsep := hw.rel_getElem_of_lt j.isLt i.isLt hji
      change (ps.get j).offset + (ps.get j).order ≤ (ps.get i).offset at hsep
      omega
  subst j
  exact ⟨rfl, by omega⟩

end Grothe.UpperChaos.Q0GaussAddress
