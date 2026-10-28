import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade068Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade068Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade068Part01536 = 988674314140288342456759974231660619802027920524620914554956838290467811157750130305902346375762061616731914240 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade068Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade068Part01600 = 822784492953127239324341923331411017441639607055432237009244598439017623799658207040435913370486133460555530240 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade068Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade068Part01664 = 660345986432179782457838013637479341159208848827532815757268579067828173661752759621242394144115040065440186368 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade068Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade068Part01728 = 525952323502543033501932417135125942999345550072305166757673238123925213473581721811223923846134736837907841024 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade068Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade068Part01792 = 416265990080368425753119030975089050852379896304956183461975710746626252022865731926036140236719250356106690560 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade068Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade068Part01856 = 327747435476647225087306608460394127559562660241821897204579324411645208005347858077712816389393346002604261376 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade068Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade068Part01920 = 257234517461165169574830486465544047267817959599259907583141721218137519679141186122411660545224446856835104768 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade068Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade068Part01984 = 201811092470305365416412825355080366995115048891611300615448661795659768642895305547178591734060956440149884928 := by decide +kernel

theorem group_length : firstCenterIntegerGrade068Group003.size = 512 := by
  simp only [firstCenterIntegerGrade068Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade068Group003 = 4200816152516624583572541279591784514077097491517540422944288672093307570442992900452143786641895971636331413504 := by
  simp only [firstCenterIntegerGrade068Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade068Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
