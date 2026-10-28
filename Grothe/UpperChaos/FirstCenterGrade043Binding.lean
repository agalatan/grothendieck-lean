import Grothe.UpperChaos.FirstCenterGrade000Length
import Grothe.UpperChaos.FirstCenterGrade001Length
import Grothe.UpperChaos.FirstCenterGrade002Length
import Grothe.UpperChaos.FirstCenterGrade003Length
import Grothe.UpperChaos.FirstCenterGrade004Length
import Grothe.UpperChaos.FirstCenterGrade005Length
import Grothe.UpperChaos.FirstCenterGrade006Length
import Grothe.UpperChaos.FirstCenterGrade007Length
import Grothe.UpperChaos.FirstCenterGrade008Length
import Grothe.UpperChaos.FirstCenterGrade009Length
import Grothe.UpperChaos.FirstCenterGrade010Length
import Grothe.UpperChaos.FirstCenterGrade011Length
import Grothe.UpperChaos.FirstCenterGrade012Length
import Grothe.UpperChaos.FirstCenterGrade013Length
import Grothe.UpperChaos.FirstCenterGrade014Length
import Grothe.UpperChaos.FirstCenterGrade015Length
import Grothe.UpperChaos.FirstCenterGrade016Length
import Grothe.UpperChaos.FirstCenterGrade017Length
import Grothe.UpperChaos.FirstCenterGrade018Length
import Grothe.UpperChaos.FirstCenterGrade019Length
import Grothe.UpperChaos.FirstCenterGrade020Length
import Grothe.UpperChaos.FirstCenterGrade021Length
import Grothe.UpperChaos.FirstCenterGrade022Length
import Grothe.UpperChaos.FirstCenterGrade023Length
import Grothe.UpperChaos.FirstCenterGrade024Length
import Grothe.UpperChaos.FirstCenterGrade025Length
import Grothe.UpperChaos.FirstCenterGrade026Length
import Grothe.UpperChaos.FirstCenterGrade027Length
import Grothe.UpperChaos.FirstCenterGrade028Length
import Grothe.UpperChaos.FirstCenterGrade029Length
import Grothe.UpperChaos.FirstCenterGrade030Length
import Grothe.UpperChaos.FirstCenterGrade031Length
import Grothe.UpperChaos.FirstCenterGrade032Length
import Grothe.UpperChaos.FirstCenterGrade033Length
import Grothe.UpperChaos.FirstCenterGrade034Length
import Grothe.UpperChaos.FirstCenterGrade035Length
import Grothe.UpperChaos.FirstCenterGrade036Length
import Grothe.UpperChaos.FirstCenterGrade037Length
import Grothe.UpperChaos.FirstCenterGrade038Length
import Grothe.UpperChaos.FirstCenterGrade039Length
import Grothe.UpperChaos.FirstCenterGrade040Length
import Grothe.UpperChaos.FirstCenterGrade041Length
import Grothe.UpperChaos.FirstCenterGrade042Length
import Grothe.UpperChaos.FirstCenterGrade043Length
import Grothe.UpperChaos.ThirdArrayLookup
import Grothe.UpperChaos.ThirdFoldRectangle
import Grothe.UpperChaos.FirstSecondGradeEnergyTargets
import Mathlib.Tactic

/-! Draft actual first center grade 43 lookup and energy; no native check. -/
namespace Grothe.UpperChaos.FirstCenterGrade043Binding
open FirstSecondGradeEnergyTargets
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := FirstCenterGrade000.values ++ FirstCenterGrade001.values ++ FirstCenterGrade002.values ++ FirstCenterGrade003.values ++ FirstCenterGrade004.values ++ FirstCenterGrade005.values ++ FirstCenterGrade006.values ++ FirstCenterGrade007.values ++ FirstCenterGrade008.values ++ FirstCenterGrade009.values ++ FirstCenterGrade010.values ++ FirstCenterGrade011.values ++ FirstCenterGrade012.values ++ FirstCenterGrade013.values ++ FirstCenterGrade014.values ++ FirstCenterGrade015.values ++ FirstCenterGrade016.values ++ FirstCenterGrade017.values ++ FirstCenterGrade018.values ++ FirstCenterGrade019.values ++ FirstCenterGrade020.values ++ FirstCenterGrade021.values ++ FirstCenterGrade022.values ++ FirstCenterGrade023.values ++ FirstCenterGrade024.values ++ FirstCenterGrade025.values ++ FirstCenterGrade026.values ++ FirstCenterGrade027.values ++ FirstCenterGrade028.values ++ FirstCenterGrade029.values ++ FirstCenterGrade030.values ++ FirstCenterGrade031.values ++ FirstCenterGrade032.values ++ FirstCenterGrade033.values ++ FirstCenterGrade034.values ++ FirstCenterGrade035.values ++ FirstCenterGrade036.values ++ FirstCenterGrade037.values ++ FirstCenterGrade038.values ++ FirstCenterGrade039.values ++ FirstCenterGrade040.values ++ FirstCenterGrade041.values ++ FirstCenterGrade042.values
def suffix : List ℤ := FirstCenterGrade044.values ++ FirstCenterGrade045.values ++ FirstCenterGrade046.values ++ FirstCenterGrade047.values ++ FirstCenterGrade048.values ++ FirstCenterGrade049.values ++ FirstCenterGrade050.values ++ FirstCenterGrade051.values ++ FirstCenterGrade052.values ++ FirstCenterGrade053.values ++ FirstCenterGrade054.values ++ FirstCenterGrade055.values ++ FirstCenterGrade056.values ++ FirstCenterGrade057.values ++ FirstCenterGrade058.values ++ FirstCenterGrade059.values ++ FirstCenterGrade060.values ++ FirstCenterGrade061.values ++ FirstCenterGrade062.values ++ FirstCenterGrade063.values ++ FirstCenterGrade064.values ++ FirstCenterGrade065.values ++ FirstCenterGrade066.values ++ FirstCenterGrade067.values ++ FirstCenterGrade068.values ++ FirstCenterGrade069.values ++ FirstCenterGrade070.values ++ FirstCenterGrade071.values ++ FirstCenterGrade072.values ++ FirstCenterGrade073.values ++ FirstCenterGrade074.values ++ FirstCenterGrade075.values ++ FirstCenterGrade076.values ++ FirstCenterGrade077.values ++ FirstCenterGrade078.values ++ FirstCenterGrade079.values ++ FirstCenterGrade080.values ++ FirstCenterGrade081.values ++ FirstCenterGrade082.values ++ FirstCenterGrade083.values ++ FirstCenterGrade084.values ++ FirstCenterGrade085.values ++ FirstCenterGrade086.values ++ FirstCenterGrade087.values ++ FirstCenterGrade088.values ++ FirstCenterGrade089.values ++ FirstCenterGrade090.values

theorem source_split : FirstSecondIntegerBinding.firstAllValues =
    before ++ FirstCenterGrade043.values ++ suffix := by
  simp only [FirstSecondIntegerBinding.firstAllValues,
    FirstSecondIntegerBinding.first_source_values, before, suffix,
    List.append_assoc]

theorem before_length : before.length = 28380 := by
  simp only [before, List.length_append, FirstCenterGrade000Length.length, FirstCenterGrade001Length.length, FirstCenterGrade002Length.length, FirstCenterGrade003Length.length, FirstCenterGrade004Length.length, FirstCenterGrade005Length.length, FirstCenterGrade006Length.length, FirstCenterGrade007Length.length, FirstCenterGrade008Length.length, FirstCenterGrade009Length.length, FirstCenterGrade010Length.length, FirstCenterGrade011Length.length, FirstCenterGrade012Length.length, FirstCenterGrade013Length.length, FirstCenterGrade014Length.length, FirstCenterGrade015Length.length, FirstCenterGrade016Length.length, FirstCenterGrade017Length.length, FirstCenterGrade018Length.length, FirstCenterGrade019Length.length, FirstCenterGrade020Length.length, FirstCenterGrade021Length.length, FirstCenterGrade022Length.length, FirstCenterGrade023Length.length, FirstCenterGrade024Length.length, FirstCenterGrade025Length.length, FirstCenterGrade026Length.length, FirstCenterGrade027Length.length, FirstCenterGrade028Length.length, FirstCenterGrade029Length.length, FirstCenterGrade030Length.length, FirstCenterGrade031Length.length, FirstCenterGrade032Length.length, FirstCenterGrade033Length.length, FirstCenterGrade034Length.length, FirstCenterGrade035Length.length, FirstCenterGrade036Length.length, FirstCenterGrade037Length.length, FirstCenterGrade038Length.length, FirstCenterGrade039Length.length, FirstCenterGrade040Length.length, FirstCenterGrade041Length.length, FirstCenterGrade042Length.length, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 45) (hd : d < 44) :
    firstCenterAt 43 c d = FirstCenterGrade043.values[c * 44 + d]?.getD 0 := by
  have hk : c * 44 + d < FirstCenterGrade043.values.length := by
    rw [FirstCenterGrade043Length.length]
    omega
  change firstCenterInts[gradedFlatIndex 43 c d]?.getD 0 = _
  rw [FirstSecondIntegerBinding.first_source_array, source_split]
  have h := ThirdArrayLookup.middle_get before FirstCenterGrade043.values suffix (c * 44 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (43 + 2), ∑ d ∈ Finset.range (43 + 1),
      firstCenterAt 43 c d ^ 2) = firstGradeEnergy 43 := by
  calc
    _ = ∑ c ∈ Finset.range 45, ∑ d ∈ Finset.range 44,
        (FirstCenterGrade043.values[c * 44 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = firstCenterIntegerGrade043.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [FirstCenterGrade043.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold firstCenterIntegerGrade043 45 44
              TaylorFirstIntegerGrade043Check.grade_length)
    _ = firstGradeEnergy 43 := by
          rw [TaylorFirstIntegerGrade043Check.grade_energy]
          decide +kernel
end Grothe.UpperChaos.FirstCenterGrade043Binding
