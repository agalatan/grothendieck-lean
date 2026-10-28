import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade078Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade078Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade078Part01536 = 129532280871912467866069294355329842010001048699972655227238685127613345421477307446067345168551252004630953984 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade078Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade078Part01600 = 347132427008915957962848372524181522860371673571088312265652192435400596544740112516135196005506113481914449920 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade078Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade078Part01664 = 406726533694693745601238275933583848455413352859904346517045881199225578907722936747208578950187942161351180288 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade078Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade078Part01728 = 341560731689591169631916276138625352581514416387207944859513026055832283920201498802395035846117262084708237312 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade078Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade078Part01792 = 283654110680821830894619211790565839069519301903801926009046136791864503586950915104926483246958443464520368128 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade078Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade078Part01856 = 65269494191137545035527386618109715556555749761562976494253056339423222827234574952565837105698228765471014912 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade078Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade078Part01920 = 168748677999316121794957758472056190893414014417250658644730770358705859949529444481776862992883964548539744256 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade078Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade078Part01984 = 192312309484008989912573447162458478693889689312342173953046039097542512982006766917896737283855862436661821440 := by decide +kernel

theorem group_length : firstCenterIntegerGrade078Group003.size = 512 := by
  simp only [firstCenterIntegerGrade078Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade078Group003 = 1934936565620397828699750022994910790120679246913130993970525787405607904139863556968972076599759068947797770240 := by
  simp only [firstCenterIntegerGrade078Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade078Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
