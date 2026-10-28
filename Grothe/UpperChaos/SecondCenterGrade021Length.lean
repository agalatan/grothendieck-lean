import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade021Check

/-! Draft length proof for actual second center grade 21. -/
namespace Grothe.UpperChaos.SecondCenterGrade021Length

theorem length : SecondCenterGrade021.values.length = 506 := by
  simpa only [SecondCenterGrade021.values, Array.length_toList] using
    TaylorSecondIntegerGrade021Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade021Length
