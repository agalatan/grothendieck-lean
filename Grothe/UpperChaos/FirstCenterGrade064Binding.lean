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
import Grothe.UpperChaos.FirstCenterGrade044Length
import Grothe.UpperChaos.FirstCenterGrade045Length
import Grothe.UpperChaos.FirstCenterGrade046Length
import Grothe.UpperChaos.FirstCenterGrade047Length
import Grothe.UpperChaos.FirstCenterGrade048Length
import Grothe.UpperChaos.FirstCenterGrade049Length
import Grothe.UpperChaos.FirstCenterGrade050Length
import Grothe.UpperChaos.FirstCenterGrade051Length
import Grothe.UpperChaos.FirstCenterGrade052Length
import Grothe.UpperChaos.FirstCenterGrade053Length
import Grothe.UpperChaos.FirstCenterGrade054Length
import Grothe.UpperChaos.FirstCenterGrade055Length
import Grothe.UpperChaos.FirstCenterGrade056Length
import Grothe.UpperChaos.FirstCenterGrade057Length
import Grothe.UpperChaos.FirstCenterGrade058Length
import Grothe.UpperChaos.FirstCenterGrade059Length
import Grothe.UpperChaos.FirstCenterGrade060Length
import Grothe.UpperChaos.FirstCenterGrade061Length
import Grothe.UpperChaos.FirstCenterGrade062Length
import Grothe.UpperChaos.FirstCenterGrade063Length
import Grothe.UpperChaos.FirstCenterGrade064Length
import Grothe.UpperChaos.ThirdArrayLookup
import Grothe.UpperChaos.ThirdFoldRectangle
import Grothe.UpperChaos.FirstSecondGradeEnergyTargets
import Mathlib.Tactic

/-! Draft actual first center grade 64 lookup and energy; no native check. -/
namespace Grothe.UpperChaos.FirstCenterGrade064Binding
open FirstSecondGradeEnergyTargets
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := FirstCenterGrade000.values ++ FirstCenterGrade001.values ++ FirstCenterGrade002.values ++ FirstCenterGrade003.values ++ FirstCenterGrade004.values ++ FirstCenterGrade005.values ++ FirstCenterGrade006.values ++ FirstCenterGrade007.values ++ FirstCenterGrade008.values ++ FirstCenterGrade009.values ++ FirstCenterGrade010.values ++ FirstCenterGrade011.values ++ FirstCenterGrade012.values ++ FirstCenterGrade013.values ++ FirstCenterGrade014.values ++ FirstCenterGrade015.values ++ FirstCenterGrade016.values ++ FirstCenterGrade017.values ++ FirstCenterGrade018.values ++ FirstCenterGrade019.values ++ FirstCenterGrade020.values ++ FirstCenterGrade021.values ++ FirstCenterGrade022.values ++ FirstCenterGrade023.values ++ FirstCenterGrade024.values ++ FirstCenterGrade025.values ++ FirstCenterGrade026.values ++ FirstCenterGrade027.values ++ FirstCenterGrade028.values ++ FirstCenterGrade029.values ++ FirstCenterGrade030.values ++ FirstCenterGrade031.values ++ FirstCenterGrade032.values ++ FirstCenterGrade033.values ++ FirstCenterGrade034.values ++ FirstCenterGrade035.values ++ FirstCenterGrade036.values ++ FirstCenterGrade037.values ++ FirstCenterGrade038.values ++ FirstCenterGrade039.values ++ FirstCenterGrade040.values ++ FirstCenterGrade041.values ++ FirstCenterGrade042.values ++ FirstCenterGrade043.values ++ FirstCenterGrade044.values ++ FirstCenterGrade045.values ++ FirstCenterGrade046.values ++ FirstCenterGrade047.values ++ FirstCenterGrade048.values ++ FirstCenterGrade049.values ++ FirstCenterGrade050.values ++ FirstCenterGrade051.values ++ FirstCenterGrade052.values ++ FirstCenterGrade053.values ++ FirstCenterGrade054.values ++ FirstCenterGrade055.values ++ FirstCenterGrade056.values ++ FirstCenterGrade057.values ++ FirstCenterGrade058.values ++ FirstCenterGrade059.values ++ FirstCenterGrade060.values ++ FirstCenterGrade061.values ++ FirstCenterGrade062.values ++ FirstCenterGrade063.values
def suffix : List ℤ := FirstCenterGrade065.values ++ FirstCenterGrade066.values ++ FirstCenterGrade067.values ++ FirstCenterGrade068.values ++ FirstCenterGrade069.values ++ FirstCenterGrade070.values ++ FirstCenterGrade071.values ++ FirstCenterGrade072.values ++ FirstCenterGrade073.values ++ FirstCenterGrade074.values ++ FirstCenterGrade075.values ++ FirstCenterGrade076.values ++ FirstCenterGrade077.values ++ FirstCenterGrade078.values ++ FirstCenterGrade079.values ++ FirstCenterGrade080.values ++ FirstCenterGrade081.values ++ FirstCenterGrade082.values ++ FirstCenterGrade083.values ++ FirstCenterGrade084.values ++ FirstCenterGrade085.values ++ FirstCenterGrade086.values ++ FirstCenterGrade087.values ++ FirstCenterGrade088.values ++ FirstCenterGrade089.values ++ FirstCenterGrade090.values

theorem source_split : FirstSecondIntegerBinding.firstAllValues =
    before ++ FirstCenterGrade064.values ++ suffix := by
  simp only [FirstSecondIntegerBinding.firstAllValues,
    FirstSecondIntegerBinding.first_source_values, before, suffix,
    List.append_assoc]

theorem before_length : before.length = 91520 := by
  simp only [before, List.length_append, FirstCenterGrade000Length.length, FirstCenterGrade001Length.length, FirstCenterGrade002Length.length, FirstCenterGrade003Length.length, FirstCenterGrade004Length.length, FirstCenterGrade005Length.length, FirstCenterGrade006Length.length, FirstCenterGrade007Length.length, FirstCenterGrade008Length.length, FirstCenterGrade009Length.length, FirstCenterGrade010Length.length, FirstCenterGrade011Length.length, FirstCenterGrade012Length.length, FirstCenterGrade013Length.length, FirstCenterGrade014Length.length, FirstCenterGrade015Length.length, FirstCenterGrade016Length.length, FirstCenterGrade017Length.length, FirstCenterGrade018Length.length, FirstCenterGrade019Length.length, FirstCenterGrade020Length.length, FirstCenterGrade021Length.length, FirstCenterGrade022Length.length, FirstCenterGrade023Length.length, FirstCenterGrade024Length.length, FirstCenterGrade025Length.length, FirstCenterGrade026Length.length, FirstCenterGrade027Length.length, FirstCenterGrade028Length.length, FirstCenterGrade029Length.length, FirstCenterGrade030Length.length, FirstCenterGrade031Length.length, FirstCenterGrade032Length.length, FirstCenterGrade033Length.length, FirstCenterGrade034Length.length, FirstCenterGrade035Length.length, FirstCenterGrade036Length.length, FirstCenterGrade037Length.length, FirstCenterGrade038Length.length, FirstCenterGrade039Length.length, FirstCenterGrade040Length.length, FirstCenterGrade041Length.length, FirstCenterGrade042Length.length, FirstCenterGrade043Length.length, FirstCenterGrade044Length.length, FirstCenterGrade045Length.length, FirstCenterGrade046Length.length, FirstCenterGrade047Length.length, FirstCenterGrade048Length.length, FirstCenterGrade049Length.length, FirstCenterGrade050Length.length, FirstCenterGrade051Length.length, FirstCenterGrade052Length.length, FirstCenterGrade053Length.length, FirstCenterGrade054Length.length, FirstCenterGrade055Length.length, FirstCenterGrade056Length.length, FirstCenterGrade057Length.length, FirstCenterGrade058Length.length, FirstCenterGrade059Length.length, FirstCenterGrade060Length.length, FirstCenterGrade061Length.length, FirstCenterGrade062Length.length, FirstCenterGrade063Length.length, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 66) (hd : d < 65) :
    firstCenterAt 64 c d = FirstCenterGrade064.values[c * 65 + d]?.getD 0 := by
  have hk : c * 65 + d < FirstCenterGrade064.values.length := by
    rw [FirstCenterGrade064Length.length]
    omega
  change firstCenterInts[gradedFlatIndex 64 c d]?.getD 0 = _
  rw [FirstSecondIntegerBinding.first_source_array, source_split]
  have h := ThirdArrayLookup.middle_get before FirstCenterGrade064.values suffix (c * 65 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (64 + 2), ∑ d ∈ Finset.range (64 + 1),
      firstCenterAt 64 c d ^ 2) = firstGradeEnergy 64 := by
  calc
    _ = ∑ c ∈ Finset.range 66, ∑ d ∈ Finset.range 65,
        (FirstCenterGrade064.values[c * 65 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = firstCenterIntegerGrade064.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [FirstCenterGrade064.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold firstCenterIntegerGrade064 66 65
              TaylorFirstIntegerGrade064Check.grade_length)
    _ = firstGradeEnergy 64 := by
          rw [TaylorFirstIntegerGrade064Check.grade_energy]
          decide +kernel
end Grothe.UpperChaos.FirstCenterGrade064Binding
