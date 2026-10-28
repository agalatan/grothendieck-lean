import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade009Check

/-! Draft length proof for actual first center grade 9. -/
namespace Grothe.UpperChaos.FirstCenterGrade009Length

theorem length : FirstCenterGrade009.values.length = 110 := by
  simpa only [FirstCenterGrade009.values, Array.length_toList] using
    TaylorFirstIntegerGrade009Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade009Length
