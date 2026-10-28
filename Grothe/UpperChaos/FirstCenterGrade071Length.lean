import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade071Check

/-! Draft length proof for actual first center grade 71. -/
namespace Grothe.UpperChaos.FirstCenterGrade071Length

theorem length : FirstCenterGrade071.values.length = 5256 := by
  simpa only [FirstCenterGrade071.values, Array.length_toList] using
    TaylorFirstIntegerGrade071Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade071Length
