import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade007Check

/-! Draft length proof for actual first center grade 7. -/
namespace Grothe.UpperChaos.FirstCenterGrade007Length

theorem length : FirstCenterGrade007.values.length = 72 := by
  simpa only [FirstCenterGrade007.values, Array.length_toList] using
    TaylorFirstIntegerGrade007Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade007Length
