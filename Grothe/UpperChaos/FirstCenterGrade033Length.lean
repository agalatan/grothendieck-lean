import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade033Check

/-! Draft length proof for actual first center grade 33. -/
namespace Grothe.UpperChaos.FirstCenterGrade033Length

theorem length : FirstCenterGrade033.values.length = 1190 := by
  simpa only [FirstCenterGrade033.values, Array.length_toList] using
    TaylorFirstIntegerGrade033Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade033Length
