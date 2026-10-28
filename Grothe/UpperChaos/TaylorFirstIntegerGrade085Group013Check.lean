import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group013Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group013Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part06656.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part06656 = 12116691052657832095733059006247449032035020824559561157095609160494344153127247845724698736345960641724416 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part06720.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part06720 = 8785545158042255002547458851204936445140104827133479953394070743508971696323923862683098027275746562539520 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part06784.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part06784 = 2633960960138746522177173242612704417159592594653412242111051144547480241084855489875704623443474164744192 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part06848.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part06848 = 9312811479798138510690098924364102325851688396938822570747247587429805128693216023037739294421855617679360 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part06912.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part06912 = 11313196474205398850170743310837810681561558289950021024026925958315625313249093464890174575851098502856704 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade085Part06976.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade085Part06976 = 5726161540590102303036371324729831693534758064618122808752660214217323960517961825626954767141313590591488 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade085Part07040.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade085Part07040 = 3473443949573342488432687475866682629342865477707529408322775476309800415576433470982121139398291413270528 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade085Part07104.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade085Part07104 = 15810268843209059224251508533111436220971709021454775195727808925466558067739358089121321475294372707696640 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group013.size = 512 := by
  simp only [firstCenterIntegerGrade085Group013, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade085Group013 = 69172079458214874997039100668974953445597297497015724360178149210289908976312090071941812639172113201102848 := by
  simp only [firstCenterIntegerGrade085Group013, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group013Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group013Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group013Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
