import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade063Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade063Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade063Part02048 = 137975771150229892139304828835399545299462225958916371082294127916398704587052406568699288517244904539823276032 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade063Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade063Part02112 = 105739745028401395985453074799443317970266062514725453692011243252777055077864656739784510004193745068881870848 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade063Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade063Part02176 = 80164619660884184171154009483133979975053409242522741510473472672966413540591659949450094583741539642507264000 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade063Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade063Part02240 = 59859546482140585061431881840949121930078805234583819883531750876544877543920332845237035272578341870147469312 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade063Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade063Part02304 = 43826502507304792932306820561547513332276915240110855254324417966811177849942004632197843999575739588822433792 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade063Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade063Part02368 = 31371433356187773151840445066654786653898986282228459528259438080499917372418314533706047978402817952276545536 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade063Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade063Part02432 = 22003189414684162128421291008883317879010962485660838866472008651814018717334468293342180719291607013801328640 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade063Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade063Part02496 = 15221387934693423183547690880363522767787800464797897794196828139413934801026903933140789457229514435375136768 := by decide +kernel

theorem group_length : firstCenterIntegerGrade063Group004.size = 512 := by
  simp only [firstCenterIntegerGrade063Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade063Group004 = 496162195534526208753460042476375105807835167423546437611563287557226099490150747495557790532258210111635324928 := by
  simp only [firstCenterIntegerGrade063Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade063Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
