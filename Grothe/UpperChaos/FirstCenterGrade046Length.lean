import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade046Check

/-! Draft length proof for actual first center grade 46. -/
namespace Grothe.UpperChaos.FirstCenterGrade046Length

theorem length : FirstCenterGrade046.values.length = 2256 := by
  simpa only [FirstCenterGrade046.values, Array.length_toList] using
    TaylorFirstIntegerGrade046Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade046Length
