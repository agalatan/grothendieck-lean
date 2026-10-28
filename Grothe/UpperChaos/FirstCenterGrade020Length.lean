import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade020Check

/-! Draft length proof for actual first center grade 20. -/
namespace Grothe.UpperChaos.FirstCenterGrade020Length

theorem length : FirstCenterGrade020.values.length = 462 := by
  simpa only [FirstCenterGrade020.values, Array.length_toList] using
    TaylorFirstIntegerGrade020Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade020Length
