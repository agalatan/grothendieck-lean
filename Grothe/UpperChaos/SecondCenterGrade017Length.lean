import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade017Check

/-! Draft length proof for actual second center grade 17. -/
namespace Grothe.UpperChaos.SecondCenterGrade017Length

theorem length : SecondCenterGrade017.values.length = 342 := by
  simpa only [SecondCenterGrade017.values, Array.length_toList] using
    TaylorSecondIntegerGrade017Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade017Length
