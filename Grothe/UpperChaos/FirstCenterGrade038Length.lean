import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade038Check

/-! Draft length proof for actual first center grade 38. -/
namespace Grothe.UpperChaos.FirstCenterGrade038Length

theorem length : FirstCenterGrade038.values.length = 1560 := by
  simpa only [FirstCenterGrade038.values, Array.length_toList] using
    TaylorFirstIntegerGrade038Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade038Length
