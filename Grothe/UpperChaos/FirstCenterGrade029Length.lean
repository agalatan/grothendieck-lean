import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade029Check

/-! Draft length proof for actual first center grade 29. -/
namespace Grothe.UpperChaos.FirstCenterGrade029Length

theorem length : FirstCenterGrade029.values.length = 930 := by
  simpa only [FirstCenterGrade029.values, Array.length_toList] using
    TaylorFirstIntegerGrade029Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade029Length
