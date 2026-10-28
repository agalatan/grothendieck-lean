import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade062Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade062Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade062Part02048 = 134524175106414467024293276599674530296163416969175537946940638051661480891633119091870104422086450142225891328 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade062Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade062Part02112 = 103519111338193333378223572792020786444425020923906766434184599643577247233211903968179687518739026227759153152 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade062Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade062Part02176 = 78590498643755704681769668921820633974648383157170051434609944886051777392226379202868771641340100759246602240 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade062Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade062Part02240 = 58425698897774395212469064864565403459833698114390408636961119410492056513584587388068791908261190053486657536 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade062Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade062Part02304 = 42275043102732200852974902588137474439120923047583958056360089734849781563032004564825638599258056403544178688 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade062Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade062Part02368 = 29762457803116182134105583762659848894325687455741449300201339854695320616947698714438331640800856118965305344 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade062Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade062Part02432 = 20533874828791010995763295042598475957511033158849592660302919874826621463752708441638533065522235716826824704 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade062Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade062Part02496 = 14073051947657739694443218784212372631551353069651229262843685081575989326135635753886538753261025118751031296 := by decide +kernel

theorem group_length : firstCenterIntegerGrade062Group004.size = 512 := by
  simp only [firstCenterIntegerGrade062Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade062Group004 = 481703911668435033974042583355689526097579515896468993732404336537730275000524037125776397549268940540805644288 := by
  simp only [firstCenterIntegerGrade062Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade062Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
