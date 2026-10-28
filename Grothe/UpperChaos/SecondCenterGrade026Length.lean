import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade026Check

/-! Draft length proof for actual second center grade 26. -/
namespace Grothe.UpperChaos.SecondCenterGrade026Length

theorem length : SecondCenterGrade026.values.length = 756 := by
  simpa only [SecondCenterGrade026.values, Array.length_toList] using
    TaylorSecondIntegerGrade026Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade026Length
