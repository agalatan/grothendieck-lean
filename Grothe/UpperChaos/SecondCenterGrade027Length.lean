import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade027Check

/-! Draft length proof for actual second center grade 27. -/
namespace Grothe.UpperChaos.SecondCenterGrade027Length

theorem length : SecondCenterGrade027.values.length = 812 := by
  simpa only [SecondCenterGrade027.values, Array.length_toList] using
    TaylorSecondIntegerGrade027Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade027Length
