import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade001Check

/-! Draft length proof for actual second center grade 1. -/
namespace Grothe.UpperChaos.SecondCenterGrade001Length

theorem length : SecondCenterGrade001.values.length = 6 := by
  simpa only [SecondCenterGrade001.values, Array.length_toList] using
    TaylorSecondIntegerGrade001Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade001Length
