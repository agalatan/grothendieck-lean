import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade032Check

/-! Draft length proof for actual first center grade 32. -/
namespace Grothe.UpperChaos.FirstCenterGrade032Length

theorem length : FirstCenterGrade032.values.length = 1122 := by
  simpa only [FirstCenterGrade032.values, Array.length_toList] using
    TaylorFirstIntegerGrade032Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade032Length
