import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade049Check

/-! Draft length proof for actual first center grade 49. -/
namespace Grothe.UpperChaos.FirstCenterGrade049Length

theorem length : FirstCenterGrade049.values.length = 2550 := by
  simpa only [FirstCenterGrade049.values, Array.length_toList] using
    TaylorFirstIntegerGrade049Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade049Length
