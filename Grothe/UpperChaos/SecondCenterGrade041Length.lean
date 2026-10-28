import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade041Check

/-! Draft length proof for actual second center grade 41. -/
namespace Grothe.UpperChaos.SecondCenterGrade041Length

theorem length : SecondCenterGrade041.values.length = 1806 := by
  simpa only [SecondCenterGrade041.values, Array.length_toList] using
    TaylorSecondIntegerGrade041Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade041Length
