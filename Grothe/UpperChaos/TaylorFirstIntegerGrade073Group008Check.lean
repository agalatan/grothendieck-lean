import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade073Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade073Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade073Part04096 = 139034147346801458035391901424158255595720802608138788351086895179979108384330223618566442268525390561542144 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade073Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade073Part04160 = 107796339841689501525603433152692013415319030564388785699524024349134262448482226026250896104893577057796096 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade073Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade073Part04224 = 81250183540671928515695668083593042922559691834284022849957436287097931888286316783505728457853918362206208 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade073Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade073Part04288 = 53124841215476889647871199902688749291589937398763060442772962087905561716469359922996169582883695077883904 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade073Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade073Part04352 = 18528373302230304471852809830970127380317286889706853996326268663179792658958973920450551980250597293031424 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade073Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade073Part04416 = 45720447827671702567184018504863590270847986950721782139922589044656043537049779389367400145408988712796160 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade073Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade073Part04480 = 43296033774980337132104225740337349127066723693898069955412752120905439599874675009202706604604280669208576 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade073Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade073Part04544 = 35020954490143169666311492405203031551272456973333543185172605773383719644339591717259437341007143688470528 := by decide +kernel

theorem group_length : firstCenterIntegerGrade073Group008.size = 512 := by
  simp only [firstCenterIntegerGrade073Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade073Group008 = 523771321339665291562014749044506159554693916913234906620175533506241859877791146387599332485427591422935040 := by
  simp only [firstCenterIntegerGrade073Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade073Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
