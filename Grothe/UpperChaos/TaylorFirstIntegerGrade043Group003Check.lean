import Grothe.UpperChaos.TaylorFirstIntegerGrade043Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade043Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade043Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade043Part01536 = 37494189931350730602401751867477644484585667781224874581056164213028922523019491495098003312365990344182988800 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade043Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade043Part01600 = 33853454019275997082353330862048654494580153771766842471769751634376173397525428804597364550826700561077764096 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade043Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade043Part01664 = 13156355061521252253736162799454574106960801516964311980315014727103331706779630562447522452897792113145544704 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade043Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade043Part01728 = 4926988066067082440191299883488350168711513645004552005889937978503385606497649805300544560464412701888610304 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade043Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade043Part01792 = 14773367024910165493440600775838137711545693775338470193023127188568956850066318258718203811952474394390953984 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade043Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade043Part01856 = 6232281880844416857578326972064334490595968317721327149426277257848434108038624541219980917785305058149138432 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade043Part01920.size = 60 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade043Part01920 = 23331007841005437657034396448463889377335061561655161571249482839486602997469346410425115650691022913070432256 := by decide +kernel

theorem group_length : firstCenterIntegerGrade043Group003.size = 444 := by
  simp only [firstCenterIntegerGrade043Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6]

theorem group_energy : energy firstCenterIntegerGrade043Group003 = 133767643824975082386735869608835584834314860369675539952729755838915807189396489877806735256983698085905432576 := by
  simp only [firstCenterIntegerGrade043Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade043Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade043Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade043Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
