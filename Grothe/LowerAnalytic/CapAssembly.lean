import Grothe.LowerAnalytic.NodeCaps
import Grothe.LowerAnalytic.CapChords

/-!
# The convex-hull assembly of the node caps (route H)

Convexity of each fibre potential turns vertex caps into every stored node cap.
The computable chord predicates live in `CapChords`; their exact finite check
and the analytic assembly remain here.
-/

open MeasureTheory Set Grothe.Lower

namespace Grothe.LowerAnalytic

noncomputable section

lemma rowPot_psd (k : ℕ) (hk : k < rowData.length) :
    (rowData.getD k row01).E.psdOK = true ∧ (rowR k).psdOK = true := by
  have hmem : rowData.getD k row01 ∈ rowData := by
    rw [List.getD_eq_getElem _ _ hk]; exact List.getElem_mem hk
  have hg := List.all_eq_true.1 rowData_gatesOK _ hmem
  simp only [rowGatesOK, Bool.and_eq_true] at hg
  have hlen := rowGates_consistent.1
  refine ⟨hg.1.1, ?_⟩
  have hk' : k < rowGates.length := hlen ▸ hk
  have h := List.all_eq_true.1 rowGates_ok _ (List.getElem_mem hk')
  simp only [Bool.and_eq_true] at h
  unfold rowR
  rw [List.getD_eq_getElem _ _ hk']
  exact h.1.1

/-- `Ψ_k − capPad` is convex on `[0, ∞)`. -/
lemma rowPot_sub_convexOn (k : ℕ) (hk : k < rowData.length) :
    ConvexOn ℝ (Ici 0) (fun s => rowPot k s - capPad) := by
  obtain ⟨hE, hR⟩ := rowPot_psd k hk
  have hc := pot_convexOn (rowData.getD k row01).E (rowR k) (rowData.getD k row01).ell
    (rowData.getD k row01).beta (aFib (rowData.getD k row01).b1 (rowData.getD k row01).b2
      (rowData.getD k row01).b3) hE hR
  refine ⟨convex_Ici 0, fun x _ y _ u v hu hv huv => ?_⟩
  have h := hc.2 (mem_univ x) (mem_univ y) hu hv huv
  simp only [smul_eq_mul] at h ⊢
  have : u * (capPad : ℝ) + v * capPad = capPad := by rw [← add_mul, huv, one_mul]
  unfold rowPot
  simp only at h ⊢
  linarith

/-- **The chord bound** (route H): caps at `rᵢ < rⱼ` bound `Ψ_k − capPad` by their chord on
`[rᵢ, rⱼ]`. -/
theorem rowPot_le_chord (k : ℕ) (hk : k < rowData.length) {ra rb ca cb s : ℝ} (h0 : 0 ≤ ra)
    (hab : ra < rb) (h1 : ra ≤ s) (h2 : s ≤ rb) (ha : rowPot k ra - capPad ≤ ca)
    (hb : rowPot k rb - capPad ≤ cb) :
    rowPot k s - capPad ≤ ca + (cb - ca) / (rb - ra) * (s - ra) :=
  chord_le (fun s => rowPot k s - capPad) (rowPot_sub_convexOn k hk) ra rb ca cb s h0 hab h1 h2
    ha hb

/-! ### The chord nodes -/

/-- **The finite computation** (by `native_decide`): every chord node of every row is below the
chord of its two vertex nodes. -/
theorem capChords_check :
    (List.range rowData.length).all
      (fun k => chordOK (rowData.getD k row01).nodeList (capChords.getD k [])) = true := by
  native_decide

/-- **The node caps at the vertex nodes** (the caps that need a certificate of their own). -/
def VertexCaps : Prop :=
  ∀ k, k < rowData.length → ∀ i, i < (rowData.getD k row01).nodeList.length →
    isChord (capChords.getD k []) i = false →
      rowPot k ((rowData.getD k row01).nodeList.getD i (0, 0)).1 - capPad
        ≤ ((rowData.getD k row01).nodeList.getD i (0, 0)).2

/-- **The convex-hull step**: the caps at the vertex nodes give all node caps. -/
theorem nodeCaps_of_vertexCaps (h : VertexCaps) : NodeCaps := by
  intro k hk m hm
  have hrow := List.all_eq_true.1 capChords_check k (List.mem_range.2 hk)
  have h' := h k hk
  generalize (rowData.getD k row01).nodeList = ns at hm hrow h'
  generalize capChords.getD k [] = ch at hrow h'
  obtain ⟨i, hi, rfl⟩ := List.mem_iff_getElem.1 hm
  rw [← List.getD_eq_getElem _ (0, 0) hi]
  cases hc : isChord ch i with
  | false => exact h' i hi hc
  | true =>
    obtain ⟨t, ht, hti⟩ := List.any_eq_true.1 hc
    have hti : t.1 = i := by simpa using hti
    have hn := List.all_eq_true.1 hrow t ht
    simp only [chordNodeOK, Bool.and_eq_true, decide_eq_true_eq, Bool.not_eq_true'] at hn
    obtain ⟨⟨⟨⟨⟨⟨⟨hil, hjl⟩, hiv⟩, hjv⟩, h0⟩, h1⟩, h2⟩, hch⟩ := hn
    rw [hti] at h1 h2 hch
    have ha := h' t.2.1 hil hiv
    have hb := h' t.2.2 hjl hjv
    have h0' : (0 : ℝ) ≤ ((ns.getD t.2.1 (0, 0)).1 : ℝ) := by exact_mod_cast h0
    have h1' : ((ns.getD t.2.1 (0, 0)).1 : ℝ) < (ns.getD i (0, 0)).1 := by exact_mod_cast h1
    have h2' : ((ns.getD i (0, 0)).1 : ℝ) < (ns.getD t.2.2 (0, 0)).1 := by exact_mod_cast h2
    have hch' : ((ns.getD t.2.1 (0, 0)).2 : ℝ) + ((ns.getD t.2.2 (0, 0)).2 - (ns.getD t.2.1 (0, 0)).2)
        / ((ns.getD t.2.2 (0, 0)).1 - (ns.getD t.2.1 (0, 0)).1)
        * ((ns.getD i (0, 0)).1 - (ns.getD t.2.1 (0, 0)).1) ≤ (ns.getD i (0, 0)).2 := by
      exact_mod_cast hch
    exact (rowPot_le_chord k hk h0' (h1'.trans h2') h1'.le h2'.le ha hb).trans hch'

end

end Grothe.LowerAnalytic
