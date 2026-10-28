import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade033Check

/-! Draft length proof for actual second center grade 33. -/
namespace Grothe.UpperChaos.SecondCenterGrade033Length

theorem length : SecondCenterGrade033.values.length = 1190 := by
  simpa only [SecondCenterGrade033.values, Array.length_toList] using
    TaylorSecondIntegerGrade033Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade033Length
