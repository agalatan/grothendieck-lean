import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade022Check

/-! Draft length proof for actual first center grade 22. -/
namespace Grothe.UpperChaos.FirstCenterGrade022Length

theorem length : FirstCenterGrade022.values.length = 552 := by
  simpa only [FirstCenterGrade022.values, Array.length_toList] using
    TaylorFirstIntegerGrade022Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade022Length
