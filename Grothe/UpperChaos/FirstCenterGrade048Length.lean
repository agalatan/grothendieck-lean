import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade048Check

/-! Draft length proof for actual first center grade 48. -/
namespace Grothe.UpperChaos.FirstCenterGrade048Length

theorem length : FirstCenterGrade048.values.length = 2450 := by
  simpa only [FirstCenterGrade048.values, Array.length_toList] using
    TaylorFirstIntegerGrade048Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade048Length
