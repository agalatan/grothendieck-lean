import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade042Check

/-! Draft length proof for actual first center grade 42. -/
namespace Grothe.UpperChaos.FirstCenterGrade042Length

theorem length : FirstCenterGrade042.values.length = 1892 := by
  simpa only [FirstCenterGrade042.values, Array.length_toList] using
    TaylorFirstIntegerGrade042Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade042Length
