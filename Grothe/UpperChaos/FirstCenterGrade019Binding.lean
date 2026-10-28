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
import Grothe.UpperChaos.ThirdArrayLookup
import Grothe.UpperChaos.ThirdFoldRectangle
import Grothe.UpperChaos.FirstSecondGradeEnergyTargets
import Mathlib.Tactic

/-! Draft actual first center grade 19 lookup and energy; no native check. -/
namespace Grothe.UpperChaos.FirstCenterGrade019Binding
open FirstSecondGradeEnergyTargets
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := FirstCenterGrade000.values ++ FirstCenterGrade001.values ++ FirstCenterGrade002.values ++ FirstCenterGrade003.values ++ FirstCenterGrade004.values ++ FirstCenterGrade005.values ++ FirstCenterGrade006.values ++ FirstCenterGrade007.values ++ FirstCenterGrade008.values ++ FirstCenterGrade009.values ++ FirstCenterGrade010.values ++ FirstCenterGrade011.values ++ FirstCenterGrade012.values ++ FirstCenterGrade013.values ++ FirstCenterGrade014.values ++ FirstCenterGrade015.values ++ FirstCenterGrade016.values ++ FirstCenterGrade017.values ++ FirstCenterGrade018.values
def suffix : List ℤ := FirstCenterGrade020.values ++ FirstCenterGrade021.values ++ FirstCenterGrade022.values ++ FirstCenterGrade023.values ++ FirstCenterGrade024.values ++ FirstCenterGrade025.values ++ FirstCenterGrade026.values ++ FirstCenterGrade027.values ++ FirstCenterGrade028.values ++ FirstCenterGrade029.values ++ FirstCenterGrade030.values ++ FirstCenterGrade031.values ++ FirstCenterGrade032.values ++ FirstCenterGrade033.values ++ FirstCenterGrade034.values ++ FirstCenterGrade035.values ++ FirstCenterGrade036.values ++ FirstCenterGrade037.values ++ FirstCenterGrade038.values ++ FirstCenterGrade039.values ++ FirstCenterGrade040.values ++ FirstCenterGrade041.values ++ FirstCenterGrade042.values ++ FirstCenterGrade043.values ++ FirstCenterGrade044.values ++ FirstCenterGrade045.values ++ FirstCenterGrade046.values ++ FirstCenterGrade047.values ++ FirstCenterGrade048.values ++ FirstCenterGrade049.values ++ FirstCenterGrade050.values ++ FirstCenterGrade051.values ++ FirstCenterGrade052.values ++ FirstCenterGrade053.values ++ FirstCenterGrade054.values ++ FirstCenterGrade055.values ++ FirstCenterGrade056.values ++ FirstCenterGrade057.values ++ FirstCenterGrade058.values ++ FirstCenterGrade059.values ++ FirstCenterGrade060.values ++ FirstCenterGrade061.values ++ FirstCenterGrade062.values ++ FirstCenterGrade063.values ++ FirstCenterGrade064.values ++ FirstCenterGrade065.values ++ FirstCenterGrade066.values ++ FirstCenterGrade067.values ++ FirstCenterGrade068.values ++ FirstCenterGrade069.values ++ FirstCenterGrade070.values ++ FirstCenterGrade071.values ++ FirstCenterGrade072.values ++ FirstCenterGrade073.values ++ FirstCenterGrade074.values ++ FirstCenterGrade075.values ++ FirstCenterGrade076.values ++ FirstCenterGrade077.values ++ FirstCenterGrade078.values ++ FirstCenterGrade079.values ++ FirstCenterGrade080.values ++ FirstCenterGrade081.values ++ FirstCenterGrade082.values ++ FirstCenterGrade083.values ++ FirstCenterGrade084.values ++ FirstCenterGrade085.values ++ FirstCenterGrade086.values ++ FirstCenterGrade087.values ++ FirstCenterGrade088.values ++ FirstCenterGrade089.values ++ FirstCenterGrade090.values

theorem source_split : FirstSecondIntegerBinding.firstAllValues =
    before ++ FirstCenterGrade019.values ++ suffix := by
  simp only [FirstSecondIntegerBinding.firstAllValues,
    FirstSecondIntegerBinding.first_source_values, before, suffix,
    List.append_assoc]

theorem before_length : before.length = 2660 := by
  simp only [before, List.length_append, FirstCenterGrade000Length.length, FirstCenterGrade001Length.length, FirstCenterGrade002Length.length, FirstCenterGrade003Length.length, FirstCenterGrade004Length.length, FirstCenterGrade005Length.length, FirstCenterGrade006Length.length, FirstCenterGrade007Length.length, FirstCenterGrade008Length.length, FirstCenterGrade009Length.length, FirstCenterGrade010Length.length, FirstCenterGrade011Length.length, FirstCenterGrade012Length.length, FirstCenterGrade013Length.length, FirstCenterGrade014Length.length, FirstCenterGrade015Length.length, FirstCenterGrade016Length.length, FirstCenterGrade017Length.length, FirstCenterGrade018Length.length, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 21) (hd : d < 20) :
    firstCenterAt 19 c d = FirstCenterGrade019.values[c * 20 + d]?.getD 0 := by
  have hk : c * 20 + d < FirstCenterGrade019.values.length := by
    rw [FirstCenterGrade019Length.length]
    omega
  change firstCenterInts[gradedFlatIndex 19 c d]?.getD 0 = _
  rw [FirstSecondIntegerBinding.first_source_array, source_split]
  have h := ThirdArrayLookup.middle_get before FirstCenterGrade019.values suffix (c * 20 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (19 + 2), ∑ d ∈ Finset.range (19 + 1),
      firstCenterAt 19 c d ^ 2) = firstGradeEnergy 19 := by
  calc
    _ = ∑ c ∈ Finset.range 21, ∑ d ∈ Finset.range 20,
        (FirstCenterGrade019.values[c * 20 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = firstCenterIntegerGrade019.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [FirstCenterGrade019.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold firstCenterIntegerGrade019 21 20
              TaylorFirstIntegerGrade019Check.grade_length)
    _ = firstGradeEnergy 19 := by
          rw [TaylorFirstIntegerGrade019Check.grade_energy]
          decide +kernel
end Grothe.UpperChaos.FirstCenterGrade019Binding
