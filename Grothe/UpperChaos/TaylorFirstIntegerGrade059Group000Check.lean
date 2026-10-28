import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade059Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade059Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade059Part00000 = 123009858395125583211404415083756912441152743385187828008387468899619468745521623277768215255603471926421591425024 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade059Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade059Part00064 = 145132505187196500072880628222331300635801006295935776493543960819067588093861091065500483081708325074896911597568 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade059Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade059Part00128 = 141158370772026025155472257256926959127711699687575807614308580879129035195025884055821798928397555062206252449792 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade059Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade059Part00192 = 129098911927479752479654592575043470711684258800219449262179066796795810301503046701036446451144605925045170077696 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade059Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade059Part00256 = 114069031708583890635978464002852693089963000683087106690317892109154577594783085646543662770438213597081899106304 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade059Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade059Part00320 = 92581640434417616678481613292782693981809870143155204706951185379507424565586241950112080503305747215397010014208 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade059Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade059Part00384 = 70351254086508396564502431906139675682795022453750813602377707769141418588436853531739091355181261488983050813440 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade059Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade059Part00448 = 50157784475561350006492571716965000144478869519845791923298057184123981692071234492926678136373700284110770012160 := by decide +kernel

theorem group_length : firstCenterIntegerGrade059Group000.size = 512 := by
  simp only [firstCenterIntegerGrade059Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade059Group000 = 865559356986899114804866974056798705815396470968757778301363919836539304776789060721448456482152880574142655496192 := by
  simp only [firstCenterIntegerGrade059Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade059Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
