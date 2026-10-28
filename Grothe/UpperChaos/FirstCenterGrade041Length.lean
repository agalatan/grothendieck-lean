import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade041Check

/-! Draft length proof for actual first center grade 41. -/
namespace Grothe.UpperChaos.FirstCenterGrade041Length

theorem length : FirstCenterGrade041.values.length = 1806 := by
  simpa only [FirstCenterGrade041.values, Array.length_toList] using
    TaylorFirstIntegerGrade041Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade041Length
