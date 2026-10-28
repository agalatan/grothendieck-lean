import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group012Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group012Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part06144.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part06144 = 4398152109307740605986103543479187763889991060254490937425214616491559766500664300898436969629190648233984 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part06208.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part06208 = 12035054188286405267727359760194804507837702482333988513039014235940268690752394211618225552595876847812608 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part06272.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part06272 = 11959757376522321399105969507300856433107649893293201857687425988729633115751223092685980863911140098310144 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part06336.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part06336 = 3602503793712851027530074976617750480016695695373407015456456193382843034412573103453159396262161141465088 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part06400.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part06400 = 8710069644069067138109627517534978312010672621237726599041252271233128338144555316788340710818318913634304 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part06464.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part06464 = 11791987852661687523127866501154857301681001682844143769112792639795383839650112644545009632713988330487808 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part06528.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part06528 = 8966067400045649581539164342057127588121394623649557441629660004133913409267276523874030889609822335926272 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part06592.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part06592 = 4431807198149705650440269003950156148960627104334515234823096497351955836885525324679602637741380453007360 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group012.size = 512 := by
  simp only [firstCenterIntegerGrade087Group012, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group012 = 65895399562755428193566435152289718535625735163321031368214912447058686031364324518542786653281878768877568 := by
  simp only [firstCenterIntegerGrade087Group012, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group012Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group012Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
