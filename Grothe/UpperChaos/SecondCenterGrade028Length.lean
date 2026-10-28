import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade028Check

/-! Draft length proof for actual second center grade 28. -/
namespace Grothe.UpperChaos.SecondCenterGrade028Length

theorem length : SecondCenterGrade028.values.length = 870 := by
  simpa only [SecondCenterGrade028.values, Array.length_toList] using
    TaylorSecondIntegerGrade028Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade028Length
