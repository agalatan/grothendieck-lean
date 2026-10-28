import Grothe.UpperChaos.SecondCenterGrade000Length
import Grothe.UpperChaos.SecondCenterGrade001Length
import Grothe.UpperChaos.SecondCenterGrade002Length
import Grothe.UpperChaos.SecondCenterGrade003Length
import Grothe.UpperChaos.SecondCenterGrade004Length
import Grothe.UpperChaos.SecondCenterGrade005Length
import Grothe.UpperChaos.SecondCenterGrade006Length
import Grothe.UpperChaos.SecondCenterGrade007Length
import Grothe.UpperChaos.SecondCenterGrade008Length
import Grothe.UpperChaos.SecondCenterGrade009Length
import Grothe.UpperChaos.SecondCenterGrade010Length
import Grothe.UpperChaos.SecondCenterGrade011Length
import Grothe.UpperChaos.SecondCenterGrade012Length
import Grothe.UpperChaos.ThirdArrayLookup
import Grothe.UpperChaos.ThirdFoldRectangle
import Grothe.UpperChaos.FirstSecondGradeEnergyTargets
import Mathlib.Tactic

/-! Draft actual second center grade 12 lookup and energy; no native check. -/
namespace Grothe.UpperChaos.SecondCenterGrade012Binding
open FirstSecondGradeEnergyTargets
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := SecondCenterGrade000.values ++ SecondCenterGrade001.values ++ SecondCenterGrade002.values ++ SecondCenterGrade003.values ++ SecondCenterGrade004.values ++ SecondCenterGrade005.values ++ SecondCenterGrade006.values ++ SecondCenterGrade007.values ++ SecondCenterGrade008.values ++ SecondCenterGrade009.values ++ SecondCenterGrade010.values ++ SecondCenterGrade011.values
def suffix : List ℤ := SecondCenterGrade013.values ++ SecondCenterGrade014.values ++ SecondCenterGrade015.values ++ SecondCenterGrade016.values ++ SecondCenterGrade017.values ++ SecondCenterGrade018.values ++ SecondCenterGrade019.values ++ SecondCenterGrade020.values ++ SecondCenterGrade021.values ++ SecondCenterGrade022.values ++ SecondCenterGrade023.values ++ SecondCenterGrade024.values ++ SecondCenterGrade025.values ++ SecondCenterGrade026.values ++ SecondCenterGrade027.values ++ SecondCenterGrade028.values ++ SecondCenterGrade029.values ++ SecondCenterGrade030.values ++ SecondCenterGrade031.values ++ SecondCenterGrade032.values ++ SecondCenterGrade033.values ++ SecondCenterGrade034.values ++ SecondCenterGrade035.values ++ SecondCenterGrade036.values ++ SecondCenterGrade037.values ++ SecondCenterGrade038.values ++ SecondCenterGrade039.values ++ SecondCenterGrade040.values ++ SecondCenterGrade041.values ++ SecondCenterGrade042.values ++ SecondCenterGrade043.values ++ SecondCenterGrade044.values ++ SecondCenterGrade045.values

theorem source_split : FirstSecondIntegerBinding.secondAllValues =
    before ++ SecondCenterGrade012.values ++ suffix := by
  simp only [FirstSecondIntegerBinding.secondAllValues,
    FirstSecondIntegerBinding.second_source_values, before, suffix,
    List.append_assoc]

theorem before_length : before.length = 728 := by
  simp only [before, List.length_append, SecondCenterGrade000Length.length, SecondCenterGrade001Length.length, SecondCenterGrade002Length.length, SecondCenterGrade003Length.length, SecondCenterGrade004Length.length, SecondCenterGrade005Length.length, SecondCenterGrade006Length.length, SecondCenterGrade007Length.length, SecondCenterGrade008Length.length, SecondCenterGrade009Length.length, SecondCenterGrade010Length.length, SecondCenterGrade011Length.length, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 14) (hd : d < 13) :
    secondCenterAt 12 c d = SecondCenterGrade012.values[c * 13 + d]?.getD 0 := by
  have hk : c * 13 + d < SecondCenterGrade012.values.length := by
    rw [SecondCenterGrade012Length.length]
    omega
  change secondCenterInts[gradedFlatIndex 12 c d]?.getD 0 = _
  rw [FirstSecondIntegerBinding.second_source_array, source_split]
  have h := ThirdArrayLookup.middle_get before SecondCenterGrade012.values suffix (c * 13 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (12 + 2), ∑ d ∈ Finset.range (12 + 1),
      secondCenterAt 12 c d ^ 2) = secondGradeEnergy 12 := by
  calc
    _ = ∑ c ∈ Finset.range 14, ∑ d ∈ Finset.range 13,
        (SecondCenterGrade012.values[c * 13 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = secondCenterIntegerGrade012.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [SecondCenterGrade012.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold secondCenterIntegerGrade012 14 13
              TaylorSecondIntegerGrade012Check.grade_length)
    _ = secondGradeEnergy 12 := by
          rw [TaylorSecondIntegerGrade012Check.grade_energy]
          decide +kernel
end Grothe.UpperChaos.SecondCenterGrade012Binding
