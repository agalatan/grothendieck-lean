import Grothe.UpperChaos.ThirdGradeLengths
import Grothe.UpperChaos.ThirdFoldRectangle

/-! Exact source-bound integer sum for grade 1. -/
namespace Grothe.UpperChaos.ThirdArrayGrade01
open ThirdGradeCandidateNumerics
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := ThirdGradeReceipt00.values
def suffix : List ℤ := ThirdGradeReceipt02.values ++ ThirdGradeReceipt03.values ++ ThirdGradeReceipt04.values ++ ThirdGradeReceipt05.values ++ ThirdGradeReceipt06.values ++ ThirdGradeReceipt07.values ++ ThirdGradeReceipt08.values ++ ThirdGradeReceipt09.values ++ ThirdGradeReceipt10.values ++ ThirdGradeReceipt11.values ++ ThirdGradeReceipt12.values ++ ThirdGradeReceipt13.values ++ ThirdGradeReceipt14.values ++ ThirdGradeReceipt15.values ++ ThirdGradeReceipt16.values ++ ThirdGradeReceipt17.values ++ ThirdGradeReceipt18.values ++ ThirdGradeReceipt19.values ++ ThirdGradeReceipt20.values ++ ThirdGradeReceipt21.values ++ ThirdGradeReceipt22.values ++ ThirdGradeReceipt23.values ++ ThirdGradeReceipt24.values ++ ThirdGradeReceipt25.values

theorem source_split : ThirdIntegerSourceBinding.allValues =
    before ++ ThirdGradeReceipt01.values ++ suffix := by
  simp only [ThirdIntegerSourceBinding.allValues, ThirdIntegerSourceBinding.source_values,
    before, suffix, List.append_assoc]

theorem before_length : before.length = 2 := by
  simp only [before, ThirdGradeLengths.len00]

theorem lookup (c d : ℕ) (hc : c < 3) (hd : d < 2) :
    thirdCenterAt 1 c d = ThirdGradeReceipt01.values[c * 2 + d]?.getD 0 := by
  have hk : c * 2 + d < ThirdGradeReceipt01.values.length := by
    rw [ThirdGradeLengths.len01]
    omega
  change thirdCenterInts[gradedFlatIndex 1 c d]?.getD 0 = _
  rw [ThirdIntegerSourceBinding.source_array, source_split]
  have h := ThirdArrayLookup.middle_get before ThirdGradeReceipt01.values suffix (c * 2 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (1 + 2), ∑ d ∈ Finset.range (1 + 1),
      thirdCenterAt 1 c d ^ 2) = grade 1 := by
  calc
    _ = ∑ c ∈ Finset.range 3, ∑ d ∈ Finset.range 2,
        (ThirdGradeReceipt01.values[c * 2 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = thirdCenterIntegerGrade01.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [ThirdGradeReceipt01.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold thirdCenterIntegerGrade01 3 2
              TaylorThirdIntegerGrade01Check.grade_length)
    _ = grade 1 := by
          have htarget : grade 1 = 6281891909463200469449438898227293552905902096384 := by decide +kernel
          rw [htarget]
          exact TaylorThirdIntegerGrade01Check.grade_energy

end Grothe.UpperChaos.ThirdArrayGrade01
