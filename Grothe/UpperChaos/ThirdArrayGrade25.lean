import Grothe.UpperChaos.ThirdGradeLengths
import Grothe.UpperChaos.ThirdFoldRectangle

/-! Exact source-bound integer sum for grade 25. -/
namespace Grothe.UpperChaos.ThirdArrayGrade25
open ThirdGradeCandidateNumerics
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := ThirdGradeReceipt00.values ++ ThirdGradeReceipt01.values ++ ThirdGradeReceipt02.values ++ ThirdGradeReceipt03.values ++ ThirdGradeReceipt04.values ++ ThirdGradeReceipt05.values ++ ThirdGradeReceipt06.values ++ ThirdGradeReceipt07.values ++ ThirdGradeReceipt08.values ++ ThirdGradeReceipt09.values ++ ThirdGradeReceipt10.values ++ ThirdGradeReceipt11.values ++ ThirdGradeReceipt12.values ++ ThirdGradeReceipt13.values ++ ThirdGradeReceipt14.values ++ ThirdGradeReceipt15.values ++ ThirdGradeReceipt16.values ++ ThirdGradeReceipt17.values ++ ThirdGradeReceipt18.values ++ ThirdGradeReceipt19.values ++ ThirdGradeReceipt20.values ++ ThirdGradeReceipt21.values ++ ThirdGradeReceipt22.values ++ ThirdGradeReceipt23.values ++ ThirdGradeReceipt24.values
def suffix : List ℤ := []

theorem source_split : ThirdIntegerSourceBinding.allValues =
    before ++ ThirdGradeReceipt25.values ++ suffix := by
  simp only [ThirdIntegerSourceBinding.allValues, ThirdIntegerSourceBinding.source_values,
    before, suffix, List.append_assoc, List.append_nil]

theorem before_length : before.length = 5850 := by
  simp only [before, List.length_append, ThirdGradeLengths.len00, ThirdGradeLengths.len01, ThirdGradeLengths.len02, ThirdGradeLengths.len03, ThirdGradeLengths.len04, ThirdGradeLengths.len05, ThirdGradeLengths.len06, ThirdGradeLengths.len07, ThirdGradeLengths.len08, ThirdGradeLengths.len09, ThirdGradeLengths.len10, ThirdGradeLengths.len11, ThirdGradeLengths.len12, ThirdGradeLengths.len13, ThirdGradeLengths.len14, ThirdGradeLengths.len15, ThirdGradeLengths.len16, ThirdGradeLengths.len17, ThirdGradeLengths.len18, ThirdGradeLengths.len19, ThirdGradeLengths.len20, ThirdGradeLengths.len21, ThirdGradeLengths.len22, ThirdGradeLengths.len23, ThirdGradeLengths.len24, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 27) (hd : d < 26) :
    thirdCenterAt 25 c d = ThirdGradeReceipt25.values[c * 26 + d]?.getD 0 := by
  have hk : c * 26 + d < ThirdGradeReceipt25.values.length := by
    rw [ThirdGradeLengths.len25]
    omega
  change thirdCenterInts[gradedFlatIndex 25 c d]?.getD 0 = _
  rw [ThirdIntegerSourceBinding.source_array, source_split]
  have h := ThirdArrayLookup.middle_get before ThirdGradeReceipt25.values suffix (c * 26 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (25 + 2), ∑ d ∈ Finset.range (25 + 1),
      thirdCenterAt 25 c d ^ 2) = grade 25 := by
  calc
    _ = ∑ c ∈ Finset.range 27, ∑ d ∈ Finset.range 26,
        (ThirdGradeReceipt25.values[c * 26 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = thirdCenterIntegerGrade25.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [ThirdGradeReceipt25.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold thirdCenterIntegerGrade25 27 26
              TaylorThirdIntegerGrade25Check.grade_length)
    _ = grade 25 := by
          have htarget : grade 25 = 365194447708022706840596720968599347214805041954816 := by decide +kernel
          rw [htarget]
          exact TaylorThirdIntegerGrade25Check.grade_energy

end Grothe.UpperChaos.ThirdArrayGrade25
