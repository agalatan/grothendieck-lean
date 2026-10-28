import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade075Check

/-! Draft length proof for actual first center grade 75. -/
namespace Grothe.UpperChaos.FirstCenterGrade075Length

theorem length : FirstCenterGrade075.values.length = 5852 := by
  simpa only [FirstCenterGrade075.values, Array.length_toList] using
    TaylorFirstIntegerGrade075Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade075Length
