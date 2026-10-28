import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade042Check

/-! Draft length proof for actual second center grade 42. -/
namespace Grothe.UpperChaos.SecondCenterGrade042Length

theorem length : SecondCenterGrade042.values.length = 1892 := by
  simpa only [SecondCenterGrade042.values, Array.length_toList] using
    TaylorSecondIntegerGrade042Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade042Length
