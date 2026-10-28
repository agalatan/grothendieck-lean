import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade047Check

/-! Draft length proof for actual first center grade 47. -/
namespace Grothe.UpperChaos.FirstCenterGrade047Length

theorem length : FirstCenterGrade047.values.length = 2352 := by
  simpa only [FirstCenterGrade047.values, Array.length_toList] using
    TaylorFirstIntegerGrade047Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade047Length
