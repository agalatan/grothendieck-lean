import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group013Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group013Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part06656.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part06656 = 12637645586674575544662002529453204302971244450404960706518397581936045880950658499816061408100529075126272 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part06720.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part06720 = 13614303606610442997355857871405125121624766654894522454845552654144186115603049519987115814575516977987584 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part06784.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part06784 = 6349157707818155454216550228981755200505318523631052472991810673260397263352029765559248142095068776366080 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part06848.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part06848 = 7468416478896446923998858154169616472950244425355739581459788421777346864937627629830121508513412070506496 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part06912.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part06912 = 14952973270183028933843601433697975208664512292854909884149098876365884594856473397137577817593454446772224 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part06976.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part06976 = 10847236590398656428442430157745754898949231296133742882874050159080831598656763606541572394540866656534528 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part07040.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part07040 = 549176750046573670874802018775013829204455874020032586874453109143090921425556988112872894608964155604992 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part07104.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part07104 = 9657698056972247978487121574090990904753844695107398695733021893535442425516475039717560274983152166895616 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group013.size = 512 := by
  simp only [firstCenterIntegerGrade087Group013, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group013 = 76076608047600127931881223968319435939623618212402359265446173369243225665298634446702130255010964325793792 := by
  simp only [firstCenterIntegerGrade087Group013, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group013Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group013Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group013Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
