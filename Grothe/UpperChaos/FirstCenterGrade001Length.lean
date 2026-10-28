import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade001Check

/-! Draft length proof for actual first center grade 1. -/
namespace Grothe.UpperChaos.FirstCenterGrade001Length

theorem length : FirstCenterGrade001.values.length = 6 := by
  simpa only [FirstCenterGrade001.values, Array.length_toList] using
    TaylorFirstIntegerGrade001Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade001Length
