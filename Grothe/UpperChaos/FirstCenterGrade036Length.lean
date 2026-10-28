import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade036Check

/-! Draft length proof for actual first center grade 36. -/
namespace Grothe.UpperChaos.FirstCenterGrade036Length

theorem length : FirstCenterGrade036.values.length = 1406 := by
  simpa only [FirstCenterGrade036.values, Array.length_toList] using
    TaylorFirstIntegerGrade036Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade036Length
