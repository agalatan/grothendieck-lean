import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group012Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group012Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part06144.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part06144 = 10566482461169747500102789534585178157579144120676669946769290108219317105002600988898994916479507030343680 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part06208.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part06208 = 4627982296703838586807450205442769212374607139228065421004053403073893615355981150218817550357629396582400 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part06272.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part06272 = 6068380767919281345572851162457824025520724915685303334689492734518323861502422858962818617645593190727680 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part06336.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part06336 = 10823436045059040548698267271729744236989458298749595022563703506230249875411827391773191890056826346012672 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part06400.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part06400 = 6902261841278754256843666399136282783537433682863953599598329922243595824982705500221755363245713510105088 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part06464.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part06464 = 4029704809036653925011677299118856077976325385223237505821548628328769746693406172020059134395022831517696 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part06528.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part06528 = 10750340972724696471595226239743162746015751796585157415897915485044835382070433862529093749059378078547968 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part06592.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part06592 = 10050555260725180329405850925706498853450446330511137121175906828526365318472305292979605429023926694969344 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group012.size = 512 := by
  simp only [firstCenterIntegerGrade089Group012, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group012 = 63819144454617192964037779037920316093443891669523119367520240616185350729491683217604336650263597078806528 := by
  simp only [firstCenterIntegerGrade089Group012, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group012Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group012Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
