import Grothe.UpperChaos.TaylorFirstIntegerGrade040Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade040Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade040Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade040Part00000 = 355308650069834054059731161647823130436995254562898036174604852347786499647966755420265511517262453160936657125376 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade040Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade040Part00064 = 195814877204869004031271144042956004086620014977606326248961383614558535195690402409838859203932217786573730611200 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade040Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade040Part00128 = 285808602495233864093434515815077928787933729302458828488630817327520383067984589291548027570211387401523158843392 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade040Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade040Part00192 = 324566817321225508251985569996590955314715778880177979941509535838909867937118141087023444136323733525557556543488 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade040Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade040Part00256 = 122940273383110015742998142751794118445907286447440519621143619344764905162378492715056147337502133609752801837056 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade040Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade040Part00320 = 158954189678228084211074342504831158186107935101800146673881066230874987209103783823927599387260346118842538262528 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade040Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade040Part00384 = 60250355353507680683398476975829914602274967767956179999285817226626134178044502385529554417360423379377191911424 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade040Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade040Part00448 = 81041980209731693408590541825083906633445794494729734761704673817461393315722992173539824526443914073244971302912 := by decide +kernel

theorem group_length : firstCenterIntegerGrade040Group000.size = 512 := by
  simp only [firstCenterIntegerGrade040Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade040Group000 = 1584685745715739904482483895559987116494000761535067751909721765748502705714009659306728968096296609055808606437376 := by
  simp only [firstCenterIntegerGrade040Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade040Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade040Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade040Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
