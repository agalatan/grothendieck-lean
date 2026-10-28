import Grothe.UpperChaos.ThirdArrayGrade00
import Grothe.UpperChaos.ThirdArrayGrade01
import Grothe.UpperChaos.ThirdArrayGrade02
import Grothe.UpperChaos.ThirdArrayGrade03
import Grothe.UpperChaos.ThirdArrayGrade04
import Grothe.UpperChaos.ThirdArrayGrade05
import Grothe.UpperChaos.ThirdArrayGrade06
import Grothe.UpperChaos.ThirdArrayGrade07
import Grothe.UpperChaos.ThirdArrayGrade08
import Grothe.UpperChaos.ThirdArrayGrade09
import Grothe.UpperChaos.ThirdArrayGrade10
import Grothe.UpperChaos.ThirdArrayGrade11
import Grothe.UpperChaos.ThirdArrayGrade12
import Grothe.UpperChaos.ThirdArrayGrade13
import Grothe.UpperChaos.ThirdArrayGrade14
import Grothe.UpperChaos.ThirdArrayGrade15
import Grothe.UpperChaos.ThirdArrayGrade16
import Grothe.UpperChaos.ThirdArrayGrade17
import Grothe.UpperChaos.ThirdArrayGrade18
import Grothe.UpperChaos.ThirdArrayGrade19
import Grothe.UpperChaos.ThirdArrayGrade20
import Grothe.UpperChaos.ThirdArrayGrade21
import Grothe.UpperChaos.ThirdArrayGrade22
import Grothe.UpperChaos.ThirdArrayGrade23
import Grothe.UpperChaos.ThirdArrayGrade24
import Grothe.UpperChaos.ThirdArrayGrade25
import Mathlib.Tactic.FinCases

/-! Complete aggregate of the 26 source-bound integer grade sums. -/
namespace Grothe.UpperChaos.ThirdArrayGrades
open ThirdGradeCandidateNumerics
set_option maxRecDepth 16384

theorem all_grade_sums : ∀ q < 26,
    (∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      thirdCenterAt q c d ^ 2) = grade q := by
  intro q hq
  interval_cases q
  · exact ThirdArrayGrade00.grade_sum
  · exact ThirdArrayGrade01.grade_sum
  · exact ThirdArrayGrade02.grade_sum
  · exact ThirdArrayGrade03.grade_sum
  · exact ThirdArrayGrade04.grade_sum
  · exact ThirdArrayGrade05.grade_sum
  · exact ThirdArrayGrade06.grade_sum
  · exact ThirdArrayGrade07.grade_sum
  · exact ThirdArrayGrade08.grade_sum
  · exact ThirdArrayGrade09.grade_sum
  · exact ThirdArrayGrade10.grade_sum
  · exact ThirdArrayGrade11.grade_sum
  · exact ThirdArrayGrade12.grade_sum
  · exact ThirdArrayGrade13.grade_sum
  · exact ThirdArrayGrade14.grade_sum
  · exact ThirdArrayGrade15.grade_sum
  · exact ThirdArrayGrade16.grade_sum
  · exact ThirdArrayGrade17.grade_sum
  · exact ThirdArrayGrade18.grade_sum
  · exact ThirdArrayGrade19.grade_sum
  · exact ThirdArrayGrade20.grade_sum
  · exact ThirdArrayGrade21.grade_sum
  · exact ThirdArrayGrade22.grade_sum
  · exact ThirdArrayGrade23.grade_sum
  · exact ThirdArrayGrade24.grade_sum
  · exact ThirdArrayGrade25.grade_sum
end Grothe.UpperChaos.ThirdArrayGrades
