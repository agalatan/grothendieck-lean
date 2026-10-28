import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade066Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade066Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade066Part01024 = 1301610734856360880134999049946418708428205644468253176555276374907631856150700787307730915080740847769016598528 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade066Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade066Part01088 = 2429618400483192588324781005886271522932276431139803830823348348287500914795648594746032050548352038401063518208 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade066Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade066Part01152 = 2823199906671677200133995987542369820106762526126693579562075484261807274819724041433591755068933676827137802240 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade066Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade066Part01216 = 2650987041845591993690607867651898724017233380343715147341217860009910925420373467319433533855556287515408203776 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade066Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade066Part01280 = 2313053521953601011908614745505239236888679081563779910340291316381463770302171684820863454756113686147907977216 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade066Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade066Part01344 = 1960912944669260953474418925979167883250495327468770749555462590284516921103479029600623635068232951598048870400 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade066Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade066Part01408 = 1625418473037958334084173750695506929820109202765196856905994234528928722800411027120071624052868234838101983232 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade066Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade066Part01472 = 1323340917500793639709533750072951679949304079602599977043841411993705870132786119780603677969552777893778554880 := by decide +kernel

theorem group_length : firstCenterIntegerGrade066Group002.size = 512 := by
  simp only [firstCenterIntegerGrade066Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade066Group002 = 16428141941018436601461125083279824505393065673478813228127507620655466255525294752128950646400350500990463508480 := by
  simp only [firstCenterIntegerGrade066Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade066Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
