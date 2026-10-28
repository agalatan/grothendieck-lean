import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade022Check

/-! Draft length proof for actual second center grade 22. -/
namespace Grothe.UpperChaos.SecondCenterGrade022Length

theorem length : SecondCenterGrade022.values.length = 552 := by
  simpa only [SecondCenterGrade022.values, Array.length_toList] using
    TaylorSecondIntegerGrade022Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade022Length
