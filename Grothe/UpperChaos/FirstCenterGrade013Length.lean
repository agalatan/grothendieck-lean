import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade013Check

/-! Draft length proof for actual first center grade 13. -/
namespace Grothe.UpperChaos.FirstCenterGrade013Length

theorem length : FirstCenterGrade013.values.length = 210 := by
  simpa only [FirstCenterGrade013.values, Array.length_toList] using
    TaylorFirstIntegerGrade013Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade013Length
