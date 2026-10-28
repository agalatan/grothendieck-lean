import Grothe.UpperChaos.TaylorFirstIntegerGrade047Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade047Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade047Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade047Part01536 = 136242940451168845771916891683361301890053169914055659570703593330576719363577379368463209906758407714882191360 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade047Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade047Part01600 = 176913651948115639775450272951140910133172413284820347435709419759267457110974455356781530851227489750797516800 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade047Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade047Part01664 = 98235801923808071522613238551755299347705438612029333952680331032897675640099604991616505704681475112223899648 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade047Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade047Part01728 = 27897546500080405443497915281565650895338565247628966492119837750497080028504899571385910404169785310500093952 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade047Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade047Part01792 = 14093939391679244641162596635914923123133857710742088670097901923853749306375957143858531464111016080102653952 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade047Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade047Part01856 = 32312686660731657570472636279593329521019686026731404115150145670337389975975888904899359595463602837754216448 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade047Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade047Part01920 = 18144833208360501980615026508153122936666218938280615641021108172234346316080812746413464152509472960438861824 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade047Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade047Part01984 = 12686183877438151360245421464902181333017879171298436129576551579787322225273230137200617327955282306038497280 := by decide +kernel

theorem group_length : firstCenterIntegerGrade047Group003.size = 512 := by
  simp only [firstCenterIntegerGrade047Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade047Group003 = 516527583961382518065973999356386719180107228905586852007058889219451739966862228220619129406876532072737931264 := by
  simp only [firstCenterIntegerGrade047Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade047Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade047Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade047Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
