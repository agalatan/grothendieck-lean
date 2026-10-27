import Grothe.Upper.ComparisonMass

/-! Exact head table mass, split into 21 rational checks. Agent-ID: codex-aa04.
Each chunk is checked by Lean kernel reduction, with no new native fact. The caps are upward roundings at 10^-9. -/

open GrotheKernel Finset
namespace Grothe.Upper

set_option maxRecDepth 16384
set_option maxHeartbeats 0
-- Bound each generated string-parser CBV check; default 100000 is insufficient.
set_option cbv.maxSteps 10000000

/-- Sum a raw row, retaining all entries, including any zero index. -/
def tableRowMass (r : RowQ) : ℚ := (r.2.map fun e => e.2).sum

def headRowMasses : List ℚ := energyStrs.map fun s => tableRowMass (parseRow s)

lemma tableRowMass_sum_flat (rows : List RowQ) :
    (rows.map tableRowMass).sum = ((flat rows).map fun e => e.2).sum := by
  induction rows with
  | nil => rfl
  | cons r rs ih =>
    simp only [List.map_cons, List.sum_cons, flat, List.flatMap_cons,
      List.map_append, List.sum_append] at ih ⊢
    rw [ih]
    congr 1
    simp [tableRowMass, List.map_map, Function.comp_def]

lemma headRowMasses_sum : headRowMasses.sum = ∑ p ∈ headIdx 501, energyTable p := by
  have hs : ∀ e ∈ flat energyRows, e.1 ∈ headIdx 501 := by
    intro e he
    change e ∈ energyRows.flatMap (fun r => r.2.map fun e => ((e.1, r.1), e.2)) at he
    obtain ⟨r, hr, he⟩ := List.mem_flatMap.1 he
    obtain ⟨e', he', rfl⟩ := List.mem_map.1 he
    exact mem_headIdx.2 ((tabWithin_iff.1 energyRows_within r hr).2 e' he')
  have h := weighted_entries (headIdx 501) (fun _ => 1) (flat energyRows) hs
  have hrows : headRowMasses.sum = ((flat energyRows).map fun e => e.2).sum := by
    simpa only [headRowMasses, energyRows, List.map_map, Function.comp_def] using
      tableRowMass_sum_flat energyRows
  rw [hrows]
  simpa only [one_mul, mul_one, energyTable, tabVal] using h

lemma rowMass_split (xs : List ℚ) (n : ℕ) :
    (xs.drop n).sum = ((xs.drop n).take 8).sum + (xs.drop (n + 8)).sum := by
  have h : (xs.drop n).take 8 ++ (xs.drop n).drop 8 = xs.drop n :=
    List.take_append_drop 8 (xs.drop n)
  have hh := congrArg List.sum h
  simpa only [List.sum_append, List.drop_drop] using hh.symm

{{chunk_checks}}lemma rowMass_end : (headRowMasses.drop 168).sum = 0 := by
  decide +kernel

/-- Exact rational mass bound; the only finite data checks are the chunks above. -/
theorem energyTable_head_mass_rat :
    (∑ p ∈ headIdx 501, energyTable p) + (3 / 20000000 : ℚ) ≤ 1 := by
  rw [← headRowMasses_sum]
  have hs00 := rowMass_split headRowMasses 0
  have hs01 := rowMass_split headRowMasses 8
  have hs02 := rowMass_split headRowMasses 16
  have hs03 := rowMass_split headRowMasses 24
  have hs04 := rowMass_split headRowMasses 32
  have hs05 := rowMass_split headRowMasses 40
  have hs06 := rowMass_split headRowMasses 48
  have hs07 := rowMass_split headRowMasses 56
  have hs08 := rowMass_split headRowMasses 64
  have hs09 := rowMass_split headRowMasses 72
  have hs10 := rowMass_split headRowMasses 80
  have hs11 := rowMass_split headRowMasses 88
  have hs12 := rowMass_split headRowMasses 96
  have hs13 := rowMass_split headRowMasses 104
  have hs14 := rowMass_split headRowMasses 112
  have hs15 := rowMass_split headRowMasses 120
  have hs16 := rowMass_split headRowMasses 128
  have hs17 := rowMass_split headRowMasses 136
  have hs18 := rowMass_split headRowMasses 144
  have hs19 := rowMass_split headRowMasses 152
  have hs20 := rowMass_split headRowMasses 160
  have hc00 := rowMass_chunk_00
  have hc01 := rowMass_chunk_01
  have hc02 := rowMass_chunk_02
  have hc03 := rowMass_chunk_03
  have hc04 := rowMass_chunk_04
  have hc05 := rowMass_chunk_05
  have hc06 := rowMass_chunk_06
  have hc07 := rowMass_chunk_07
  have hc08 := rowMass_chunk_08
  have hc09 := rowMass_chunk_09
  have hc10 := rowMass_chunk_10
  have hc11 := rowMass_chunk_11
  have hc12 := rowMass_chunk_12
  have hc13 := rowMass_chunk_13
  have hc14 := rowMass_chunk_14
  have hc15 := rowMass_chunk_15
  have hc16 := rowMass_chunk_16
  have hc17 := rowMass_chunk_17
  have hc18 := rowMass_chunk_18
  have hc19 := rowMass_chunk_19
  have hc20 := rowMass_chunk_20
  have hend := rowMass_end
  simp only [Nat.reduceAdd, List.drop_zero] at hs00 hs01 hs02 hs03 hs04 hs05 hs06 hs07 hs08 hs09 hs10 hs11 hs12 hs13 hs14 hs15 hs16 hs17 hs18 hs19 hs20 hc00
  linarith

/-- Cast the rational check to the exact form needed by the L² bridge. -/
theorem energyTable_head_mass_real :
    (∑ p ∈ headIdx 501, (energyTable p : ℝ)) + (3 / 20000000 : ℝ) ≤ 1 := by
  have h := (Rat.cast_le (K := ℝ)).mpr energyTable_head_mass_rat
  simpa only [Rat.cast_sum, Rat.cast_add, Rat.cast_div, Rat.cast_ofNat, Rat.cast_one] using h

end Grothe.Upper
