import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade043Check

/-! Draft length proof for actual first center grade 43. -/
namespace Grothe.UpperChaos.FirstCenterGrade043Length

theorem length : FirstCenterGrade043.values.length = 1980 := by
  simpa only [FirstCenterGrade043.values, Array.length_toList] using
    TaylorFirstIntegerGrade043Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade043Length
