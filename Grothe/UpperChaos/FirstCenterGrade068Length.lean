import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade068Check

/-! Draft length proof for actual first center grade 68. -/
namespace Grothe.UpperChaos.FirstCenterGrade068Length

theorem length : FirstCenterGrade068.values.length = 4830 := by
  simpa only [FirstCenterGrade068.values, Array.length_toList] using
    TaylorFirstIntegerGrade068Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade068Length
