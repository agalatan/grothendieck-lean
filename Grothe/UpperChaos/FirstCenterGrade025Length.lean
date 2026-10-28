import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade025Check

/-! Draft length proof for actual first center grade 25. -/
namespace Grothe.UpperChaos.FirstCenterGrade025Length

theorem length : FirstCenterGrade025.values.length = 702 := by
  simpa only [FirstCenterGrade025.values, Array.length_toList] using
    TaylorFirstIntegerGrade025Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade025Length
