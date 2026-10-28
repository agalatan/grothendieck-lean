import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade010Check

/-! Draft length proof for actual first center grade 10. -/
namespace Grothe.UpperChaos.FirstCenterGrade010Length

theorem length : FirstCenterGrade010.values.length = 132 := by
  simpa only [FirstCenterGrade010.values, Array.length_toList] using
    TaylorFirstIntegerGrade010Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade010Length
