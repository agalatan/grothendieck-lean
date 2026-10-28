import Grothe.UpperChaos.ThirdGradeLengths
import Grothe.UpperChaos.ThirdFoldRectangle

/-! Exact source-bound integer sum for grade 2. -/
namespace Grothe.UpperChaos.ThirdArrayGrade02
open ThirdGradeCandidateNumerics
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := ThirdGradeReceipt00.values ++ ThirdGradeReceipt01.values
def suffix : List ℤ := ThirdGradeReceipt03.values ++ ThirdGradeReceipt04.values ++ ThirdGradeReceipt05.values ++ ThirdGradeReceipt06.values ++ ThirdGradeReceipt07.values ++ ThirdGradeReceipt08.values ++ ThirdGradeReceipt09.values ++ ThirdGradeReceipt10.values ++ ThirdGradeReceipt11.values ++ ThirdGradeReceipt12.values ++ ThirdGradeReceipt13.values ++ ThirdGradeReceipt14.values ++ ThirdGradeReceipt15.values ++ ThirdGradeReceipt16.values ++ ThirdGradeReceipt17.values ++ ThirdGradeReceipt18.values ++ ThirdGradeReceipt19.values ++ ThirdGradeReceipt20.values ++ ThirdGradeReceipt21.values ++ ThirdGradeReceipt22.values ++ ThirdGradeReceipt23.values ++ ThirdGradeReceipt24.values ++ ThirdGradeReceipt25.values

theorem source_split : ThirdIntegerSourceBinding.allValues =
    before ++ ThirdGradeReceipt02.values ++ suffix := by
  simp only [ThirdIntegerSourceBinding.allValues, ThirdIntegerSourceBinding.source_values,
    before, suffix, List.append_assoc]

theorem before_length : before.length = 8 := by
  simp only [before, List.length_append, ThirdGradeLengths.len00, ThirdGradeLengths.len01, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 4) (hd : d < 3) :
    thirdCenterAt 2 c d = ThirdGradeReceipt02.values[c * 3 + d]?.getD 0 := by
  have hk : c * 3 + d < ThirdGradeReceipt02.values.length := by
    rw [ThirdGradeLengths.len02]
    omega
  change thirdCenterInts[gradedFlatIndex 2 c d]?.getD 0 = _
  rw [ThirdIntegerSourceBinding.source_array, source_split]
  have h := ThirdArrayLookup.middle_get before ThirdGradeReceipt02.values suffix (c * 3 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (2 + 2), ∑ d ∈ Finset.range (2 + 1),
      thirdCenterAt 2 c d ^ 2) = grade 2 := by
  calc
    _ = ∑ c ∈ Finset.range 4, ∑ d ∈ Finset.range 3,
        (ThirdGradeReceipt02.values[c * 3 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = thirdCenterIntegerGrade02.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [ThirdGradeReceipt02.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold thirdCenterIntegerGrade02 4 3
              TaylorThirdIntegerGrade02Check.grade_length)
    _ = grade 2 := by
          have htarget : grade 2 = 107082066966185791338608105289233816874741252751360 := by decide +kernel
          rw [htarget]
          exact TaylorThirdIntegerGrade02Check.grade_energy

end Grothe.UpperChaos.ThirdArrayGrade02
