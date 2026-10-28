import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade010Check

/-! Draft length proof for actual second center grade 10. -/
namespace Grothe.UpperChaos.SecondCenterGrade010Length

theorem length : SecondCenterGrade010.values.length = 132 := by
  simpa only [SecondCenterGrade010.values, Array.length_toList] using
    TaylorSecondIntegerGrade010Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade010Length
