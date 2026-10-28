import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade039Check

/-! Draft length proof for actual first center grade 39. -/
namespace Grothe.UpperChaos.FirstCenterGrade039Length

theorem length : FirstCenterGrade039.values.length = 1640 := by
  simpa only [FirstCenterGrade039.values, Array.length_toList] using
    TaylorFirstIntegerGrade039Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade039Length
