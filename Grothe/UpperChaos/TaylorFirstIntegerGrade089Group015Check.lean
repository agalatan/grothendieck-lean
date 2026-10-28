import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group015Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group015Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part07680.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part07680 = 7599520851580178217148355292249886681320702036965457694043513999642218378936030799290804763833980879372288 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part07744.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part07744 = 415245814244583878195008735522087581534490245513103571459837334727566601339589196583184587241068236374016 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part07808.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part07808 = 12336696906874812890943454319363254798047229980350337992972283935904946468883653581963056486302250545709056 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part07872.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part07872 = 16199212541311717626164811012916614294975110307165120321770094318418445351336528871995001012161280475136000 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part07936.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part07936 = 10145617021119418905343872890033636361124284749243882160201478954981094386411159108778895157494004544700416 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part08000.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part08000 = 1211058789373181269826377843223790189534261902475032190052055477960259419184863482289200531704839877427200 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part08064.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part08064 = 5583804005203410706389752075840591449830393937541755284694557881614577975703317293343189593996355199067712 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part08128.size = 62 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part08128 = 2368657594714094575572820515671067073431464222620443087152439038086038656085527249746057823159389748461568 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group015.size = 510 := by
  simp only [firstCenterIntegerGrade089Group015, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group015 = 55859813524421398069584452684820928429797937381875132302346260941335147237880669583989389955893169506248256 := by
  simp only [firstCenterIntegerGrade089Group015, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group015Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group015Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group015Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
