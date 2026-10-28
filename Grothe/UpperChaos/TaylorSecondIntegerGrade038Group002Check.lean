import Grothe.UpperChaos.TaylorSecondIntegerGrade038Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade038Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade038Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade038Part01024 = 5651264007226435972040165835753873957738115581470385150143352846726693164272121085814732156310189642925211648 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade038Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade038Part01088 = 3379885512201296257872723731687134407144830443154135305802075922916736627861124984400865155431034895294529536 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade038Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade038Part01152 = 2221597914591026517920309136790230287080654684244499214034540061181848667158679248872964503195590263207624704 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade038Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade038Part01216 = 2594227879393910165403127233946409154034554239580521011645806600458711879321606360888190952567110110575329280 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade038Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade038Part01280 = 948499922451033466624334786459312079698759068929860296031280588996897739904328208970440150524800897451556864 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade038Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade038Part01344 = 1656637750356185745724825895037120540530351373532635344393928946028576650668281227314092548107523442083889152 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade038Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade038Part01408 = 1113768500064250525069716663326628741236531407207182973320771474617643157100291834362586885662163347903086592 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade038Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade038Part01472 = 555747720190530538582472182192258657046422697050556500466952779714024201514262849196219847454472160069812224 := by decide +kernel

theorem group_length : secondCenterIntegerGrade038Group002.size = 512 := by
  simp only [secondCenterIntegerGrade038Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade038Group002 = 18121629206474669189237675465192967824510219495169775795838709220641132087800695799820092199252884759511040000 := by
  simp only [secondCenterIntegerGrade038Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade038Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade038Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade038Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
