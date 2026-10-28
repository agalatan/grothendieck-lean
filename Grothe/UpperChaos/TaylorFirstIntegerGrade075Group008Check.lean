import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade075Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade075Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade075Part04096 = 107533970606309213220649169769100146219077601183421301697967054648043924626255287613674045868286682157023232 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade075Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade075Part04160 = 27735972373586473492518106868369333522906783267149664766101646755263550227863634505212185955519906105524224 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade075Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade075Part04224 = 123729358012468550797668795626616362403023852786783058463693067496870670707449300009861664113883520136380416 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade075Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade075Part04288 = 102323432405918909397461729643677379740060146648088061251689921646285806109886542198234755760852918001991680 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade075Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade075Part04352 = 81584925980166661083443164676351876634008672191353179224121692530953314776224849708254444732085078876749824 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade075Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade075Part04416 = 61989098991401048877746912097965362354849348486036686808049619853025688099642574482140904162148928255426560 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade075Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade075Part04480 = 26327745830603689105348974221867870193787962044482343058752840727653640305353917212977723848493222005309440 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade075Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade075Part04544 = 22506359760895318214196557856411894022417488859849469214295998514010408050718949389646904334695702949003264 := by decide +kernel

theorem group_length : firstCenterIntegerGrade075Group008.size = 512 := by
  simp only [firstCenterIntegerGrade075Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade075Group008 = 553730863961349864189033410760360225090131855467163764484671842172107002903395055120002628775965958487408640 := by
  simp only [firstCenterIntegerGrade075Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade075Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
