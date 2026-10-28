import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade074Check

/-! Draft length proof for actual first center grade 74. -/
namespace Grothe.UpperChaos.FirstCenterGrade074Length

theorem length : FirstCenterGrade074.values.length = 5700 := by
  simpa only [FirstCenterGrade074.values, Array.length_toList] using
    TaylorFirstIntegerGrade074Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade074Length
