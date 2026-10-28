import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade027Check

/-! Draft length proof for actual first center grade 27. -/
namespace Grothe.UpperChaos.FirstCenterGrade027Length

theorem length : FirstCenterGrade027.values.length = 812 := by
  simpa only [FirstCenterGrade027.values, Array.length_toList] using
    TaylorFirstIntegerGrade027Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade027Length
