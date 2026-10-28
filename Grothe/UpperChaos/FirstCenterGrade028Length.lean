import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade028Check

/-! Draft length proof for actual first center grade 28. -/
namespace Grothe.UpperChaos.FirstCenterGrade028Length

theorem length : FirstCenterGrade028.values.length = 870 := by
  simpa only [FirstCenterGrade028.values, Array.length_toList] using
    TaylorFirstIntegerGrade028Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade028Length
