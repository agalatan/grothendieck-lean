import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade054Check

/-! Draft length proof for actual first center grade 54. -/
namespace Grothe.UpperChaos.FirstCenterGrade054Length

theorem length : FirstCenterGrade054.values.length = 3080 := by
  simpa only [FirstCenterGrade054.values, Array.length_toList] using
    TaylorFirstIntegerGrade054Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade054Length
