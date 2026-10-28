import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade059Check

/-! Draft length proof for actual first center grade 59. -/
namespace Grothe.UpperChaos.FirstCenterGrade059Length

theorem length : FirstCenterGrade059.values.length = 3660 := by
  simpa only [FirstCenterGrade059.values, Array.length_toList] using
    TaylorFirstIntegerGrade059Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade059Length
