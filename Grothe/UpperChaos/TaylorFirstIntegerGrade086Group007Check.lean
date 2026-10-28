import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part03584 = 4260121192739774971399579504792189475464592369611679879661377519749233973894651607604876566095189907410518016 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part03648 = 3214386169652605373020282436607442651298153758935948771639935693730899606444833019501798888479176529765466112 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part03712 = 3001200702702112948156171700742708563006298434753303937060287278045499167550013308243560970404457862922240 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part03776 = 2391121432601550070426556939258910633957433286673537326775040151610287518340636265503297971071368141478035456 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part03840 = 1756963304683339644577148824461649792196664782360130092500294786849532717396175153843550365907641817035177984 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part03904 = 1268000685961035348733639076297194397809113808916353841781696386909099023210665296140900058930294197806170112 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part03968 = 3069358289969748933952254233681050623394246490576378749675066484355001082335415730996952696892925579100160 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part04032 = 899670603900188804607607541927719734019062377087203244501593298474975840936740535885974229189324902116622336 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group007.size = 512 := by
  simp only [firstCenterIntegerGrade086Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group007 = 13796333948531166074646922749279530443931420928510182839546673191086429180473587307519638593340292879054012416 := by
  simp only [firstCenterIntegerGrade086Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
