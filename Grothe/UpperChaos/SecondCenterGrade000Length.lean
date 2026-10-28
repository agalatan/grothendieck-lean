import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade000Check

/-! Draft length proof for actual second center grade 0. -/
namespace Grothe.UpperChaos.SecondCenterGrade000Length

theorem length : SecondCenterGrade000.values.length = 2 := by
  simpa only [SecondCenterGrade000.values, Array.length_toList] using
    TaylorSecondIntegerGrade000Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade000Length
