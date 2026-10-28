import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade036Check

/-! Draft length proof for actual second center grade 36. -/
namespace Grothe.UpperChaos.SecondCenterGrade036Length

theorem length : SecondCenterGrade036.values.length = 1406 := by
  simpa only [SecondCenterGrade036.values, Array.length_toList] using
    TaylorSecondIntegerGrade036Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade036Length
