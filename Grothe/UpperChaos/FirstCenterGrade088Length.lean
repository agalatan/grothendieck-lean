import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade088Check

/-! Draft length proof for actual first center grade 88. -/
namespace Grothe.UpperChaos.FirstCenterGrade088Length

theorem length : FirstCenterGrade088.values.length = 8010 := by
  simpa only [FirstCenterGrade088.values, Array.length_toList] using
    TaylorFirstIntegerGrade088Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade088Length
