import Grothe.UpperChaos.TaylorSecondIntegerGrade029Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade029Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade029Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade029Part00512 = 103411539028447963336329503099746325956028761701101078794297276641633255474604276403208104083038682078590795776 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade029Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade029Part00576 = 66164514754370330365214400376145901485642487487061512853237525660958032396765837720116528904047962892080775168 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade029Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade029Part00640 = 43375773492949067425560366293828556319978239256687820409232030732893356517952407070989534997176224211256999936 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade029Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade029Part00704 = 26876846156904505976687585704550091857491773784445664471668892353246280990470049721520780220268516610054029312 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade029Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade029Part00768 = 23354577174190001577157826520779936353752565570915783429389292353080287437126069929814572957576589183564120064 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade029Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade029Part00832 = 17354364638028540886076668933697982777891316691194519009831020521101061149753778158502704085249069636598628352 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade029Part00896.size = 34 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade029Part00896 = 6377169401878910048818578483794869144543030276897751887141305333790373467493266411307343678002312257279623168 := by decide +kernel

theorem group_length : secondCenterIntegerGrade029Group001.size = 418 := by
  simp only [secondCenterIntegerGrade029Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6]

theorem group_energy : energy secondCenterIntegerGrade029Group001 = 286914784646769319615844929412543663895328174768304130854797343596702647434165685415459568925359356869424971776 := by
  simp only [secondCenterIntegerGrade029Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade029Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade029Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade029Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
