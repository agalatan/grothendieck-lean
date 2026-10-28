import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade066Check

/-! Draft length proof for actual first center grade 66. -/
namespace Grothe.UpperChaos.FirstCenterGrade066Length

theorem length : FirstCenterGrade066.values.length = 4556 := by
  simpa only [FirstCenterGrade066.values, Array.length_toList] using
    TaylorFirstIntegerGrade066Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade066Length
