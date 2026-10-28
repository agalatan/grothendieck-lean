import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade008Check

/-! Draft length proof for actual first center grade 8. -/
namespace Grothe.UpperChaos.FirstCenterGrade008Length

theorem length : FirstCenterGrade008.values.length = 90 := by
  simpa only [FirstCenterGrade008.values, Array.length_toList] using
    TaylorFirstIntegerGrade008Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade008Length
