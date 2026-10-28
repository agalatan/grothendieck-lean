import Grothe.UpperChaos.TaylorSecondIntegerGrade040Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade040Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade040Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade040Part01024 = 4893868688420782062162279360179689577084491098787745923193973744534032282911225230194912133509977528623693824 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade040Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade040Part01088 = 2519540527201698888377101672658247262566774183852487697604131871962603454338120628995687549232233166799896576 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade040Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade040Part01152 = 2823964956895066112911932731027403889681344906394825577176617480350565184615898465965356936991272261105221632 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade040Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade040Part01216 = 1588355786234779023278972884548045364023857083784662375342422467459983342985605514816702351427118927309701120 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade040Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade040Part01280 = 1873518202382770245656124660876785436147720213035521085940611342518279146282601174252838098866781981885071360 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade040Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade040Part01344 = 812677181744388617656905104763676835638988772473852747105504708545336429372185353584496058890981797097635840 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade040Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade040Part01408 = 1194625003048787461844557158210611325327930375752554810484143300598088405696263462240583003911462625105412096 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade040Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade040Part01472 = 541617360207462827740105006733914356555680231833261985289923387275173896796997412572242218338126328267538432 := by decide +kernel

theorem group_length : secondCenterIntegerGrade040Group002.size = 512 := by
  simp only [secondCenterIntegerGrade040Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade040Group002 = 16248167706135735239627978578998374047026786865914912202137328303244062142998897242622818351167954616194170880 := by
  simp only [secondCenterIntegerGrade040Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade040Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade040Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade040Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
