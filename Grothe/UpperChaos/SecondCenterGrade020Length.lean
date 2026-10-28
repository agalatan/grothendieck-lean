import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade020Check

/-! Draft length proof for actual second center grade 20. -/
namespace Grothe.UpperChaos.SecondCenterGrade020Length

theorem length : SecondCenterGrade020.values.length = 462 := by
  simpa only [SecondCenterGrade020.values, Array.length_toList] using
    TaylorSecondIntegerGrade020Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade020Length
