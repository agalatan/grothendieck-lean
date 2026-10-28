import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade005Check

/-! Draft length proof for actual first center grade 5. -/
namespace Grothe.UpperChaos.FirstCenterGrade005Length

theorem length : FirstCenterGrade005.values.length = 42 := by
  simpa only [FirstCenterGrade005.values, Array.length_toList] using
    TaylorFirstIntegerGrade005Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade005Length
