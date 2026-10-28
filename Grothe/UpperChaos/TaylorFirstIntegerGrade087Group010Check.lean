import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part05120 = 38313103641153395282381000997229226015104810017082857236203428765194270767371212844176825267748470960160768 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part05184 = 11104440085321689626615498936255171748323992021449840331070621678212752559671689089077824175088276531576832 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part05248 = 23946735765784140419768520541302675111943515060428793675845932984391268851874261664121272285153845110112256 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part05312 = 30982108941069905089160266956073599291832434715617711559733302225888829513960247509224542739451230073913344 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part05376 = 26236860264470122393770242865017754762648423939181442144119661185485732390079986351680907619390889750691840 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part05440 = 1472655708525791126827002585324710948855658258386623909864601020860968342228107837382852133427880686256128 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part05504 = 22332320115782502360939834110324425397410576353645533306331193858621883350241736625359464395323642312916992 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part05568 = 19986148456783697177738009366214697328206388630512495245909859145706486827888970140688153729841402648461312 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group010.size = 512 := by
  simp only [firstCenterIntegerGrade087Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group010 = 174374372978891243477200376357742260604325798996305297409078600864362192603316212061711842345425638074089472 := by
  simp only [firstCenterIntegerGrade087Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
