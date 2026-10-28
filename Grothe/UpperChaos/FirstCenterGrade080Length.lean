import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade080Check

/-! Draft length proof for actual first center grade 80. -/
namespace Grothe.UpperChaos.FirstCenterGrade080Length

theorem length : FirstCenterGrade080.values.length = 6642 := by
  simpa only [FirstCenterGrade080.values, Array.length_toList] using
    TaylorFirstIntegerGrade080Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade080Length
