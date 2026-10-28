import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade084Check

/-! Draft length proof for actual first center grade 84. -/
namespace Grothe.UpperChaos.FirstCenterGrade084Length

theorem length : FirstCenterGrade084.values.length = 7310 := by
  simpa only [FirstCenterGrade084.values, Array.length_toList] using
    TaylorFirstIntegerGrade084Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade084Length
