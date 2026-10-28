import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade011Check

/-! Draft length proof for actual second center grade 11. -/
namespace Grothe.UpperChaos.SecondCenterGrade011Length

theorem length : SecondCenterGrade011.values.length = 156 := by
  simpa only [SecondCenterGrade011.values, Array.length_toList] using
    TaylorSecondIntegerGrade011Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade011Length
