import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade053Check

/-! Draft length proof for actual first center grade 53. -/
namespace Grothe.UpperChaos.FirstCenterGrade053Length

theorem length : FirstCenterGrade053.values.length = 2970 := by
  simpa only [FirstCenterGrade053.values, Array.length_toList] using
    TaylorFirstIntegerGrade053Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade053Length
