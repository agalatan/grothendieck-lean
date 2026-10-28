import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade065Check

/-! Draft length proof for actual first center grade 65. -/
namespace Grothe.UpperChaos.FirstCenterGrade065Length

theorem length : FirstCenterGrade065.values.length = 4422 := by
  simpa only [FirstCenterGrade065.values, Array.length_toList] using
    TaylorFirstIntegerGrade065Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade065Length
