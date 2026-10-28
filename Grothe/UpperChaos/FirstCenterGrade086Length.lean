import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade086Check

/-! Draft length proof for actual first center grade 86. -/
namespace Grothe.UpperChaos.FirstCenterGrade086Length

theorem length : FirstCenterGrade086.values.length = 7656 := by
  simpa only [FirstCenterGrade086.values, Array.length_toList] using
    TaylorFirstIntegerGrade086Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade086Length
