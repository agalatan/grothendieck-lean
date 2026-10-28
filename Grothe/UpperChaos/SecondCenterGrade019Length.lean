import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorSecondIntegerGrade019Check

/-! Draft length proof for actual second center grade 19. -/
namespace Grothe.UpperChaos.SecondCenterGrade019Length

theorem length : SecondCenterGrade019.values.length = 420 := by
  simpa only [SecondCenterGrade019.values, Array.length_toList] using
    TaylorSecondIntegerGrade019Check.grade_length
end Grothe.UpperChaos.SecondCenterGrade019Length
