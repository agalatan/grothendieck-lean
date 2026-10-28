import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade003Check

/-! Draft length proof for actual second center grade 3. -/
namespace Grothe.UpperChaos.SecondCenterGrade003Length

theorem length : SecondCenterGrade003.values.length = 20 := by
  simpa only [SecondCenterGrade003.values, Array.length_toList] using
    TaylorSecondIntegerGrade003Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade003Length
