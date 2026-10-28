import Grothe.UpperChaos.TaylorFirstIntegerGrade046Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade046Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade046Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade046Part00512 = 114102024492460977492793823721491567400189183742958702537579059468252274261640658776124860963627080427735124803584 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade046Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade046Part00576 = 37744088349018369423207219927752135760233140189760995032070077021285774534529604402385081034247792621545356001280 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade046Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade046Part00640 = 27945638058141856090271694532264919787323702261500402400232805520103229301980602906332006650359072179433041297408 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade046Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade046Part00704 = 38400386845274918681841993067743445682720254972318299523146782443276226798959243637122817349710105149907413237760 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade046Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade046Part00768 = 18107021775030849301272686350949992469785109819350634187703279927227704855166573016898171351928571161306462158848 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade046Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade046Part00832 = 10651976827835085707065993575618851764092322678789631971937634321743969796201286796022505206055284268923195752448 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade046Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade046Part00896 = 12069877808647965428439521611394439779372212276337159577502720602340704769422789567859905901070002707570209325056 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade046Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade046Part00960 = 3764586463772335331612254235552152854450715818710640773174165736018503969911947672521468399987039448549470240768 := by decide +kernel

theorem group_length : firstCenterIntegerGrade046Group001.size = 512 := by
  simp only [firstCenterIntegerGrade046Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade046Group001 = 262785600620182357456505187022767505498166641759726466003346525040248388287812706775266816856984947964970272817152 := by
  simp only [firstCenterIntegerGrade046Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade046Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade046Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade046Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
