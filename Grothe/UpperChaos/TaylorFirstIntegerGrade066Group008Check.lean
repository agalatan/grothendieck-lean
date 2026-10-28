import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade066Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade066Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade066Part04096 = 40598371304044190032104522481019733620037847407261686512222255073997527369405768681374919470647826238668800 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade066Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade066Part04160 = 33911263748409358797403749265553631115879400008645906483530933302877355235068346411997930273430759968604160 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade066Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade066Part04224 = 58385022630547406102170754661691388630858973777818758464199854487789230016082930646121564285831505518788608 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade066Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade066Part04288 = 50967580239904935179129825827177313061692718732379665378698725107393391085713592342369015403207713510916096 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade066Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade066Part04352 = 33388911128544702661543424657196458338601170576540704021759049606006060357261328589458450585181982082203648 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade066Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade066Part04416 = 15162486567763427336127235833693627241424541837265237902277841113070148029325221946376019662592735640027136 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade066Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade066Part04480 = 7878268278192472018008251936786049542215906907902998028595445092900909307067125180101843111098398883708928 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade066Part04544.size = 12 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade066Part04544 = 3723121327846794972848257392615142252330996000222392197224171249660964215254295905367970662099851503730688 := by decide +kernel

theorem group_length : firstCenterIntegerGrade066Group008.size = 460 := by
  simp only [firstCenterIntegerGrade066Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade066Group008 = 244015025225253287099336022055733343803041555248037348988508275033695585615178609703167713454090773346648064 := by
  simp only [firstCenterIntegerGrade066Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade066Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
