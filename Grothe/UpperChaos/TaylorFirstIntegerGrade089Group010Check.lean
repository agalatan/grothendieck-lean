import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part05120 = 8923849521693738796706505151107871698910868710913688250468230195086820359614076095778621000087399382908928 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part05184 = 33649547237536693797591480071302884013211201569078997905562238386760666847525883002492532193983905419755520 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part05248 = 38043445799449354918024982247510662333965919879111863693509184053693598514021969887770578467289324530434048 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part05312 = 32505545946913086049191341472680127225660814929295656785644975931678259725828038051986206963468819295633408 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part05376 = 1647333397029255458133456535633918088583472206374417052376319405248945546987229786568621701677055186305024 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part05440 = 29402636756699708113698281133515462437536285359887467734243150284787529581578518780374325419181587247923200 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part05504 = 24882998853623645285074435337424998787644638854138706919333532135087561427570977128420880848283927943577600 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part05568 = 1774625389283258217215794162603888078526791246220185545366573389236507727538061639484846902054918448742400 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group010.size = 512 := by
  simp only [firstCenterIntegerGrade089Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group010 = 170829982902228740635636276111779812664039992755020983886504203781579889730664754372876613496026937455280128 := by
  simp only [firstCenterIntegerGrade089Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
