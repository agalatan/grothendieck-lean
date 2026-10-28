import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade029Check

/-! Draft length proof for actual second center grade 29. -/
namespace Grothe.UpperChaos.SecondCenterGrade029Length

theorem length : SecondCenterGrade029.values.length = 930 := by
  simpa only [SecondCenterGrade029.values, Array.length_toList] using
    TaylorSecondIntegerGrade029Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade029Length
