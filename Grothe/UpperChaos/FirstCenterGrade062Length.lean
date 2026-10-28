import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade062Check

/-! Draft length proof for actual first center grade 62. -/
namespace Grothe.UpperChaos.FirstCenterGrade062Length

theorem length : FirstCenterGrade062.values.length = 4032 := by
  simpa only [FirstCenterGrade062.values, Array.length_toList] using
    TaylorFirstIntegerGrade062Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade062Length
