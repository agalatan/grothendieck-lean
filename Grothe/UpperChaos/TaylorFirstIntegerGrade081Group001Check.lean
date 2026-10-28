import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade081Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade081Part00512 = 159288544305064099712465761025246421557587214438157356310842935018379092447726843856236248508364551237381652480 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade081Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade081Part00576 = 3193371518541710732163493602550512976283301436681523456008151986130077266924689791606253968950887453922428977152 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade081Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade081Part00640 = 2990551714107172655264415542851932929441630539728262482295090067337067310566767554198138187256146469612964282368 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade081Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade081Part00704 = 2534124185260612770527826112379643464992362858994128559107921917113556562876347287234102197893705648724919713792 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade081Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade081Part00768 = 1659301139646224665496818883388797429930952785265358035145870762256485999474955580760309663691305703628238487552 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade081Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade081Part00832 = 384905791709738331111685135255328061997187320504127452923529198062153801503878326898725562465092338231824875520 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade081Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade081Part00896 = 1603557104033841402562626218635345790204452541122799975067291001990645120542130752701591865276651612699931705344 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade081Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade081Part00960 = 1223465887859074030600964655010010995711786094837146011053562364984413176229408059848252991776783477403136557056 := by decide +kernel

theorem group_length : firstCenterIntegerGrade081Group001.size = 512 := by
  simp only [firstCenterIntegerGrade081Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade081Group001 = 13748565885463438687440295911096818070119260791571503327912260232892778330565904197103610685818937255460826251264 := by
  simp only [firstCenterIntegerGrade081Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
