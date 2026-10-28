import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade011Check

/-! Draft length proof for actual first center grade 11. -/
namespace Grothe.UpperChaos.FirstCenterGrade011Length

theorem length : FirstCenterGrade011.values.length = 156 := by
  simpa only [FirstCenterGrade011.values, Array.length_toList] using
    TaylorFirstIntegerGrade011Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade011Length
