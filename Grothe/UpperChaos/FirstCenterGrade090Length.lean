import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade090Check

/-! Draft length proof for actual first center grade 90. -/
namespace Grothe.UpperChaos.FirstCenterGrade090Length

theorem length : FirstCenterGrade090.values.length = 8372 := by
  simpa only [FirstCenterGrade090.values, Array.length_toList] using
    TaylorFirstIntegerGrade090Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade090Length
