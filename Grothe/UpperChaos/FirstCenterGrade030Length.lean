import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade030Check

/-! Draft length proof for actual first center grade 30. -/
namespace Grothe.UpperChaos.FirstCenterGrade030Length

theorem length : FirstCenterGrade030.values.length = 992 := by
  simpa only [FirstCenterGrade030.values, Array.length_toList] using
    TaylorFirstIntegerGrade030Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade030Length
