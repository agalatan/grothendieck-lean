import Grothe.UpperChaos.TaylorBandData
import Grothe.UpperChaos.TaylorThirdIntegerData

/-! Direct binding to the authoritative third-center integer arrays.
No text parser or native calculation is used. This draft requires Lean checking.
Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos

namespace ThirdGradeReceipt00
def values : List ℤ := thirdCenterIntegerGrade00.toList
end ThirdGradeReceipt00

namespace ThirdGradeReceipt01
def values : List ℤ := thirdCenterIntegerGrade01.toList
end ThirdGradeReceipt01

namespace ThirdGradeReceipt02
def values : List ℤ := thirdCenterIntegerGrade02.toList
end ThirdGradeReceipt02

namespace ThirdGradeReceipt03
def values : List ℤ := thirdCenterIntegerGrade03.toList
end ThirdGradeReceipt03

namespace ThirdGradeReceipt04
def values : List ℤ := thirdCenterIntegerGrade04.toList
end ThirdGradeReceipt04

namespace ThirdGradeReceipt05
def values : List ℤ := thirdCenterIntegerGrade05.toList
end ThirdGradeReceipt05

namespace ThirdGradeReceipt06
def values : List ℤ := thirdCenterIntegerGrade06.toList
end ThirdGradeReceipt06

namespace ThirdGradeReceipt07
def values : List ℤ := thirdCenterIntegerGrade07.toList
end ThirdGradeReceipt07

namespace ThirdGradeReceipt08
def values : List ℤ := thirdCenterIntegerGrade08.toList
end ThirdGradeReceipt08

namespace ThirdGradeReceipt09
def values : List ℤ := thirdCenterIntegerGrade09.toList
end ThirdGradeReceipt09

namespace ThirdGradeReceipt10
def values : List ℤ := thirdCenterIntegerGrade10.toList
end ThirdGradeReceipt10

namespace ThirdGradeReceipt11
def values : List ℤ := thirdCenterIntegerGrade11.toList
end ThirdGradeReceipt11

namespace ThirdGradeReceipt12
def values : List ℤ := thirdCenterIntegerGrade12.toList
end ThirdGradeReceipt12

namespace ThirdGradeReceipt13
def values : List ℤ := thirdCenterIntegerGrade13.toList
end ThirdGradeReceipt13

namespace ThirdGradeReceipt14
def values : List ℤ := thirdCenterIntegerGrade14.toList
end ThirdGradeReceipt14

namespace ThirdGradeReceipt15
def values : List ℤ := thirdCenterIntegerGrade15.toList
end ThirdGradeReceipt15

namespace ThirdGradeReceipt16
def values : List ℤ := thirdCenterIntegerGrade16.toList
end ThirdGradeReceipt16

namespace ThirdGradeReceipt17
def values : List ℤ := thirdCenterIntegerGrade17.toList
end ThirdGradeReceipt17

namespace ThirdGradeReceipt18
def values : List ℤ := thirdCenterIntegerGrade18.toList
end ThirdGradeReceipt18

namespace ThirdGradeReceipt19
def values : List ℤ := thirdCenterIntegerGrade19.toList
end ThirdGradeReceipt19

namespace ThirdGradeReceipt20
def values : List ℤ := thirdCenterIntegerGrade20.toList
end ThirdGradeReceipt20

namespace ThirdGradeReceipt21
def values : List ℤ := thirdCenterIntegerGrade21.toList
end ThirdGradeReceipt21

namespace ThirdGradeReceipt22
def values : List ℤ := thirdCenterIntegerGrade22.toList
end ThirdGradeReceipt22

namespace ThirdGradeReceipt23
def values : List ℤ := thirdCenterIntegerGrade23.toList
end ThirdGradeReceipt23

namespace ThirdGradeReceipt24
def values : List ℤ := thirdCenterIntegerGrade24.toList
end ThirdGradeReceipt24

namespace ThirdGradeReceipt25
def values : List ℤ := thirdCenterIntegerGrade25.toList
end ThirdGradeReceipt25

namespace ThirdIntegerSourceBinding
def allValues : List ℤ := thirdCenterIntegerValues

-- This names the exact authoritative arrays while retaining opaque grade aliases.
-- No equality to a copied proposed coefficient table is assumed.
theorem source_values : thirdCenterIntegerValues =
    ThirdGradeReceipt00.values ++ ThirdGradeReceipt01.values ++ ThirdGradeReceipt02.values ++ ThirdGradeReceipt03.values ++ ThirdGradeReceipt04.values ++ ThirdGradeReceipt05.values ++ ThirdGradeReceipt06.values ++ ThirdGradeReceipt07.values ++ ThirdGradeReceipt08.values ++ ThirdGradeReceipt09.values ++ ThirdGradeReceipt10.values ++ ThirdGradeReceipt11.values ++ ThirdGradeReceipt12.values ++ ThirdGradeReceipt13.values ++ ThirdGradeReceipt14.values ++ ThirdGradeReceipt15.values ++ ThirdGradeReceipt16.values ++ ThirdGradeReceipt17.values ++ ThirdGradeReceipt18.values ++ ThirdGradeReceipt19.values ++ ThirdGradeReceipt20.values ++ ThirdGradeReceipt21.values ++ ThirdGradeReceipt22.values ++ ThirdGradeReceipt23.values ++ ThirdGradeReceipt24.values ++ ThirdGradeReceipt25.values := by rfl

theorem source_array : thirdCenterInts = allValues.toArray := by rfl
end ThirdIntegerSourceBinding
end Grothe.UpperChaos
