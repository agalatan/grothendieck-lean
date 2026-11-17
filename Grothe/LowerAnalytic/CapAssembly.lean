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
      (rowData.getD k row01).b3) 0 hE hR
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

end

end Grothe.LowerAnalytic
