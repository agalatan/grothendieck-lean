import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade004Check

/-! Draft length proof for actual first center grade 4. -/
namespace Grothe.UpperChaos.FirstCenterGrade004Length

theorem length : FirstCenterGrade004.values.length = 30 := by
  simpa only [FirstCenterGrade004.values, Array.length_toList] using
    TaylorFirstIntegerGrade004Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade004Length
