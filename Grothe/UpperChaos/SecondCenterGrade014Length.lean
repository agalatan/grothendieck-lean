import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade014Check

/-! Draft length proof for actual second center grade 14. -/
namespace Grothe.UpperChaos.SecondCenterGrade014Length

theorem length : SecondCenterGrade014.values.length = 240 := by
  simpa only [SecondCenterGrade014.values, Array.length_toList] using
    TaylorSecondIntegerGrade014Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade014Length
