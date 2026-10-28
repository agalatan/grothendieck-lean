import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade071Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade071Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade071Part04096 = 31506502661667745488291682165110557294244788805014395320612364691543706721971520721266821918451725487833088 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade071Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade071Part04160 = 67020067702047472184386324558819714311966202647937548091035063810493531330318253382390730758455131700723712 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade071Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade071Part04224 = 70878647856727048460757345456196403381815616408934080007902144715964183246796057815986362664818999772053504 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade071Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade071Part04288 = 54183791876474092089980395292290896733826587062913753607091343078935881105753457536487049885842704011624448 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade071Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade071Part04352 = 41436728106541848810463836386350482955670899383522680596133227989829990057939128744585833991028725069643776 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade071Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade071Part04416 = 34662640182338001249814828709764897936677158415021361177188156716966511015048086726053682906634879045206016 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade071Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade071Part04480 = 39927017119196075574896140400789153248298414717374370520690412788688241251408753562108055686346937661915136 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade071Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade071Part04544 = 31593354055230793663297999118309175420439029455702532834761248275614987570282820172159566687432437286305792 := by decide +kernel

theorem group_length : firstCenterIntegerGrade071Group008.size = 512 := by
  simp only [firstCenterIntegerGrade071Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade071Group008 = 371208749560223077521888552087631281282938696896420722155413962068037032299518078661038104499011540035305472 := by
  simp only [firstCenterIntegerGrade071Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade071Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
