import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade073Check

/-! Draft length proof for actual first center grade 73. -/
namespace Grothe.UpperChaos.FirstCenterGrade073Length

theorem length : FirstCenterGrade073.values.length = 5550 := by
  simpa only [FirstCenterGrade073.values, Array.length_toList] using
    TaylorFirstIntegerGrade073Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade073Length
