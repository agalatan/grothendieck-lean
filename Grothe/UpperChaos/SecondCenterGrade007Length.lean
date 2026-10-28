import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade007Check

/-! Draft length proof for actual second center grade 7. -/
namespace Grothe.UpperChaos.SecondCenterGrade007Length

theorem length : SecondCenterGrade007.values.length = 72 := by
  simpa only [SecondCenterGrade007.values, Array.length_toList] using
    TaylorSecondIntegerGrade007Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade007Length
