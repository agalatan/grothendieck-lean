import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade045Check

/-! Draft length proof for actual first center grade 45. -/
namespace Grothe.UpperChaos.FirstCenterGrade045Length

theorem length : FirstCenterGrade045.values.length = 2162 := by
  simpa only [FirstCenterGrade045.values, Array.length_toList] using
    TaylorFirstIntegerGrade045Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade045Length
