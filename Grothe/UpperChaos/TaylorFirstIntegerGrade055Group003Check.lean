import Grothe.UpperChaos.TaylorFirstIntegerGrade055Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade055Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade055Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade055Part01536 = 645854486530669031017533290039577039823533340856678201314553429456173979557642997491387149654731983533243367424 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade055Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade055Part01600 = 317468019219217292262366906714694965987209353002172083071364169636517267677477081762356714164130289633147748352 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade055Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade055Part01664 = 269429080880077352018314787535500888354420765169653439266072734865377132308398203001997430546087337762125512704 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade055Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade055Part01728 = 224714775173531162137431113583843240310402628745462162237206863349762292970067204205407802369489823284185792512 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade055Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade055Part01792 = 175918980530877306821295216420054463419454280970706997081562170260153569639820772771155368263144136967037386752 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade055Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade055Part01856 = 129712689914400704272013749024534714216771391303070440885604597111613999456556063545064069476028352212336902144 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade055Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade055Part01920 = 92038856202822797338588256407908079468942248414770358183418981841209718363640863799844791520543962265804603392 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade055Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade055Part01984 = 66538823367917730927862558430094794058177813528791557088179665647334202840058716122134590171553948940084707328 := by decide +kernel

theorem group_length : firstCenterIntegerGrade055Group003.size = 512 := by
  simp only [firstCenterIntegerGrade055Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade055Group003 = 1921675711819513376795405878156208185638911821991305239127962612168142162813661902699347916165709834597966020608 := by
  simp only [firstCenterIntegerGrade055Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade055Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade055Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade055Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
