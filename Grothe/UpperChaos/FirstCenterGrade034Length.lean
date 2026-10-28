import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade034Check

/-! Draft length proof for actual first center grade 34. -/
namespace Grothe.UpperChaos.FirstCenterGrade034Length

theorem length : FirstCenterGrade034.values.length = 1260 := by
  simpa only [FirstCenterGrade034.values, Array.length_toList] using
    TaylorFirstIntegerGrade034Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade034Length
