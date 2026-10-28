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
import Grothe.UpperChaos.SecondCenterGrade013Length
import Grothe.UpperChaos.SecondCenterGrade014Length
import Grothe.UpperChaos.SecondCenterGrade015Length
import Grothe.UpperChaos.SecondCenterGrade016Length
import Grothe.UpperChaos.SecondCenterGrade017Length
import Grothe.UpperChaos.SecondCenterGrade018Length
import Grothe.UpperChaos.SecondCenterGrade019Length
import Grothe.UpperChaos.SecondCenterGrade020Length
import Grothe.UpperChaos.SecondCenterGrade021Length
import Grothe.UpperChaos.SecondCenterGrade022Length
import Grothe.UpperChaos.SecondCenterGrade023Length
import Grothe.UpperChaos.SecondCenterGrade024Length
import Grothe.UpperChaos.SecondCenterGrade025Length
import Grothe.UpperChaos.SecondCenterGrade026Length
import Grothe.UpperChaos.SecondCenterGrade027Length
import Grothe.UpperChaos.SecondCenterGrade028Length
import Grothe.UpperChaos.SecondCenterGrade029Length
import Grothe.UpperChaos.SecondCenterGrade030Length
import Grothe.UpperChaos.SecondCenterGrade031Length
import Grothe.UpperChaos.SecondCenterGrade032Length
import Grothe.UpperChaos.SecondCenterGrade033Length
import Grothe.UpperChaos.SecondCenterGrade034Length
import Grothe.UpperChaos.SecondCenterGrade035Length
import Grothe.UpperChaos.SecondCenterGrade036Length
import Grothe.UpperChaos.SecondCenterGrade037Length
import Grothe.UpperChaos.SecondCenterGrade038Length
import Grothe.UpperChaos.ThirdArrayLookup
import Grothe.UpperChaos.ThirdFoldRectangle
import Grothe.UpperChaos.FirstSecondGradeEnergyTargets
import Mathlib.Tactic

/-! Draft actual second center grade 38 lookup and energy; no native check. -/
namespace Grothe.UpperChaos.SecondCenterGrade038Binding
open FirstSecondGradeEnergyTargets
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := SecondCenterGrade000.values ++ SecondCenterGrade001.values ++ SecondCenterGrade002.values ++ SecondCenterGrade003.values ++ SecondCenterGrade004.values ++ SecondCenterGrade005.values ++ SecondCenterGrade006.values ++ SecondCenterGrade007.values ++ SecondCenterGrade008.values ++ SecondCenterGrade009.values ++ SecondCenterGrade010.values ++ SecondCenterGrade011.values ++ SecondCenterGrade012.values ++ SecondCenterGrade013.values ++ SecondCenterGrade014.values ++ SecondCenterGrade015.values ++ SecondCenterGrade016.values ++ SecondCenterGrade017.values ++ SecondCenterGrade018.values ++ SecondCenterGrade019.values ++ SecondCenterGrade020.values ++ SecondCenterGrade021.values ++ SecondCenterGrade022.values ++ SecondCenterGrade023.values ++ SecondCenterGrade024.values ++ SecondCenterGrade025.values ++ SecondCenterGrade026.values ++ SecondCenterGrade027.values ++ SecondCenterGrade028.values ++ SecondCenterGrade029.values ++ SecondCenterGrade030.values ++ SecondCenterGrade031.values ++ SecondCenterGrade032.values ++ SecondCenterGrade033.values ++ SecondCenterGrade034.values ++ SecondCenterGrade035.values ++ SecondCenterGrade036.values ++ SecondCenterGrade037.values
def suffix : List ℤ := SecondCenterGrade039.values ++ SecondCenterGrade040.values ++ SecondCenterGrade041.values ++ SecondCenterGrade042.values ++ SecondCenterGrade043.values ++ SecondCenterGrade044.values ++ SecondCenterGrade045.values

theorem source_split : FirstSecondIntegerBinding.secondAllValues =
    before ++ SecondCenterGrade038.values ++ suffix := by
  simp only [FirstSecondIntegerBinding.secondAllValues,
    FirstSecondIntegerBinding.second_source_values, before, suffix,
    List.append_assoc]

theorem before_length : before.length = 19760 := by
  simp only [before, List.length_append, SecondCenterGrade000Length.length, SecondCenterGrade001Length.length, SecondCenterGrade002Length.length, SecondCenterGrade003Length.length, SecondCenterGrade004Length.length, SecondCenterGrade005Length.length, SecondCenterGrade006Length.length, SecondCenterGrade007Length.length, SecondCenterGrade008Length.length, SecondCenterGrade009Length.length, SecondCenterGrade010Length.length, SecondCenterGrade011Length.length, SecondCenterGrade012Length.length, SecondCenterGrade013Length.length, SecondCenterGrade014Length.length, SecondCenterGrade015Length.length, SecondCenterGrade016Length.length, SecondCenterGrade017Length.length, SecondCenterGrade018Length.length, SecondCenterGrade019Length.length, SecondCenterGrade020Length.length, SecondCenterGrade021Length.length, SecondCenterGrade022Length.length, SecondCenterGrade023Length.length, SecondCenterGrade024Length.length, SecondCenterGrade025Length.length, SecondCenterGrade026Length.length, SecondCenterGrade027Length.length, SecondCenterGrade028Length.length, SecondCenterGrade029Length.length, SecondCenterGrade030Length.length, SecondCenterGrade031Length.length, SecondCenterGrade032Length.length, SecondCenterGrade033Length.length, SecondCenterGrade034Length.length, SecondCenterGrade035Length.length, SecondCenterGrade036Length.length, SecondCenterGrade037Length.length, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 40) (hd : d < 39) :
    secondCenterAt 38 c d = SecondCenterGrade038.values[c * 39 + d]?.getD 0 := by
  have hk : c * 39 + d < SecondCenterGrade038.values.length := by
    rw [SecondCenterGrade038Length.length]
    omega
  change secondCenterInts[gradedFlatIndex 38 c d]?.getD 0 = _
  rw [FirstSecondIntegerBinding.second_source_array, source_split]
  have h := ThirdArrayLookup.middle_get before SecondCenterGrade038.values suffix (c * 39 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (38 + 2), ∑ d ∈ Finset.range (38 + 1),
      secondCenterAt 38 c d ^ 2) = secondGradeEnergy 38 := by
  calc
    _ = ∑ c ∈ Finset.range 40, ∑ d ∈ Finset.range 39,
        (SecondCenterGrade038.values[c * 39 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = secondCenterIntegerGrade038.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [SecondCenterGrade038.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold secondCenterIntegerGrade038 40 39
              TaylorSecondIntegerGrade038Check.grade_length)
    _ = secondGradeEnergy 38 := by
          rw [TaylorSecondIntegerGrade038Check.grade_energy]
          decide +kernel
end Grothe.UpperChaos.SecondCenterGrade038Binding
