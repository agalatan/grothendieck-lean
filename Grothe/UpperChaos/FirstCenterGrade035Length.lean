import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade035Check

/-! Draft length proof for actual first center grade 35. -/
namespace Grothe.UpperChaos.FirstCenterGrade035Length

theorem length : FirstCenterGrade035.values.length = 1332 := by
  simpa only [FirstCenterGrade035.values, Array.length_toList] using
    TaylorFirstIntegerGrade035Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade035Length
