import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade055Check

/-! Draft length proof for actual first center grade 55. -/
namespace Grothe.UpperChaos.FirstCenterGrade055Length

theorem length : FirstCenterGrade055.values.length = 3192 := by
  simpa only [FirstCenterGrade055.values, Array.length_toList] using
    TaylorFirstIntegerGrade055Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade055Length
