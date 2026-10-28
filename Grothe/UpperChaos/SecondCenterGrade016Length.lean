import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade016Check

/-! Draft length proof for actual second center grade 16. -/
namespace Grothe.UpperChaos.SecondCenterGrade016Length

theorem length : SecondCenterGrade016.values.length = 306 := by
  simpa only [SecondCenterGrade016.values, Array.length_toList] using
    TaylorSecondIntegerGrade016Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade016Length
