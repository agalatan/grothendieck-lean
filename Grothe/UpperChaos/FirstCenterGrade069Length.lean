import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade069Check

/-! Draft length proof for actual first center grade 69. -/
namespace Grothe.UpperChaos.FirstCenterGrade069Length

theorem length : FirstCenterGrade069.values.length = 4970 := by
  simpa only [FirstCenterGrade069.values, Array.length_toList] using
    TaylorFirstIntegerGrade069Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade069Length
