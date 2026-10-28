import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade070Check

/-! Draft length proof for actual first center grade 70. -/
namespace Grothe.UpperChaos.FirstCenterGrade070Length

theorem length : FirstCenterGrade070.values.length = 5112 := by
  simpa only [FirstCenterGrade070.values, Array.length_toList] using
    TaylorFirstIntegerGrade070Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade070Length
