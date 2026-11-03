import Grothe.UpperChaos.SecondCenterGrade000Binding
import Grothe.UpperChaos.SecondCenterGrade001Binding
import Grothe.UpperChaos.SecondCenterGrade002Binding
import Grothe.UpperChaos.SecondCenterGrade003Binding
import Grothe.UpperChaos.SecondCenterGrade004Binding
import Grothe.UpperChaos.SecondCenterGrade005Binding
import Grothe.UpperChaos.SecondCenterGrade006Binding
import Grothe.UpperChaos.SecondCenterGrade007Binding
import Grothe.UpperChaos.SecondCenterGrade008Binding
import Grothe.UpperChaos.SecondCenterGrade009Binding
import Grothe.UpperChaos.SecondCenterGrade010Binding
import Grothe.UpperChaos.SecondCenterGrade011Binding
import Grothe.UpperChaos.SecondCenterGrade012Binding
import Grothe.UpperChaos.SecondCenterGrade013Binding
import Grothe.UpperChaos.SecondCenterGrade014Binding
import Grothe.UpperChaos.SecondCenterGrade015Binding
import Grothe.UpperChaos.SecondCenterGrade016Binding
import Grothe.UpperChaos.SecondCenterGrade017Binding
import Grothe.UpperChaos.SecondCenterGrade018Binding
import Grothe.UpperChaos.SecondCenterGrade019Binding
import Grothe.UpperChaos.SecondCenterGrade020Binding
import Grothe.UpperChaos.SecondCenterGrade021Binding
import Grothe.UpperChaos.SecondCenterGrade022Binding
import Grothe.UpperChaos.SecondCenterGrade023Binding
import Grothe.UpperChaos.SecondCenterGrade024Binding
import Grothe.UpperChaos.SecondCenterGrade025Binding
import Grothe.UpperChaos.SecondCenterGrade026Binding
import Grothe.UpperChaos.SecondCenterGrade027Binding
import Grothe.UpperChaos.SecondCenterGrade028Binding
import Grothe.UpperChaos.SecondCenterGrade029Binding
import Grothe.UpperChaos.SecondCenterGrade030Binding
import Grothe.UpperChaos.SecondCenterGrade031Binding
import Grothe.UpperChaos.SecondCenterGrade032Binding
import Grothe.UpperChaos.SecondCenterGrade033Binding
import Grothe.UpperChaos.SecondCenterGrade034Binding
import Grothe.UpperChaos.SecondCenterGrade035Binding
import Grothe.UpperChaos.SecondCenterGrade036Binding
import Grothe.UpperChaos.SecondCenterGrade037Binding
import Grothe.UpperChaos.SecondCenterGrade038Binding
import Grothe.UpperChaos.SecondCenterGrade039Binding
import Grothe.UpperChaos.SecondCenterGrade040Binding
import Grothe.UpperChaos.SecondCenterGrade041Binding
import Grothe.UpperChaos.SecondCenterGrade042Binding
import Grothe.UpperChaos.SecondCenterGrade043Binding
import Grothe.UpperChaos.SecondCenterGrade044Binding
import Grothe.UpperChaos.SecondCenterGrade045Binding
import Mathlib.Tactic.FinCases

/-! Actual-source second grade sums conditional on packed-to-literal equality; check all imports. -/
namespace Grothe.UpperChaos.SecondCenterGradeBindings
open FirstSecondGradeEnergyTargets
set_option maxRecDepth 16384
set_option maxHeartbeats 0

theorem all_grade_sums
    (hsource : secondCenterInts = FirstSecondIntegerBinding.secondAllValues.toArray) :
    ∀ q < 46,
    (∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      secondCenterAt q c d ^ 2) = secondGradeEnergy q := by
  intro q hq
  interval_cases q
  · exact SecondCenterGrade000Binding.grade_sum hsource
  · exact SecondCenterGrade001Binding.grade_sum hsource
  · exact SecondCenterGrade002Binding.grade_sum hsource
  · exact SecondCenterGrade003Binding.grade_sum hsource
  · exact SecondCenterGrade004Binding.grade_sum hsource
  · exact SecondCenterGrade005Binding.grade_sum hsource
  · exact SecondCenterGrade006Binding.grade_sum hsource
  · exact SecondCenterGrade007Binding.grade_sum hsource
  · exact SecondCenterGrade008Binding.grade_sum hsource
  · exact SecondCenterGrade009Binding.grade_sum hsource
  · exact SecondCenterGrade010Binding.grade_sum hsource
  · exact SecondCenterGrade011Binding.grade_sum hsource
  · exact SecondCenterGrade012Binding.grade_sum hsource
  · exact SecondCenterGrade013Binding.grade_sum hsource
  · exact SecondCenterGrade014Binding.grade_sum hsource
  · exact SecondCenterGrade015Binding.grade_sum hsource
  · exact SecondCenterGrade016Binding.grade_sum hsource
  · exact SecondCenterGrade017Binding.grade_sum hsource
  · exact SecondCenterGrade018Binding.grade_sum hsource
  · exact SecondCenterGrade019Binding.grade_sum hsource
  · exact SecondCenterGrade020Binding.grade_sum hsource
  · exact SecondCenterGrade021Binding.grade_sum hsource
  · exact SecondCenterGrade022Binding.grade_sum hsource
  · exact SecondCenterGrade023Binding.grade_sum hsource
  · exact SecondCenterGrade024Binding.grade_sum hsource
  · exact SecondCenterGrade025Binding.grade_sum hsource
  · exact SecondCenterGrade026Binding.grade_sum hsource
  · exact SecondCenterGrade027Binding.grade_sum hsource
  · exact SecondCenterGrade028Binding.grade_sum hsource
  · exact SecondCenterGrade029Binding.grade_sum hsource
  · exact SecondCenterGrade030Binding.grade_sum hsource
  · exact SecondCenterGrade031Binding.grade_sum hsource
  · exact SecondCenterGrade032Binding.grade_sum hsource
  · exact SecondCenterGrade033Binding.grade_sum hsource
  · exact SecondCenterGrade034Binding.grade_sum hsource
  · exact SecondCenterGrade035Binding.grade_sum hsource
  · exact SecondCenterGrade036Binding.grade_sum hsource
  · exact SecondCenterGrade037Binding.grade_sum hsource
  · exact SecondCenterGrade038Binding.grade_sum hsource
  · exact SecondCenterGrade039Binding.grade_sum hsource
  · exact SecondCenterGrade040Binding.grade_sum hsource
  · exact SecondCenterGrade041Binding.grade_sum hsource
  · exact SecondCenterGrade042Binding.grade_sum hsource
  · exact SecondCenterGrade043Binding.grade_sum hsource
  · exact SecondCenterGrade044Binding.grade_sum hsource
  · exact SecondCenterGrade045Binding.grade_sum hsource
end Grothe.UpperChaos.SecondCenterGradeBindings
