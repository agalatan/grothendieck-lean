import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade044Check

/-! Draft length proof for actual second center grade 44. -/
namespace Grothe.UpperChaos.SecondCenterGrade044Length

theorem length : SecondCenterGrade044.values.length = 2070 := by
  simpa only [SecondCenterGrade044.values, Array.length_toList] using
    TaylorSecondIntegerGrade044Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade044Length
