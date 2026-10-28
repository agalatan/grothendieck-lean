import Grothe.UpperChaos.ThirdGradeLengths
import Grothe.UpperChaos.ThirdFoldRectangle

/-! Draft source-bound grade 12; must be checked by Lean. -/
namespace Grothe.UpperChaos.ThirdArrayGrade12
open ThirdGradeCandidateNumerics
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := ThirdGradeReceipt00.values ++ ThirdGradeReceipt01.values ++ ThirdGradeReceipt02.values ++ ThirdGradeReceipt03.values ++ ThirdGradeReceipt04.values ++ ThirdGradeReceipt05.values ++ ThirdGradeReceipt06.values ++ ThirdGradeReceipt07.values ++ ThirdGradeReceipt08.values ++ ThirdGradeReceipt09.values ++ ThirdGradeReceipt10.values ++ ThirdGradeReceipt11.values
def suffix : List ℤ := ThirdGradeReceipt13.values ++ ThirdGradeReceipt14.values ++ ThirdGradeReceipt15.values ++ ThirdGradeReceipt16.values ++ ThirdGradeReceipt17.values ++ ThirdGradeReceipt18.values ++ ThirdGradeReceipt19.values ++ ThirdGradeReceipt20.values ++ ThirdGradeReceipt21.values ++ ThirdGradeReceipt22.values ++ ThirdGradeReceipt23.values ++ ThirdGradeReceipt24.values ++ ThirdGradeReceipt25.values

theorem source_split : ThirdIntegerSourceBinding.allValues =
    before ++ ThirdGradeReceipt12.values ++ suffix := by
  simp only [ThirdIntegerSourceBinding.allValues, ThirdIntegerSourceBinding.source_values,
    before, suffix, List.append_assoc]

theorem before_length : before.length = 728 := by
  simp only [before, List.length_append, ThirdGradeLengths.len00, ThirdGradeLengths.len01, ThirdGradeLengths.len02, ThirdGradeLengths.len03, ThirdGradeLengths.len04, ThirdGradeLengths.len05, ThirdGradeLengths.len06, ThirdGradeLengths.len07, ThirdGradeLengths.len08, ThirdGradeLengths.len09, ThirdGradeLengths.len10, ThirdGradeLengths.len11, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 14) (hd : d < 13) :
    thirdCenterAt 12 c d = ThirdGradeReceipt12.values[c * 13 + d]?.getD 0 := by
  have hk : c * 13 + d < ThirdGradeReceipt12.values.length := by
    rw [ThirdGradeLengths.len12]
    omega
  change thirdCenterInts[gradedFlatIndex 12 c d]?.getD 0 = _
  rw [ThirdIntegerSourceBinding.source_array, source_split]
  have h := ThirdArrayLookup.middle_get before ThirdGradeReceipt12.values suffix (c * 13 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (12 + 2), ∑ d ∈ Finset.range (12 + 1),
      thirdCenterAt 12 c d ^ 2) = grade 12 := by
  calc
    _ = ∑ c ∈ Finset.range 14, ∑ d ∈ Finset.range 13,
        (ThirdGradeReceipt12.values[c * 13 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = thirdCenterIntegerGrade12.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [ThirdGradeReceipt12.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold thirdCenterIntegerGrade12 14 13
              TaylorThirdIntegerGrade12Check.grade_length)
    _ = grade 12 := by
          have htarget : grade 12 = 625785305858991510315277327744395465456503419305984 := by decide +kernel
          rw [htarget]
          exact TaylorThirdIntegerGrade12Check.grade_energy

end Grothe.UpperChaos.ThirdArrayGrade12
