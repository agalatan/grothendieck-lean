import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade024Check

/-! Draft length proof for actual second center grade 24. -/
namespace Grothe.UpperChaos.SecondCenterGrade024Length

theorem length : SecondCenterGrade024.values.length = 650 := by
  simpa only [SecondCenterGrade024.values, Array.length_toList] using
    TaylorSecondIntegerGrade024Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade024Length
