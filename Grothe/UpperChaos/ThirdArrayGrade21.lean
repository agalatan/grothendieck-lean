import Grothe.UpperChaos.ThirdGradeLengths
import Grothe.UpperChaos.ThirdFoldRectangle

/-! Draft source-bound grade 21; must be checked by Lean. -/
namespace Grothe.UpperChaos.ThirdArrayGrade21
open ThirdGradeCandidateNumerics
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := ThirdGradeReceipt00.values ++ ThirdGradeReceipt01.values ++ ThirdGradeReceipt02.values ++ ThirdGradeReceipt03.values ++ ThirdGradeReceipt04.values ++ ThirdGradeReceipt05.values ++ ThirdGradeReceipt06.values ++ ThirdGradeReceipt07.values ++ ThirdGradeReceipt08.values ++ ThirdGradeReceipt09.values ++ ThirdGradeReceipt10.values ++ ThirdGradeReceipt11.values ++ ThirdGradeReceipt12.values ++ ThirdGradeReceipt13.values ++ ThirdGradeReceipt14.values ++ ThirdGradeReceipt15.values ++ ThirdGradeReceipt16.values ++ ThirdGradeReceipt17.values ++ ThirdGradeReceipt18.values ++ ThirdGradeReceipt19.values ++ ThirdGradeReceipt20.values
def suffix : List ℤ := ThirdGradeReceipt22.values ++ ThirdGradeReceipt23.values ++ ThirdGradeReceipt24.values ++ ThirdGradeReceipt25.values

theorem source_split : ThirdIntegerSourceBinding.allValues =
    before ++ ThirdGradeReceipt21.values ++ suffix := by
  simp only [ThirdIntegerSourceBinding.allValues, ThirdIntegerSourceBinding.source_values,
    before, suffix, List.append_assoc]

theorem before_length : before.length = 3542 := by
  simp only [before, List.length_append, ThirdGradeLengths.len00, ThirdGradeLengths.len01, ThirdGradeLengths.len02, ThirdGradeLengths.len03, ThirdGradeLengths.len04, ThirdGradeLengths.len05, ThirdGradeLengths.len06, ThirdGradeLengths.len07, ThirdGradeLengths.len08, ThirdGradeLengths.len09, ThirdGradeLengths.len10, ThirdGradeLengths.len11, ThirdGradeLengths.len12, ThirdGradeLengths.len13, ThirdGradeLengths.len14, ThirdGradeLengths.len15, ThirdGradeLengths.len16, ThirdGradeLengths.len17, ThirdGradeLengths.len18, ThirdGradeLengths.len19, ThirdGradeLengths.len20, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 23) (hd : d < 22) :
    thirdCenterAt 21 c d = ThirdGradeReceipt21.values[c * 22 + d]?.getD 0 := by
  have hk : c * 22 + d < ThirdGradeReceipt21.values.length := by
    rw [ThirdGradeLengths.len21]
    omega
  change thirdCenterInts[gradedFlatIndex 21 c d]?.getD 0 = _
  rw [ThirdIntegerSourceBinding.source_array, source_split]
  have h := ThirdArrayLookup.middle_get before ThirdGradeReceipt21.values suffix (c * 22 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (21 + 2), ∑ d ∈ Finset.range (21 + 1),
      thirdCenterAt 21 c d ^ 2) = grade 21 := by
  calc
    _ = ∑ c ∈ Finset.range 23, ∑ d ∈ Finset.range 22,
        (ThirdGradeReceipt21.values[c * 22 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = thirdCenterIntegerGrade21.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [ThirdGradeReceipt21.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold thirdCenterIntegerGrade21 23 22
              TaylorThirdIntegerGrade21Check.grade_length)
    _ = grade 21 := by
          have htarget : grade 21 = 411986005990471885279114228819387168647053058244608 := by decide +kernel
          rw [htarget]
          exact TaylorThirdIntegerGrade21Check.grade_energy

end Grothe.UpperChaos.ThirdArrayGrade21
