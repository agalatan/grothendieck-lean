import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade070Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade070Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade070Part01536 = 788949505625599184301577366236266283813284748507239055000179010884680648366294973264868908406640499661792608256 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade070Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade070Part01600 = 642203557135646152584566728408162184764729936961396715776222939564529497065671006537085747688355988746201464832 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade070Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade070Part01664 = 169197885155358843448650768893292086841281870869218681024981269667750773554244360597076848834790855213513179136 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade070Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade070Part01728 = 349737964774742391220923391599098185556597876942832376877403011848580264103487640198240743734470279422124490752 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade070Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade070Part01792 = 415109946084690679738852684459876634086050473084514795243412189093088373513662398980984797386479725655053303808 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade070Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade070Part01856 = 332344627794878001965638802650105976767435112275657824661728289912915876081666777581378792544781747171182510080 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade070Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade070Part01920 = 265147363610495664320843739315298740237173824277286101045416742214276774009853427327282262832885510878022074368 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade070Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade070Part01984 = 210985774633259101962708373310082806746519195808216688454893804454195594894467173815852298794286066846532632576 := by decide +kernel

theorem group_length : firstCenterIntegerGrade070Group003.size = 512 := by
  simp only [firstCenterIntegerGrade070Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade070Group003 = 3173676624814670019543761854872182898813073038726362238084237257640017801589347758302770400222690673594422263808 := by
  simp only [firstCenterIntegerGrade070Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade070Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
