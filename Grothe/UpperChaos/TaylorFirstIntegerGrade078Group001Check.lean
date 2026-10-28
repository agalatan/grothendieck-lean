import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade078Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade078Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade078Part00512 = 4743527567788296842654346378183565591064371951432977208495676914305867873708285636641699597917353972206699282432 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade078Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade078Part00576 = 2316770817585017116224251141130089403007799919022352107173069498412939987559932740869902314900596276935331414016 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade078Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade078Part00640 = 1628664811008014085682208936655532622093245526030779406631933879973292471489871971533736758261808316283250278400 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade078Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade078Part00704 = 3170244934365268809156892711468421502837750533571372705348026807254068530568084453160171354539785543926058844160 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade078Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade078Part00768 = 2535507693462403379443499420832168404754626902432759621508736289854359717077793547439463550348710667843302064128 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade078Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade078Part00832 = 1972091678897334201905560931146260205485852651612796474044226411804111433946598184396431514079150087337616080896 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade078Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade078Part00896 = 836699551947199380033906865189754856854497962706216577074443712792126877766981255559233857649410449719968137216 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade078Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade078Part00960 = 626842714226096538583088630147274751617795047139030250406463540492915407262955387286529192877831485615125823488 := by decide +kernel

theorem group_length : firstCenterIntegerGrade078Group001.size = 512 := by
  simp only [firstCenterIntegerGrade078Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade078Group001 = 17830349769279630353683755014753067337715940493948284350682577054889682299380503176887168140574646799867351924736 := by
  simp only [firstCenterIntegerGrade078Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade078Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
