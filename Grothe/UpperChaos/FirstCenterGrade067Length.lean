import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade067Check

/-! Draft length proof for actual first center grade 67. -/
namespace Grothe.UpperChaos.FirstCenterGrade067Length

theorem length : FirstCenterGrade067.values.length = 4692 := by
  simpa only [FirstCenterGrade067.values, Array.length_toList] using
    TaylorFirstIntegerGrade067Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade067Length
