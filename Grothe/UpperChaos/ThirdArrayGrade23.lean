import Grothe.UpperChaos.ThirdGradeLengths
import Grothe.UpperChaos.ThirdFoldRectangle

/-! Draft source-bound grade 23; must be checked by Lean. -/
namespace Grothe.UpperChaos.ThirdArrayGrade23
open ThirdGradeCandidateNumerics
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := ThirdGradeReceipt00.values ++ ThirdGradeReceipt01.values ++ ThirdGradeReceipt02.values ++ ThirdGradeReceipt03.values ++ ThirdGradeReceipt04.values ++ ThirdGradeReceipt05.values ++ ThirdGradeReceipt06.values ++ ThirdGradeReceipt07.values ++ ThirdGradeReceipt08.values ++ ThirdGradeReceipt09.values ++ ThirdGradeReceipt10.values ++ ThirdGradeReceipt11.values ++ ThirdGradeReceipt12.values ++ ThirdGradeReceipt13.values ++ ThirdGradeReceipt14.values ++ ThirdGradeReceipt15.values ++ ThirdGradeReceipt16.values ++ ThirdGradeReceipt17.values ++ ThirdGradeReceipt18.values ++ ThirdGradeReceipt19.values ++ ThirdGradeReceipt20.values ++ ThirdGradeReceipt21.values ++ ThirdGradeReceipt22.values
def suffix : List ℤ := ThirdGradeReceipt24.values ++ ThirdGradeReceipt25.values

theorem source_split : ThirdIntegerSourceBinding.allValues =
    before ++ ThirdGradeReceipt23.values ++ suffix := by
  simp only [ThirdIntegerSourceBinding.allValues, ThirdIntegerSourceBinding.source_values,
    before, suffix, List.append_assoc]

theorem before_length : before.length = 4600 := by
  simp only [before, List.length_append, ThirdGradeLengths.len00, ThirdGradeLengths.len01, ThirdGradeLengths.len02, ThirdGradeLengths.len03, ThirdGradeLengths.len04, ThirdGradeLengths.len05, ThirdGradeLengths.len06, ThirdGradeLengths.len07, ThirdGradeLengths.len08, ThirdGradeLengths.len09, ThirdGradeLengths.len10, ThirdGradeLengths.len11, ThirdGradeLengths.len12, ThirdGradeLengths.len13, ThirdGradeLengths.len14, ThirdGradeLengths.len15, ThirdGradeLengths.len16, ThirdGradeLengths.len17, ThirdGradeLengths.len18, ThirdGradeLengths.len19, ThirdGradeLengths.len20, ThirdGradeLengths.len21, ThirdGradeLengths.len22, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 25) (hd : d < 24) :
    thirdCenterAt 23 c d = ThirdGradeReceipt23.values[c * 24 + d]?.getD 0 := by
  have hk : c * 24 + d < ThirdGradeReceipt23.values.length := by
    rw [ThirdGradeLengths.len23]
    omega
  change thirdCenterInts[gradedFlatIndex 23 c d]?.getD 0 = _
  rw [ThirdIntegerSourceBinding.source_array, source_split]
  have h := ThirdArrayLookup.middle_get before ThirdGradeReceipt23.values suffix (c * 24 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (23 + 2), ∑ d ∈ Finset.range (23 + 1),
      thirdCenterAt 23 c d ^ 2) = grade 23 := by
  calc
    _ = ∑ c ∈ Finset.range 25, ∑ d ∈ Finset.range 24,
        (ThirdGradeReceipt23.values[c * 24 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = thirdCenterIntegerGrade23.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [ThirdGradeReceipt23.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold thirdCenterIntegerGrade23 25 24
              TaylorThirdIntegerGrade23Check.grade_length)
    _ = grade 23 := by
          have htarget : grade 23 = 462022960110086194303931657409630158314224987668480 := by decide +kernel
          rw [htarget]
          exact TaylorThirdIntegerGrade23Check.grade_energy

end Grothe.UpperChaos.ThirdArrayGrade23
