import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade016Check

/-! Draft length proof for actual first center grade 16. -/
namespace Grothe.UpperChaos.FirstCenterGrade016Length

theorem length : FirstCenterGrade016.values.length = 306 := by
  simpa only [FirstCenterGrade016.values, Array.length_toList] using
    TaylorFirstIntegerGrade016Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade016Length
