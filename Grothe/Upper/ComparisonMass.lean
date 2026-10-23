import Grothe.Upper.Final
import Grothe.Upper.ComparisonData

/-! Native finite energy masses and their relation to the comparison radii. -/
namespace Grothe.Upper

set_option maxRecDepth 4096

open GrotheKernel Finset

noncomputable section

def bandIndices (b : ComparisonBand) : Finset (ℕ × ℕ) :=
  (headIdx 501).filter fun p => b.contains p.1 p.2

lemma bandIndices_subset (b : ComparisonBand) : bandIndices b ⊆ headIdx 501 :=
  filter_subset _ _

lemma weighted_entries (S : Finset (ℕ × ℕ)) (f : (ℕ × ℕ) → ℚ) :
    ∀ es : List ((ℕ × ℕ) × ℚ), (∀ e ∈ es, e.1 ∈ S) →
    (es.map fun e => e.2 * f e.1).sum =
      ∑ p ∈ S, (es.map fun e => if e.1 = p then e.2 else 0).sum * f p := by
  intro es
  induction es with
  | nil => intro _; simp
  | cons e es ih =>
    intro h
    simp only [List.map_cons, List.sum_cons]
    rw [ih fun e' he' => h e' (List.mem_cons_of_mem _ he')]
    have h1 : ∑ p ∈ S, (if e.1 = p then e.2 else 0) * f p = e.2 * f e.1 := by
      rw [sum_eq_single_of_mem e.1 (h e List.mem_cons_self) fun p _ hp => by
        rw [ite_eq_right (Ne.symm hp), zero_mul]]
      rw [ite_eq_left rfl]
    rw [← h1, ← sum_add_distrib]
    exact sum_congr rfl fun p _ => (add_mul _ _ _).symm

lemma comparisonMass_flat (rows : List RowQ) (b : ComparisonBand) :
    comparisonMass rows b =
      ((flat rows).map fun e => if b.contains e.1.1 e.1.2 then e.2 else 0).sum := by
  induction rows with
  | nil => rfl
  | cons r rs ih =>
    simp only [comparisonMass, List.map_cons, List.sum_cons, flat,
      List.flatMap_cons, List.map_append, List.sum_append] at ih ⊢
    rw [ih]
    congr 1
    simp only [List.map_map, Function.comp_def]

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

/-- The radii enclose all selected-band energies plus the inherited table error;
the final inequality assembles the cross terms and charges the quadratic error once. -/
theorem comparison_check : comparisonOK energyRows comparisonBands energyErrQ compareQ = true := by
  native_decide

lemma comparison_facts :
    (∀ b ∈ comparisonBands, 0 ≤ b.error ∧ 0 ≤ b.norm ∧
      comparisonMass energyRows b + energyErrQ ≤ b.norm ^ 2) ∧
    2 * (comparisonBands.map fun b => b.norm * b.error).sum +
      (comparisonBands.map fun b => b.error).sum ^ 2 ≤ compareQ := by
  simpa only [comparisonOK, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq, and_assoc] using comparison_check

lemma energyRows_within : tabWithin 501 energyRows = true := by
  have h := Grothe.head_check
  simp only [headOK, Bool.and_eq_true] at h
  exact h.1

/-- Finite table accuracy supplies the actual comparison-vector norm in every band. -/
theorem actual_band_mass {EX : ℕ × ℕ → ℝ}
    (hclose : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ))
    {b : ComparisonBand} (hb : b ∈ comparisonBands) :
    ∑ p ∈ bandIndices b, EX p ≤ (b.norm : ℝ) ^ 2 := by
  have hm : (∑ p ∈ bandIndices b, (energyTable p : ℝ)) + (energyErrQ : ℝ)
      ≤ (b.norm : ℝ) ^ 2 := by
    have h := (comparison_facts.1 b hb).2.2
    rw [comparisonMass_sum energyRows_within] at h
    change (∑ p ∈ bandIndices b, tabVal energyRows p) + energyErrQ ≤ b.norm ^ 2 at h
    exact_mod_cast h
  have he : ∑ p ∈ bandIndices b, |EX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ) :=
    (sum_le_sum_of_subset_of_nonneg (bandIndices_subset b) fun p _ _ => abs_nonneg _).trans hclose
  calc
    _ ≤ ∑ p ∈ bandIndices b, ((energyTable p : ℝ) + |EX p - (energyTable p : ℝ)|) := by
      refine sum_le_sum fun p _ => ?_
      have := le_abs_self (EX p - (energyTable p : ℝ)); linarith
    _ = (∑ p ∈ bandIndices b, (energyTable p : ℝ)) +
        ∑ p ∈ bandIndices b, |EX p - (energyTable p : ℝ)| := sum_add_distrib
    _ ≤ (∑ p ∈ bandIndices b, (energyTable p : ℝ)) + (energyErrQ : ℝ) :=
      add_le_add le_rfl he
    _ ≤ (b.norm : ℝ) ^ 2 := hm

end
end Grothe.Upper
