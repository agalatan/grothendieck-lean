import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade013Check

/-! Draft length proof for actual second center grade 13. -/
namespace Grothe.UpperChaos.SecondCenterGrade013Length

theorem length : SecondCenterGrade013.values.length = 210 := by
  simpa only [SecondCenterGrade013.values, Array.length_toList] using
    TaylorSecondIntegerGrade013Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade013Length
