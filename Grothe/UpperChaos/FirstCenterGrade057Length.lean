import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.TaylorFirstIntegerGrade057Check

/-! Draft length proof for actual first center grade 57. -/
namespace Grothe.UpperChaos.FirstCenterGrade057Length

theorem length : FirstCenterGrade057.values.length = 3422 := by
  simpa only [FirstCenterGrade057.values, Array.length_toList] using
    TaylorFirstIntegerGrade057Check.grade_length
end Grothe.UpperChaos.FirstCenterGrade057Length
