import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade015Check

/-! Draft length proof for actual first center grade 15. -/
namespace Grothe.UpperChaos.FirstCenterGrade015Length

theorem length : FirstCenterGrade015.values.length = 272 := by
  simpa only [FirstCenterGrade015.values, Array.length_toList] using
    TaylorFirstIntegerGrade015Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade015Length
