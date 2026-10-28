import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade012Check

/-! Draft length proof for actual second center grade 12. -/
namespace Grothe.UpperChaos.SecondCenterGrade012Length

theorem length : SecondCenterGrade012.values.length = 182 := by
  simpa only [SecondCenterGrade012.values, Array.length_toList] using
    TaylorSecondIntegerGrade012Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade012Length
