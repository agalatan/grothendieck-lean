import Grothe.Lower.ChordData
import Grothe.Lower.ProfileCheckV2

/-!
# Chord domination of all 365 physical polynomials

`chords_check` runs the exact checker (`native_decide`) on every polynomial of `polyGroupsV2`
against the lifted node caps of its source group; `chords_sound` is the resulting statement:
every lifted polynomial used by the version-2 certificate dominates, at every `s ≥ 0`, an
active chord/tail support of its group.  Together with the analytic facts that the potential
`Ψ` is convex, `2`-Lipschitz and below the lifted node caps, this makes each polynomial a
global majorant of `Ψ`.
-/

namespace Grothe.Lower

def dfltCert : PhysCert := ⟨0, 0, ""⟩

theorem chords_check : (List.range 9).all (fun g =>
    ((polyGroupsV2.getD g []).length == (chordCerts.getD g []).length) &&
    (List.zip (polyGroupsV2.getD g []) (chordCerts.getD g [])).all
      (fun pc => checkPhysical (chordPts.getD g []) (liftPoly pc.1) pc.2)) = true := by
  native_decide

/-- **Every physical polynomial of the version-2 certificate dominates the chords of its
group.** -/
theorem chords_sound : ∀ g < 9, ∀ k < ctxV2.npolys g,
    DominatesChords (chordPts.getD g []) (ctxV2.poly g k) := by
  intro g hg k hk
  have h := List.all_eq_true.1 chords_check g (List.mem_range.2 hg)
  simp only [Bool.and_eq_true, beq_iff_eq, List.all_eq_true] at h
  obtain ⟨hlen, hall⟩ := h
  have hk' : k < (polyGroupsV2.getD g []).length := hk
  have hk'' : k < (chordCerts.getD g []).length := lt_of_lt_of_eq hk' hlen
  have hmem : ((polyGroupsV2.getD g []).getD k [], (chordCerts.getD g []).getD k dfltCert)
      ∈ List.zip (polyGroupsV2.getD g []) (chordCerts.getD g []) := by
    rw [List.getD_eq_getElem _ _ hk', List.getD_eq_getElem _ _ hk'']
    exact List.mem_iff_getElem.2 ⟨k, by rw [List.length_zip]; exact lt_min hk' hk'', by simp⟩
  exact dominates_of_check _ _ _ (hall _ hmem)

end Grothe.Lower
