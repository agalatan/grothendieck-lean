import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade089Check

/-! Draft length proof for actual first center grade 89. -/
namespace Grothe.UpperChaos.FirstCenterGrade089Length

theorem length : FirstCenterGrade089.values.length = 8190 := by
  simpa only [FirstCenterGrade089.values, Array.length_toList] using
    TaylorFirstIntegerGrade089Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade089Length
