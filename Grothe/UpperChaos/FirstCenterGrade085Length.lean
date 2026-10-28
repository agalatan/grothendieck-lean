import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade085Check

/-! Draft length proof for actual first center grade 85. -/
namespace Grothe.UpperChaos.FirstCenterGrade085Length

theorem length : FirstCenterGrade085.values.length = 7482 := by
  simpa only [FirstCenterGrade085.values, Array.length_toList] using
    TaylorFirstIntegerGrade085Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade085Length
