import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade032Check

/-! Draft length proof for actual second center grade 32. -/
namespace Grothe.UpperChaos.SecondCenterGrade032Length

theorem length : SecondCenterGrade032.values.length = 1122 := by
  simpa only [SecondCenterGrade032.values, Array.length_toList] using
    TaylorSecondIntegerGrade032Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade032Length
