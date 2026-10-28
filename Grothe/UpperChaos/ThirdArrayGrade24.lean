import Grothe.UpperChaos.ThirdGradeLengths
import Grothe.UpperChaos.ThirdFoldRectangle

/-! Draft source-bound grade 24; must be checked by Lean. -/
namespace Grothe.UpperChaos.ThirdArrayGrade24
open ThirdGradeCandidateNumerics
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := ThirdGradeReceipt00.values ++ ThirdGradeReceipt01.values ++ ThirdGradeReceipt02.values ++ ThirdGradeReceipt03.values ++ ThirdGradeReceipt04.values ++ ThirdGradeReceipt05.values ++ ThirdGradeReceipt06.values ++ ThirdGradeReceipt07.values ++ ThirdGradeReceipt08.values ++ ThirdGradeReceipt09.values ++ ThirdGradeReceipt10.values ++ ThirdGradeReceipt11.values ++ ThirdGradeReceipt12.values ++ ThirdGradeReceipt13.values ++ ThirdGradeReceipt14.values ++ ThirdGradeReceipt15.values ++ ThirdGradeReceipt16.values ++ ThirdGradeReceipt17.values ++ ThirdGradeReceipt18.values ++ ThirdGradeReceipt19.values ++ ThirdGradeReceipt20.values ++ ThirdGradeReceipt21.values ++ ThirdGradeReceipt22.values ++ ThirdGradeReceipt23.values
def suffix : List ℤ := ThirdGradeReceipt25.values

theorem source_split : ThirdIntegerSourceBinding.allValues =
    before ++ ThirdGradeReceipt24.values ++ suffix := by
  simp only [ThirdIntegerSourceBinding.allValues, ThirdIntegerSourceBinding.source_values,
    before, suffix, List.append_assoc]

theorem before_length : before.length = 5200 := by
  simp only [before, List.length_append, ThirdGradeLengths.len00, ThirdGradeLengths.len01, ThirdGradeLengths.len02, ThirdGradeLengths.len03, ThirdGradeLengths.len04, ThirdGradeLengths.len05, ThirdGradeLengths.len06, ThirdGradeLengths.len07, ThirdGradeLengths.len08, ThirdGradeLengths.len09, ThirdGradeLengths.len10, ThirdGradeLengths.len11, ThirdGradeLengths.len12, ThirdGradeLengths.len13, ThirdGradeLengths.len14, ThirdGradeLengths.len15, ThirdGradeLengths.len16, ThirdGradeLengths.len17, ThirdGradeLengths.len18, ThirdGradeLengths.len19, ThirdGradeLengths.len20, ThirdGradeLengths.len21, ThirdGradeLengths.len22, ThirdGradeLengths.len23, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 26) (hd : d < 25) :
    thirdCenterAt 24 c d = ThirdGradeReceipt24.values[c * 25 + d]?.getD 0 := by
  have hk : c * 25 + d < ThirdGradeReceipt24.values.length := by
    rw [ThirdGradeLengths.len24]
    omega
  change thirdCenterInts[gradedFlatIndex 24 c d]?.getD 0 = _
  rw [ThirdIntegerSourceBinding.source_array, source_split]
  have h := ThirdArrayLookup.middle_get before ThirdGradeReceipt24.values suffix (c * 25 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (24 + 2), ∑ d ∈ Finset.range (24 + 1),
      thirdCenterAt 24 c d ^ 2) = grade 24 := by
  calc
    _ = ∑ c ∈ Finset.range 26, ∑ d ∈ Finset.range 25,
        (ThirdGradeReceipt24.values[c * 25 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = thirdCenterIntegerGrade24.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [ThirdGradeReceipt24.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold thirdCenterIntegerGrade24 26 25
              TaylorThirdIntegerGrade24Check.grade_length)
    _ = grade 24 := by
          have htarget : grade 24 = 318708704024484425105962287075187188991386348038081 := by decide +kernel
          rw [htarget]
          exact TaylorThirdIntegerGrade24Check.grade_energy

end Grothe.UpperChaos.ThirdArrayGrade24
