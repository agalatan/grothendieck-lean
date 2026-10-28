import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade063Check

/-! Draft length proof for actual first center grade 63. -/
namespace Grothe.UpperChaos.FirstCenterGrade063Length

theorem length : FirstCenterGrade063.values.length = 4160 := by
  simpa only [FirstCenterGrade063.values, Array.length_toList] using
    TaylorFirstIntegerGrade063Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade063Length
