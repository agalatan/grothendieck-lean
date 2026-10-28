import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade043Check

/-! Draft length proof for actual second center grade 43. -/
namespace Grothe.UpperChaos.SecondCenterGrade043Length

theorem length : SecondCenterGrade043.values.length = 1980 := by
  simpa only [SecondCenterGrade043.values, Array.length_toList] using
    TaylorSecondIntegerGrade043Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade043Length
