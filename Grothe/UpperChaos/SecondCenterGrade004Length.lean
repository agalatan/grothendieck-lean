import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade004Check

/-! Draft length proof for actual second center grade 4. -/
namespace Grothe.UpperChaos.SecondCenterGrade004Length

theorem length : SecondCenterGrade004.values.length = 30 := by
  simpa only [SecondCenterGrade004.values, Array.length_toList] using
    TaylorSecondIntegerGrade004Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade004Length
