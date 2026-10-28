import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade025Check

/-! Draft length proof for actual second center grade 25. -/
namespace Grothe.UpperChaos.SecondCenterGrade025Length

theorem length : SecondCenterGrade025.values.length = 702 := by
  simpa only [SecondCenterGrade025.values, Array.length_toList] using
    TaylorSecondIntegerGrade025Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade025Length
