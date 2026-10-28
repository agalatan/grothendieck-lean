import Grothe.UpperChaos.FirstCenterGrade000Length
import Grothe.UpperChaos.FirstCenterGrade001Length
import Grothe.UpperChaos.FirstCenterGrade002Length
import Grothe.UpperChaos.FirstCenterGrade003Length
import Grothe.UpperChaos.FirstCenterGrade004Length
import Grothe.UpperChaos.FirstCenterGrade005Length
import Grothe.UpperChaos.ThirdArrayLookup
import Grothe.UpperChaos.ThirdFoldRectangle
import Grothe.UpperChaos.FirstSecondGradeEnergyTargets
import Mathlib.Tactic

/-! Draft actual first center grade 5 lookup and energy; no native check. -/
namespace Grothe.UpperChaos.FirstCenterGrade005Binding
open FirstSecondGradeEnergyTargets
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := FirstCenterGrade000.values ++ FirstCenterGrade001.values ++ FirstCenterGrade002.values ++ FirstCenterGrade003.values ++ FirstCenterGrade004.values
def suffix : List ℤ := FirstCenterGrade006.values ++ FirstCenterGrade007.values ++ FirstCenterGrade008.values ++ FirstCenterGrade009.values ++ FirstCenterGrade010.values ++ FirstCenterGrade011.values ++ FirstCenterGrade012.values ++ FirstCenterGrade013.values ++ FirstCenterGrade014.values ++ FirstCenterGrade015.values ++ FirstCenterGrade016.values ++ FirstCenterGrade017.values ++ FirstCenterGrade018.values ++ FirstCenterGrade019.values ++ FirstCenterGrade020.values ++ FirstCenterGrade021.values ++ FirstCenterGrade022.values ++ FirstCenterGrade023.values ++ FirstCenterGrade024.values ++ FirstCenterGrade025.values ++ FirstCenterGrade026.values ++ FirstCenterGrade027.values ++ FirstCenterGrade028.values ++ FirstCenterGrade029.values ++ FirstCenterGrade030.values ++ FirstCenterGrade031.values ++ FirstCenterGrade032.values ++ FirstCenterGrade033.values ++ FirstCenterGrade034.values ++ FirstCenterGrade035.values ++ FirstCenterGrade036.values ++ FirstCenterGrade037.values ++ FirstCenterGrade038.values ++ FirstCenterGrade039.values ++ FirstCenterGrade040.values ++ FirstCenterGrade041.values ++ FirstCenterGrade042.values ++ FirstCenterGrade043.values ++ FirstCenterGrade044.values ++ FirstCenterGrade045.values ++ FirstCenterGrade046.values ++ FirstCenterGrade047.values ++ FirstCenterGrade048.values ++ FirstCenterGrade049.values ++ FirstCenterGrade050.values ++ FirstCenterGrade051.values ++ FirstCenterGrade052.values ++ FirstCenterGrade053.values ++ FirstCenterGrade054.values ++ FirstCenterGrade055.values ++ FirstCenterGrade056.values ++ FirstCenterGrade057.values ++ FirstCenterGrade058.values ++ FirstCenterGrade059.values ++ FirstCenterGrade060.values ++ FirstCenterGrade061.values ++ FirstCenterGrade062.values ++ FirstCenterGrade063.values ++ FirstCenterGrade064.values ++ FirstCenterGrade065.values ++ FirstCenterGrade066.values ++ FirstCenterGrade067.values ++ FirstCenterGrade068.values ++ FirstCenterGrade069.values ++ FirstCenterGrade070.values ++ FirstCenterGrade071.values ++ FirstCenterGrade072.values ++ FirstCenterGrade073.values ++ FirstCenterGrade074.values ++ FirstCenterGrade075.values ++ FirstCenterGrade076.values ++ FirstCenterGrade077.values ++ FirstCenterGrade078.values ++ FirstCenterGrade079.values ++ FirstCenterGrade080.values ++ FirstCenterGrade081.values ++ FirstCenterGrade082.values ++ FirstCenterGrade083.values ++ FirstCenterGrade084.values ++ FirstCenterGrade085.values ++ FirstCenterGrade086.values ++ FirstCenterGrade087.values ++ FirstCenterGrade088.values ++ FirstCenterGrade089.values ++ FirstCenterGrade090.values

theorem source_split : FirstSecondIntegerBinding.firstAllValues =
    before ++ FirstCenterGrade005.values ++ suffix := by
  simp only [FirstSecondIntegerBinding.firstAllValues,
    FirstSecondIntegerBinding.first_source_values, before, suffix,
    List.append_assoc]

theorem before_length : before.length = 70 := by
  simp only [before, List.length_append, FirstCenterGrade000Length.length, FirstCenterGrade001Length.length, FirstCenterGrade002Length.length, FirstCenterGrade003Length.length, FirstCenterGrade004Length.length, Nat.reduceAdd]

theorem lookup (c d : ℕ) (hc : c < 7) (hd : d < 6) :
    firstCenterAt 5 c d = FirstCenterGrade005.values[c * 6 + d]?.getD 0 := by
  have hk : c * 6 + d < FirstCenterGrade005.values.length := by
    rw [FirstCenterGrade005Length.length]
    omega
  change firstCenterInts[gradedFlatIndex 5 c d]?.getD 0 = _
  rw [FirstSecondIntegerBinding.first_source_array, source_split]
  have h := ThirdArrayLookup.middle_get before FirstCenterGrade005.values suffix (c * 6 + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range (5 + 2), ∑ d ∈ Finset.range (5 + 1),
      firstCenterAt 5 c d ^ 2) = firstGradeEnergy 5 := by
  calc
    _ = ∑ c ∈ Finset.range 7, ∑ d ∈ Finset.range 6,
        (FirstCenterGrade005.values[c * 6 + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = firstCenterIntegerGrade005.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [FirstCenterGrade005.values, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold firstCenterIntegerGrade005 7 6
              TaylorFirstIntegerGrade005Check.grade_length)
    _ = firstGradeEnergy 5 := by
          rw [TaylorFirstIntegerGrade005Check.grade_energy]
          decide +kernel
end Grothe.UpperChaos.FirstCenterGrade005Binding
