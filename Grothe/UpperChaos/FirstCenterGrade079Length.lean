import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade079Check

/-! Draft length proof for actual first center grade 79. -/
namespace Grothe.UpperChaos.FirstCenterGrade079Length

theorem length : FirstCenterGrade079.values.length = 6480 := by
  simpa only [FirstCenterGrade079.values, Array.length_toList] using
    TaylorFirstIntegerGrade079Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade079Length
