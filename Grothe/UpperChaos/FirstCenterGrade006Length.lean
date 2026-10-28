import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade006Check

/-! Draft length proof for actual first center grade 6. -/
namespace Grothe.UpperChaos.FirstCenterGrade006Length

theorem length : FirstCenterGrade006.values.length = 56 := by
  simpa only [FirstCenterGrade006.values, Array.length_toList] using
    TaylorFirstIntegerGrade006Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade006Length
