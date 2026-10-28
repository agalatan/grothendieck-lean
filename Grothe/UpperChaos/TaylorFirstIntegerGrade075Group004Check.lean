import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade075Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade075Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade075Part02048 = 162895586643740944311354001020299189137450356696817966546160758724845796378183910506885211225686119091697352704 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade075Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade075Part02112 = 130936523430271266208314585515251639412364902157893053831599124352132664913710435084659685442437975974164299776 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade075Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade075Part02176 = 105405225808399996954851550858333735257924255647113289054739656614973541825017249018503402686413397800400191488 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade075Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade075Part02240 = 234672469659664835622851161207143474659340522810983233404737629903683256421075264013660520122612584017821696 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade075Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade075Part02304 = 84972324745342954085702687324209699047480251629910554307487972333269077446968047925748051361188546071341563904 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade075Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade075Part02368 = 69138907678383037120777055234075646544327039226162521643076557051822905985038315706508126306243964666353025024 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade075Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade075Part02432 = 56175545722094043521815013089557698363605866661262199380903363757120950100166300983919905313883060314954530816 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade075Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade075Part02496 = 45458202924735395792835854468955635380762823487046881827141878770579757809001380880444871900724048049219829760 := by decide +kernel

theorem group_length : firstCenterIntegerGrade075Group004.size = 512 := by
  simp only [firstCenterIntegerGrade075Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade075Group004 = 655216989422627302831273598671890386618574836029017449824514049234648377714506715370682914756699724552148615168 := by
  simp only [firstCenterIntegerGrade075Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade075Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
