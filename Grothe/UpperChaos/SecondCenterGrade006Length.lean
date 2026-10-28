import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade006Check

/-! Draft length proof for actual second center grade 6. -/
namespace Grothe.UpperChaos.SecondCenterGrade006Length

theorem length : SecondCenterGrade006.values.length = 56 := by
  simpa only [SecondCenterGrade006.values, Array.length_toList] using
    TaylorSecondIntegerGrade006Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade006Length
