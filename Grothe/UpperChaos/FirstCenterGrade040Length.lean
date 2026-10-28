import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade040Check

/-! Draft length proof for actual first center grade 40. -/
namespace Grothe.UpperChaos.FirstCenterGrade040Length

theorem length : FirstCenterGrade040.values.length = 1722 := by
  simpa only [FirstCenterGrade040.values, Array.length_toList] using
    TaylorFirstIntegerGrade040Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade040Length
