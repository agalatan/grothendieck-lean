import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade018Check

/-! Draft length proof for actual second center grade 18. -/
namespace Grothe.UpperChaos.SecondCenterGrade018Length

theorem length : SecondCenterGrade018.values.length = 380 := by
  simpa only [SecondCenterGrade018.values, Array.length_toList] using
    TaylorSecondIntegerGrade018Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade018Length
