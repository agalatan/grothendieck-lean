import Grothe.UpperChaos.ThirdGradeLengths
import Grothe.UpperChaos.ThirdFoldRectangle

/-! Draft source-bound grade 4; must be checked by Lean. -/
namespace Grothe.UpperChaos.ThirdArrayGrade04
open ThirdGradeCandidateNumerics
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := ThirdGradeReceipt00.values ++ ThirdGradeReceipt01.values ++ ThirdGradeReceipt02.values ++ ThirdGradeReceipt03.values
def suffix : List ℤ := ThirdGradeReceipt05.values ++ ThirdGradeReceipt06.values ++ ThirdGradeReceipt07.values ++ ThirdGradeReceipt08.values ++ ThirdGradeReceipt09.values ++ ThirdGradeReceipt10.values ++ ThirdGradeReceipt11.values ++ ThirdGradeReceipt12.values ++ ThirdGradeReceipt13.values ++ ThirdGradeReceipt14.values ++ ThirdGradeReceipt15.values ++ ThirdGradeReceipt16.values ++ ThirdGradeReceipt17.values ++ ThirdGradeReceipt18.values ++ ThirdGradeReceipt19.values ++ ThirdGradeReceipt20.values ++ ThirdGradeReceipt21.values ++ ThirdGradeReceipt22.values ++ ThirdGradeReceipt23.values ++ ThirdGradeReceipt24.values ++ ThirdGradeReceipt25.values

theorem source_split : ThirdIntegerSourceBinding.allValues =
    before ++ ThirdGradeReceipt04.values ++ suffix := by
  simp only [ThirdIntegerSourceBinding.allValues, ThirdIntegerSourceBinding.source_values,
    before, suffix, List.append_assoc]

theorem before_length : before.length = 40 := by
  simp only [before, List.length_append, ThirdGradeLengths.len00, ThirdGradeLengths.len01, ThirdGradeLengths.len02, ThirdGradeLengths.len03, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 6) (hd : d < 5) :
    thirdCenterAt 4 c d = ThirdGradeReceipt04.values[c * 5 + d]?.getD 0 := by
  have hk : c * 5 + d < ThirdGradeReceipt04.values.length := by
    rw [ThirdGradeLengths.len04]
    omega
  change thirdCenterInts[gradedFlatIndex 4 c d]?.getD 0 = _
  rw [ThirdIntegerSourceBinding.source_array, source_split]
  have h := ThirdArrayLookup.middle_get before ThirdGradeReceipt04.values suffix (c * 5 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (4 + 2), ∑ d ∈ Finset.range (4 + 1),
      thirdCenterAt 4 c d ^ 2) = grade 4 := by
  calc
    _ = ∑ c ∈ Finset.range 6, ∑ d ∈ Finset.range 5,
        (ThirdGradeReceipt04.values[c * 5 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = thirdCenterIntegerGrade04.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [ThirdGradeReceipt04.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold thirdCenterIntegerGrade04 6 5
              TaylorThirdIntegerGrade04Check.grade_length)
    _ = grade 4 := by
          have htarget : grade 4 = 3265362349938420117886554384694877003371544909447168 := by decide +kernel
          rw [htarget]
          exact TaylorThirdIntegerGrade04Check.grade_energy

end Grothe.UpperChaos.ThirdArrayGrade04
