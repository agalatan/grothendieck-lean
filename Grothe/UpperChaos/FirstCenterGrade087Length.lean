import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade087Check

/-! Draft length proof for actual first center grade 87. -/
namespace Grothe.UpperChaos.FirstCenterGrade087Length

theorem length : FirstCenterGrade087.values.length = 7832 := by
  simpa only [FirstCenterGrade087.values, Array.length_toList] using
    TaylorFirstIntegerGrade087Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade087Length
