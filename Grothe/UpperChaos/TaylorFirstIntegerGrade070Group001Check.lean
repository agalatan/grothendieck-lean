import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade070Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade070Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade070Part00512 = 6174858856494007841284964694888188725656065237808326231565423249055316278399658784530316087448077544059830272000 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade070Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade070Part00576 = 4751054197610866063232801505760790779822803450685123235303661452410757128645740416777443219018543081945896583168 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade070Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade070Part00640 = 7642519004689595785050961087160591081281732012468833280304403890647727872100077865891962672220376759191379902464 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade070Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade070Part00704 = 5616092646938055751051558511178545987973764880561055631460747703442877209832524085698649634688940749741455572992 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade070Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade070Part00768 = 3902689258795426658168649370866880791607862649471145318764424117761108364102824526751932988298856063869390946304 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade070Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade070Part00832 = 2776684572679616979174050120154312580378175224986683907357436167623800736340667120411483564164034635436889473024 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade070Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade070Part00896 = 2140327054142598190465300633437902250826712311089633371238447459780472101606176009079830182092477754345347088384 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade070Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade070Part00960 = 1856576224203464943250623247919761154188893472663292971220220503340690684795189430121887010824405474971152809984 := by decide +kernel

theorem group_length : firstCenterIntegerGrade070Group001.size = 512 := by
  simp only [firstCenterIntegerGrade070Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade070Group001 = 34860801815553632211678909171366973351736009239734093947214764544062750375822858239263505358755712063561342648320 := by
  simp only [firstCenterIntegerGrade070Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade070Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
