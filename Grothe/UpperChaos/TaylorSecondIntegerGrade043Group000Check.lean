import Grothe.UpperChaos.TaylorSecondIntegerGrade043Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade043Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade043Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade043Part00000 = 661804505580466926211940284609202637395269811797266222702497079025939330389228016822595828307105472680430665728 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade043Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade043Part00064 = 493325905508566446279250642867898505476837857965224338490639132046344120579379832339551962581936192695050436608 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade043Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade043Part00128 = 437255590879192656726857963737257211666139259845765002933645204902102223672220071002797480059780914111414534144 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade043Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade043Part00192 = 77970664392870716871780677397281287755772345350279234611670604303104442374405369423372116880033173357465698304 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade043Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade043Part00256 = 118840069610390652088413823475988230082322959803551667610382943416366784695236479417103512199831843030440083456 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade043Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade043Part00320 = 80178165953741289544567981102759552843037730616819977090842515547329296686581043238886851655680801785904103424 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade043Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade043Part00384 = 72617833422145952947359616492594327017529731526193497617486921925619672204039978845329606484851619405542457344 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade043Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade043Part00448 = 32400509909748413376029507991097213464286145279168397985222857541283143369670705930592191065508336266081468416 := by decide +kernel

theorem group_length : secondCenterIntegerGrade043Group000.size = 512 := by
  simp only [secondCenterIntegerGrade043Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade043Group000 = 1974393245257123054046200497674078965701195842184268339042387258708089013970761497020229549234728353332329447424 := by
  simp only [secondCenterIntegerGrade043Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade043Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade043Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade043Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
