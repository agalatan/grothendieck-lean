import Grothe.UpperChaos.ThirdGradeLengths
import Grothe.UpperChaos.ThirdFoldRectangle

/-! Exact source-bound integer sum for grade 5. -/
namespace Grothe.UpperChaos.ThirdArrayGrade05
open ThirdGradeCandidateNumerics
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := ThirdGradeReceipt00.values ++ ThirdGradeReceipt01.values ++ ThirdGradeReceipt02.values ++ ThirdGradeReceipt03.values ++ ThirdGradeReceipt04.values
def suffix : List ℤ := ThirdGradeReceipt06.values ++ ThirdGradeReceipt07.values ++ ThirdGradeReceipt08.values ++ ThirdGradeReceipt09.values ++ ThirdGradeReceipt10.values ++ ThirdGradeReceipt11.values ++ ThirdGradeReceipt12.values ++ ThirdGradeReceipt13.values ++ ThirdGradeReceipt14.values ++ ThirdGradeReceipt15.values ++ ThirdGradeReceipt16.values ++ ThirdGradeReceipt17.values ++ ThirdGradeReceipt18.values ++ ThirdGradeReceipt19.values ++ ThirdGradeReceipt20.values ++ ThirdGradeReceipt21.values ++ ThirdGradeReceipt22.values ++ ThirdGradeReceipt23.values ++ ThirdGradeReceipt24.values ++ ThirdGradeReceipt25.values

theorem source_split : ThirdIntegerSourceBinding.allValues =
    before ++ ThirdGradeReceipt05.values ++ suffix := by
  simp only [ThirdIntegerSourceBinding.allValues, ThirdIntegerSourceBinding.source_values,
    before, suffix, List.append_assoc]

theorem before_length : before.length = 70 := by
  simp only [before, List.length_append, ThirdGradeLengths.len00, ThirdGradeLengths.len01, ThirdGradeLengths.len02, ThirdGradeLengths.len03, ThirdGradeLengths.len04, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 7) (hd : d < 6) :
    thirdCenterAt 5 c d = ThirdGradeReceipt05.values[c * 6 + d]?.getD 0 := by
  have hk : c * 6 + d < ThirdGradeReceipt05.values.length := by
    rw [ThirdGradeLengths.len05]
    omega
  change thirdCenterInts[gradedFlatIndex 5 c d]?.getD 0 = _
  rw [ThirdIntegerSourceBinding.source_array, source_split]
  have h := ThirdArrayLookup.middle_get before ThirdGradeReceipt05.values suffix (c * 6 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (5 + 2), ∑ d ∈ Finset.range (5 + 1),
      thirdCenterAt 5 c d ^ 2) = grade 5 := by
  calc
    _ = ∑ c ∈ Finset.range 7, ∑ d ∈ Finset.range 6,
        (ThirdGradeReceipt05.values[c * 6 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = thirdCenterIntegerGrade05.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [ThirdGradeReceipt05.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold thirdCenterIntegerGrade05 7 6
              TaylorThirdIntegerGrade05Check.grade_length)
    _ = grade 5 := by
          have htarget : grade 5 = 2939757548211040834628685072859828444170766782562304 := by decide +kernel
          rw [htarget]
          exact TaylorThirdIntegerGrade05Check.grade_energy

end Grothe.UpperChaos.ThirdArrayGrade05
