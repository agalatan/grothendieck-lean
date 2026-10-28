import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade031Check

/-! Draft length proof for actual first center grade 31. -/
namespace Grothe.UpperChaos.FirstCenterGrade031Length

theorem length : FirstCenterGrade031.values.length = 1056 := by
  simpa only [FirstCenterGrade031.values, Array.length_toList] using
    TaylorFirstIntegerGrade031Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade031Length
