import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade026Check

/-! Draft length proof for actual first center grade 26. -/
namespace Grothe.UpperChaos.FirstCenterGrade026Length

theorem length : FirstCenterGrade026.values.length = 756 := by
  simpa only [FirstCenterGrade026.values, Array.length_toList] using
    TaylorFirstIntegerGrade026Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade026Length
