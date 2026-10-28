import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade056Check

/-! Draft length proof for actual first center grade 56. -/
namespace Grothe.UpperChaos.FirstCenterGrade056Length

theorem length : FirstCenterGrade056.values.length = 3306 := by
  simpa only [FirstCenterGrade056.values, Array.length_toList] using
    TaylorFirstIntegerGrade056Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade056Length
