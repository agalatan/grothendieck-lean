import Grothe.UpperChaos.SecondCenterGrade000Length
import Grothe.UpperChaos.ThirdArrayLookup
import Grothe.UpperChaos.ThirdFoldRectangle
import Grothe.UpperChaos.FirstSecondGradeEnergyTargets
import Mathlib.Tactic

/-! Draft actual second center grade 0 lookup and energy; no native check. -/
namespace Grothe.UpperChaos.SecondCenterGrade000Binding
open FirstSecondGradeEnergyTargets
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := []
def suffix : List ℤ := SecondCenterGrade001.values ++ SecondCenterGrade002.values ++ SecondCenterGrade003.values ++ SecondCenterGrade004.values ++ SecondCenterGrade005.values ++ SecondCenterGrade006.values ++ SecondCenterGrade007.values ++ SecondCenterGrade008.values ++ SecondCenterGrade009.values ++ SecondCenterGrade010.values ++ SecondCenterGrade011.values ++ SecondCenterGrade012.values ++ SecondCenterGrade013.values ++ SecondCenterGrade014.values ++ SecondCenterGrade015.values ++ SecondCenterGrade016.values ++ SecondCenterGrade017.values ++ SecondCenterGrade018.values ++ SecondCenterGrade019.values ++ SecondCenterGrade020.values ++ SecondCenterGrade021.values ++ SecondCenterGrade022.values ++ SecondCenterGrade023.values ++ SecondCenterGrade024.values ++ SecondCenterGrade025.values ++ SecondCenterGrade026.values ++ SecondCenterGrade027.values ++ SecondCenterGrade028.values ++ SecondCenterGrade029.values ++ SecondCenterGrade030.values ++ SecondCenterGrade031.values ++ SecondCenterGrade032.values ++ SecondCenterGrade033.values ++ SecondCenterGrade034.values ++ SecondCenterGrade035.values ++ SecondCenterGrade036.values ++ SecondCenterGrade037.values ++ SecondCenterGrade038.values ++ SecondCenterGrade039.values ++ SecondCenterGrade040.values ++ SecondCenterGrade041.values ++ SecondCenterGrade042.values ++ SecondCenterGrade043.values ++ SecondCenterGrade044.values ++ SecondCenterGrade045.values

theorem source_split : FirstSecondIntegerBinding.secondAllValues =
    before ++ SecondCenterGrade000.values ++ suffix := by
  simp only [FirstSecondIntegerBinding.secondAllValues,
    FirstSecondIntegerBinding.second_source_values, before, suffix,
    List.append_assoc, List.nil_append]

theorem before_length : before.length = 0 := by
  simp only [before, List.length_nil]

theorem lookup (c d : ℕ) (hc : c < 2) (hd : d < 1) :
    secondCenterAt 0 c d = SecondCenterGrade000.values[c * 1 + d]?.getD 0 := by
  have hk : c * 1 + d < SecondCenterGrade000.values.length := by
    rw [SecondCenterGrade000Length.length]
    omega
  change secondCenterInts[gradedFlatIndex 0 c d]?.getD 0 = _
  rw [FirstSecondIntegerBinding.second_source_array, source_split]
  have h := ThirdArrayLookup.middle_get before SecondCenterGrade000.values suffix (c * 1 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (0 + 2), ∑ d ∈ Finset.range (0 + 1),
      secondCenterAt 0 c d ^ 2) = secondGradeEnergy 0 := by
  calc
    _ = ∑ c ∈ Finset.range 2, ∑ d ∈ Finset.range 1,
        (SecondCenterGrade000.values[c * 1 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = secondCenterIntegerGrade000.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [SecondCenterGrade000.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold secondCenterIntegerGrade000 2 1
              TaylorSecondIntegerGrade000Check.grade_length)
    _ = secondGradeEnergy 0 := by
          rw [TaylorSecondIntegerGrade000Check.grade_energy]
          decide +kernel
end Grothe.UpperChaos.SecondCenterGrade000Binding
