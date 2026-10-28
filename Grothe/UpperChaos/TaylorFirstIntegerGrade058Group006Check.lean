import Grothe.UpperChaos.TaylorFirstIntegerGrade058Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade058Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade058Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade058Part03072 = 751042510543146171503369938732563872988271148055590724324243563588156802199342650034440738906523100008939520 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade058Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade058Part03136 = 585864729876063884658163762279275213287907246790437547229229309347541580025294012199248135747747348888944640 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade058Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade058Part03200 = 391234486012043227445447816007890844758447245351356226210409952305193101787741896198019732696431824979623936 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade058Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade058Part03264 = 411792246425338427478464875129253460789458292043520251462063312186091070271338667630260565240788993238368256 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade058Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade058Part03328 = 307922007823424652949438379494486354265591135541599938573967948147787992135021385343310131891548335860875264 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade058Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade058Part03392 = 213168131535150129116542807244627662391042202010806491770881188020244298795174273151469515423373628931047424 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade058Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade058Part03456 = 191008792645104724150158127316986587119066755082579247420759407902639658162850581997064671159456920978325504 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade058Part03520.size = 20 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade058Part03520 = 242736973805007738272701364686964501432365033659126758460949615780094317917354893272434586369360936430469120 := by decide +kernel

theorem group_length : firstCenterIntegerGrade058Group006.size = 468 := by
  simp only [firstCenterIntegerGrade058Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade058Group006 = 3094769878665278955574287070892048497032149058535017185452504297277748821294118359826248077435231089316593664 := by
  simp only [firstCenterIntegerGrade058Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade058Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade058Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade058Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
