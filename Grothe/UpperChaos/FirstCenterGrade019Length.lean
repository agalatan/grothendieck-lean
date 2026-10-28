import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade019Check

/-! Draft length proof for actual first center grade 19. -/
namespace Grothe.UpperChaos.FirstCenterGrade019Length

theorem length : FirstCenterGrade019.values.length = 420 := by
  simpa only [FirstCenterGrade019.values, Array.length_toList] using
    TaylorFirstIntegerGrade019Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade019Length
