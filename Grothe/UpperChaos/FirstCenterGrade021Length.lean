import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade021Check

/-! Draft length proof for actual first center grade 21. -/
namespace Grothe.UpperChaos.FirstCenterGrade021Length

theorem length : FirstCenterGrade021.values.length = 506 := by
  simpa only [FirstCenterGrade021.values, Array.length_toList] using
    TaylorFirstIntegerGrade021Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade021Length
