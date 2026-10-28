import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade035Check

/-! Draft length proof for actual second center grade 35. -/
namespace Grothe.UpperChaos.SecondCenterGrade035Length

theorem length : SecondCenterGrade035.values.length = 1332 := by
  simpa only [SecondCenterGrade035.values, Array.length_toList] using
    TaylorSecondIntegerGrade035Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade035Length
