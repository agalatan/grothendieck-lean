import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade065Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade065Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade065Part01024 = 3682410824862846775605594468514007741543014341622752856497130446346197979633038738518469718180829523566934360064 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade065Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade065Part01088 = 3436684151648395360613561281759024177293635141514059364726542254088392748988187748497412318555513937620782546944 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade065Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade065Part01152 = 3085263675966721044631615954343919432085094745422884774925288362963996967662601646431509603987640308065544175616 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade065Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade065Part01216 = 2667161609952177289205456129146175145983057822483270997286499434545588555086629111953246219107696805098005987328 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade065Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade065Part01280 = 2229968191781465669496250498770378825621968656653867799870065093121596662386198654827577923940869274197207023616 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade065Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade065Part01344 = 757148926043497655701506859283934849742842438333367928837865239250445873226880062633119039398108815100326445056 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade065Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade065Part01408 = 1310441269640935812136872431331921195189554864238872296814198387825277359521141460789388956079670716695540924416 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade065Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade065Part01472 = 1354768608243490933809927251492037916915231053644492424778466542549988722378198060596218101950359534623325683712 := by decide +kernel

theorem group_length : firstCenterIntegerGrade065Group002.size = 512 := by
  simp only [firstCenterIntegerGrade065Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade065Group002 = 18523847258139530541200784874641399284374399063913568443736055760691484868882875484246941881200688914967667146752 := by
  simp only [firstCenterIntegerGrade065Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade065Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
