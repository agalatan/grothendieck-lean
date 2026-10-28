import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Check

/-! Draft length proof for actual first center grade 83. -/
namespace Grothe.UpperChaos.FirstCenterGrade083Length

theorem length : FirstCenterGrade083.values.length = 7140 := by
  simpa only [FirstCenterGrade083.values, Array.length_toList] using
    TaylorFirstIntegerGrade083Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade083Length
