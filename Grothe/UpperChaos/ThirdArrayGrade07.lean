import Grothe.UpperChaos.ThirdGradeLengths
import Grothe.UpperChaos.ThirdFoldRectangle

/-! Draft source-bound grade 7; must be checked by Lean. -/
namespace Grothe.UpperChaos.ThirdArrayGrade07
open ThirdGradeCandidateNumerics
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := ThirdGradeReceipt00.values ++ ThirdGradeReceipt01.values ++ ThirdGradeReceipt02.values ++ ThirdGradeReceipt03.values ++ ThirdGradeReceipt04.values ++ ThirdGradeReceipt05.values ++ ThirdGradeReceipt06.values
def suffix : List ℤ := ThirdGradeReceipt08.values ++ ThirdGradeReceipt09.values ++ ThirdGradeReceipt10.values ++ ThirdGradeReceipt11.values ++ ThirdGradeReceipt12.values ++ ThirdGradeReceipt13.values ++ ThirdGradeReceipt14.values ++ ThirdGradeReceipt15.values ++ ThirdGradeReceipt16.values ++ ThirdGradeReceipt17.values ++ ThirdGradeReceipt18.values ++ ThirdGradeReceipt19.values ++ ThirdGradeReceipt20.values ++ ThirdGradeReceipt21.values ++ ThirdGradeReceipt22.values ++ ThirdGradeReceipt23.values ++ ThirdGradeReceipt24.values ++ ThirdGradeReceipt25.values

theorem source_split : ThirdIntegerSourceBinding.allValues =
    before ++ ThirdGradeReceipt07.values ++ suffix := by
  simp only [ThirdIntegerSourceBinding.allValues, ThirdIntegerSourceBinding.source_values,
    before, suffix, List.append_assoc]

theorem before_length : before.length = 168 := by
  simp only [before, List.length_append, ThirdGradeLengths.len00, ThirdGradeLengths.len01, ThirdGradeLengths.len02, ThirdGradeLengths.len03, ThirdGradeLengths.len04, ThirdGradeLengths.len05, ThirdGradeLengths.len06, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 9) (hd : d < 8) :
    thirdCenterAt 7 c d = ThirdGradeReceipt07.values[c * 8 + d]?.getD 0 := by
  have hk : c * 8 + d < ThirdGradeReceipt07.values.length := by
    rw [ThirdGradeLengths.len07]
    omega
  change thirdCenterInts[gradedFlatIndex 7 c d]?.getD 0 = _
  rw [ThirdIntegerSourceBinding.source_array, source_split]
  have h := ThirdArrayLookup.middle_get before ThirdGradeReceipt07.values suffix (c * 8 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (7 + 2), ∑ d ∈ Finset.range (7 + 1),
      thirdCenterAt 7 c d ^ 2) = grade 7 := by
  calc
    _ = ∑ c ∈ Finset.range 9, ∑ d ∈ Finset.range 8,
        (ThirdGradeReceipt07.values[c * 8 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = thirdCenterIntegerGrade07.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [ThirdGradeReceipt07.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold thirdCenterIntegerGrade07 9 8
              TaylorThirdIntegerGrade07Check.grade_length)
    _ = grade 7 := by
          have htarget : grade 7 = 1165623431964595447947173303427870672413344116244480 := by decide +kernel
          rw [htarget]
          exact TaylorThirdIntegerGrade07Check.grade_energy

end Grothe.UpperChaos.ThirdArrayGrade07
