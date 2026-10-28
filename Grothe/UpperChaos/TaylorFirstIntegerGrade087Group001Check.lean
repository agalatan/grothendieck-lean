import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part00512 = 2012510221458364897547486197718303174263600092920111363267320531858808917721235892019162967695327955724940607488 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part00576 = 1901983449959921944847793918123377250801648319129043066651029168858772584007873918251496654100515892680982528000 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part00640 = 87315198615633330099520948202157368701983360520876586618375379302361764623043076922939262627534723673489408 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part00704 = 1711114370016663323982351880104937992166325685130007360819932631110224914885750918718901315579421708251557789696 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part00768 = 1543027902431385056561281934109853251659464199067041206094558611095825694973034628631748239631190178370022277120 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part00832 = 1273247324341808952806287592228350066482911645924765854478714342766314603709319654746239175542985009953790492672 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part00896 = 100814947700719457380303482501067605353068789897531397767810023765923942862675400413489168384966792044498386944 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part00960 = 1143827997094127921299022252246144495332961966737121570420453393557865562132078876031794826900881464946098962432 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group001.size = 512 := by
  simp only [firstCenterIntegerGrade087Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group001 = 9686613528201607187754626777980235993428682682166142696086437078393038582056592331889755287097916536695564533760 := by
  simp only [firstCenterIntegerGrade087Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
