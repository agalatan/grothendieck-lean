import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade023Check

/-! Draft length proof for actual first center grade 23. -/
namespace Grothe.UpperChaos.FirstCenterGrade023Length

theorem length : FirstCenterGrade023.values.length = 600 := by
  simpa only [FirstCenterGrade023.values, Array.length_toList] using
    TaylorFirstIntegerGrade023Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade023Length
