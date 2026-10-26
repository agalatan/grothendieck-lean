import Grothe.LowerAnalytic.CapTables
import Grothe.LowerAnalytic.CapTablesData
import Grothe.LowerAnalytic.CapGridOK

/-!
# The shared tables of the checker and their correctness

`mkTables Nr N h` builds the kernel `Tables` from the verified enclosures of
`CapTables.lean` (`radEncList`, `tailEnc`, `angEncWith` on the shared ball table), and
`tablesOK_mk` proves `TablesOK Nr N h (mkTables Nr N h)` (radius `Nr h ≤ 8`, `4 ≤ N ≤ 4096`).
-/

open MeasureTheory Real Set Finset GrotheKernel Grothe.Upper

namespace Grothe.LowerAnalytic

lemma mem_toIv {x : ℝ} {p : ℚ × ℚ} (h1 : (p.1 : ℝ) ≤ x) (h2 : x ≤ p.2) : mem x (toIv p) := by
  have hD : (0 : ℝ) < (D : ℝ) := D_pos
  constructor
  · exact (ofRatLo_le p.1).trans (mul_le_mul_of_nonneg_right h1 hD.le)
  · exact (mul_le_mul_of_nonneg_right h2 hD.le).trans (le_ofRatHi p.2)

lemma toIv_zero : toIv (0, 0) = zeroI := by
  simp [toIv, ofRatLo, ofRatHi, zeroI, Rat.floor]

lemma getD_map_toIv (l : List (ℚ × ℚ)) (m : ℕ) :
    (l.map toIv).toArray.getD m zeroI = toIv (l.getD m (0, 0)) := by
  rw [← toIv_zero]
  by_cases hm : m < l.length
  · simp [Array.getD, hm]
  · simp [Array.getD, hm]

/-- **The tables are correct.** -/
theorem tablesOK_mk {Nr N : ℕ} {h : ℚ} (hh : 0 < h) (hR1 : 1 ≤ (Nr : ℚ) * h) (hR8 : (Nr : ℚ) * h ≤ 8)
    (hN : 4 ≤ N) (hN' : N ≤ 4096) : TablesOK Nr N h (mkTables Nr N h) := by
  refine ⟨fun i hi m hm => ?_, fun m hm => ?_, fun j hj n hn => ?_⟩
  · unfold Tables.radAt mkTables
    simp only
    rw [toArray_map_range_getD _ _ _ hi, getD_map_toIv]
    have hi' : ((i : ℚ) + 1) * h ≤ 8 := by
      have : (i : ℚ) + 1 ≤ Nr := by exact_mod_cast hi
      nlinarith
    have := CapTab.radEncList_sound (a := (i : ℚ) * h) (b := ((i : ℚ) + 1) * h) (by positivity)
      (by nlinarith) hi' hm
    push_cast at this
    exact mem_toIv this.1 this.2
  · unfold Tables.tailAt mkTables
    simp only
    rw [toArray_map_range_getD _ _ _ (by omega)]
    have := tailEnc_sound hR1 (by linarith) hm
    push_cast at this
    exact mem_toIv this.1 this.2
  · unfold mkTables
    simp only
    rw [toArray_map_range_getD _ _ _ hj, toArray_map_range_getD _ _ _ (by omega),
      GrotheKernel.angEncWith_unitTable (by omega)]
    have := angEnc_sound hN hN' hj (n := (n : ℤ)) (by simpa using hn)
    exact ⟨mem_toIv this.1 this.2.1, mem_toIv this.2.2.1 this.2.2.2⟩

end Grothe.LowerAnalytic
