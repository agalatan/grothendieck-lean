import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade030Check

/-! Draft length proof for actual second center grade 30. -/
namespace Grothe.UpperChaos.SecondCenterGrade030Length

theorem length : SecondCenterGrade030.values.length = 992 := by
  simpa only [SecondCenterGrade030.values, Array.length_toList] using
    TaylorSecondIntegerGrade030Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade030Length
