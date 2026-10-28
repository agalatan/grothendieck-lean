import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade040Check

/-! Draft length proof for actual second center grade 40. -/
namespace Grothe.UpperChaos.SecondCenterGrade040Length

theorem length : SecondCenterGrade040.values.length = 1722 := by
  simpa only [SecondCenterGrade040.values, Array.length_toList] using
    TaylorSecondIntegerGrade040Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade040Length
