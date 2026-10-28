import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade017Check

/-! Draft length proof for actual first center grade 17. -/
namespace Grothe.UpperChaos.FirstCenterGrade017Length

theorem length : FirstCenterGrade017.values.length = 342 := by
  simpa only [FirstCenterGrade017.values, Array.length_toList] using
    TaylorFirstIntegerGrade017Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade017Length
