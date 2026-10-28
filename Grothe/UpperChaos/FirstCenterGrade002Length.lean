import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade002Check

/-! Draft length proof for actual first center grade 2. -/
namespace Grothe.UpperChaos.FirstCenterGrade002Length

theorem length : FirstCenterGrade002.values.length = 12 := by
  simpa only [FirstCenterGrade002.values, Array.length_toList] using
    TaylorFirstIntegerGrade002Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade002Length
