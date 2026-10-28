import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade003Check

/-! Draft length proof for actual first center grade 3. -/
namespace Grothe.UpperChaos.FirstCenterGrade003Length

theorem length : FirstCenterGrade003.values.length = 20 := by
  simpa only [FirstCenterGrade003.values, Array.length_toList] using
    TaylorFirstIntegerGrade003Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade003Length
