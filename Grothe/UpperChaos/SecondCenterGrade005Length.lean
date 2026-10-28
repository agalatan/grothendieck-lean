import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade005Check

/-! Draft length proof for actual second center grade 5. -/
namespace Grothe.UpperChaos.SecondCenterGrade005Length

theorem length : SecondCenterGrade005.values.length = 42 := by
  simpa only [SecondCenterGrade005.values, Array.length_toList] using
    TaylorSecondIntegerGrade005Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade005Length
