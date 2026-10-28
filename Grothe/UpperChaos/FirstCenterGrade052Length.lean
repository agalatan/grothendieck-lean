import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade052Check

/-! Draft length proof for actual first center grade 52. -/
namespace Grothe.UpperChaos.FirstCenterGrade052Length

theorem length : FirstCenterGrade052.values.length = 2862 := by
  simpa only [FirstCenterGrade052.values, Array.length_toList] using
    TaylorFirstIntegerGrade052Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade052Length
