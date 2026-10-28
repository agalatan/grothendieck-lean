import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade077Check

/-! Draft length proof for actual first center grade 77. -/
namespace Grothe.UpperChaos.FirstCenterGrade077Length

theorem length : FirstCenterGrade077.values.length = 6162 := by
  simpa only [FirstCenterGrade077.values, Array.length_toList] using
    TaylorFirstIntegerGrade077Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade077Length
