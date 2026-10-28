import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade067Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade067Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade067Part00000 = 18367096882066301569881692780786144212958852369829608718821908071601881319102783104665409652070597967682291630080 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade067Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade067Part00064 = 25179425381812005953031585103330334872620682911724074616808556365934364598061936193993584388923077366090400006144 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade067Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade067Part00128 = 33587804501037094610921525301693157815099531553501575773667793465539463409574983881689411681361553530375454588928 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade067Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade067Part00192 = 36092845761885267942594309441569252788582707639347263210020009355047099078491856154955190063555663197053581787136 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade067Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade067Part00256 = 35639058995385406476676927672193234466423477575538289121785618212928030739171296167292003394508025950836384333824 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade067Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade067Part00320 = 32590668908892914088050443244563779115906698538642203360374815956695385539965875230498934829340539472887158931456 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade067Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade067Part00384 = 27727323301409133153335477687912004436814293344744113072620326517847023650640040162937269572354488768142734524416 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade067Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade067Part00448 = 22007565465584930321186958221616729589039994879531411883483465663317751337741928262890085179017870523233197883392 := by decide +kernel

theorem group_length : firstCenterIntegerGrade067Group000.size = 512 := by
  simp only [firstCenterIntegerGrade067Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade067Group000 = 231191789198073054115678919453664637297446238812858539757582493608910999672750699158921888761131816776301203685376 := by
  simp only [firstCenterIntegerGrade067Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade067Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
