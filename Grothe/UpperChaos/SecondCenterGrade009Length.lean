import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade009Check

/-! Draft length proof for actual second center grade 9. -/
namespace Grothe.UpperChaos.SecondCenterGrade009Length

theorem length : SecondCenterGrade009.values.length = 110 := by
  simpa only [SecondCenterGrade009.values, Array.length_toList] using
    TaylorSecondIntegerGrade009Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade009Length
