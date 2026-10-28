import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade024Check

/-! Draft length proof for actual first center grade 24. -/
namespace Grothe.UpperChaos.FirstCenterGrade024Length

theorem length : FirstCenterGrade024.values.length = 650 := by
  simpa only [FirstCenterGrade024.values, Array.length_toList] using
    TaylorFirstIntegerGrade024Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade024Length
