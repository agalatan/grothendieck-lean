import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade078Check

/-! Draft length proof for actual first center grade 78. -/
namespace Grothe.UpperChaos.FirstCenterGrade078Length

theorem length : FirstCenterGrade078.values.length = 6320 := by
  simpa only [FirstCenterGrade078.values, Array.length_toList] using
    TaylorFirstIntegerGrade078Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade078Length
