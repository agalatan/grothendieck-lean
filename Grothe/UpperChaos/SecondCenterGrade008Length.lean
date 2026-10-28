import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade008Check

/-! Draft length proof for actual second center grade 8. -/
namespace Grothe.UpperChaos.SecondCenterGrade008Length

theorem length : SecondCenterGrade008.values.length = 90 := by
  simpa only [SecondCenterGrade008.values, Array.length_toList] using
    TaylorSecondIntegerGrade008Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade008Length
