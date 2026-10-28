import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade034Check

/-! Draft length proof for actual second center grade 34. -/
namespace Grothe.UpperChaos.SecondCenterGrade034Length

theorem length : SecondCenterGrade034.values.length = 1260 := by
  simpa only [SecondCenterGrade034.values, Array.length_toList] using
    TaylorSecondIntegerGrade034Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade034Length
