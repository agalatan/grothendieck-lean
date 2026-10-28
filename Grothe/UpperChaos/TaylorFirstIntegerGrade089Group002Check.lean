import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part01024 = 538606724173833480064382163798756453125358199403213442174005823885311153831818410676694123709937666582156148736 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part01088 = 277886591067675291738488512387246014967823870917199732144836839433120636520254370498951307902791352042152525824 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part01152 = 617509217271027423577593094999976682115277415115545598908513173248326100416369115324297092471845451808972472320 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part01216 = 425894429311860858974437973905913452128149677931152513531858219135387654653709554158821653125075270853973770240 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part01280 = 41865376012683727331258084887981412617497799423265868465819317688122023891340744384551482795417883097165725696 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part01344 = 373415007201618170886997785447202280121713054332742056475600430105894761650878838443716293096270115836878913536 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part01408 = 319053848014673012687337074891805429349575857609924282314318252085551904845987050902960338264859350421475426304 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part01472 = 22752799803569549047685306091224294358389730601721317490379080468928335268549184995127855790942879678015209472 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group002.size = 512 := by
  simp only [firstCenterIntegerGrade089Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group002 = 2616983992856941514308179996410106018783785605334764811505331136050642571078907269385120147157139970320790192128 := by
  simp only [firstCenterIntegerGrade089Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
