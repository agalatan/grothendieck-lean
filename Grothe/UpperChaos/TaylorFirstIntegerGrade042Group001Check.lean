import Grothe.UpperChaos.TaylorFirstIntegerGrade042Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade042Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade042Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade042Part00512 = 90692506727449915505955978647705820175379194575732320716174995777707990016930300975453282955988930082335598051328 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade042Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade042Part00576 = 31692499841842498319199444799181932190576272596904764722929634825715242263186387591882182357873706896483246145536 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade042Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade042Part00640 = 31832609382246968132364257797423653759508540358644080545386468906961192109875428693613120429423075548878860189696 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade042Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade042Part00704 = 8377295949634656017918146235219054652851126049758919031641807796645115904293740146534878938532651719900056780800 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade042Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade042Part00768 = 5428931922538197813794832293118822714028437534067351317096715120185863297609346100541749034169341082334998298624 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade042Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade042Part00832 = 2586277122127716972021629650503729375901292817126136781391185572352704912326771958284841188339286469478484803584 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade042Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade042Part00896 = 611808870589793040595322523668595806757141225918433265660239456493062848745106864808691243377005817148146188288 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade042Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade042Part00960 = 394853168037130599565044509454317495923987416365479973515904591428738255289883076515521684333323091371804852224 := by decide +kernel

theorem group_length : firstCenterIntegerGrade042Group001.size = 512 := by
  simp only [firstCenterIntegerGrade042Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade042Group001 = 171616782984466876401414656456275926170925992574517486353796952047489909608256965407634267832037320707931195310080 := by
  simp only [firstCenterIntegerGrade042Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade042Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade042Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade042Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
