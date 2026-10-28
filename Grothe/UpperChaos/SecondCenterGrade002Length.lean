import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade002Check

/-! Draft length proof for actual second center grade 2. -/
namespace Grothe.UpperChaos.SecondCenterGrade002Length

theorem length : SecondCenterGrade002.values.length = 12 := by
  simpa only [SecondCenterGrade002.values, Array.length_toList] using
    TaylorSecondIntegerGrade002Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade002Length
