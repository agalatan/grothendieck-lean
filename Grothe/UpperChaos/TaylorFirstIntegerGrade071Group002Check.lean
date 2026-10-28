import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade071Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade071Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade071Part01024 = 1118869468051789147056937176606598625981837970047631820132471969350597416044069317494173714659145966801934876672 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade071Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade071Part01088 = 1458914621418104916510722505985698172941577352996744391654905035251542538448104798497854049275518347072738689024 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade071Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade071Part01152 = 1485808392395557118727491606682609714163239171556673789725781570850951297552627292948539818663674500819814711296 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade071Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade071Part01216 = 1404853259722711930447776934625254753409279727697298723492994265985736953320590262009696191785797751757772685312 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade071Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade071Part01280 = 1289033612193185984159387757817087068693642382763954155199208710981455763624214028190367667011749685939228639232 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade071Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade071Part01344 = 1147596155978726141945026026288448818453200194993802914900629453430020965758122163184689644831866829608893546496 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade071Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade071Part01408 = 994727841376632165241285677541471926588822957926889348040584557637341620392865385873687951801232287056032432128 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade071Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade071Part01472 = 763415636458040451533541399171048935486094314088900760264403147966178247890501628532416361042487780126658396160 := by decide +kernel

theorem group_length : firstCenterIntegerGrade071Group002.size = 512 := by
  simp only [firstCenterIntegerGrade071Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade071Group002 = 9663218987594747855622169084718218015717694072071895903410978711453824803031094876731425399071473149183073976320 := by
  simp only [firstCenterIntegerGrade071Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade071Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
