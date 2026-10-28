import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade061Check

/-! Draft length proof for actual first center grade 61. -/
namespace Grothe.UpperChaos.FirstCenterGrade061Length

theorem length : FirstCenterGrade061.values.length = 3906 := by
  simpa only [FirstCenterGrade061.values, Array.length_toList] using
    TaylorFirstIntegerGrade061Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade061Length
