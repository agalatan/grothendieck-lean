import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade037Check

/-! Draft length proof for actual first center grade 37. -/
namespace Grothe.UpperChaos.FirstCenterGrade037Length

theorem length : FirstCenterGrade037.values.length = 1482 := by
  simpa only [FirstCenterGrade037.values, Array.length_toList] using
    TaylorFirstIntegerGrade037Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade037Length
