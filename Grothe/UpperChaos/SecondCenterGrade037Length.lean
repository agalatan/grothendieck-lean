import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade037Check

/-! Draft length proof for actual second center grade 37. -/
namespace Grothe.UpperChaos.SecondCenterGrade037Length

theorem length : SecondCenterGrade037.values.length = 1482 := by
  simpa only [SecondCenterGrade037.values, Array.length_toList] using
    TaylorSecondIntegerGrade037Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade037Length
