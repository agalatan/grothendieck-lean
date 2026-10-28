import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part04096 = 620574946562316830920412438324796672385122481040993909273429382822475295677565316541404354009930318022180864 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part04160 = 160448830229855299953118684990388585605610248376609421098992022812620183941700743641783503986255675403534336 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part04224 = 250770591869555862841996717765555999795458638643719625766664627232824649372300705599505712497969540613799936 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part04288 = 261374795324256868064272640912834496271142511812285575032449850873087830221312391363020274809523990710714368 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part04352 = 168720624754851658734583136001074178364576760884176936961936865455728133084290079575727985116195671578247168 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part04416 = 5026832996167283276280999241443467893371982706066568562004313004362341956706824593334315114990909115072512 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part04480 = 116357746375302125170774218546238434346558765968007976406377270941629166181563401523407476682122049110409216 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part04544 = 96789715754769138628138316624889097157357390162286236068872684670410845083624305047615628248745490174181376 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group008.size = 512 := by
  simp only [firstCenterIntegerGrade086Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group008 = 1680064083867075067589577152407220931819198779594146249170727017813138445519063767885799250465733644728139776 := by
  simp only [firstCenterIntegerGrade086Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
