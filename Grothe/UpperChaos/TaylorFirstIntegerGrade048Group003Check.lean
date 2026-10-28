import Grothe.UpperChaos.TaylorFirstIntegerGrade048Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade048Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade048Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade048Part01536 = 191762551286625260371065646562857682568824838781004479307338573531809039224061749578331964854940442613593931776 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade048Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade048Part01600 = 184901306350109776443005777314473484438444666766997931085471791333965594925975567159765874313442652550835732480 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade048Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade048Part01664 = 111527181251611153635070632458478401943128954927830747321221336101677002563760805327421209826312956991590367232 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade048Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade048Part01728 = 78228470816695685678676507839616083001035623992102498759209845246915467323493213298984948600158157124577263616 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade048Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade048Part01792 = 61377273925256580909071706183079047776426012739137697602168141483182171704875889193807256428083472302142914560 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade048Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade048Part01856 = 10044908356722295963098946881361573452956531737128921292914699525918327843079753076016848774900499092309278720 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade048Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade048Part01920 = 11204209093703721228388665593263253609053881437178039880822111515361591962679241135183378552778867424041631744 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade048Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade048Part01984 = 28568182937770435662590403146378539197792096777617533159015757779204479172643963033596036268330100294212911104 := by decide +kernel

theorem group_length : firstCenterIntegerGrade048Group003.size = 512 := by
  simp only [firstCenterIntegerGrade048Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade048Group003 = 677614084018494909890968285979508065987662607158997848408162256518033674720570181803107517618947148393304031232 := by
  simp only [firstCenterIntegerGrade048Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade048Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade048Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade048Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
