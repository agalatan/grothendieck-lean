import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade050Check

/-! Draft length proof for actual first center grade 50. -/
namespace Grothe.UpperChaos.FirstCenterGrade050Length

theorem length : FirstCenterGrade050.values.length = 2652 := by
  simpa only [FirstCenterGrade050.values, Array.length_toList] using
    TaylorFirstIntegerGrade050Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade050Length
