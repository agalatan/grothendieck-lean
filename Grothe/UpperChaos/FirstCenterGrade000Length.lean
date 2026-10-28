import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade000Check

/-! Draft length proof for actual first center grade 0. -/
namespace Grothe.UpperChaos.FirstCenterGrade000Length

theorem length : FirstCenterGrade000.values.length = 2 := by
  simpa only [FirstCenterGrade000.values, Array.length_toList] using
    TaylorFirstIntegerGrade000Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade000Length
