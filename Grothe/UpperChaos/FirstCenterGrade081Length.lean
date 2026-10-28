import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Check

/-! Draft length proof for actual first center grade 81. -/
namespace Grothe.UpperChaos.FirstCenterGrade081Length

theorem length : FirstCenterGrade081.values.length = 6806 := by
  simpa only [FirstCenterGrade081.values, Array.length_toList] using
    TaylorFirstIntegerGrade081Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade081Length
