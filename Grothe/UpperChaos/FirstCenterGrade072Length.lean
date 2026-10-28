import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade072Check

/-! Draft length proof for actual first center grade 72. -/
namespace Grothe.UpperChaos.FirstCenterGrade072Length

theorem length : FirstCenterGrade072.values.length = 5402 := by
  simpa only [FirstCenterGrade072.values, Array.length_toList] using
    TaylorFirstIntegerGrade072Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade072Length
