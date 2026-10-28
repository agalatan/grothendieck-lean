import Grothe.UpperChaos.TaylorSecondIntegerGrade045Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade045Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade045Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade045Part00000 = 787818750440508792880790042427199757953861445618060259706034018691166613641706669127962821048005578107232714752 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade045Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade045Part00064 = 344296316358859936690591610767783145067699193491257269251543449629099781933378916986795720947245582107287748608 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade045Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade045Part00128 = 221522465784698518354442201419219550349668008906445086116192958310837496977804331829012515013794852460820430848 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade045Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade045Part00192 = 106211406936252933614103967327476671670700282132908006548661266504932262568332914632836331751160027260571877376 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade045Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade045Part00256 = 96143865415459126071386945926540804894822931288853511330345249946657506225930689613922445815687625305527156736 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade045Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade045Part00320 = 80344406988793944355407699276385100937209555161388050650574683825928719142054217157485929387846997531860926464 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade045Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade045Part00384 = 38600666516530381882551120907125119652422744622399291835230816059155743295249213824305033905159323266695823360 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade045Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade045Part00448 = 45470211529576507104855361747544330247326661170325831240370940747940600486881479288629416492098087119633776640 := by decide +kernel

theorem group_length : secondCenterIntegerGrade045Group000.size = 512 := by
  simp only [secondCenterIntegerGrade045Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade045Group000 = 1720408089970680140954128949799274480773710822391637306678953383715718724271338432460950214360998073159630454784 := by
  simp only [secondCenterIntegerGrade045Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade045Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade045Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade045Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
