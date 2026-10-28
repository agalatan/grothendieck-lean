import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade012Check

/-! Draft length proof for actual first center grade 12. -/
namespace Grothe.UpperChaos.FirstCenterGrade012Length

theorem length : FirstCenterGrade012.values.length = 182 := by
  simpa only [FirstCenterGrade012.values, Array.length_toList] using
    TaylorFirstIntegerGrade012Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade012Length
