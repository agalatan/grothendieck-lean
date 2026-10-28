import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade060Check

/-! Draft length proof for actual first center grade 60. -/
namespace Grothe.UpperChaos.FirstCenterGrade060Length

theorem length : FirstCenterGrade060.values.length = 3782 := by
  simpa only [FirstCenterGrade060.values, Array.length_toList] using
    TaylorFirstIntegerGrade060Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade060Length
