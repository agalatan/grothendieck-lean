import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part03072 = 16447810525587096967884810813056406520339596925822060912392361601535662128503022391371422760856993773570228224 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part03136 = 83918462812886736707799867165247267270469902513085167542963173168502269448249707856118209947477964887162880 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part03200 = 13550024416474284260410382608288014323315274777909938009076084625901504959485474902004157485449804013100859392 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part03264 = 11147115505247511159377439326286520664143675836144597623780594083444943558760795825918196577127304383403393024 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part03328 = 8951658598752813357002485576101662136982353331448483627013459023494554865948711494072432961603179590233096192 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part03392 = 3233106262882460391172974694535615761600825539292893903854256963134984583704509352693004816009431120609280 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part03456 = 7062624821539933954339724609049241370967213626113911090147783670277519745394674457620486427460468076269535232 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part03520 = 5483990911597016618630684719472739053285984740473070257220779796740895966989838123041259985845293471091392512 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group006.size = 512 := by
  simp only [firstCenterIntegerGrade087Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group006 = 62730376348274425514744500494114366952066169965964439581077880231526718479114471411236767413106530703676276736 := by
  simp only [firstCenterIntegerGrade087Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
