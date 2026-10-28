import Grothe.UpperChaos.TaylorFirstIntegerGrade052Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade052Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade052Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade052Part01536 = 369854458646377894378965207675603253745602496765288806553896086815165685093546952624051329967501773714973786112 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade052Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade052Part01600 = 292933707822902746792965506360777306682264145377528046616538295298454780797778074835194336524342155829233844224 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade052Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade052Part01664 = 297110490461100502763251107627294716306808709453032142966665234246936892160378705396384860381428053489032888320 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade052Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade052Part01728 = 168196412162834976494177337498716790647489015786768580742005747673875613622017414482800340818612278468959797248 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade052Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade052Part01792 = 82587690341684234532869862759796048441392767691507981750184717734190101040121680063086363562926099139213131776 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade052Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade052Part01856 = 72066041929507554473344752291784900143112719840845205694951417955051787328413262781706677561863092452083105792 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade052Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade052Part01920 = 65015018271116315865806096679270651864163294897735068214773339331791445552767706363296469631486934752866336768 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade052Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade052Part01984 = 63683276625180125222467745258147974105511010191711451767575400809587704567610410331076964860004691225635454976 := by decide +kernel

theorem group_length : firstCenterIntegerGrade052Group003.size = 512 := by
  simp only [firstCenterIntegerGrade052Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade052Group003 = 1411447096260704350523847616151391641936344160004417284306590239865054010162634206877597343308165079071998345216 := by
  simp only [firstCenterIntegerGrade052Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade052Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade052Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade052Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
