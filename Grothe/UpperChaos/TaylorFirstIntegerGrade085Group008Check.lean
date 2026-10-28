import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part04096 = 2952373978872058248574557467554942133768682818748103171075437003530636109523777485490262509208872945713152 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part04160 = 383904385818345325085042844592723649194399685293101283336572652356426435213726457576575570063228886543499264 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part04224 = 249923996057679146898391207486428531653769624840605885646910762661231512652664036736860444651915168549175296 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part04288 = 134226976454048962942185134913177060844339195372477179196632288985833580314639289766092113425118558945280000 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part04352 = 40028778757840688910768421132612590003275274167434891178519308996233248446095284946078350637948806537150464 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade085Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade085Part04416 = 131708766229736709909858139407233980670013426743871562165823049186990919342642558847263915799908311908745216 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade085Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade085Part04480 = 102499381597382540887741924597293586325649475476310921907051512263727126011810779290984707138559107347251200 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade085Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade085Part04544 = 21152349667765973745702055413290912658804160006655478981861849521189399659068561486309023214428987557150720 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group008.size = 512 := by
  simp only [firstCenterIntegerGrade085Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade085Group008 = 1066397008561671406628264285010315253484019524719205305584446860975162857750170746135654387440316700333965312 := by
  simp only [firstCenterIntegerGrade085Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
