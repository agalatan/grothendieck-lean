import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade045Check

/-! Draft length proof for actual second center grade 45. -/
namespace Grothe.UpperChaos.SecondCenterGrade045Length

theorem length : SecondCenterGrade045.values.length = 2162 := by
  simpa only [SecondCenterGrade045.values, Array.length_toList] using
    TaylorSecondIntegerGrade045Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade045Length
