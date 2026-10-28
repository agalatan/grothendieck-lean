import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade018Check

/-! Draft length proof for actual first center grade 18. -/
namespace Grothe.UpperChaos.FirstCenterGrade018Length

theorem length : FirstCenterGrade018.values.length = 380 := by
  simpa only [FirstCenterGrade018.values, Array.length_toList] using
    TaylorFirstIntegerGrade018Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade018Length
