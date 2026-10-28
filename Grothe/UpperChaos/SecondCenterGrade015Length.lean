import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade015Check

/-! Draft length proof for actual second center grade 15. -/
namespace Grothe.UpperChaos.SecondCenterGrade015Length

theorem length : SecondCenterGrade015.values.length = 272 := by
  simpa only [SecondCenterGrade015.values, Array.length_toList] using
    TaylorSecondIntegerGrade015Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade015Length
