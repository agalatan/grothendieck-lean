import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade058Check

/-! Draft length proof for actual first center grade 58. -/
namespace Grothe.UpperChaos.FirstCenterGrade058Length

theorem length : FirstCenterGrade058.values.length = 3540 := by
  simpa only [FirstCenterGrade058.values, Array.length_toList] using
    TaylorFirstIntegerGrade058Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade058Length
