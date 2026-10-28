import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade076Check

/-! Draft length proof for actual first center grade 76. -/
namespace Grothe.UpperChaos.FirstCenterGrade076Length

theorem length : FirstCenterGrade076.values.length = 6006 := by
  simpa only [FirstCenterGrade076.values, Array.length_toList] using
    TaylorFirstIntegerGrade076Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade076Length
