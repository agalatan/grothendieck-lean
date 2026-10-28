import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part02048 = 146290541167593532742815451986659728626705022235168950104742297687570822794100823962377167322176375432895528960 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part02112 = 36099395720639518751421259880246046624047549645666921657061329833815786956281150201242616322012173208244977664 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part02176 = 85834182646576611582090532826738642625699085723675049113040691504842621468331552044674124214373879138561818624 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part02240 = 100919309387594897986699532538493927625620053413508025965029706703029144324131292385644819522014358198214983680 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part02304 = 83022944023338952621773463668946732608173143133354998085084181176933969378236874136580373025573964125464166400 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade085Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade085Part02368 = 663637363529346550189316686096650418225853455764603331518663240262375656448227926245774480110373882178830336 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade085Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade085Part02432 = 67366523361753969080637486339515710848834641078880981964832066342505287980670832452084555329502970931755089920 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade085Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade085Part02496 = 55694495054676589124981682907397903303484855596083051650159487026835999021298448116875885677532467820150915072 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group004.size = 512 := by
  simp only [firstCenterIntegerGrade085Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade085Group004 = 575891028725703418440608726834095342680790204282102581871468423515796007579499201225725315893296562737466310656 := by
  simp only [firstCenterIntegerGrade085Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
