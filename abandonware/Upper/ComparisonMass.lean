/-
ABANDONWARE: text removed from `Grothe/Upper/ComparisonMass.lean` by the cleanup of 4 November 2026 (PR #301, task #291).
Kept for reference only: this folder is outside every Lake library, is not imported by any root
and is never built or checked. The lines below are the removed lines of the diff against master
b886bb574, verbatim (they are not a self-contained module: imports, namespaces and context are in the
original file at that commit).
-/

lemma comparisonMass_sum {N : ℕ} {rows : List RowQ} (hw : tabWithin N rows = true)
    (b : ComparisonBand) :
    comparisonMass rows b = ∑ p ∈ (headIdx N).filter (fun p => b.contains p.1 p.2), tabVal rows p := by
  have hs : ∀ e ∈ flat rows, e.1 ∈ headIdx N := by
    intro e he
    change e ∈ rows.flatMap (fun r => r.2.map fun e => ((e.1, r.1), e.2)) at he
    obtain ⟨r, hr, he⟩ := List.mem_flatMap.1 he
    obtain ⟨e', he', rfl⟩ := List.mem_map.1 he
    exact mem_headIdx.2 ((tabWithin_iff.1 hw r hr).2 e' he')
  have h := weighted_entries (headIdx N)
    (fun p => if b.contains p.1 p.2 then 1 else 0) (flat rows) hs
  simpa [comparisonMass_flat, bandIndices, tabVal, sum_filter] using h

