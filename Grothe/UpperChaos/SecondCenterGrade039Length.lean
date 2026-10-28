import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade039Check

/-! Draft length proof for actual second center grade 39. -/
namespace Grothe.UpperChaos.SecondCenterGrade039Length

theorem length : SecondCenterGrade039.values.length = 1640 := by
  simpa only [SecondCenterGrade039.values, Array.length_toList] using
    TaylorSecondIntegerGrade039Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade039Length
