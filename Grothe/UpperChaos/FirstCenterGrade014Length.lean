import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade014Check

/-! Draft length proof for actual first center grade 14. -/
namespace Grothe.UpperChaos.FirstCenterGrade014Length

theorem length : FirstCenterGrade014.values.length = 240 := by
  simpa only [FirstCenterGrade014.values, Array.length_toList] using
    TaylorFirstIntegerGrade014Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade014Length
