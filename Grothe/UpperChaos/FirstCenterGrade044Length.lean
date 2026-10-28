import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade044Check

/-! Draft length proof for actual first center grade 44. -/
namespace Grothe.UpperChaos.FirstCenterGrade044Length

theorem length : FirstCenterGrade044.values.length = 2070 := by
  simpa only [FirstCenterGrade044.values, Array.length_toList] using
    TaylorFirstIntegerGrade044Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade044Length
