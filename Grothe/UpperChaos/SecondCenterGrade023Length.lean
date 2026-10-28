import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade023Check

/-! Draft length proof for actual second center grade 23. -/
namespace Grothe.UpperChaos.SecondCenterGrade023Length

theorem length : SecondCenterGrade023.values.length = 600 := by
  simpa only [SecondCenterGrade023.values, Array.length_toList] using
    TaylorSecondIntegerGrade023Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade023Length
