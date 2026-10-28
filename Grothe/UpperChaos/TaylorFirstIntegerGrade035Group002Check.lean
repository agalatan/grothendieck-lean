import Grothe.UpperChaos.TaylorFirstIntegerGrade035Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade035Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade035Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade035Part01024 = 329064567174133142647890173991798826902097186436441974711955040054158358108181826972487343910444849567128092672 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade035Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade035Part01088 = 185880975173822875683237984354245157855634276431067903669951746434035468587251518674558244576405898340769726464 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade035Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade035Part01152 = 66517003642306400923826767510801145854810766960069085211785137565177202910124161287760762409505121382443253760 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade035Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade035Part01216 = 74704033250396171279652986612662572541961495810487531116461882818847201188108355035838139478242206597871828992 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade035Part01280.size = 52 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade035Part01280 = 104315111483086285482384364560961485301330574326254375622764730746268950921166722099311451779326832896349569024 := by decide +kernel

theorem group_length : firstCenterIntegerGrade035Group002.size = 308 := by
  simp only [firstCenterIntegerGrade035Group002, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy firstCenterIntegerGrade035Group002 = 760481690723744876016992277030469188455834299964320870332918537618487181714832584069955942153924908784562470912 := by
  simp only [firstCenterIntegerGrade035Group002, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade035Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade035Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade035Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
