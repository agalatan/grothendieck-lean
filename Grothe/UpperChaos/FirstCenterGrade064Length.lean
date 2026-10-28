import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade064Check

/-! Draft length proof for actual first center grade 64. -/
namespace Grothe.UpperChaos.FirstCenterGrade064Length

theorem length : FirstCenterGrade064.values.length = 4290 := by
  simpa only [FirstCenterGrade064.values, Array.length_toList] using
    TaylorFirstIntegerGrade064Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade064Length
