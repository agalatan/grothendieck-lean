import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade051Check

/-! Draft length proof for actual first center grade 51. -/
namespace Grothe.UpperChaos.FirstCenterGrade051Length

theorem length : FirstCenterGrade051.values.length = 2756 := by
  simpa only [FirstCenterGrade051.values, Array.length_toList] using
    TaylorFirstIntegerGrade051Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade051Length
