import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade074Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade074Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade074Part02560 = 38723890162502979615230712107838875852596449827239845084537594694285323548605889442441538842227966042563411968 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade074Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade074Part02624 = 30404988341098328973573887162918773192632460579800934664845417540272657086648990410337752041656807067259764736 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade074Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade074Part02688 = 23585570351236699410953153974628325275155466897315470378946835290877646099887179010231049672404286143012536320 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade074Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade074Part02752 = 17786818996500380916111655576248901893518743058868752548844714855526708444047058676546564909736101979380252672 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade074Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade074Part02816 = 304728028353222316756691554286907391328350980579261944646720464565043581951535388933411795826770680142102528 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade074Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade074Part02880 = 13626349486724391972688457996963330076081631097616941665130953868729902330935876811328782591065124830758043648 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade074Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade074Part02944 = 10111405647471583434826411724442752901565249258572461783536890413298501749539489683488632704190968857224019968 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade074Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade074Part03008 = 7327548304372075475566361022018225352873051942488342459269114700232856621273266411830665935111606749695574016 := by decide +kernel

theorem group_length : firstCenterIntegerGrade074Group005.size = 512 := by
  simp only [firstCenterIntegerGrade074Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade074Group005 = 141871299318259662115707331119346091935751403642482010529758241827788639462889285835138398492219632350035705856 := by
  simp only [firstCenterIntegerGrade074Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade074Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
