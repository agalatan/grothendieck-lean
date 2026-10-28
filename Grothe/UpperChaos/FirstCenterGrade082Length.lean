import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Check

/-! Draft length proof for actual first center grade 82. -/
namespace Grothe.UpperChaos.FirstCenterGrade082Length

theorem length : FirstCenterGrade082.values.length = 6972 := by
  simpa only [FirstCenterGrade082.values, Array.length_toList] using
    TaylorFirstIntegerGrade082Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade082Length
