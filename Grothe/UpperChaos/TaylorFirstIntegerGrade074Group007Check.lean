import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade074Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade074Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade074Part03584 = 281161556811214585382379780976772039545067221596101697384243411736421990299696301774589192521820537813467136 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade074Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade074Part03648 = 85620361536684402186743218769318534675549517579058636048884786709978088397969667907477291111405613828014080 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade074Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade074Part03712 = 275972709100486913084444277806382817422730492553803218360077009642978543001989251547640288844617127309606912 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade074Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade074Part03776 = 206583359747278272786582443900041288685929659307443649551280467753429545971450518302866167347374888325218304 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade074Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade074Part03840 = 162071065040003157504152784394712543286740625442809850327012926518203800730141203312825002033416343694344192 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade074Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade074Part03904 = 151774774204588502467055938284210375155045216710651311978036857162194152727695959145481507835096472311824384 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade074Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade074Part03968 = 155498171145699039978369576835471728841084001723024278614629647063774897898850337105941344993670107920072704 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade074Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade074Part04032 = 12509162467292834740509826572487808301019986657024844055497936553708649863524359126371917733003274418651136 := by decide +kernel

theorem group_length : firstCenterIntegerGrade074Group007.size = 512 := by
  simp only [firstCenterIntegerGrade074Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade074Group007 = 1331191160053247708130237847539397135913166721569917486319663043140689668891317598223192712420404365621198848 := by
  simp only [firstCenterIntegerGrade074Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade074Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
