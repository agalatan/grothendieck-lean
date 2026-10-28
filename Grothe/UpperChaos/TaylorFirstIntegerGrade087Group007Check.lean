import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part03584 = 643646214660526209892540705148760488608117617912461837348256511649314768940869185879498264865159510050734080 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part03648 = 3554585329438849296687897064979233152643410549460803427355714974073674436551371448726102766508726288082010112 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part03712 = 3169152131461353794872528481638913486815113918152358125157973407821038574478793368867419460848895346127929344 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part03776 = 2362216293419690684923237898106473612964225046801366244691778267757605675902654985864098502424939541676687360 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part03840 = 2303313321265537644228358190349482614280043213871607658675907420777679568227440615807608643803839679430656 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part03904 = 1742325205430807753675657440130693848350843450661937229179760492633321140929350143645513263488572811504517120 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part03968 = 1273215052865658892933916818339710539184090483098862984052833815510469937913630895026435182496030139973894144 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part04032 = 595606843446759178874888745643293307276877093928125988384017855188853723375587712435557856213067891543638016 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group007.size = 512 := by
  simp only [firstCenterIntegerGrade087Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group007 = 13343050384044911349504895512177427918456958203229787443829011232055055937660485181060432905489195368638840832 := by
  simp only [firstCenterIntegerGrade087Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
