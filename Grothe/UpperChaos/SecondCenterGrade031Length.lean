import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade031Check

/-! Draft length proof for actual second center grade 31. -/
namespace Grothe.UpperChaos.SecondCenterGrade031Length

theorem length : SecondCenterGrade031.values.length = 1056 := by
  simpa only [SecondCenterGrade031.values, Array.length_toList] using
    TaylorSecondIntegerGrade031Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade031Length
