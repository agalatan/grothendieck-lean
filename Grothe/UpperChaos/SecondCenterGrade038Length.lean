import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade038Check

/-! Draft length proof for actual second center grade 38. -/
namespace Grothe.UpperChaos.SecondCenterGrade038Length

theorem length : SecondCenterGrade038.values.length = 1560 := by
  simpa only [SecondCenterGrade038.values, Array.length_toList] using
    TaylorSecondIntegerGrade038Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade038Length
