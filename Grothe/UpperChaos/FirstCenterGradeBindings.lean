import Grothe.UpperChaos.FirstCenterGrade000Binding
import Grothe.UpperChaos.FirstCenterGrade001Binding
import Grothe.UpperChaos.FirstCenterGrade002Binding
import Grothe.UpperChaos.FirstCenterGrade003Binding
import Grothe.UpperChaos.FirstCenterGrade004Binding
import Grothe.UpperChaos.FirstCenterGrade005Binding
import Grothe.UpperChaos.FirstCenterGrade006Binding
import Grothe.UpperChaos.FirstCenterGrade007Binding
import Grothe.UpperChaos.FirstCenterGrade008Binding
import Grothe.UpperChaos.FirstCenterGrade009Binding
import Grothe.UpperChaos.FirstCenterGrade010Binding
import Grothe.UpperChaos.FirstCenterGrade011Binding
import Grothe.UpperChaos.FirstCenterGrade012Binding
import Grothe.UpperChaos.FirstCenterGrade013Binding
import Grothe.UpperChaos.FirstCenterGrade014Binding
import Grothe.UpperChaos.FirstCenterGrade015Binding
import Grothe.UpperChaos.FirstCenterGrade016Binding
import Grothe.UpperChaos.FirstCenterGrade017Binding
import Grothe.UpperChaos.FirstCenterGrade018Binding
import Grothe.UpperChaos.FirstCenterGrade019Binding
import Grothe.UpperChaos.FirstCenterGrade020Binding
import Grothe.UpperChaos.FirstCenterGrade021Binding
import Grothe.UpperChaos.FirstCenterGrade022Binding
import Grothe.UpperChaos.FirstCenterGrade023Binding
import Grothe.UpperChaos.FirstCenterGrade024Binding
import Grothe.UpperChaos.FirstCenterGrade025Binding
import Grothe.UpperChaos.FirstCenterGrade026Binding
import Grothe.UpperChaos.FirstCenterGrade027Binding
import Grothe.UpperChaos.FirstCenterGrade028Binding
import Grothe.UpperChaos.FirstCenterGrade029Binding
import Grothe.UpperChaos.FirstCenterGrade030Binding
import Grothe.UpperChaos.FirstCenterGrade031Binding
import Grothe.UpperChaos.FirstCenterGrade032Binding
import Grothe.UpperChaos.FirstCenterGrade033Binding
import Grothe.UpperChaos.FirstCenterGrade034Binding
import Grothe.UpperChaos.FirstCenterGrade035Binding
import Grothe.UpperChaos.FirstCenterGrade036Binding
import Grothe.UpperChaos.FirstCenterGrade037Binding
import Grothe.UpperChaos.FirstCenterGrade038Binding
import Grothe.UpperChaos.FirstCenterGrade039Binding
import Grothe.UpperChaos.FirstCenterGrade040Binding
import Grothe.UpperChaos.FirstCenterGrade041Binding
import Grothe.UpperChaos.FirstCenterGrade042Binding
import Grothe.UpperChaos.FirstCenterGrade043Binding
import Grothe.UpperChaos.FirstCenterGrade044Binding
import Grothe.UpperChaos.FirstCenterGrade045Binding
import Grothe.UpperChaos.FirstCenterGrade046Binding
import Grothe.UpperChaos.FirstCenterGrade047Binding
import Grothe.UpperChaos.FirstCenterGrade048Binding
import Grothe.UpperChaos.FirstCenterGrade049Binding
import Grothe.UpperChaos.FirstCenterGrade050Binding
import Grothe.UpperChaos.FirstCenterGrade051Binding
import Grothe.UpperChaos.FirstCenterGrade052Binding
import Grothe.UpperChaos.FirstCenterGrade053Binding
import Grothe.UpperChaos.FirstCenterGrade054Binding
import Grothe.UpperChaos.FirstCenterGrade055Binding
import Grothe.UpperChaos.FirstCenterGrade056Binding
import Grothe.UpperChaos.FirstCenterGrade057Binding
import Grothe.UpperChaos.FirstCenterGrade058Binding
import Grothe.UpperChaos.FirstCenterGrade059Binding
import Grothe.UpperChaos.FirstCenterGrade060Binding
import Grothe.UpperChaos.FirstCenterGrade061Binding
import Grothe.UpperChaos.FirstCenterGrade062Binding
import Grothe.UpperChaos.FirstCenterGrade063Binding
import Grothe.UpperChaos.FirstCenterGrade064Binding
import Grothe.UpperChaos.FirstCenterGrade065Binding
import Grothe.UpperChaos.FirstCenterGrade066Binding
import Grothe.UpperChaos.FirstCenterGrade067Binding
import Grothe.UpperChaos.FirstCenterGrade068Binding
import Grothe.UpperChaos.FirstCenterGrade069Binding
import Grothe.UpperChaos.FirstCenterGrade070Binding
import Grothe.UpperChaos.FirstCenterGrade071Binding
import Grothe.UpperChaos.FirstCenterGrade072Binding
import Grothe.UpperChaos.FirstCenterGrade073Binding
import Grothe.UpperChaos.FirstCenterGrade074Binding
import Grothe.UpperChaos.FirstCenterGrade075Binding
import Grothe.UpperChaos.FirstCenterGrade076Binding
import Grothe.UpperChaos.FirstCenterGrade077Binding
import Grothe.UpperChaos.FirstCenterGrade078Binding
import Grothe.UpperChaos.FirstCenterGrade079Binding
import Grothe.UpperChaos.FirstCenterGrade080Binding
import Grothe.UpperChaos.FirstCenterGrade081Binding
import Grothe.UpperChaos.FirstCenterGrade082Binding
import Grothe.UpperChaos.FirstCenterGrade083Binding
import Grothe.UpperChaos.FirstCenterGrade084Binding
import Grothe.UpperChaos.FirstCenterGrade085Binding
import Grothe.UpperChaos.FirstCenterGrade086Binding
import Grothe.UpperChaos.FirstCenterGrade087Binding
import Grothe.UpperChaos.FirstCenterGrade088Binding
import Grothe.UpperChaos.FirstCenterGrade089Binding
import Grothe.UpperChaos.FirstCenterGrade090Binding
import Mathlib.Tactic.FinCases

/-! Draft all actual-source first grade sums; check all imports. -/
namespace Grothe.UpperChaos.FirstCenterGradeBindings
open FirstSecondGradeEnergyTargets
set_option maxRecDepth 16384
set_option maxHeartbeats 0

theorem all_grade_sums : ∀ q < 91,
    (∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      firstCenterAt q c d ^ 2) = firstGradeEnergy q := by
  intro q hq
  interval_cases q
  · exact FirstCenterGrade000Binding.grade_sum
  · exact FirstCenterGrade001Binding.grade_sum
  · exact FirstCenterGrade002Binding.grade_sum
  · exact FirstCenterGrade003Binding.grade_sum
  · exact FirstCenterGrade004Binding.grade_sum
  · exact FirstCenterGrade005Binding.grade_sum
  · exact FirstCenterGrade006Binding.grade_sum
  · exact FirstCenterGrade007Binding.grade_sum
  · exact FirstCenterGrade008Binding.grade_sum
  · exact FirstCenterGrade009Binding.grade_sum
  · exact FirstCenterGrade010Binding.grade_sum
  · exact FirstCenterGrade011Binding.grade_sum
  · exact FirstCenterGrade012Binding.grade_sum
  · exact FirstCenterGrade013Binding.grade_sum
  · exact FirstCenterGrade014Binding.grade_sum
  · exact FirstCenterGrade015Binding.grade_sum
  · exact FirstCenterGrade016Binding.grade_sum
  · exact FirstCenterGrade017Binding.grade_sum
  · exact FirstCenterGrade018Binding.grade_sum
  · exact FirstCenterGrade019Binding.grade_sum
  · exact FirstCenterGrade020Binding.grade_sum
  · exact FirstCenterGrade021Binding.grade_sum
  · exact FirstCenterGrade022Binding.grade_sum
  · exact FirstCenterGrade023Binding.grade_sum
  · exact FirstCenterGrade024Binding.grade_sum
  · exact FirstCenterGrade025Binding.grade_sum
  · exact FirstCenterGrade026Binding.grade_sum
  · exact FirstCenterGrade027Binding.grade_sum
  · exact FirstCenterGrade028Binding.grade_sum
  · exact FirstCenterGrade029Binding.grade_sum
  · exact FirstCenterGrade030Binding.grade_sum
  · exact FirstCenterGrade031Binding.grade_sum
  · exact FirstCenterGrade032Binding.grade_sum
  · exact FirstCenterGrade033Binding.grade_sum
  · exact FirstCenterGrade034Binding.grade_sum
  · exact FirstCenterGrade035Binding.grade_sum
  · exact FirstCenterGrade036Binding.grade_sum
  · exact FirstCenterGrade037Binding.grade_sum
  · exact FirstCenterGrade038Binding.grade_sum
  · exact FirstCenterGrade039Binding.grade_sum
  · exact FirstCenterGrade040Binding.grade_sum
  · exact FirstCenterGrade041Binding.grade_sum
  · exact FirstCenterGrade042Binding.grade_sum
  · exact FirstCenterGrade043Binding.grade_sum
  · exact FirstCenterGrade044Binding.grade_sum
  · exact FirstCenterGrade045Binding.grade_sum
  · exact FirstCenterGrade046Binding.grade_sum
  · exact FirstCenterGrade047Binding.grade_sum
  · exact FirstCenterGrade048Binding.grade_sum
  · exact FirstCenterGrade049Binding.grade_sum
  · exact FirstCenterGrade050Binding.grade_sum
  · exact FirstCenterGrade051Binding.grade_sum
  · exact FirstCenterGrade052Binding.grade_sum
  · exact FirstCenterGrade053Binding.grade_sum
  · exact FirstCenterGrade054Binding.grade_sum
  · exact FirstCenterGrade055Binding.grade_sum
  · exact FirstCenterGrade056Binding.grade_sum
  · exact FirstCenterGrade057Binding.grade_sum
  · exact FirstCenterGrade058Binding.grade_sum
  · exact FirstCenterGrade059Binding.grade_sum
  · exact FirstCenterGrade060Binding.grade_sum
  · exact FirstCenterGrade061Binding.grade_sum
  · exact FirstCenterGrade062Binding.grade_sum
  · exact FirstCenterGrade063Binding.grade_sum
  · exact FirstCenterGrade064Binding.grade_sum
  · exact FirstCenterGrade065Binding.grade_sum
  · exact FirstCenterGrade066Binding.grade_sum
  · exact FirstCenterGrade067Binding.grade_sum
  · exact FirstCenterGrade068Binding.grade_sum
  · exact FirstCenterGrade069Binding.grade_sum
  · exact FirstCenterGrade070Binding.grade_sum
  · exact FirstCenterGrade071Binding.grade_sum
  · exact FirstCenterGrade072Binding.grade_sum
  · exact FirstCenterGrade073Binding.grade_sum
  · exact FirstCenterGrade074Binding.grade_sum
  · exact FirstCenterGrade075Binding.grade_sum
  · exact FirstCenterGrade076Binding.grade_sum
  · exact FirstCenterGrade077Binding.grade_sum
  · exact FirstCenterGrade078Binding.grade_sum
  · exact FirstCenterGrade079Binding.grade_sum
  · exact FirstCenterGrade080Binding.grade_sum
  · exact FirstCenterGrade081Binding.grade_sum
  · exact FirstCenterGrade082Binding.grade_sum
  · exact FirstCenterGrade083Binding.grade_sum
  · exact FirstCenterGrade084Binding.grade_sum
  · exact FirstCenterGrade085Binding.grade_sum
  · exact FirstCenterGrade086Binding.grade_sum
  · exact FirstCenterGrade087Binding.grade_sum
  · exact FirstCenterGrade088Binding.grade_sum
  · exact FirstCenterGrade089Binding.grade_sum
  · exact FirstCenterGrade090Binding.grade_sum
end Grothe.UpperChaos.FirstCenterGradeBindings
