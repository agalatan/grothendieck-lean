import Grothe.UpperChaos.SecondCenterGrade000Length
import Grothe.UpperChaos.SecondCenterGrade001Length
import Grothe.UpperChaos.SecondCenterGrade002Length
import Grothe.UpperChaos.SecondCenterGrade003Length
import Grothe.UpperChaos.SecondCenterGrade004Length
import Grothe.UpperChaos.SecondCenterGrade005Length
import Grothe.UpperChaos.ThirdArrayLookup
import Grothe.UpperChaos.ThirdFoldRectangle
import Grothe.UpperChaos.FirstSecondGradeEnergyTargets
import Mathlib.Tactic

/-! Draft actual second center grade 5 lookup and energy; no native check. -/
namespace Grothe.UpperChaos.SecondCenterGrade005Binding
open FirstSecondGradeEnergyTargets
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := SecondCenterGrade000.values ++ SecondCenterGrade001.values ++ SecondCenterGrade002.values ++ SecondCenterGrade003.values ++ SecondCenterGrade004.values
def suffix : List ℤ := SecondCenterGrade006.values ++ SecondCenterGrade007.values ++ SecondCenterGrade008.values ++ SecondCenterGrade009.values ++ SecondCenterGrade010.values ++ SecondCenterGrade011.values ++ SecondCenterGrade012.values ++ SecondCenterGrade013.values ++ SecondCenterGrade014.values ++ SecondCenterGrade015.values ++ SecondCenterGrade016.values ++ SecondCenterGrade017.values ++ SecondCenterGrade018.values ++ SecondCenterGrade019.values ++ SecondCenterGrade020.values ++ SecondCenterGrade021.values ++ SecondCenterGrade022.values ++ SecondCenterGrade023.values ++ SecondCenterGrade024.values ++ SecondCenterGrade025.values ++ SecondCenterGrade026.values ++ SecondCenterGrade027.values ++ SecondCenterGrade028.values ++ SecondCenterGrade029.values ++ SecondCenterGrade030.values ++ SecondCenterGrade031.values ++ SecondCenterGrade032.values ++ SecondCenterGrade033.values ++ SecondCenterGrade034.values ++ SecondCenterGrade035.values ++ SecondCenterGrade036.values ++ SecondCenterGrade037.values ++ SecondCenterGrade038.values ++ SecondCenterGrade039.values ++ SecondCenterGrade040.values ++ SecondCenterGrade041.values ++ SecondCenterGrade042.values ++ SecondCenterGrade043.values ++ SecondCenterGrade044.values ++ SecondCenterGrade045.values

theorem source_split : FirstSecondIntegerBinding.secondAllValues =
    before ++ SecondCenterGrade005.values ++ suffix := by
  simp only [FirstSecondIntegerBinding.secondAllValues,
    FirstSecondIntegerBinding.second_source_values, before, suffix,
    List.append_assoc]

theorem before_length : before.length = 70 := by
  simp only [before, List.length_append, SecondCenterGrade000Length.length, SecondCenterGrade001Length.length, SecondCenterGrade002Length.length, SecondCenterGrade003Length.length, SecondCenterGrade004Length.length, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 7) (hd : d < 6) :
    secondCenterAt 5 c d = SecondCenterGrade005.values[c * 6 + d]?.getD 0 := by
  have hk : c * 6 + d < SecondCenterGrade005.values.length := by
    rw [SecondCenterGrade005Length.length]
    omega
  change secondCenterInts[gradedFlatIndex 5 c d]?.getD 0 = _
  rw [FirstSecondIntegerBinding.second_source_array, source_split]
  have h := ThirdArrayLookup.middle_get before SecondCenterGrade005.values suffix (c * 6 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (5 + 2), ∑ d ∈ Finset.range (5 + 1),
      secondCenterAt 5 c d ^ 2) = secondGradeEnergy 5 := by
  calc
    _ = ∑ c ∈ Finset.range 7, ∑ d ∈ Finset.range 6,
        (SecondCenterGrade005.values[c * 6 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = secondCenterIntegerGrade005.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [SecondCenterGrade005.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold secondCenterIntegerGrade005 7 6
              TaylorSecondIntegerGrade005Check.grade_length)
    _ = secondGradeEnergy 5 := by
          rw [TaylorSecondIntegerGrade005Check.grade_energy]
          decide +kernel
end Grothe.UpperChaos.SecondCenterGrade005Binding
