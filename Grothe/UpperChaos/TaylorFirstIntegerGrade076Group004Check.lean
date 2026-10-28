import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade076Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade076Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade076Part02048 = 150261519459591214526819074157496116698948132910921244874889539606830882785853272353133664225828813144466653184 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade076Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade076Part02112 = 135429535414935619351435030647162299757744064833721566131399048967094964124349010749082794225935720183234560 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade076Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade076Part02176 = 121059314478805963478951046482167008565620104314439152949799993190468632090207350124846952527542800932948410368 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade076Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade076Part02240 = 97578215832519941714808821182352417378631359596167424500454711856476497172135939986168276154600366691961536512 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade076Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade076Part02304 = 78788510011093566552963828218386869243783076105237812895807292959787170985354822287344503385235898995241385984 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade076Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade076Part02368 = 63904082601239118082525159646540651808636345997481853122072078811207536861250904786418155513510305785838567424 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade076Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade076Part02432 = 12326108207579656702039591545428548909004378004799938811562167446744101144301938588949237545579893420441206784 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade076Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade076Part02496 = 39711929985188801954066315058749347907781802621853052515193065974939510831439612129855220319168706497820491776 := by decide +kernel

theorem group_length : firstCenterIntegerGrade076Group004.size = 512 := by
  simp only [firstCenterIntegerGrade076Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade076Group004 = 563765110111433198631525271321768122812162943615734201235910248895421426834668189267465092465692721188901486592 := by
  simp only [firstCenterIntegerGrade076Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade076Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
